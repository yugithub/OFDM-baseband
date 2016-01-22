
`timescale 1ns/1ns

module add_cyclic_prefix_tb();
    parameter WIDTH = 20;
	reg    cp_clk;                           //时钟信号
	reg    cp_rst_n;                            //复位信号，低有效
	reg [WIDTH-1:0] cp_real_din;            //数据实部输入
	reg [WIDTH-1:0] cp_imag_din;             //数据虚部输入
	reg din_valid;                            //输入数据有效
	reg [5:0] din_index;                       //输入数据计数，index = 0~47
	
	wire [WIDTH-1:0] cp_real_dout;     //数据实部输出
	wire [WIDTH-1:0] cp_imag_dout;      //数据虚部输出
	wire [6:0] dout_index;                //输出数据计数，index = 0~47
	wire dout_valid ;                      //数据输出有效
	
	integer  data_re, data_im;
	
	add_cyclic_prefix #(WIDTH) i1(
						.cp_clk(cp_clk),
						.cp_rst_n(cp_rst_n),
						.din_index(din_index),
						.din_valid(din_valid),
						.cp_real_din(cp_real_din),
						.cp_imag_din(cp_imag_din),
						.cp_real_dout(cp_real_dout),
						.cp_imag_dout(cp_imag_dout),
						//.dout_index(dout_index),
						.dout_valid(dout_valid));
	
	initial begin
	    data_re = $fopen("C:/Users/Administrator/Desktop/code/data/re_data.txt","r");
        data_im = $fopen("C:/Users/Administrator/Desktop/code/data/im_data.txt","r");      
		cp_clk = 0;
		cp_rst_n = 0;
		din_valid = 0;
		#80;        //2*40
		cp_rst_n = 1;
		din_valid = 1;
		#2560;       //64*40
		din_valid = 0;
		#640;        //16*40
		din_valid = 1;
		#2560;       //64*40
		din_valid = 0;
		#640;        //16*40
		din_valid = 1;
		#2560;       //64*40
		din_valid = 0;
		#640;        //16*40
		$stop;
	end
	
	always #20 cp_clk = ~cp_clk;
	
	always@(posedge cp_clk) begin
		if(!cp_rst_n) begin
			din_index <= 0;
		end
		else begin
			if(din_valid)
				din_index <= din_index + 1'b1;
			else
				din_index <= 0;
		end
	end
	
	integer rc_x,ic_x,data_real_in_int,data_imag_in_int;
	
	always@(negedge cp_clk) begin
		if(!cp_rst_n) begin
			cp_real_din <= 0;
			cp_imag_din <= 0;
		end
		else begin
			if(din_valid) begin
				 rc_x = $fscanf(data_re,"%d",data_real_in_int);                                                           
				 cp_real_din <= data_real_in_int;
				 ic_x = $fscanf(data_im,"%d",data_imag_in_int);                                                           
				 cp_imag_din <= data_imag_in_int;
			end
			else begin
				cp_real_din <= 0;
			    cp_imag_din <= 0;
			end
		end
	end
endmodule
	