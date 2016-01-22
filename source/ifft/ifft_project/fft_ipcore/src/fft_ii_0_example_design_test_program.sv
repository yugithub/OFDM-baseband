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


//Test bench for FFT, requires bus functional models as created by the QSYS
//TB flow and matching parameters set by the definitions below. For a detailed
//look at how this works see the altera_cic_ii regtests which use a similar
//test bench as a template to run functional post-synthesis tests.


// console messaging level
import avalon_utilities_pkg::*;
import verbosity_pkg::*;

`define VERBOSITY VERBOSITY_NONE

//BFM hierachy
`define CLK tb.fft_ii_0_example_design_inst_core_clk_bfm
`define RST tb.fft_ii_0_example_design_inst_core_rst_bfm
`define SRC tb.fft_ii_0_example_design_inst_core_sink_bfm
`define SNK tb.fft_ii_0_example_design_inst_core_source_bfm

//Test parameters
`define BACK_PRESSURE "false"
`define FORWARD_PRESSURE "false"

`define IN_REAL_FILE "fft_ii_0_example_design_real_input.txt" // Real component of input data, formatted as integers (fixed point) or Hex (Float) 1 line per input cycle
`define IN_IMAG_FILE "fft_ii_0_example_design_imag_input.txt" // Imaginary component of input data, formatted as integers (fixed point) or Hex (Float) 1 line per input cycle
`define OUT_REAL_FILE "fft_ii_0_example_design_real_output.txt" // Real component of output data, formatted as integers (fixed point) or Hex (Float) 1 line per input cycle
`define OUT_IMAG_FILE "fft_ii_0_example_design_imag_output.txt" // Imaginary component of output data, formatted as integers (fixed point) or Hex (Float) 1 line per input cycle
`define OUT_EXP_FILE "fft_ii_0_example_design_exponent_output.txt" // Exponent component of output data, formatted as integers used only for Block Floating point
`define OUT_LATENCY_FILE "fft_ii_0_example_design_latency_report.txt" // Exponent component of output data, formatted as integers used only for Block Floating point
`define IN_BLK_FILE "fft_ii_0_example_design_blksize_report.txt" // List of block sizes used in variable sized ffts, 1 per line formated as an integer
`define IN_INV_FILE "fft_ii_0_example_design_inverse_report.txt"// List of directions for FFT in bi-directional mode, 1 per line formated as an integer
`define DATA_REPRESENTATION "Block Floating Point" //Fixed or Float or Block Float
`define B_IN 16 //32 for SINGLE precision Float
`define B_OUT 16 //32 for SINGLE precision Float
`define DIRECTION "Bi-directional" // Reverse or Forward or Bi-directional
`define DATA_FLOW "Streaming" // Buffered Burst or Burst or Streaming or Variable Streaming
`define FFT_LENGTH 64 //Max for variable size

`timescale 1ns/1ps




module test_program();

//instantiate the testbench system
fft_ii_0_example_design_tb tb();

localparam FFT_REP_WIDTH = $clog2(`FFT_LENGTH+1);

//BFM related parameters
localparam SRC_D_W   = 2*`B_IN;
localparam SRC_L_W   = (`DATA_FLOW == "Variable Streaming") ? FFT_REP_WIDTH : 1; //set to 1 when not used to avoid -1:0 range
localparam SRC_INV_W = (`DIRECTION == "Bi-directional") ? 1 : 0;

localparam SNK_EXP_W = (`DATA_REPRESENTATION == "Variable Streaming") ? 1 : 6; //set to 1 when not used to avoid -1:0 range
localparam SNK_D_W = 2*`B_OUT;
localparam SNK_L_W = (`DATA_FLOW == "Variable Streaming") ? FFT_REP_WIDTH : 1; //set to 1 when not used to avoid -1:0 range


localparam SRC_DATA_W = (`DATA_FLOW == "Variable Streaming") ? SRC_D_W + SRC_L_W + SRC_INV_W : SRC_D_W + SRC_INV_W;
localparam SRC_SYMBOL_W = SRC_DATA_W;
localparam SRC_NUM_SYMBOLS = 1;
localparam SRC_CHANNEL_W = 0;
localparam SRC_ERROR_W = 2;
localparam SRC_EMPTY_W = 0;
localparam SRC_READ_LATENCY = 0;
localparam SRC_MAX_CHANNELS = 1;
localparam SRC_RESP_TIMEOUT = 32000;

localparam SNK_DATA_W = (`DATA_FLOW == "Variable Streaming") ? SNK_D_W + SNK_L_W  : SNK_D_W + SNK_EXP_W;
localparam SNK_SYMBOL_W = SNK_DATA_W;
localparam SNK_NUM_SYMBOLS = 1;
localparam SNK_CHANNEL_W = 0;
localparam SNK_ERROR_W = 2;
localparam SNK_EMPTY_W = 0;
localparam SNK_READ_LATENCY = 0;
localparam SNK_MAX_CHANNELS = 1;

localparam MAXVAL_EXP = (2**(SNK_EXP_W-1))-1;
localparam OFFSET_EXP = 2**SNK_EXP_W;

IdleOutputValue_t avalon_settings = LOW;
int data_counted_in = 0;
int data_counted_out = 0;
    
time start_time_in [$];
time start_time_out [$];
time end_time_in [$];
time end_time_out [$];
int relevant_fft_size [$];
int latency_file;

typedef logic signed [SRC_DATA_W -1    :0]  Src_Data_t;
typedef logic        [SRC_ERROR_W-1   :0]   Src_Error_t;


typedef logic signed [SNK_DATA_W-1    :0]  Snk_Data_t;
typedef logic        [SNK_CHANNEL_W-1 :0]  Snk_Channel_t;
typedef logic        [SNK_ERROR_W-1   :0]  Snk_Error_t;


  //the ST transaction is defined using SystemVerilog structure data type
  class src_transaction_class;
   int          idles;
   bit               startofpacket;
   bit               endofpacket;
   logic signed   [`B_IN-1    :0]            data_real;
   logic signed   [`B_IN-1    :0]            data_imag;
   logic signed   [SRC_DATA_W-1    :0]          data;
   logic unsigned [SRC_L_W-1    :0]          length;
   logic inverse;
   Src_Error_t       error;
   int packet_size;
   int data_count;
   int inv_file, blk_file, in_data_r_file, in_data_i_file;

        string message;


    function void pack_data ();
        $sformat(message, "%m: Packed Data ");
        print(VERBOSITY_DEBUG, message);
        if ( `DATA_FLOW == "Variable Streaming" ) begin
            if (`DIRECTION == "Bi-directional") begin
            $sformat(message, "%m: Packed Real: %d, Imag: %d, Len: %d, Inv %d", data_real, data_imag, length, inverse);
            print(VERBOSITY_DEBUG, message);
            data = {data_real, data_imag, length, inverse};
            end else begin
            $sformat(message, "%m: Packed Real: %d, Imag: %d, Len: %d", data_real, data_imag, length);
            print(VERBOSITY_DEBUG, message);
            data = {data_real, data_imag, length};
            end
        end else begin
            if (`DIRECTION == "Bi-directional") begin
            $sformat(message, "%m: Packed Real: %d, Imag: %d, Inv %d", data_real, data_imag, inverse);
            print(VERBOSITY_DEBUG, message);
            data = { data_real, data_imag, inverse};
            end else begin
            $sformat(message, "%m: Packed Real: %d, Imag: %d", data_real, data_imag);
            print(VERBOSITY_DEBUG, message);
            data = {data_real, data_imag};
            end
        end
    endfunction



    task send_data ();
        data_counted_in++;
        $sformat(message, "%m: Sent Packet");
        print(VERBOSITY_DEBUG, message);
        `SRC.set_transaction_idles   (idles);
        `SRC.set_transaction_sop     (startofpacket);
        `SRC.set_transaction_eop     (endofpacket);
        `SRC.set_transaction_data    (data);
        `SRC.set_transaction_error   (error);
        `SRC.push_transaction();

        fork : wait_for_response
            begin : waiting_thread
                if (startofpacket == 1'b1 ) begin
            @(negedge `CLK.clk)
                    for(int i  = 0; i < `SRC.get_transaction_queue_size(); i++ ) begin
                        @(`SRC.signal_response_done);
                    end 
                    start_time_in.push_back($time);
                    relevant_fft_size.push_back(packet_size);
                end else if (endofpacket == 1'b1 ) begin
            @(negedge `CLK.clk)
                    for(int i  = 0; i < `SRC.get_transaction_queue_size(); i++ ) begin
                        @(`SRC.signal_response_done);
                    end 
                    end_time_in.push_back($time);
                end
            end
        join_none

        wait(`SRC.signal_min_transaction_queue_size);
    endtask





    function int read_input_data_files ();
        int success;
        int data_real_in_int,data_imag_in_int, data_real_in_hex, data_imag_in_hex;
        $sformat(message, "%m: Reading from file line");
        print(VERBOSITY_DEBUG, message);
        startofpacket = 1'b0;
        endofpacket   = 1'b0;
        error = 2'b0;
        print(VERBOSITY_DEBUG,"Reading the input files");
        if($feof(in_data_r_file)) begin
            print(VERBOSITY_WARNING,"End of Data R file");
            return -1;
        end
        if($feof(in_data_i_file)) begin
            print(VERBOSITY_WARNING,"End of Data I file");
            return -1;
        end
        if (`DATA_REPRESENTATION == "Single Floating Point") begin
            success = $fscanf(in_data_r_file,"%x\n",data_real_in_hex);
            success = $fscanf(in_data_i_file,"%x\n",data_imag_in_hex);
            data_real = data_real_in_hex;
            data_imag = data_imag_in_hex;
        end else begin
            success = $fscanf(in_data_r_file,"%d\n",data_real_in_int);
            success = $fscanf(in_data_i_file,"%d\n",data_imag_in_int);
            data_real = data_real_in_int;
            data_imag = data_imag_in_int;
        end

        if(data_count == 0) begin //At the beginning of each frame find the direction and size
            startofpacket = 1'b1;
            if(`DIRECTION == "Bi-directional") begin
                if($feof(inv_file)) begin
                    return -1;
                end
                success = $fscanf(inv_file,"%b\n",inverse);
            end
            if(`DATA_FLOW == "Variable Streaming") begin
                if($feof(blk_file)) begin
                    return -1;
                end
                success = $fscanf(blk_file,"%d\n",length);
                $sformat(message, "%m: Read Length: %d", length);
                print(VERBOSITY_INFO, message);
                packet_size = length;
            end else begin
                packet_size = `FFT_LENGTH;
            end
        end
        $sformat(message, "%m: Count %d/%d", data_count+1, packet_size);
        print(VERBOSITY_INFO, message);
        if(data_count == packet_size -1 ) begin
            endofpacket = 1'b1;
            data_count = 0;
        end else begin
            data_count = data_count + 1;
        end
        pack_data();
        read_input_data_files = 1;
    endfunction


    function void open_input_files ();
        $sformat(message, "%m: Opening input files");
        print(VERBOSITY_DEBUG, message);
        data_count = 0;
        if (`DIRECTION == "Bi-directional") begin
            inv_file = $fopen(`IN_INV_FILE, "r");
            if (!inv_file) begin
                print(VERBOSITY_ERROR,"Failed to open inverse file");
            end
        end
        if (`DATA_FLOW == "Variable Streaming") begin
            blk_file =  $fopen(`IN_BLK_FILE, "r");
            if (!blk_file) begin
                print(VERBOSITY_ERROR,"Failed to open block file");
            end
        end
        in_data_r_file = $fopen(`IN_REAL_FILE, "r");
            if (!in_data_r_file) begin
            print(VERBOSITY_ERROR,"Failed to open data (R) file");
        end
        in_data_i_file = $fopen(`IN_IMAG_FILE, "r");
            if (!in_data_i_file) begin
            print(VERBOSITY_ERROR,"Failed to open data (I) file");
        end
    endfunction
    function void close_input_files ();
        $sformat(message, "%m: Closing input files");
        print(VERBOSITY_DEBUG, message);
        data_count = 0;
        if (`DIRECTION == "Bi-directional") begin
            $fclose(inv_file);
        end
        if (`DATA_FLOW == "Variable Streaming") begin
            $fclose(blk_file);
        end
        $fclose(in_data_r_file);
        $fclose(in_data_i_file);

    endfunction


endclass

class snk_transaction_class;
    int          idles;
    bit               startofpacket;
    bit               endofpacket;
    Snk_Data_t        data;
    Snk_Error_t       error;

    logic signed   [`B_OUT-1    :0] data_real;
    logic signed   [`B_OUT-1    :0] data_imag;
    logic signed   [SNK_EXP_W-1 :0] exponent;
    logic [SNK_L_W-1 :0]         fft_size;

    int exp_file, out_data_r_file, out_data_i_file;

    function void write_out_result ();
        $sformat(message, "%m: Result has been written out");
        print(VERBOSITY_DEBUG, message);
        if (`DATA_REPRESENTATION ==  "Block Floating Point") begin
            $fdisplay(exp_file, "%d", exponent);
        end
        if (`DATA_REPRESENTATION == "Single Floating Point") begin
            $fdisplay(out_data_r_file, "%X", data_real);
            $fdisplay(out_data_i_file, "%X", data_imag);
        end else if(`B_OUT > 32) begin
            $fdisplay(out_data_r_file, "%b", data_real);
            $fdisplay(out_data_i_file, "%b", data_imag);
        end else begin
            $fdisplay(out_data_r_file, "%d", data_real);
            $fdisplay(out_data_i_file, "%d", data_imag);
        end
    endfunction

    function void unpack_data  ();
        if(`DATA_REPRESENTATION ==  "Block Floating Point") begin
            data_real = data[SNK_EXP_W + (2*`B_OUT) -1 : `B_OUT + SNK_EXP_W];
            data_imag = data[SNK_EXP_W +`B_OUT-1 : SNK_EXP_W];
            exponent = data[SNK_EXP_W-1 : 0];
        end
        if(`DATA_FLOW == "Variable Streaming") begin
            data_real = data[SNK_L_W + (2*`B_OUT) -1 : `B_OUT + SNK_L_W];
            data_imag = data[SNK_L_W +`B_OUT-1 : SNK_L_W];
            fft_size  = data[SNK_L_W-1 : 0];
        end
        $sformat(message, "%m: Result data: Real %d, Imag %d\n", data_real, data_imag);
        print(VERBOSITY_DEBUG, message);
    endfunction

    //pop the transaction from Sink BFM queue and get the decriptors
    function automatic void snk_pop_transaction();
        data_counted_out++;
        `SNK.pop_transaction();
        idles         = `SNK.get_transaction_idles();
        startofpacket = `SNK.get_transaction_sop();
        endofpacket   = `SNK.get_transaction_eop();
        data          = `SNK.get_transaction_data();
        error         = `SNK.get_transaction_error();
        unpack_data();
        if (startofpacket == 1'b1 ) begin
            start_time_out.push_back($time);
        end
        if (startofpacket == 1'b1 ) begin
            end_time_out.push_back($time);
        end
    endfunction

    function void open_output_files ();
        print(VERBOSITY_DEBUG,"Opening the output files");
        if (`DATA_REPRESENTATION ==  "Block Floating Point") begin
            exp_file = $fopen(`OUT_EXP_FILE, "w");
        end
        out_data_r_file = $fopen(`OUT_REAL_FILE, "w");
        out_data_i_file = $fopen(`OUT_IMAG_FILE, "w");
    endfunction
    function void close_output_files ();
        print(VERBOSITY_DEBUG,"Closing the output files");

        if (`DATA_REPRESENTATION ==  "Block Floating Point") begin
            $fclose(exp_file);
        end
        $fclose(out_data_r_file);
        $fclose(out_data_i_file);
    endfunction
endclass


integer data_file_in, data_file_out;
integer i,j,k,l,m,rate_test;
integer reset_length;

string message;
int flag;
src_transaction_class src_transaction;
snk_transaction_class snk_transaction;
integer src_q_size, snk_q_size;
integer fft_index = 0;

initial
begin
    set_verbosity(`VERBOSITY);
    `SRC.set_response_timeout(SRC_RESP_TIMEOUT);
    `SRC.init();
    `SNK.init();
    `SRC.set_idle_state_output_configuration(avalon_settings);
    `SRC.set_min_transaction_queue_size(1);
    src_transaction = new();
    snk_transaction = new();
    src_transaction.open_input_files();
    snk_transaction.open_output_files();
    //wait for reset to de-assert and trigger start_test event
    wait(`RST.reset == 1);
    `RST.reset_assert();
    @(negedge `CLK.clk);
    `RST.reset_deassert();
    @(posedge `CLK.clk);
    fork: test_threads
        begin : source_data_thread
            while(src_transaction.read_input_data_files() != -1) begin
                if(`FORWARD_PRESSURE=="true")
                begin
                   src_transaction.idles =  ($unsigned($random()) % 10);
                end else begin
                   src_transaction.idles =  0;
                end
                src_transaction.send_data();
            end
      end // source_data_thread
        begin : sink_thread
            while (1)
            begin
                `SNK.set_ready(1);
                @`SNK.signal_transaction_received;
                snk_transaction.snk_pop_transaction();
                snk_transaction.write_out_result();
                if(`BACK_PRESSURE=="true")
                begin
                    snk_transaction.idles = ($unsigned($random()) % 10);
                    `SNK.set_ready(0);
                    for(l = 0; l < snk_transaction.idles; l++)
                    begin
                        @(posedge `CLK.clk);
                    end
                end
                if(data_counted_in == data_counted_out) begin
                   break;
                end
            end
        end // sink_thread
    join
    disable test_threads;  // kill any threads still running
    src_transaction.close_input_files();
    snk_transaction.close_output_files();
    latency_file = $fopen(`OUT_LATENCY_FILE, "w");
    $fdisplay(latency_file, "Packet,Size:,Time SoP In (ns),Time SoP Out (ns),Time EoP In (ns),Time EoP Out (ns),Latency (cycles),Clock Period is 20 ns");
    while(start_time_in.size()> 0)
    begin
        automatic int t_start_in = start_time_in.pop_front();
        automatic int t_start_out = start_time_out.pop_front();
        automatic int t_end_in = end_time_in.pop_front();
        automatic int t_end_out = end_time_out.pop_front();
        automatic int fft_size = relevant_fft_size.pop_front();   
        automatic int measured_latency = (($itor(t_start_out)-$itor(t_start_in))/20);   
        fft_index = fft_index + 1;         
        $fdisplay(latency_file, "%d,%d,%d,%d,%d,%d,%d", fft_index, fft_size,t_start_in, t_start_out, t_end_in, t_end_out,measured_latency);

    end
    $fclose(latency_file);

    $sformat(message, "%m: Test Finished");
    print(VERBOSITY_INFO, message);
    `CLK.clock_stop();
    $finish();
end




endmodule

