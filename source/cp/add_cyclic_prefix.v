//添加循环前缀

module add_cyclic_prefix #( parameter DATAWIDTH = 18 )(	
	input    cp_clk,                           //时钟信号
	input    cp_rst_n,                           //复位信号，低有效
	input [DATAWIDTH-1:0] cp_real_din,            //数据实部输入
	input [DATAWIDTH-1:0] cp_imag_din,             //数据虚部输入
	input din_valid,                            //输入数据有效
	input [5:0] din_index,                       //输入数据计数，index = 0~63
	
	output reg [DATAWIDTH-1:0] cp_real_dout,      //数据实部输出
	output reg [DATAWIDTH-1:0] cp_imag_dout,      //数据虚部输出
	//output reg [6:0] dout_index,                //输出数据计数，index = 0~79
	output reg dout_valid                       //数据输出有效
	);
	
	reg write_en;                           
	reg read_en;
	reg wctr;
	reg rctr;
	reg [5:0] cnt;
	reg [6:0] read_addr;
	reg [6:0] write_addr;
	
	reg [DATAWIDTH-1:0] ram_real_din;
	reg [DATAWIDTH-1:0] ram_imag_din;
	wire [DATAWIDTH-1:0] ram_real_dout;
	wire [DATAWIDTH-1:0] ram_imag_dout;
	
	//wctr=0，rctr=0分别像RAM中0-63写读数据，wctr=1，rctr=1分别像RAM中64-127写读数据，
	always@(posedge cp_clk) begin
		if(!cp_rst_n) begin
			wctr <= 0;
			rctr <= 0;
		end
		else begin
			if(din_index == 63)
				wctr <= ~wctr;
			else ;
			
			if(read_addr == 63 || read_addr == 127)
				rctr <= ~rctr;
			else ;
		end
	end
	
	//向RAM中写数据
	always@(posedge cp_clk) begin
		if(!cp_rst_n) begin
			//wctr <= 0;
			write_en <= 1'b0;
			write_addr <= 0;
			ram_real_din <= 0;
			ram_imag_din <= 0;	
		end
		else begin
			if(din_valid) begin
				write_en <= 1'b1;
				write_addr[6] <= wctr;
				write_addr[5:0] <= din_index;
				ram_real_din <= cp_real_din;
				ram_imag_din <= cp_imag_din;
			end
			else begin
			    write_en <= 0;
			    write_addr <= 0;
				ram_real_din <= 0;
			    ram_imag_din <= 0;
			end
		end
	end
	
	//读数据模块
	always@(posedge cp_clk) begin
		if(!cp_rst_n) begin
			read_en <= 0;
			cp_real_dout <= 0;
			cp_imag_dout <= 0;
			dout_valid <= 0;
		end
		else begin
			if(din_index == 62) begin
				read_en <= 1;
			end
			else ;
			if(cnt == 63)
				read_en <= 0;
			else ;
			
			if(din_index > 47) begin
				cp_real_dout <= cp_real_din;
				cp_imag_dout <= cp_imag_din;
				dout_valid <= 1'b1;
			end
			else begin
				if(read_en) begin
					cp_real_dout <= ram_real_dout;
					cp_imag_dout <= ram_imag_dout;
					dout_valid <= 1'b1;
				end
				else if((~read_en) && (~din_valid)) begin
					cp_real_dout <= 0;
					cp_imag_dout <= 0;
					dout_valid <= 1'b0;
				end
				else ;
			end
		end
	end
				
	//计数器单元0-63，输出计数信号作为双口RAM的读地址信号
	always@(posedge cp_clk) begin
		if(!cp_rst_n) begin
			read_addr <= 0;
			cnt <= 0;
		end
		else begin
			if(read_en) begin
				read_addr[6] <= rctr;
				read_addr[5:0] <= read_addr[5:0] + 1'b1;
				cnt <= read_addr[5:0];
			end
			else begin
				read_addr[5:0] <= 0;
			end
		end	
	end
		
	
	//调用128*32双口RAM
	
    cp_ram2port	#(DATAWIDTH) cp_mem_re (
	.data ( ram_real_din ),
	.rdaddress ( read_addr ),
	.rdclock ( cp_clk ),
	.rden ( read_en ),
	.wraddress ( write_addr ),
	.wrclock ( cp_clk ),
	.wren ( write_en ),
	.q ( ram_real_dout )
	);
	
	cp_ram2port	#(DATAWIDTH) cp_mem_im (
	.data ( ram_imag_din ),
	.rdaddress ( read_addr ),
	.rdclock ( cp_clk ),
	.rden ( read_en ),
	.wraddress ( write_addr ),
	.wrclock ( cp_clk ),
	.wren ( write_en ),
	.q ( ram_imag_dout )
	);
endmodule