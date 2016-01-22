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


// $File: //acds/rel/15.0/ip/sopc/components/verification/altera_avalon_st_source_bfm/altera_avalon_st_source_bfm.sv $
// $Revision: #1 $
// $Date: 2015/02/08 $
// $Author: swbranch $
//-----------------------------------------------------------------------------
// =head1 NAME
// altera_avalon_st_source_bfm
// =head1 SYNOPSIS
// Bus Functional Model (BFM) for a Avalon Streaming Source
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This is a Bus Functional Model (BFM) for a Avalon Streaming Source.
// The behavior of each clock cycle of the ST protocol on the interface
// is governed by a transaction. Transactions are constructed using the
// the public API methods provided and are then pushed into a dispatch
// queue, either one at a time or as entire sequences. Response transactions 
// are popped out of a separate response queue and inform the client of
// statistics such as back pressure latency.
//-----------------------------------------------------------------------------
`timescale 1ps / 1ps

module altera_avalon_st_source_bfm (
                                         clk,   
                                         reset,
                             
                                         src_data,
                                         src_channel,
                                         src_valid,
                                         src_startofpacket,
                                         src_endofpacket,
                                         src_error,
                                         src_empty,
                                         src_ready
                                    );

   // =head1 PARAMETERS    
   parameter ST_SYMBOL_W       = 8;   // Data symbol width in bits
   parameter ST_NUMSYMBOLS     = 4;   // Number of symbols per word
   parameter ST_CHANNEL_W      = 0;   // Channel width in bits
   parameter ST_ERROR_W        = 0;   // Error width in bits
   parameter ST_EMPTY_W        = 0;   // Empty width in bits                     
   
   parameter ST_READY_LATENCY  = 0;   // Number of cycles latency after ready 
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
   input                                     clk;
   input                                     reset;

   // =head2 Avalon Streaming Source Interface
   output [lindex(ST_MDATA_W): 0]            src_data;
   output [lindex(ST_MCHANNEL_W): 0]         src_channel;
   output [ST_BEATSPERCYCLE-1: 0]            src_valid;
   output [ST_BEATSPERCYCLE-1: 0]            src_startofpacket;
   output [ST_BEATSPERCYCLE-1: 0]            src_endofpacket;
   output [lindex(ST_MERROR_W): 0]           src_error;
   output [lindex(ST_MEMPTY_W): 0]           src_empty;    
   input                                     src_ready;

   // =cut

   function int lindex;
      // returns the left index for a vector having a declared width 
      // when width is 0, then the left index is set to 0 rather than -1
      input [31:0] width;
      lindex = (width > 0) ? (width-1) : 0;
   endfunction   
   
// synthesis translate_off
   import verbosity_pkg::*;
   import avalon_utilities_pkg::*;
   
   typedef logic [lindex(ST_DATA_W)    :0] STData_t;
   typedef logic [lindex(ST_CHANNEL_W) :0] STChannel_t;
   typedef logic [lindex(ST_EMPTY_W)   :0] STEmpty_t;
   typedef logic [lindex(ST_ERROR_W)   :0] STError_t;
   typedef logic [ST_BEATSPERCYCLE-1   :0] STBeats_t;

   logic [ST_BEATSPERCYCLE-1    :0]         src_valid;
   logic [lindex(ST_MDATA_W)    :0]         src_data;                  
   logic [lindex(ST_MCHANNEL_W) :0]         src_channel;
   logic [lindex(ST_MERROR_W)   :0]         src_error;
   logic [lindex(ST_MEMPTY_W)   :0]         src_empty;
   logic [ST_BEATSPERCYCLE-1    :0]         src_startofpacket;
   logic [ST_BEATSPERCYCLE-1    :0]         src_endofpacket;

   logic [ST_BEATSPERCYCLE-1    :0]         src_valid_temp;   
   logic [lindex(ST_MDATA_W)    :0]         src_data_temp, src_data_slices;
   logic [lindex(ST_MCHANNEL_W) :0]         src_channel_temp, src_channel_slices;
   logic [lindex(ST_MERROR_W)   :0]         src_error_temp, src_error_slices;
   logic [lindex(ST_MEMPTY_W)   :0]         src_empty_temp, src_empty_slices;
   logic [ST_BEATSPERCYCLE-1    :0]         src_startofpacket_temp;
   logic [ST_BEATSPERCYCLE-1    :0]         src_endofpacket_temp;
   
   //--------------------------------------------------------------------------
   // Private Types and Variables
   //--------------------------------------------------------------------------
   typedef struct packed
   {
        bit [31:0]      idles;
        logic           startofpacket;
        logic           endofpacket;
        STChannel_t     channel;
        STData_t        data;
        STError_t       error;
        STEmpty_t       empty;
        bit             valid;
   } Transaction_t;

   typedef struct packed
   {
        int             latency;
        int             count;     
   } Response_t;
    
   Transaction_t new_transaction;
   Transaction_t current_transaction[ST_BEATSPERCYCLE];
   Transaction_t transaction_queue[$];

   Response_t    current_response;
   Response_t    new_response;   
   Response_t    response_queue[$];
 
   int           response_timeout           = 100;   
   string        message                    = "";

   int           idle_ctr                   = 0;
   bit           idle_state                 = 0;   
   int           ready_latency_ctr          = 0;
   bit           transaction_pending        = 0;
   int           transaction_queue_size     = 0;
   int           transaction_ctr            = 0;
   int           max_transaction_queue_size = 256;
   int           min_transaction_queue_size = 2;      

   bit           start                      = 0;
   bit           complete                   = 0;

   logic         src_ready_qualified;
   logic         src_is_now_ready;
   logic         load_transaction = 0;
   STBeats_t     src_valid_local;
   
   IdleOutputValue_t    idle_output_config = UNKNOWN;
   
   localparam MAX_READY_DELAY = 8;   
   logic [MAX_READY_DELAY-1:0]         src_ready_delayed; 

   //--------------------------------------------------------------------------
   // Private Methods
   //--------------------------------------------------------------------------
   function int __floor(
     int arg                        
   );
      // returns the arg if it is greater than 0, else returns 0
      return (arg > 0) ? arg : 0;
   endfunction   
   
   task __drive_temp_interface_idle();
      case (idle_output_config)
         LOW: begin
            src_valid_temp         <= 0;
            src_startofpacket_temp <= '0;
            src_endofpacket_temp   <= '0;
            src_channel_temp       <= '0;
            src_data_temp          <= '0;
            src_error_temp         <= '0;
            src_empty_temp         <= '0;
         end
         HIGH: begin
            src_valid_temp         <= 0;
            src_startofpacket_temp <= '1;
            src_endofpacket_temp   <= '1;
            src_channel_temp       <= '1;
            src_data_temp          <= '1;
            src_error_temp         <= '1;
            src_empty_temp         <= '1;
         end
         RANDOM: begin
            src_valid_temp         <= 0;
            src_startofpacket_temp <= $random;
            src_endofpacket_temp   <= $random;
            src_channel_temp       <= $random;
            src_data_temp          <= $random;
            src_error_temp         <= $random;
            src_empty_temp         <= $random;
         end
         UNKNOWN: begin
            src_valid_temp         <= 0;
            src_startofpacket_temp <= 'x;
            src_endofpacket_temp   <= 'x;
            src_channel_temp       <= 'x;
            src_data_temp          <= 'x;
            src_error_temp         <= 'x;
            src_empty_temp         <= 'x;
         end
         default: begin
            src_valid_temp         <= 0;
            src_startofpacket_temp <= 'x;
            src_endofpacket_temp   <= 'x;
            src_channel_temp       <= 'x;
            src_data_temp          <= 'x;
            src_error_temp         <= 'x;
            src_empty_temp         <= 'x;
         end
      endcase
   endtask
   
   task __drive_interface_idle();
      case (idle_output_config)
         LOW: begin
            src_valid         = '0;
            src_startofpacket = '0;
            src_endofpacket   = '0;
            src_data          = '0;
            src_channel       = '0;
            src_error         = '0;
            src_empty         = '0;            
         end
         HIGH: begin
            src_valid         = '0;
            src_startofpacket = '1;
            src_endofpacket   = '1;
            src_data          = '1;
            src_channel       = '1;
            src_error         = '1;
            src_empty         = '1;
         end
         RANDOM: begin
            src_valid         = '0;
            src_startofpacket = $random;
            src_endofpacket   = $random;
            src_data          = $random;
            src_channel       = $random;
            src_error         = $random;
            src_empty         = $random;
         end
         UNKNOWN: begin
            src_valid         = '0;
            src_startofpacket = 'x;
            src_endofpacket   = 'x;
            src_data          = 'x;
            src_channel       = 'x;
            src_error         = 'x;
            src_empty         = 'x;
         end
         default: begin
            src_valid         = '0;
            src_startofpacket = 'x;
            src_endofpacket   = 'x;
            src_data          = 'x;
            src_channel       = 'x;
            src_error         = 'x;
            src_empty         = 'x;
         end
      endcase
   endtask

   function automatic void __hello();
      // Introduction Message to console      
      $sformat(message, "%m: - Hello from altera_avalon_st_source_bfm.");
      print(VERBOSITY_INFO, message);            
      $sformat(message, "%m: -   $Revision: #1 $");
      print(VERBOSITY_INFO, message);            
      $sformat(message, "%m: -   $Date: 2015/02/08 $");
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_SYMBOL_W             = %0d", 
               ST_SYMBOL_W);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_NUMSYMBOLS           = %0d", 
               ST_NUMSYMBOLS);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_CHANNEL_W            = %0d", 
               ST_CHANNEL_W);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_ERROR_W              = %0d", 
               ST_ERROR_W);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   ST_EMPTY_W              = %0d", 
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
      $sformat(message, "%m: -   USE_PACKET            = %0d", 
               USE_PACKET);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   USE_CHANNEL           = %0d", 
               USE_CHANNEL);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   USE_ERROR           = %0d", 
               USE_ERROR);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   USE_READY           = %0d", 
               USE_READY);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   USE_VALID           = %0d", 
               USE_VALID);
      print(VERBOSITY_INFO, message);
      $sformat(message, "%m: -   USE_EMPTY           = %0d", 
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
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). In this case the application program is the test bench
   // which instantiates and controls and queries state in this BFM component.
   // Test programs must only use these public access methods and events to 
   // communicate with this BFM component. The API and the module pins
   // are the only interfaces in this component that are guaranteed to be
   // stable. The API will be maintained for the life of the product. 
   // While we cannot prevent a test program from directly accessing local
   // tasks, functions, or data private to the BFM, there is no guarantee that
   // these will be present in the future. In fact, it is best for the user
   // to assume that the underlying implementation of this component can 
   // and will change.
   // =cut
   //--------------------------------------------------------------------------
   event signal_fatal_error; // public
      // Signal that a fatal error has occurred. Terminates simulation.

   event signal_response_done; // public
      // Signal    
    
   event signal_src_ready; // public
   // Signal the assertion of the src_ready port.

   event signal_src_not_ready; // public
   // Signal the deassertion of the src_ready port implying sink backpressure

   event signal_src_transaction_complete; // public
   // Signal that all pending transactions have completed

   event signal_src_transaction_almost_complete; // public
   // Signal that BFM is driving the last pending transaction
   
   event signal_src_driving_transaction; // public
   // Signal that the source is driving the transaction onto the bus

   event signal_max_transaction_queue_size; // public
   // This event signals that the pending transaction queue size
   // threshold has been exceeded

   event signal_min_transaction_queue_size; // public
   // This event signals that the pending transaction queue size
   // is below the minimum threshold
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1"
      string ret_version = "15.0";
      return ret_version;
   endfunction
   
   function automatic void set_idle_state_output_configuration( // public
      // Set the configuration of output signal value during interface idle
      IdleOutputValue_t output_config
   );
      $sformat(message, "%m: method called");
      print(VERBOSITY_DEBUG, message);
      
      idle_output_config = output_config;
   endfunction
   
   function automatic IdleOutputValue_t get_idle_state_output_configuration();
      // Get the configuration of output signal value during interface idle
      $sformat(message, "%m: method called");
      print(VERBOSITY_DEBUG, message);
      
      return idle_output_config;
   endfunction
   
   function automatic bit get_src_transaction_complete();  // public
      // Return the transaction complete status
      $sformat(message, "%m: called get_src_transaction_complete");
      print(VERBOSITY_DEBUG, message);
      return complete;
   endfunction      

   function automatic logic get_src_ready();  // public
      // Return the value of the src_ready port.
      $sformat(message, "%m: called get_src_ready");
      print(VERBOSITY_DEBUG, message);
      return src_ready;
   endfunction      

   function automatic void set_response_timeout( // public
      int cycles = 100 
   );
      // Set the number of cycles that may elapse during backpressure before 
      // the time out error is asserted. Disable the timeout by setting 
      // the cycles argument to zero.
      response_timeout = cycles;
      $sformat(message, "%m: called set_response_timeout");
      print(VERBOSITY_DEBUG, message);
      
      $sformat(message, "%m: Response timeout set to %0d cycles", response_timeout);
      print(VERBOSITY_INFO, message);      
   endfunction     
  
   task automatic init(); // public
      // Drive interface to idle state.      
      $sformat(message, "%m: called init");
      print(VERBOSITY_DEBUG, message);
      __drive_temp_interface_idle();
   endtask

   function automatic void push_transaction(); // public
      // Push a new transaction into the local transaction queue. 
      // The BFM will drive the appropriate signals on the ST bus 
      // according to the transaction field values.
      Transaction_t idle_transaction;   
      
      $sformat(message, "%m: called push_transaction");
      print(VERBOSITY_DEBUG, message);

      if (reset) begin
         $sformat(message, "%m: Illegal command while reset asserted"); 
         print(VERBOSITY_ERROR, message);
         ->signal_fatal_error;
      end
      
      // Idle cycles, defined as preceding the actual transaction are
      // converted to an equal number of dummy transactions with the
      // valid field set to 0. These are pushed into the queue before
      // the actual transaction.
      
      if (USE_VALID == 1) begin
         idle_transaction.idles         = 0;
         idle_transaction.valid         = 1'b0;
         for (int i=0; i<new_transaction.idles; i++) begin
            case (idle_output_config)
               LOW: begin
                  idle_transaction.startofpacket = 1'b0;
                  idle_transaction.endofpacket   = 1'b0;
                  idle_transaction.channel       = '0;
                  idle_transaction.data          = '0;
                  idle_transaction.error         = '0;
                  idle_transaction.empty         = '0;                  
               end
               HIGH: begin
                  idle_transaction.startofpacket = 1'b1;
                  idle_transaction.endofpacket   = 1'b1;
                  idle_transaction.channel       = '1;
                  idle_transaction.data          = '1;
                  idle_transaction.error         = '1;
                  idle_transaction.empty         = '1;
               end
               RANDOM: begin
                  idle_transaction.startofpacket = $random;
                  idle_transaction.endofpacket   = $random;
                  idle_transaction.channel       = $random;
                  idle_transaction.data          = $random;
                  idle_transaction.error         = $random;
                  idle_transaction.empty         = $random;
               end
               UNKNOWN: begin
                  idle_transaction.startofpacket = 1'bx;
                  idle_transaction.endofpacket   = 1'bx;
                  idle_transaction.channel       = 'x;
                  idle_transaction.data          = 'x;
                  idle_transaction.error         = 'x;
                  idle_transaction.empty         = 'x;
               end
               default: begin
                  idle_transaction.startofpacket = 1'bx;
                  idle_transaction.endofpacket   = 1'bx;
                  idle_transaction.channel       = 'x;
                  idle_transaction.data          = 'x;
                  idle_transaction.error         = 'x;
                  idle_transaction.empty         = 'x;
               end
            endcase
            transaction_queue.push_back(idle_transaction);
         end
      end
      // now push the actual valid transaction into the queue
      new_transaction.idles = 0;                     
      new_transaction.valid = 1;
      transaction_queue.push_back(new_transaction);
   endfunction

   function automatic int get_transaction_queue_size(); // public
      // Return the number of transactions in the local queues.
      $sformat(message, "%m: called get_transaction_queue_size");
      print(VERBOSITY_DEBUG, message);
      return transaction_queue.size();
   endfunction

   function automatic int get_response_queue_size(); // public
      // Return the number of transactions in the response queues.      
      $sformat(message, "%m: called get_response_queue_size");
      print(VERBOSITY_DEBUG, message);
      return response_queue.size();
   endfunction

   function automatic void set_transaction_data( // public
      bit [ST_DATA_W-1:0] data
   );
      // Set the transaction data value
      $sformat(message, "%m: called set_transaction_data - %h", data);
      print(VERBOSITY_DEBUG, message);
      new_transaction.data = data;
   endfunction

   function automatic void set_transaction_channel( // public
      bit [ST_CHANNEL_W-1 :0] channel
   );
      // Set the transaction channel value      
      $sformat(message, "%m: called set_transaction_channel - %h", channel);
      print(VERBOSITY_DEBUG, message);
      new_transaction.channel = channel;
   endfunction

   function automatic void set_transaction_idles(  // public
      bit[31:0] idle_cycles
   );
      // Set the number of idle cycles to elapse before driving the 
      // transaction onto the Avalon bus.
      if (USE_VALID > 0) begin
         $sformat(message, "%m: called set_transaction_idles - %h", 
                  idle_cycles);
         print(VERBOSITY_DEBUG, message);
         new_transaction.idles = idle_cycles;
      end else begin
         $sformat(message, "%m: Ignored. Idles set to 0 when USE_VALID == 0");
         print(VERBOSITY_WARNING, message);         
         new_transaction.idles = 0; 
      end
   endfunction

   function automatic void set_transaction_sop(  // public
      bit sop
   );
      // Set the transaction start of packet value      
      $sformat(message, "%m: called set_transaction_sop - %b", sop);
      print(VERBOSITY_DEBUG, message);
      new_transaction.startofpacket = sop;
   endfunction

   function automatic void set_transaction_eop( // public
      bit eop
   );
      // Set the transaction end of packet value            
      $sformat(message, "%m: called set_transaction_eop - %b", eop);
      print(VERBOSITY_DEBUG, message);
      new_transaction.endofpacket = eop;
   endfunction

   function automatic void set_transaction_error( // public
      bit [ST_ERROR_W-1:0] error
   );
      // Set the transaction error value            
      $sformat(message, "%m: called set_transaction_error - %h", error);
      print(VERBOSITY_DEBUG, message);
      new_transaction.error = error;
   endfunction

   function automatic void set_transaction_empty( // public
      bit [ST_EMPTY_W-1:0] empty
   );
      // Set the transaction empty value                  
      $sformat(message, "%m: called set_transaction_empty - %h", empty);
      print(VERBOSITY_DEBUG, message);
      new_transaction.empty = empty;
   endfunction
   
   function automatic void pop_response(); // public
      // Pop the response transaction from the queue before querying contents
      string message;

      $sformat(message, "%m: called pop_response - queue depth %0d",
               response_queue.size());
      print(VERBOSITY_DEBUG, message);

      if (response_queue.size() == 0) begin
         $sformat(message, "%m: Illegal command: response queue is empty"); 
         print(VERBOSITY_ERROR, message);
         ->signal_fatal_error;         
      end
      
      current_response = response_queue.pop_front();
   endfunction

   function automatic int get_response_latency(); // public
      // Return the response latency due to back pressure for a 
      // transaction. The value is in terms of clock cycles.
      $sformat(message, "%m: called get_response_latency - %0d", 
               current_response.latency); 
      print(VERBOSITY_DEBUG, message);            
      return current_response.latency;
   endfunction

   function automatic void set_max_transaction_queue_size( // public
      int size                                                           
   );
      // Set the pending transaction maximum queue size threshold. 
      // The public event signal_max_transaction_queue_size
      // will fire when the threshold is exceeded.
      max_transaction_queue_size        = size;
   endfunction 

   function automatic void set_min_transaction_queue_size( // public
      int size                                                           
   );
      // Set the pending transaction minimum queue size threshold. 
      // The public event signal_min_transaction_queue_size
      // will fire when the queue level is below this threshold.
      min_transaction_queue_size        = size;
   endfunction 
   
 //=cut

   initial begin
      __hello();           
   end
     
   always @(posedge clk) begin
      if (transaction_queue.size() > max_transaction_queue_size) begin
         ->signal_max_transaction_queue_size;
      end else if (transaction_queue.size() < min_transaction_queue_size) begin
         ->signal_min_transaction_queue_size;
      end
   end

   always @(signal_fatal_error) __abort_simulation();      


   // The ST_BEATSPERCYCLE parameter complicates the driving of transactions
   // somewhat as not all beats in a given cycle need to be valid.
   // The following scenarios are possible:
   // Transactions with no idle cycles:
   // 1 There are an integral multiple of ST_BEATSPERCYCLE transactions
   //    in the pending transaction queue:
   //      All transactions fit neatly into an integral number of cycles
   //      with all beats valid and no resulting bubbles.
   // 2  There are a non integral multiple of ST_BEATSPERCYCLE transactions
   //    in the pending transaction queue:
   //      The final pending transaction(s) in the queue need to be driven
   //      out with unused beats being marked as invalid i.e. there are one
   //      or more bubbles (invalid beats) at the end of the transaction
   //      sequence.
   // A transaction with idle cycles defined is decomposed into a sequence of 
   // transactions. First there is a sequence of non valid, empty transaction
   // beats which define the idle cycles or bubbles. And finally, there is 
   // one valid transaction beat. 

   // delay chain for src_ready back pressure input to account for latency
   always @(posedge clk or posedge reset) begin
      if (reset) begin            
         src_ready_delayed <= 0;
      end else begin
         src_ready_delayed <= {src_ready_delayed[6:0], src_ready};
      end
   end
   
   assign src_ready_qualified = (USE_READY == 0)? 1'b1 :
                                 (ST_READY_LATENCY == 0)? src_ready :
                                 src_ready_delayed[__floor(ST_READY_LATENCY-1)];
                              
   assign src_is_now_ready = (USE_READY == 0)? 1'b1 :
                              (ST_READY_LATENCY <= 1)? src_ready :
                              src_ready_delayed[__floor(ST_READY_LATENCY-2)];

   always @(*) begin
      src_valid_local   =  src_valid_temp;

      if (USE_VALID > 0) begin
        if (USE_READY == 0 || ST_READY_LATENCY == 0) begin
            src_valid         = src_valid_temp;
            src_startofpacket = src_startofpacket_temp; 
            src_endofpacket   = src_endofpacket_temp; 
            src_data          = src_data_temp; 
            src_channel       = src_channel_temp; 
            src_error         = src_error_temp; 
            src_empty         = src_empty_temp;
        end else begin
            if (src_ready_qualified) begin
               src_valid         = src_valid_temp;
               src_startofpacket = src_startofpacket_temp; 
               src_endofpacket   = src_endofpacket_temp; 
               src_data          = src_data_temp; 
               src_channel       = src_channel_temp; 
               src_error         = src_error_temp; 
               src_empty         = src_empty_temp;
            end else begin
               __drive_interface_idle();
            end
        end
      end else begin
         src_valid       =  0;
         src_startofpacket = src_startofpacket_temp; 
         src_endofpacket   = src_endofpacket_temp; 
         src_data          = src_data_temp; 
         src_channel       = src_channel_temp; 
         src_error         = src_error_temp; 
         src_empty         = src_empty_temp;
      end
      
   end  

   bit pending;
   int response_transaction_ctr; 
   
   always @(posedge clk or posedge reset) begin
      if (reset) begin
            ready_latency_ctr       <= 0;
            complete                <= 0;
            response_transaction_ctr = 0;
            new_response             = 0;
            current_response         = 0;
            response_queue           = {};
      end else begin
         if (src_ready_qualified && ((src_valid != 0) || (USE_VALID == 0))) begin 
            ready_latency_ctr <= 0;

            if (transaction_pending) begin
               new_response.count = response_transaction_ctr++;
               new_response.latency = ready_latency_ctr;  
               response_queue.push_back(new_response);
               ->signal_response_done;
            end

         end else begin
            if (transaction_pending && ((src_valid != 0) || (USE_VALID == 0))) 
               ready_latency_ctr <= ready_latency_ctr + 1;               
         end
         
         if ((get_transaction_queue_size() == 0) && src_ready_qualified && 
               (USE_READY == 0 || src_valid != 0)) begin         
            complete <= 1;
            ->signal_src_transaction_complete;
         end else if (complete && 
                      ((get_transaction_queue_size() > 0) || transaction_pending)) begin
            complete <= 0;
         end
    
         if ((response_timeout != 0) && (ready_latency_ctr > response_timeout)) begin
             $sformat(message, "%m: Response Timeout");
             print(VERBOSITY_FAILURE, message);                  
             ->signal_fatal_error;            
         end
    
      end
   end

   always @(posedge clk or posedge reset) begin
      if (reset) begin
         idle_ctr            <= 0;
         transaction_pending = 0; // keep blocking
         
         __drive_temp_interface_idle();
         
         new_transaction         = 0;
         transaction_queue       = {};
         for (int i=0; i<ST_BEATSPERCYCLE; i++) begin
            current_transaction[i] = 0;
         end
      end else begin        
            __drive_temp_interface_idle();

            // reset transaction_pending after complete the current transsaction
            if ((USE_READY == 0 || ST_READY_LATENCY == 0) &&
                (src_ready_qualified || src_valid_local == 0)) begin
               transaction_pending = 0;
            end
            
            if (USE_READY == 1 && ST_READY_LATENCY > 0 && src_ready_qualified == 1) begin
                transaction_pending = 0;
            end
            
            if (~transaction_pending && get_transaction_queue_size() > 0) begin        
               transaction_pending  = 1;
               load_transaction = 1;

               // initialize all beats to be invalid
               for (int i=0; i<ST_BEATSPERCYCLE; i++)
                 current_transaction[i].valid = 0;
               
               for (int i=0; i<ST_BEATSPERCYCLE; i++) begin
                  if (get_transaction_queue_size() == 0)
                    break;
                  current_transaction[i] = transaction_queue.pop_front();
               end
            end
            
            if (transaction_pending) begin
               if (idle_ctr == 0) begin
                  for (int i=0; i<ST_BEATSPERCYCLE; i++) begin
                     src_valid_temp[i] <= 
                        current_transaction[i].valid; 
                     src_startofpacket_temp[i] <= 
                        current_transaction[i].startofpacket;
                     src_endofpacket_temp[i] <= 
                        current_transaction[i].endofpacket;                      
                  end
                   
                  // initialize slices immediately with non-blocking assigns
                  src_data_slices              = '0;                  
                  src_channel_slices           = '0;
                  src_error_slices             = '0;
                  src_empty_slices             = '0; 
                  // each beat immediately assigned to interface port slice 
                  for (int i=0; i<ST_BEATSPERCYCLE; i++) begin
                     src_data_slices = src_data_slices |
                       current_transaction[i].data << (i*ST_DATA_W);
                     src_channel_slices = src_channel_slices |
                         current_transaction[i].channel << (i*ST_CHANNEL_W);
                     src_error_slices = src_error_slices |  
                         current_transaction[i].error   << (i*ST_ERROR_W);
                     src_empty_slices = src_empty_slices |
                         current_transaction[i].empty   << (i*ST_EMPTY_W);  
                  end
                  // schedule final slice assignments
                  src_data_temp    <= src_data_slices;
                  src_channel_temp <= src_channel_slices;  
                  src_error_temp   <= src_error_slices;  
                  src_empty_temp   <= src_empty_slices;   
                  
                  fork
                     begin
                        #0;
                        for (int i=0; i<ST_BEATSPERCYCLE; i++) begin
                           if (load_transaction  && current_transaction[i].valid) begin
                              if (USE_READY == 0 || ST_READY_LATENCY == 0) begin
                                 ->signal_src_driving_transaction;
                                 load_transaction = 0;
                              end else if (ST_READY_LATENCY > 0 && src_is_now_ready == 1) begin
                                 ->signal_src_driving_transaction;
                                 load_transaction = 0;
                              end
                           end
                        end
                     end
                  join_none
                end else begin 
                  idle_ctr = idle_ctr - 1;
                end 
            end 
         
      end
   end

   always@(signal_src_driving_transaction) begin
      if (get_transaction_queue_size() == 0)
         -> signal_src_transaction_almost_complete;
   end

   always @(posedge src_ready_qualified or negedge src_ready_qualified) begin
      if (src_ready_qualified)
        ->signal_src_ready;
      else
        ->signal_src_not_ready;                
   end
// synthesis translate_on

endmodule 

// =head1 SEE ALSO
// avalon_st_sink_bfm
// =cut








