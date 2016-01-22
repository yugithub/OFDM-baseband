module tx_top #(parameter WIDTH = 16)(
	input clk,   //系统时钟100M
	input rst_n,
	output dout_valid,
	output  [18-1:0] cp_real_dout,      //输出数据的虚部
	output  [18-1:0] cp_imag_dout);      //输出数据的实部
	
	reg trig_en;
	reg [8:0] tx_cnt;
  
	
	
	wire clk_20;
	wire clk_80;
	wire rx_data;
	wire map_pilot_valid;
	wire prbs_map_valid;
	wire pilot_her_valid;
	wire her_ifft_valid;
	wire ifft_cp_valid;
	
	wire [5:0] exp;
	wire [5:0] map_pilot_index;
	wire [5:0] ifft_cp_index;
	wire [5:0] pilot_her_index;
	wire [WIDTH-1:0] map_pilot_real;
	wire [WIDTH-1:0] map_pilot_imag;
	wire [WIDTH-1:0] pilot_her_real;
	wire [WIDTH-1:0] pilot_her_imag;
	wire [WIDTH-1:0] her_ifft_real;
	wire [WIDTH-1:0] her_ifft_imag;
	wire [WIDTH-1:0] ifft_sc_real;
	wire [WIDTH-1:0] ifft_sc_imag;
	wire [18-1:0] sc_cp_real;
	wire [18-1:0] sc_cp_imag;
	
	
	always@(posedge clk_80) begin
		if(!rst_n) begin
			tx_cnt <= 1'b0;
		end
		else begin
			if(tx_cnt == 319) begin
				tx_cnt <= 1'b0;
			end
			else begin
				tx_cnt <= tx_cnt + 1'b1;
			end		
		end
	end
	
	always@(*) begin
		//if(!rst_n) begin
		//	en <= 1'b0;
		//end
		//else begin
			if(tx_cnt < 192)
				trig_en = 1'b1;
			else 
				trig_en = 1'b0;
		//end
	end
	//always@(negedge clk_25) begin
	//	if(!rst_n) begin
	//		ifft_rst_n <= 0;
	//	end
	//	else begin
	//		if(pilot_her_valid) begin
	//			ifft_rst_n <= 1'b1;
	//		end
	//		else begin
	//		//	ifft_rst_n <= 0;
	//		end
	//	end
	//end
		
	clk_pll	clk_div (
				.refclk ( clk ),
				.rst(),
				.outclk_0 ( clk_20 ),
				.outclk_1 ( clk_80 ));

				   
	prbs15 prbs(
	            .prbs_clk(clk_80),
				.prbs_rst_n(rst_n),
				.trig_en(trig_en),
				.prbs_out(rx_data),
				.dout_valid(prbs_map_valid));
				
	QAM16_MAP map(
				.qam_clk(clk_80),
				.din_valid(prbs_map_valid),
				.qam_din(rx_data),
				.dout_valid(map_pilot_valid),
				.qam_dout_imag(map_pilot_imag),
				.qam_dout_real(map_pilot_real),
				.qam_rst_n(rst_n),
				.dout_index(map_pilot_index));
	
	Insert_Pilot pilot (
				.pilot_clk(clk_20),
				.pilot_rst_n(rst_n),
				.din_valid(map_pilot_valid),
				.index(map_pilot_index),
				.pilot_imag_din(map_pilot_imag),
				.pilot_real_din(map_pilot_real),
				.pilot_imag_dout(pilot_her_imag),
				.pilot_real_dout(pilot_her_real),
				.dout_valid(pilot_her_valid),
				.dout_index(pilot_her_index));
	
	hermitian her_ins(
				.her_clk(clk_20),
				.her_rst_n(rst_n),
				.din_valid(pilot_her_valid),
				.din_index(pilot_her_index),
				.her_real_din(pilot_her_real),
				.her_imag_din(pilot_her_imag),
				.her_real_dout(her_ifft_real),
				.her_imag_dout(her_ifft_imag),
				.dout_valid(her_ifft_valid));
				
	ifft_clac ifft(
				.ifft_clk(clk_20),
				.ifft_rst_n(rst_n),
				.din_valid(her_ifft_valid),
				.ifft_real_din(her_ifft_real),
				.ifft_imag_din(her_ifft_imag),
				.dout_valid(ifft_cp_valid),
				.ifft_real_dout(ifft_sc_real),
				.ifft_imag_dout(ifft_sc_imag),
				.dout_exp(exp),
				.dout_index(ifft_cp_index));
			
	scale_clip sc_ins(
				.sc_real_din(ifft_sc_real),
				.sc_imag_din(ifft_sc_imag),
				.exp(exp),
				.sc_real_dout(sc_cp_real),
				.sc_imag_dout(sc_cp_imag));
				
	add_cyclic_prefix #(18) cp(
				.cp_clk(clk_20),
				.cp_rst_n(rst_n),
				.din_valid(ifft_cp_valid),
				.cp_real_din(sc_cp_real),
				.cp_imag_din(sc_cp_imag),
				.din_index(ifft_cp_index),
				.dout_valid(dout_valid),
				.cp_real_dout(cp_real_dout),
				.cp_imag_dout(cp_imag_dout));
	
endmodule
