// 移位寄存器长度:  15
// 移位方向: 右移
// LFSR结构:  Fibonacci(external XOR gates)
// 反馈回路门类型:   NOR
// 初始值(seed): 15'h7fff
// Taps系数 : 15 14 1 

module prbs15(
	input prbs_clk,
	input prbs_rst_n,
	input trig_en,
	output reg dout_valid,
	output reg prbs_out);
	
    reg [14:0] prbs_mem;
    //reg dout_en;
	always @(posedge prbs_clk) begin
		if(!prbs_rst_n)
			prbs_mem[14:0] <= 15'h7fff;
		else begin
			if(trig_en) begin
				prbs_mem[0] <= prbs_mem[13] ^ prbs_mem[14];
				prbs_mem[14:1] <= prbs_mem[13:0];
			end
			else ;
		end
	end
  
	always@(posedge prbs_clk) begin
		if(!prbs_rst_n) begin
			prbs_out <= 1'bx;
			dout_valid <= 1'b0;
		end
		else begin
			if(trig_en) begin
				prbs_out <= prbs_mem[14];
				dout_valid <= 1'b1;
			end
			else begin
				prbs_out <= 1'bx;
				dout_valid <= 1'b0;
			end
		end
	end
	
  //assign prbs_out = prbs_mem[14];
  
endmodule
