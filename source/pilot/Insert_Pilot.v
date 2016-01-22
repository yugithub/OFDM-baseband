//功能插入导频
//数据符号(Symbol)个数：48
//导频符号个数：4
//FFT点数：64
//数据位宽：16
module Insert_Pilot #(parameter DATAWIDTH = 16)(
	input    pilot_clk,                            //时钟信号
	input    pilot_rst_n,                          //复位信号，低有效
	input  [5:0]  index,                           //输入数据计数，index = 0~47
	
	input    din_valid,                            //输入数据有效
	input  [DATAWIDTH-1:0]    pilot_real_din,      //数据实部输入
	input  [DATAWIDTH-1:0]    pilot_imag_din,      //数据虚部输入
	
	output reg [5:0] dout_index,
	output reg [DATAWIDTH-1:0]    pilot_real_dout,     //数据实部输出
	output reg [DATAWIDTH-1:0]    pilot_imag_dout,     //数据虚部输出
	output reg  dout_valid  );                        //数据输出有效
	
	
	reg    [DATAWIDTH-1:0]     re_din_buf;         //输入数据实部缓存
	reg    [DATAWIDTH-1:0]     im_din_buf;         //输入数据虚部缓存
	
	
	reg    din_en;                                 //输入使能
	reg    [5:0] index_reg;						   //输入数据标号
	reg    dout_en;                                //数据输出使能
	
	
	reg    read_en;                                //双口RAM读使能
	reg    write_en;							   //双口RAM写使能
	reg    wac;                                    //双口RAM写地址控制
	reg    rac;
	reg    [6:0]    write_addr;                    //双口RAM写地址
	reg    [6:0]    read_addr;                     //双口RAM读地址
	reg	   [DATAWIDTH-1:0]    ram_real_din;        //双口RAM实部输入缓存
	reg    [DATAWIDTH-1:0]    ram_imag_din;        //双口RAM虚部输入缓存
	wire   [DATAWIDTH-1:0]    ram_real_dout;       //双口RAM实部输出
	wire   [DATAWIDTH-1:0]    ram_imag_dout;       //双口RAM虚部输出

	
	//为保证模块所有输入信号同步，在模块输入端口为所有信号加1级缓存
    always@(posedge pilot_clk) begin
		if(!pilot_rst_n) begin
			re_din_buf <= 0;
			im_din_buf <= 0;
			din_en     <= 1'b0;
			index_reg  <= 6'd0;
		    end
		else begin
			if(din_valid) begin
				re_din_buf <= pilot_real_din;
				im_din_buf <= pilot_imag_din;
				din_en     <= din_valid;
				index_reg  <= index;
				end
			else begin
				re_din_buf <= 0;
			    im_din_buf <= 0;
				din_en     <= 1'b0;
				index_reg  <= 6'd0;
				end
		end
	end
	//写数据模块
	always@(posedge pilot_clk) begin
		if(!pilot_rst_n) begin
			write_addr[6:0] <= 0;
			write_en   <= 1'b0;
			ram_real_din <= 0;
			ram_imag_din <= 0;
			wac <= 1'b0;
		end
		else begin
			if(din_en) begin
				write_addr[6] <= wac;                 //将wac信号作为RAM写地址缓存的最高位以控制数据写入RAM的不同部分
				
				/* if(index_reg <= 6'd4)                    //wac为0时写入RAM的低64bytes，反之，写入RAM的高64bytes
					write_addr[5:0] <= index_reg + 6'd38;
				else if(index_reg <= 6'd17)
					write_addr[5:0] <= index_reg + 6'd39;
				else if(index_reg <= 6'd23)
					write_addr[5:0] <= index_reg + 6'd40;
				else if(index_reg <= 6'd29)
					write_addr[5:0] <= index_reg - 6'd23;
				else if(index_reg <= 6'd42)
					write_addr[5:0] <= index_reg - 6'd22;
				else if(index_reg <= 6'd47)
					write_addr[5:0] <= index_reg - 6'd21;
				else
					write_addr[5:0] <= 0; */
				
				case(index_reg)
					0,1,2,3,4:
						write_addr[5:0] <= index_reg + 6'd38;
					5,6,7,8,9,10,11,12,13,14,15,16,17:
						write_addr[5:0] <= index_reg + 6'd39;
					18,19,20,21,22,23:
						write_addr[5:0] <= index_reg + 6'd40;
					24,25,26,27,28,29:
						write_addr[5:0] <= index_reg - 6'd23;
					30,31,32,33,34,35,36,37,38,39,40,41,42:
						write_addr[5:0] <= index_reg - 6'd22;
					43,44,45,46,47:
						write_addr[5:0] <= index_reg - 6'd21;
					default:
					    write_addr[5:0] <= 6'd0;
				endcase
				
				write_en <= 1'b1;
				ram_real_din <= re_din_buf;
				ram_imag_din <= im_din_buf;
				
				if(index_reg==47) begin
					//read_en <= 1'b1;
					wac <= ~wac;
				end
				else  ;
			
			end		
			else begin
				write_en <= 1'b0;
				write_addr[5:0] <= 0;
				ram_real_din <= 0;
				ram_imag_din <= 0;
			end		
		end
	end
	
    //读数据模块
    always@(posedge pilot_clk) begin
		if(!pilot_rst_n) begin
			read_en <= 1'b0;
			dout_en <= 1'b0;
			//rac <= 1'b0;
		end
		else begin
			if(index_reg==24) begin
				read_en <= 1'b1;
					//wac <= ~wac;
				//dout_en <= 1'b1;
			end
			else  ;
			
			if(read_addr == 63 || read_addr == 127) begin
				//if( read_addr == 127)
				read_en <= 1'b0;
				//dout_en <= 1'b0;
				//rac <= ~rac;
			end
			else ;
			
			if(read_en)
				dout_en <= 1'b1;
			else
				dout_en <= 1'b0;
		end
	end
	
	//计数器单元，输出计数信号作为双口RAM的读地址信号
	always@(posedge pilot_clk) begin
		if(!pilot_rst_n) begin
			//read_addr[6] <= 1;
			read_addr <= 0;
		end
		else begin
			if(read_en) begin
			    //read_addr[6] <= rac;
				read_addr[6:0] <= read_addr[6:0] + 1'b1;
			end
			else ;
		end	
	end
	
	//数据输出模块
	always@(posedge pilot_clk) begin
		if(!pilot_rst_n) begin
			pilot_real_dout <= 0;
			pilot_imag_dout <= 0;
			dout_valid <= 1'b0;
		end
		else begin
			if(dout_en) begin
				pilot_real_dout <= ram_real_dout;
				pilot_imag_dout <= ram_imag_dout;
				dout_valid <= 1'b1;
			end
			else begin
				pilot_real_dout <= 0;
			    pilot_imag_dout <= 0;
				dout_valid <= 1'b0;
			end
		end
	end
	
	 //输出计数模块0-63
    always@(posedge pilot_clk) begin
		if(!pilot_rst_n) begin
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
	
	//调用双口RAM
	pilot_ram2port	pilot_ram2port_re (
	.data ( ram_real_din ),
	.rdaddress ( read_addr ),
	.rdclock ( pilot_clk ),
	.rden ( read_en ),
	.wraddress ( write_addr ),
	.wrclock ( pilot_clk ),
	.wren ( write_en ),
	.q ( ram_real_dout )
	);
	
	pilot_ram2port	pilot_ram2port_im (
	.data ( ram_imag_din ),
	.rdaddress ( read_addr ),
	.rdclock ( pilot_clk ),
	.rden ( read_en ),
	.wraddress ( write_addr ),
	.wrclock ( pilot_clk ),
	.wren ( write_en ),
	.q ( ram_imag_dout )
	);
endmodule 