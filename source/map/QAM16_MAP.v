//16QAM map
//定点数数据格式: 字长    16 bit
//                符号位  1 bit
//                整数位  1 bit
//                小数位  14 bit

//  编码表
//  b0b1 I     |   b3b4  Q 
//  00   -3    |   00    -3
//  01   -1    |   01    -1
//  11   1     |   11    1
//  10   3     |   10    3

module QAM16_MAP #(parameter WIDTH = 16) (
	input qam_clk,         //时钟
	input qam_rst_n,       //复位
	input qam_din,         //输入串行数据流
	input din_valid,
	
	output reg dout_valid,     //输出数据有效
	output reg [5:0] dout_index,
	output reg [WIDTH-1:0] qam_dout_imag,      //输出数据的虚部
	output reg [WIDTH-1:0] qam_dout_real);      //输出数据的实部
	
	reg map_en;
	reg dout_en;
	reg [1:0] div_cnt;            //4位计数器，将串行数据流每4位分成一组
	reg [1:0] end_cnt;
	reg [3:0] din_mem;
	reg [5:0] dout_cnt;
	reg [WIDTH-1:0] qam_dout_imag_mem;
	reg [WIDTH-1:0] qam_dout_real_mem;
	
	parameter map_dataa = 16'b1100001101001001;  //  -3/√10  归一化数据，调用matlab中fi函数
	parameter map_datab = 16'b1110101111000011;  //  -1/√10  a=fi(-3/(10^0.5),1,16,14);a.bin
	parameter map_datac = 16'b0001010000111101;  //  1/√10
	parameter map_datad = 16'b0011110010110111;  //  3/√10  
	
	//4位计数器		
	always@(posedge qam_clk) begin   
		if(!qam_rst_n) begin
			div_cnt <= 2'd0;
			map_en <= 1'b0;
		end
		else begin
			if(din_valid) begin
				div_cnt <= div_cnt + 1'b1;
				if(div_cnt == 3)
					map_en <= 1'b1;
				else
					map_en <= 1'b0;
			end
			else begin
				div_cnt <= 2'd0;
			    map_en <= 1'b0;
			end
		end
	end
	
	//缓存4位数据
	always@(posedge qam_clk) begin   
		if(!qam_rst_n) begin
			din_mem <= 4'd0;
		end
		else begin
			case(div_cnt)
				2'b00 : din_mem[0] <= qam_din;
				2'b01 : din_mem[1] <= qam_din;
				2'b10 : din_mem[2] <= qam_din;
				2'b11 : din_mem[3] <= qam_din;
			endcase
		end
	end
	
	 //映射
	always@(posedge qam_clk) begin 
		if(!qam_rst_n) begin
			qam_dout_real_mem <= 0;
			qam_dout_imag_mem <= 0;
			dout_en <= 1'b0;
		end
		else begin
			if(map_en) begin
				case(din_mem[1:0])
					2'b00 : qam_dout_real_mem <= map_dataa;
					2'b10 : qam_dout_real_mem <= map_datab;
					2'b11 : qam_dout_real_mem <= map_datac;
					2'b01 : qam_dout_real_mem <= map_datad;
					default : qam_dout_real_mem <= 0;
				endcase
				
				case(din_mem[3:2])
					2'b00 : qam_dout_imag_mem <= map_dataa;
					2'b10 : qam_dout_imag_mem <= map_datab;
					2'b11 : qam_dout_imag_mem <= map_datac;
					2'b01 : qam_dout_imag_mem <= map_datad;
					default : qam_dout_imag_mem <= 0;
				endcase
				
				dout_en <= 1'b1;

            end
			else begin
				qam_dout_real_mem <= 0;
				qam_dout_imag_mem <= 0;
				dout_en <= 1'b0;
			end
		end		
    end			
	
	//数据输出模块
	always@(posedge qam_clk) begin
		if(!qam_rst_n) begin
			qam_dout_real <= 0;
			qam_dout_imag <= 0;
			dout_index <= 0;
			dout_valid <= 1'b0;
		end
		else begin
			if(dout_en) begin
				qam_dout_real <= qam_dout_real_mem;
			    qam_dout_imag <= qam_dout_imag_mem;
				dout_index <= dout_cnt;
				dout_valid <= 1'b1;	
			end
			else ;
	        
			if(dout_index == 47)
				end_cnt <= end_cnt + 1'b1;
			else
				end_cnt <= 0;
			
			if(end_cnt==3) begin
			    qam_dout_real <= 0;
			    qam_dout_imag <= 0;
				dout_index <= 0;
				dout_valid <= 1'b0;		
			end
			else ;
			
		end
	end
	
	//0-47计数模块
	always@(posedge qam_clk) begin
		if(!qam_rst_n) begin
			dout_cnt <= 0;
		end
		else begin
			if(dout_en) begin
				if(dout_cnt == 47) begin
					dout_cnt <= 0;
				end
				else begin
					dout_cnt <= dout_cnt + 1'b1;
				end
			end
			else ;
		end
	end
	
endmodule
			
	
		
		    
	