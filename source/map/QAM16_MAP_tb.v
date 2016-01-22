`timescale 1 ns/ 1 ns
module QAM16_MAP_tb();
	reg qam_clk;
	reg qam_rst_n;
	reg qam_din;
	reg din_valid;
	reg[1:0] cnt;
	wire dout_valid;
	wire [5:0] dout_index;
	wire [15:0] qam_dout_imag;
	wire [15:0] qam_dout_real;
	integer dataa;
    integer datab;
	integer  data_in;
	QAM16_MAP i1 (
	.qam_clk(qam_clk),
	.qam_din(qam_din),
	.din_valid(din_valid),
	.dout_valid(dout_valid),
	.qam_dout_imag(qam_dout_imag),
	.qam_dout_real(qam_dout_real),
	.qam_rst_n(qam_rst_n),
	.dout_index(dout_index));
	
	reg clk;
	initial                                                
	begin    
        data_in = $fopen("C:/Users/Administrator/Desktop/code/data_in.txt","r");
		dataa = $fopen("QAM16_MAP_real_data.txt");
        datab = $fopen("QAM16_MAP_imag_data.txt");	
		qam_clk = 0;
		qam_rst_n = 0;
		din_valid = 0;
		clk = 0;
		#100;
		qam_rst_n = 1;  
		din_valid = 1;
        #1920;	
		din_valid = 0;
		#1280;
		din_valid = 1;
		#1920;
		$stop;
	end     
    
	always@(posedge qam_clk) begin
		if(!qam_rst_n)
			cnt <= 2'd0;
		else begin
			if(din_valid)
				cnt <= cnt + 1'b1;
			else
				cnt <= 0;
		end
	end
	
	integer rx,din;
	always@(negedge qam_clk) begin
		if(!qam_rst_n)
			qam_din <= 0;
		 else begin
			if(din_valid) begin
				rx = $fscanf(data_in,"%b",din);
				qam_din <= din;
			end
			
		end
	end
	
	always@(negedge qam_clk) begin
	if(qam_rst_n==1'b1 && cnt == 2'd3) begin
		$fdisplay(dataa,"%b", qam_dout_real);
		$fdisplay(datab,"%b", qam_dout_imag);
	end
end
	always #5 qam_clk = ~qam_clk;  //100M
	//reg [1:0] cnnt;
	//always@(posedge qam_clk) begin        //25M
	//	if(!qam_rst_n)
	//		cnnt <= 0;
	//	else
	//		cnnt <= cnnt + 1'b1;
	//end
	//always@(posedge qam_clk) begin        //25M
	//	if(!qam_rst_n)
	//		clk <= 0;
	//	else begin
	//		if(cnnt[1])
	//			clk <= 1'b1;
	//		else
	//			clk <= 1'b0;
	//	end
	//end
endmodule

