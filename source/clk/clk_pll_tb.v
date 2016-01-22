
`timescale 1 ns / 1 ns

module clk_pll_tb;

	reg clk_in;
	reg clk_pll_rst;
	wire clk_20M;
	wire clk_80M;
	
	initial begin
		clk_in = 0;
		clk_pll_rst = 1;
		#100; //100ns(20*5)
		clk_pll_rst = 0;
		#4000;
		$stop();
	end
	
	always #10 clk_in = ~clk_in; //clk_in = 50M;
	
	clk_pll clk_inst(
						.refclk(clk_in),
						.rst(clk_pll_rst),
						.outclk_0(clk_20M),
						.outclk_1(clk_80M));




endmodule