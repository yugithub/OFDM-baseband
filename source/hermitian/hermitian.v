//共轭对称变换
module hermitian #(parameter WIDTH = 16)(
	input her_clk,
	input her_rst_n,
	input din_valid,
	input [5:0] din_index,
	input [WIDTH-1:0] her_real_din,
	input [WIDTH-1:0] her_imag_din,
	
	output reg dout_valid,
	output reg [WIDTH-1:0] her_real_dout,
	output reg [WIDTH-1:0] her_imag_dout);
	
	reg write_en;
	reg read_en;
	reg wctr;            
	reg rctr; 
	reg [6:0] write_addrA;
	reg [6:0] write_addrB;
	reg [6:0] read_addr;
	reg [WIDTH-1:0] ramA_real_din;
	reg [WIDTH-1:0] ramA_imag_din;
	wire [WIDTH-1:0] ramA_real_dout;
	wire [WIDTH-1:0] ramA_imag_dout;
	reg [WIDTH:0] ramA_real_buf;
	reg [WIDTH:0] ramA_imag_buf;
	
	reg [WIDTH-1:0] ramB_real_din;
	reg [WIDTH-1:0] ramB_imag_din;
	wire [WIDTH-1:0] ramB_real_dout;
	wire [WIDTH-1:0] ramB_imag_dout;
	reg [WIDTH:0] ramB_real_buf;
	reg [WIDTH:0] ramB_imag_buf;

	reg [WIDTH:0] sum_real;
	reg [WIDTH:0] sum_imag;
	reg real_reg;
	reg imag_reg;
	//reg [5:0] addr_cnt;
	reg [5:0] dout_index;
	reg dout_en;
	
	//wctr=0，rctr=0分别像RAM中0-63写读数据，wctr=1，rctr=1分别像RAM中64-127写读数据，
	always@(posedge her_clk) begin
		if(!her_rst_n) begin
			wctr <= 0;
			rctr <= 0;
		end
		else begin
			if(din_index == 63)
				wctr <= ~wctr;
			else ;
			
			if(read_addr==63 || read_addr ==127) begin
				rctr <= ~rctr;
			end
			else ;
		end
	end
	
	//写地址转换模块
	always@(posedge her_clk) begin
		if(!her_rst_n) begin
			write_addrA <= 0;
			write_addrB <= 0;
		end
		else begin
			write_addrA[6] <= wctr;
			write_addrB[6] <= wctr;
			write_addrB[5:0] <= din_index;
			
			if(din_index == 0) begin
				write_addrA[5:0] <= din_index;
			end
			else begin
				write_addrA[5:0] <= 64 - din_index;
			end
		end
	end
			
	//求数列共轭		
	always@(posedge her_clk) begin
		if(!her_rst_n) begin
			write_en <= 1'b0;
			ramA_real_din <= 0;
			ramA_imag_din <= 0;
			ramB_real_din <= 0;
			ramB_imag_din <= 0;
		end
		else begin
			if(din_valid) begin
				write_en <= 1'b1;
				ramA_real_din <= her_real_din;          //实部相同
				ramA_imag_din <= ~her_imag_din + 1'b1;  //虚部相反
				ramB_real_din <= her_real_din;
				ramB_imag_din <= her_imag_din;
			end
			else begin
				write_en <= 1'b0;
				ramA_real_din <= 0;
				ramA_imag_din <= 0;
				ramB_real_din <= 0;
				ramB_imag_din <= 0;
			end
		end
	end
	
	//控制读信号模块
	always@(posedge her_clk) begin
		if(!her_rst_n) begin
			read_en <= 0;
		end
		else begin
			if(din_index==63) begin
				read_en <= 1'b1;
			end
			else ;
			if(read_addr==63 || read_addr ==127) begin
				read_en <= 1'b0;
			end
			else ;
			
			if(read_en)
				dout_en <= 1'b1;
			else
				dout_en <= 1'b0;
		end
	end
	
	//求和，除2
	always@(posedge her_clk) begin
		if(!her_rst_n) begin
			her_real_dout <= 0;
			her_imag_dout <= 0;
			dout_valid <= 0;
		end
		else begin
			if(dout_en) begin
				//her_real_dout <= (ramA_real_buf + ramB_real_buf)>>1;
				//her_imag_dout <= (ramA_imag_buf + ramB_imag_buf)>>1;
				//sum_real <= ramA_real_buf + ramB_real_buf;
				//sum_imag <= ramA_imag_buf + ramB_imag_buf;
				her_real_dout <= sum_real[WIDTH:1];
				her_imag_dout <= sum_imag[WIDTH:1];
				dout_valid <= 1'b1;
			end
			else begin
				her_real_dout <= 0;
				her_imag_dout <= 0;
				dout_valid <= 0;
			end
		end
	end
	
	//64计数模块	
	always@(posedge her_clk) begin	
		if(!her_rst_n) begin
			dout_index <= 0;
		end
		else begin
			if(dout_valid ) begin
				dout_index<= dout_index + 1'b1;
			end
			else begin
				dout_index <= 0;
			end
		end
	end
	
	//读地址模块
	always@(posedge her_clk) begin	
		if(!her_rst_n) begin
			read_addr <= 0;
		end
		else begin
			if(read_en ) begin
				read_addr[6] <= rctr;
				read_addr[5:0] <= read_addr[5:0] + 1'b1;
			end
			else begin
				read_addr[5:0] <= 0;
			end
		end
	end
	
	//符号扩展1位，防止求和时溢出导致计算结果错误
	always@(*) begin
		//if(!her_rst_n) begin
		//	ramA_real_buf = 0;
		//	ramA_imag_buf = 0;
		//	ramB_real_buf = 0;
		//	ramB_imag_buf = 0;
		//end
		//else begin
			if(dout_en) begin
				if(ramA_real_dout[15] == 0)
					ramA_real_buf = {1'b0,ramA_real_dout};
				else                                 
					ramA_real_buf = {1'b1,ramA_real_dout};
					
				if(ramA_imag_dout[15] == 0)
					ramA_imag_buf = {1'b0,ramA_imag_dout};
				else                                 
					ramA_imag_buf = {1'b1,ramA_imag_dout};
					                                  
				if(ramB_real_dout[15] == 0)            
					ramB_real_buf = {1'b0,ramB_real_dout};
				else                                 
					ramB_real_buf = {1'b1,ramB_real_dout};
					                                  
				if(ramB_imag_dout[15] == 0)           
					ramB_imag_buf = {1'b0,ramB_imag_dout};
				else                               
					ramB_imag_buf = {1'b1,ramB_imag_dout};
					
				sum_real = ramA_real_buf + ramB_real_buf;
				sum_imag = ramA_imag_buf + ramB_imag_buf;
			end
			else begin
				ramA_real_buf = 0;
				ramA_imag_buf = 0;
				ramB_real_buf = 0;
				ramB_imag_buf = 0;
				sum_real = 0;
				sum_imag = 0;
			end
		//end
	end
	
	//调用128*16双口RAM
	her_ram2port	herA_ram2port_im (
	.data ( ramA_imag_din ),
	.rdaddress ( read_addr ),
	.rdclock ( her_clk ),
	.rden ( read_en ),
	.wraddress ( write_addrA ),
	.wrclock ( her_clk ),
	.wren ( write_en ),
	.q ( ramA_imag_dout )
	);
	
	her_ram2port	herA_ram2port_re (
	.data ( ramA_real_din ),
	.rdaddress ( read_addr ),
	.rdclock ( her_clk ),
	.rden ( read_en ),
	.wraddress ( write_addrA ),
	.wrclock ( her_clk ),
	.wren ( write_en ),
	.q ( ramA_real_dout )
	);
	
	her_ram2port	herB_ram2port_im (
	.data ( ramB_imag_din ),
	.rdaddress ( read_addr ),
	.rdclock ( her_clk ),
	.rden ( read_en ),
	.wraddress ( write_addrB ),
	.wrclock ( her_clk ),
	.wren ( write_en ),
	.q ( ramB_imag_dout )
	);
	
	her_ram2port	herB_ram2port_re (
	.data ( ramB_real_din ),
	.rdaddress ( read_addr ),
	.rdclock ( her_clk ),
	.rden ( read_en ),
	.wraddress ( write_addrB ),
	.wrclock ( her_clk ),
	.wren ( write_en ),
	.q ( ramB_real_dout )
	);
	
	
endmodule
