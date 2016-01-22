`timescale 1ns / 1ps
module scale_clip_tb();
	reg [15:0] sc_real_din;
	reg [15:0] sc_imag_din;
	reg [5:0]  exp;
	wire [17:0] sc_real_dout;   
	wire [17:0] sc_imag_dout;
	
	reg clk;
    integer expf;   
    integer data_re,data_im;  
	
	initial begin
		data_re = $fopen("C:/Users/Administrator/Desktop/code/data/re_dout.txt","r");
        data_im = $fopen("C:/Users/Administrator/Desktop/code/data/im_dout.txt","r"); 
		expf = $fopen("C:/Users/Administrator/Desktop/code/data/exp.txt","r"); 
		clk = 0;
		#2560; //64*40
		$stop();
	end
	
	always #20 clk = ~clk;
	
	integer rc_x,ic_x,data_real_in_int,data_imag_in_int,exp_in,exp_in_int;
	always@(negedge clk) begin
			     rc_x = $fscanf(data_re,"%b",data_real_in_int);                                                           
				 sc_real_din <= data_real_in_int;
				 ic_x = $fscanf(data_im,"%b",data_imag_in_int);                                                           
				 sc_imag_din <= data_imag_in_int;
				 exp_in = $fscanf(expf,"%b",exp_in_int);                                                           
				 exp <= exp_in_int;
	end
	
	scale_clip ins(
					.sc_real_din(sc_real_din),
					.sc_imag_din(sc_imag_din),
					.exp(exp),
					.sc_real_dout(sc_real_dout),
					.sc_imag_dout(sc_imag_dout));
endmodule
