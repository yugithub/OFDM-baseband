
`timescale 1ns / 1ps
module ifft_clac_tb;
   //inputs
   reg ifft_clk;    
   reg ifft_rst_n;
   reg din_valid;
   reg [16 - 1:0] ifft_real_din;
   reg [16 - 1:0] ifft_imag_din;
   wire [5:0]    dout_index;
   wire 		dout_valid;
   wire [5:0]   dout_exp;   
   wire [16 - 1: 0] ifft_real_dout;
   wire [16 - 1: 0] ifft_imag_dout;
   
   integer ifft_re, ifft_im;
   integer expf;   
   integer data_re,data_im;   
   
   initial begin
		data_re = $fopen("C:/Users/Administrator/Desktop/fft_test/data/re_din.txt","r");
        data_im = $fopen("C:/Users/Administrator/Desktop/fft_test/data/im_din.txt","r"); 
		ifft_re = $fopen("C:/Users/Administrator/Desktop/fft_test/data/re_dout.txt");
		ifft_im = $fopen("C:/Users/Administrator/Desktop/fft_test/data/im_dout.txt");
		expf = $fopen("C:/Users/Administrator/Desktop/fft_test/data/exp.txt");
		ifft_clk = 0;
		ifft_rst_n = 0;
		din_valid = 0;
		#120;  //3*40
		ifft_rst_n = 1;
		//@(posedge ifft_clk);
		din_valid = 1;
		#2560;  //64*40
		din_valid = 0;
		#640; //16*40
		din_valid = 1;
		#2560; //64*40
		din_valid = 0;
		#4000;
		#4000;
		#4000;
		$stop();
	end
	
	always #20 ifft_clk = ~ifft_clk;
	
	integer rc_x,ic_x,data_real_in_int,data_imag_in_int;
	always@(negedge ifft_clk) begin
		if(!ifft_rst_n) begin
			ifft_real_din <= 0;
			ifft_imag_din <= 0;
		end
		else begin
			if(din_valid) begin
			     rc_x = $fscanf(data_re,"%d",data_real_in_int);                                                           
				 ifft_real_din <= data_real_in_int;
				 ic_x = $fscanf(data_im,"%d",data_imag_in_int);                                                           
				 ifft_imag_din <= data_imag_in_int;
			end
			else begin
				ifft_real_din <= 0;
				ifft_imag_din <= 0;
			end
		end
	end
    
  
    parameter  MAXVAL_c = 2**(16 -1);
    parameter  OFFSET_c = 2**(16);
    parameter MAXVAL_EXP_c = 2**5;
    parameter OFFSET_EXP_c = 2**6;
    integer ifft_real_out_int,ifft_imag_out_int,exponent_out_int;
	//integer ifft_re_dout,ifft_im_dout;
    always @ (posedge ifft_clk) begin                 //注意Altera FFT核进行IFFT变换得到结果还需要进行处理
		if(dout_valid) begin                          //realvalud = dataout*2^(-exp)/N
			 exponent_out_int = dout_exp ;
			 ifft_real_out_int = ifft_real_dout;
			 ifft_imag_out_int = ifft_imag_dout;
			 //$fdisplay(ifft_re, "%d", ifft_real_out_int );  
             //$fdisplay(ifft_im, "%d", ifft_imag_out_int );
             //$fdisplay(expf, "%d", exponent_out_int);
	         $fdisplay(ifft_re, "%d", (ifft_real_out_int < MAXVAL_c) ? ifft_real_out_int : ifft_real_out_int - OFFSET_c);  //转换成正负数
             $fdisplay(ifft_im, "%d", (ifft_imag_out_int < MAXVAL_c) ? ifft_imag_out_int : ifft_imag_out_int - OFFSET_c);
             $fdisplay(expf, "%d", (exponent_out_int < MAXVAL_EXP_c) ? exponent_out_int : exponent_out_int - OFFSET_EXP_c);
	    end
	 end
    ifft_clac dut(
				 .ifft_clk(ifft_clk),
				 .ifft_rst_n(ifft_rst_n),
				 .din_valid(din_valid),
				 .ifft_real_din(ifft_real_din),
				 .ifft_imag_din(ifft_imag_din),
				 .dout_valid(dout_valid),
				 .ifft_real_dout(ifft_real_dout),
				 .ifft_imag_dout(ifft_imag_dout),
				 .dout_exp(dout_exp),
				 .dout_index(dout_index));
endmodule												 
