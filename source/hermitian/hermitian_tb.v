`timescale 1ns/1ns

module hermitian_tb();
	parameter WIDTH = 16;
	reg her_clk;
	reg her_rst_n;
	reg din_valid;
	reg [5:0] din_index;
	reg [WIDTH-1:0] her_real_din;
	reg [WIDTH-1:0] her_imag_din;
	
	wire dout_valid;
	wire [WIDTH-1:0] her_real_dout;
	wire [WIDTH-1:0] her_imag_dout;
	
	integer  data_re, data_im;
	
	hermitian ins(.her_clk(her_clk),
				  .her_rst_n(her_rst_n),
				  .din_valid(din_valid),
				  .din_index(din_index),
				  .her_real_din(her_real_din),
				  .her_imag_din(her_imag_din),
				  .her_real_dout(her_real_dout),
				  .her_imag_dout(her_imag_dout),
				  .dout_valid(dout_valid));
				  
				  
	initial begin
		data_re = $fopen("C:/Users/Administrator/Desktop/code/data/real.txt","r");
        data_im = $fopen("C:/Users/Administrator/Desktop/code/data/imag.txt","r");      
		her_clk = 0;
		her_rst_n = 0;
		din_valid = 0;
		#120; //3*40
		her_rst_n = 1;
		din_valid = 1;
		#2560;  //64*40
		din_valid = 0;
		#640;
		din_valid = 1;
		#2560;
		din_valid = 0;
		#640;
		din_valid = 1;
		#2560;
		din_valid = 0;
		#640;
		$stop();
	end
	
	always #20 her_clk = ~her_clk;
	
	always@(posedge her_clk) begin
		if(!her_rst_n) begin
			din_index <= 0;
		end
		else begin
			if(din_valid)
				din_index <= din_index + 1'b1;
			else
				din_index <= 0;
		end
	end
	
	integer rc_x,ic_x,data_real_in_int,data_imag_in_int;
	always@(negedge her_clk) begin
		if(!her_rst_n) begin
			her_real_din <= 0;
			her_imag_din <= 0;
		end
		else begin
			if(din_valid) begin
			     rc_x = $fscanf(data_re,"%d",data_real_in_int);                                                           
				 her_real_din <= data_real_in_int;
				 ic_x = $fscanf(data_im,"%d",data_imag_in_int);                                                           
				 her_imag_din <= data_imag_in_int;
			end
			else begin
				her_real_din <= 0;
				her_imag_din <= 0;
			end
		end
	end
	
endmodule 
			
	
	
	