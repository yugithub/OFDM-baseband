`timescale 1ns/1ns

module tx_top_tb();
	reg clk;
	reg rst_n;
	
	wire [17:0] cp_real_dout;
	wire [17:0] cp_imag_dout;
	wire dout_valid;
	
	wire clk_20;
	wire clk_80;
	
	integer cp_real_out_int,cp_imag_out_int;
	integer cp_rf, cp_if;
	
	tx_top  tx_top_ins(.clk(clk),
					   .rst_n(rst_n),
					   .cp_real_dout(cp_real_dout),
					   .cp_imag_dout(cp_imag_dout),
					   .dout_valid(dout_valid));
					   
					   

	clk_pll	clk_divv (
				.refclk ( clk ),
				.rst(),
				.outclk_0 ( clk_20 ),
				.outclk_1 ( clk_80 ));
				
	initial begin
		cp_rf = $fopen("cp_real_output.txt");
        cp_if = $fopen("cp_imag_output.txt");
		clk = 0;
		rst_n = 0;
		#200;
		rst_n = 1;
		
	end
	
	always #10 clk = ~clk;
	
	parameter 	MAXVAL_c = 2**(18 -1);
    parameter 	OFFSET_c = 2**(18);
	
	always @ (posedge clk_20) begin
		if(dout_valid) begin
			 cp_real_out_int = cp_real_dout;
			 cp_imag_out_int = cp_imag_dout;
			 $fdisplay(cp_rf, "%d", (cp_real_out_int < MAXVAL_c) ? cp_real_out_int : cp_real_out_int - OFFSET_c);
			 $fdisplay(cp_if, "%d", (cp_imag_out_int < MAXVAL_c) ? cp_imag_out_int : cp_imag_out_int - OFFSET_c);
		
		end
	end
	
endmodule

		
	
	
