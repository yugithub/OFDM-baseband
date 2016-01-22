// (C) 2001-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $File: //acds/rel/15.0/ip/sopc/components/verification/altera_avalon_st_sink_bfm/altera_avalon_st_sink_bfm.sv $
// $Revision: #1 $
// $Date: 2015/02/08 $
// $Author: swbranch $
//-----------------------------------------------------------------------------
// =head1 NAME
// altera_avalon_st_sink_bfm
// =head1 SYNOPSIS
// Bus Functional Model (BFM) for a Avalon Streaming Sink
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This is a Bus Functional Model (BFM) for a Avalon Streaming Sink.
// The behavior of each clock cycle of the ST protocol on the interface
// is governed by a transaction. Received bus cycles are captured as 
// transactions and pushed into a response queue. Clients query received
// transactions by popping them off the queue one by one and extract 
// information using the public API methods provided. Back pressure to
// a driving source is also applied using the API method set_ready.
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module altera_avalon_st_sink_bfm(
				 clk,
				 reset,
    
			  	 sink_data,
			  	 sink_channel,
			  	 sink_valid,
			  	 sink_startofpacket,
			  	 sink_endofpacket,
			  	 sink_error,
			  	 sink_empty,			  
			  	 sink_ready			  
				 );
  
   // =head1 PARAMETERS    
   parameter ST_SYMBOL_W       = 8;   // Data symbol width in bits
   parameter ST_NUMSYMBOLS     = 4;   // Number of symbols per word
   parameter ST_CHANNEL_W      = 0;   // Channel width in bits
   parameter ST_ERROR_W        = 0;   // Error width in bits
   parameter ST_EMPTY_W        = 0;   // Empty width in bits
   
   parameter ST_READY_LATENCY  = 0;   // Number of cycles latency after ready (0 or 1 only)
   parameter ST_MAX_CHANNELS   = 1;   // Maximum number of channels 
   
   parameter USE_PACKET        = 0;   // Use packet pins on interface
   parameter USE_CHANNEL       = 0;   // Use channel pins on interface
   parameter USE_ERROR         = 0;   // Use error pin on interface
   parameter USE_READY         = 1;   // Use ready pin on interface
   parameter USE_VALID         = 1;   // Use valid pin on interface
   parameter USE_EMPTY         = 0;   // Use empty pin on interface          

   parameter ST_BEATSPERCYCLE  = 1;   // Max number of packets per cycle
   parameter VHDL_ID           = 0;   // VHDL BFM ID number
   
   localparam ST_DATA_W        = ST_SYMBOL_W * ST_NUMSYMBOLS;
   localparam ST_MDATA_W       = ST_BEATSPERCYCLE * ST_DATA_W;
   localparam ST_MCHANNEL_W    = ST_BEATSPERCYCLE * ST_CHANNEL_W;
   localparam ST_MERROR_W      = ST_BEATSPERCYCLE * ST_ERROR_W;
   localparam ST_MEMPTY_W      = ST_BEATSPERCYCLE * ST_EMPTY_W;   

   // =head1 PINS
   // =head2 Clock Interface
   input                           clk;
   input                           reset;

   // =head2 Avalon Streaming Source Interface
   input [lindex(ST_MDATA_W): 0] 	   sink_data;
   input [lindex(ST_MCHANNEL_W): 0] 	   sink_channel;
   input [ST_BEATSPERCYCLE-1: 0]       	   sink_valid;
   input [ST_BEATSPERCYCLE-1: 0]    	   sink_startofpacket;
   input [ST_BEATSPERCYCLE-1: 0]    	   sink_endofpacket;
   input [lindex(ST_MERROR_W): 0] 	   sink_error;
   input [lindex(ST_MEMPTY_W): 0] 	   sink_empty;    
   output                            	   sink_ready;

   // =cut
    
   function integer lindex;
      // returns the left index for a vector having a declared width 
      // when width is 0, then the left index is set to 0 rather than -1
      input [31:0] width;
      lindex = (width > 0) ? (width-1) : 0;
   endfunction   
   
// synthesis translate_off
   import verbosity_pkg::*;
   
   logic  sink_ready;   
   
   //--------------------------------------------------------------------------
   // Private Types and Variables
   //--------------------------------------------------------------------------

   typedef logic [lindex(ST_DATA_W)     :0] STData_t;
   typedef logic [lindex(ST_CHANNEL_W)  :0] STChannel_t;
   typedef logic [lindex(ST_EMPTY_W)    :0] STEmpty_t;
   typedef logic [lindex(ST_ERROR_W)    :0] STError_t;

   typedef logic [lindex(ST_MDATA_W)    :0] STMData_t;
   typedef logic [lindex(ST_MCHANNEL_W) :0] STMChannel_t;
   typedef logic [lindex(ST_MEMPTY_W)   :0] STMEmpty_t;
   typedef logic [lindex(ST_MERROR_W)   :0] STMError_t;
   typedef logic [ST_BEATSPERCYCLE-1    :0] STBeats_t;
   
   typedef struct packed
   {
        bit [31:0]      idles;
        logic           startofpacket;
        logic           endofpacket;
        STChannel_t     channel;
        STData_t        data;
        STError_t       error;
        STEmpty_t       empty;
   } Transaction_t;
   
   Transaction_t current_transaction[ST_BEATSPERCYCLE];
   Transaction_t query_transaction;   

   Transaction_t transaction_queue[$];   

   string 	 message  = "*uninitialized*";     
   logic  	 ready    = 0;
   int    	 idle_ctr = 0;            

   STBeats_t     sink_valid_qualified;
   logic         sink_ready_qualified;

   localparam MAX_READY_DELAY = 8;      
   logic [MAX_READY_DELAY-1:0]   sink_ready_delayed;

  
   //--------------------------------------------------------------------------
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). In this case the application program is the test bench
   // which instantiates and controls and queries state in this BFM component.
   // Test programs must only use these public access methods and events to 
   // communicate with this BFM component. The API and the module pins
   // are the only interfaces in this component that are guaranteed to be
   // stable. The API will be maintained for the life of the product. 
   // While we cannot prevent a test program from directly accessing internal
   // tasks, functions, or data private to the BFM, there is no guarantee that
   // these will be present in the future. In fact, it is best for the user
   // to assume that the underlying implementation of this component can 
   // and will change.
   // =cut
   //--------------------------------------------------------------------------

   event signal_fatal_error; // public
      // Signal that a fatal error has occurred. Terminates simulation.
   
   event signal_transaction_received;  //public
      // Signal that a transaction has been received and queued.

   event signal_sink_ready_assert; // public
      // Signal that sink_ready is asserted thereby turning off back pressure.
   
   event signal_sink_ready_deassert; // public   
      // Signal that sink_ready is deasserted thereby turning on back pressure.

   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1"
      string ret_version = "__ACDS_VERSION_SHORT__";
      return ret_version;      
   endfunction
   
   task automatic init(); // public
      // Drive interface to idle state.
      $sformat(message, "%m: called init");
      print(VERBOSITY_DEBUG, message);
      
      drive_interface_idle();
   endtask

   task automatic set_ready( // public
      bit state
   );
      // Set the value of the interface ready signal. To assert back
      // pressure, the state argument is set to 0 i.e. not ready.
      // The parameter USE_READY must be set to 1 to enable this signal.
      
      if (USE_READY > 0) begin
	 $sformat(message, "%m: called set_ready");
      	 print(VERBOSITY_DEBUG, message);
      
      	 sink_ready <= state;

      	 if (state == 1'b1)
      	   ->signal_sink_ready_assert;
      	 else
      	   ->signal_sink_ready_deassert;
      end else begin 
	 $sformat(message, "%m: Ignore set_ready() when USE_READY == 0");
      	 print(VERBOSITY_WARNING, message);
	 sink_ready <= 0;
      end
   endtask
   
   function automatic void pop_transaction(); // public
      // Pop the transaction descriptor from the queue so that it can be
      // queried with the get_transaction methods by the test bench.
      if (reset) begin
	 $sformat(message, "%m: Illegal command while reset asserted"); 
	 print(VERBOSITY_ERROR, message);
	 ->signal_fatal_error;	 
      end
      
      query_transaction = transaction_queue.pop_back();

      $sformat(message, "%m: called pop_transaction");
      print(VERBOSITY_DEBUG, message);
      $sformat(message, "%m:   Data: %x", query_transaction.data);
      print(VERBOSITY_DEBUG, message);
      $sformat(message, "%m:   Channel: %0d", query_transaction.channel);
      print(VERBOSITY_DEBUG, message);		            
      $sformat(message, "%m:   SOP: %0d EOP: %0d", 
	       query_transaction.startofpacket,
	       query_transaction.endofpacket);
      print(VERBOSITY_DEBUG, message);		            
   endfunction

   function automatic bit[31:0] get_transaction_idles(); // public
      // Return the number of idle cycles in the transaction
      $sformat(message, "%m: called get_transaction_idles");
      print(VERBOSITY_DEBUG, message);
      
      return query_transaction.idles;
   endfunction

   function automatic logic [ST_DATA_W-1:0] get_transaction_data(); // public
      // Return the data in the transaction      
      $sformat(message, "%m: called get_transaction_data");
      print(VERBOSITY_DEBUG, message);
      
      return query_transaction.data;
   endfunction
    
   function automatic logic [ST_CHANNEL_W-1:0] get_transaction_channel(); // public
      // Return the channel identifier in the transaction            
      $sformat(message, "%m: called get_transaction_channel");
      print(VERBOSITY_DEBUG, message);
      
      return query_transaction.channel;
   endfunction

   function automatic logic get_transaction_sop(); // public
      // Return the start of packet status in the transaction            
      $sformat(message, "%m: called get_transaction_sop");
      print(VERBOSITY_DEBUG, message);
      
      return query_transaction.startofpacket;
   endfunction

   function automatic logic get_transaction_eop(); // public
      // Return the end of packet status in the transaction                  
      $sformat(message, "%m: called get_transaction_eop");
      print(VERBOSITY_DEBUG, message);
      
      return query_transaction.endofpacket;
   endfunction

   function automatic logic [ST_ERROR_W-1:0] get_transaction_error(); // public
      // Return the error status in the transaction                  
      $sformat(message, "%m: called get_transaction_error");
      print(VERBOSITY_DEBUG, message);
      
      return query_transaction.error;
   endfunction

   function automatic logic [ST_EMPTY_W-1:0] get_transaction_empty(); // public
      // Return the number of empty symbols in the transaction 
      $sformat(message, "%m: called get_transaction_empty");
      print(VERBOSITY_DEBUG, message);
      
      return query_transaction.empty;
   endfunction

   function automatic int get_transaction_queue_size(); // public
      // Return the length of the queue holding received transactions
      $sformat(message, "%m: called get_transaction_queue_size");
      print(VERBOSITY_DEBUG, message);
      
     // Return the number of transactions in the internal queues.       
      return transaction_queue.size();
   endfunction

   // =cut
   
   //--------------------------------------------------------------------------
   // Private Methods
   //--------------------------------------------------------------------------
   function int __floor(
     int arg			
   );
      // returns the arg if it is greater than 0, else returns 0
      return (arg > 0) ? arg : 0;
   endfunction   

   task automatic drive_interface_idle();
      set_ready(0);
   endtask

   function automatic void __hello();
      // Introduction Message to console      
      $sformat(message, "%m: - Hello from altera_avalon_st_sink_bfm.");
      print(VERBOSITY_INFO, message);            
      $sformat(message, "%m: -   $Revision: #1 $");
      print(VERBOSITY_INFO, message);            
      $sformat(message, "%m: -   $Date: 2015/02/08 $");
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_SYMBOL_W   	  = %0d", 
	       ST_SYMBOL_W);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_NUMSYMBOLS 	  = %0d", 
	       ST_NUMSYMBOLS);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_CHANNEL_W  	  = %0d", 
	       ST_CHANNEL_W);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_ERROR_W    	  = %0d", 
	       ST_ERROR_W);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_EMPTY_W    	  = %0d", 
	       ST_EMPTY_W);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_READY_LATENCY = %0d", 
	       ST_READY_LATENCY);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_MAX_CHANNELS  = %0d", 
	       ST_MAX_CHANNELS);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_BEATSPERCYCLE = %0d", 
	       ST_BEATSPERCYCLE);
      print(VERBOSITY_INFO, message);                        
      $sformat(message, "%m: -   USE_PACKET  	  = %0d", 
	       USE_PACKET);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   USE_CHANNEL 	  = %0d", 
	       USE_CHANNEL);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   USE_ERROR 	  = %0d", 
	       USE_ERROR);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   USE_READY 	  = %0d", 
	       USE_READY);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   USE_VALID 	  = %0d", 
	       USE_VALID);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   USE_EMPTY 	  = %0d", 
	       USE_EMPTY);
      print(VERBOSITY_INFO, message);      
      print_divider(VERBOSITY_INFO);
   endfunction

   function automatic void __abort_simulation();
      string message;
      $sformat(message, "%m: Abort the simulation due to fatal error."); 
      print(VERBOSITY_FAILURE, message);
      $stop;
   endfunction
   
   //--------------------------------------------------------------------------
   initial begin
      __hello();                
   end
   
   //--------------------------------------------------------------------------
   // Local Machinery
   //--------------------------------------------------------------------------
   always @(signal_fatal_error) __abort_simulation();   
   
   // delay chain for sink_ready back pressure output to account for latency
   always @(posedge clk or posedge reset) begin
      if (reset) begin	    
	 sink_ready_delayed <= 0;
      end else begin
	 sink_ready_delayed <= {sink_ready_delayed[6:0], sink_ready};
      end
   end

   assign sink_ready_qualified = (USE_READY == 0)? 1'b1 :
                                 (ST_READY_LATENCY == 0)? sink_ready :
                                 sink_ready_delayed[__floor(ST_READY_LATENCY-1)];

   assign sink_valid_qualified = (USE_VALID == 0)? 1'b1 : sink_valid;

   always @(posedge clk or posedge reset) begin
      if (reset) begin
         transaction_queue = {};
         query_transaction = 0;
         for (int i=0; i<ST_BEATSPERCYCLE; i++) begin	 
            current_transaction[i] = '0;
         end
      end else begin
         if (sink_ready_qualified) begin
            if (sink_valid_qualified != 0) 
	      ->signal_transaction_received;	    
	    for (int i=0; i<ST_BEATSPERCYCLE; i++) begin
               if (sink_valid_qualified[i]) begin
                    current_transaction[i].data          = 
               	      sink_data >> (i*ST_DATA_W);
               	  current_transaction[i].channel       = 
               	      sink_channel >> (i*ST_CHANNEL_W);
               	  current_transaction[i].startofpacket = 
               	      sink_startofpacket[i];
               	  current_transaction[i].endofpacket   = 
               	      sink_endofpacket[i];
               	  current_transaction[i].error         = 
               	      sink_error >> (i*ST_ERROR_W);
               	  current_transaction[i].empty         = 
               	      sink_empty >> (i*ST_EMPTY_W);

		  // TODO - this is ok for single beat, but not for multi beats
               	  current_transaction[i].idles         = idle_ctr; // replicate

	       	  transaction_queue.push_front(current_transaction[i]);
	       end
	    end 
	 end
      end
   end 

   bit sink_ready_d1;
   
   always @(posedge clk or posedge reset) begin
      if (reset) 
	sink_ready_d1 <= 0;
      else
	sink_ready_d1 <= sink_ready_qualified;
   end
   
   always @(posedge clk or posedge reset) begin
      if (reset) begin
	 idle_ctr <= 0;
      end else if (ST_BEATSPERCYCLE == 1) begin
	 if (sink_ready_d1 && ~sink_valid_qualified[0]) begin 
	    idle_ctr <= idle_ctr + 1;	 
	 end else begin
	    idle_ctr <= 0;
	 end
      end else begin
	 // TODO -  compute idle bubbles with multiple beats/cycle
	 idle_ctr <= 0;	 
      end
   end
// synthesis translate_on

endmodule
   
// =head1 SEE ALSO
// avalon_st_source_bfm
// =cut

