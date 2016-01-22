`timescale 1 ns / 1 ns

module prbs15_tb();
	reg prbs_clk;
	reg prbs_rst_n;
	reg trig_en;
	wire prbs_out;
	wire dout_valid;
	
	integer cycles;
	integer data;
	parameter LENGTH = 15;
	
	prbs15 ins( .prbs_clk(prbs_clk),
				.prbs_rst_n(prbs_rst_n),
				.trig_en(trig_en),
				.dout_valid(dout_valid),
				.prbs_out(prbs_out));

	
	initial begin
		data = $fopen("prbs_output.txt");
		prbs_clk = 0;
		prbs_rst_n = 0;
		trig_en = 0;
		cycles = 0;
		@(posedge prbs_clk);
		prbs_rst_n = 1;
		trig_en = 1;
		#150;
		trig_en = 0;
		#20;
		trig_en = 1;
		#50;
		$stop();
	end
	
	always@(posedge prbs_clk) begin
		//cycles = cycles + 1;
		//if(trig_en)
		   $fdisplay(data,"%b", prbs_out);
		//if(cycles == (1 << LENGTH)) begin
		//	$display($time," value = %d \n", cycles);
		//	$stop();
		//end
	end
	
	always #5 prbs_clk = ~ prbs_clk;
	
endmodule
	