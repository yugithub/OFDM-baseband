//功能：ifft变换
//方法：调用Altera FFT IP CORE
//结构：流水线
module ifft_clac #(parameter WIDTH = 16) (
	input		ifft_clk,
	input		ifft_rst_n,
	input		din_valid,
	
	input	[WIDTH-1:0]	ifft_real_din,
	input	[WIDTH-1:0]	ifft_imag_din,
	
	output   [5:0] dout_exp,
	output	 dout_valid,
	output reg [5:0] dout_index,
	output  [WIDTH-1:0]	ifft_real_dout,
	output  [WIDTH-1:0]	ifft_imag_dout);
	
	reg [5:0] frame_cnt;
	reg sink_valid;  
    reg [WIDTH-1:0] sink_real;  
	reg [WIDTH-1:0] sink_imag;
	
	wire sink_ready;
	wire source_ready;
	wire inverse;
	wire [1:0] sink_error;
	wire sink_sop;
	wire sink_eop;
	
	wire source_sop;
	wire source_eop;
	wire [1:0] source_error;
	//wire source_valid;
	//wire source_exp;
	
    assign inverse = 1'b1; // '0' => FFT ,'1' => IFFT  
    assign sink_error = 2'b0;      //no input error
	assign source_ready = 1'b1;
    assign sink_sop = (frame_cnt == 0 & din_valid== 1'b1) ? 1'b1 : 1'b0 ;
    assign sink_eop = ( frame_cnt == 63) ? 1'b1 : 1'b0;
	
	//输入控制模块
	always@(posedge ifft_clk) begin
		if(!ifft_rst_n) begin
			sink_valid <= 1'b0;
			sink_real <= 0;
			sink_imag <= 0;
		end
		else begin
			if(din_valid) begin
				sink_valid <= din_valid;
				sink_real <= ifft_real_din;
				sink_imag <= ifft_imag_din;
			end
			else begin
				sink_valid <= 1'b0;
				sink_real <= 0;
				sink_imag <= 0;
			end
		end
	end		
		
	//64计数模块
	always@(posedge ifft_clk) begin
		if(!ifft_rst_n) begin
			frame_cnt <= 1'b0;
		end
		else begin
			if(sink_valid) begin
				frame_cnt <= frame_cnt + 1'b1;
			end
			else begin
				frame_cnt <= 1'b0;
			end
		end
	end
	
    //输出计数模块0-63
    always@(posedge ifft_clk) begin
		if(!ifft_rst_n) begin
			dout_index <= 0;
		end
		else begin
			if(dout_valid) begin
				dout_index <= dout_index + 1'b1;
			end
			else begin
				dout_index <= 0;
			end
		end
	end
	
	//调用fft ip核
	fft_ipcore ifft_ins(
	    .clk(ifft_clk),
		.reset_n(ifft_rst_n),
		.inverse(inverse),
		.sink_valid(sink_valid),
		.sink_sop(sink_sop),
		.sink_eop(sink_eop),
		.sink_real(sink_real),
		.sink_imag(sink_imag),
		.sink_error(sink_error),
		.source_ready(source_ready),
		.sink_ready(sink_ready),
		.source_error(source_error),
		.source_sop(source_sop),
		.source_eop(source_eop),
		.source_valid(dout_valid),
		.source_exp(dout_exp),
		.source_real(ifft_real_dout),
		.source_imag(ifft_imag_dout));
		
		
	endmodule
	