
`timescale 1 ns/ 1 ns
module Insert_Pilot_tb();

reg din_valid;
reg [5:0] index;
reg pilot_clk;
reg [15:0] pilot_imag_din;
reg [15:0] pilot_real_din;
reg pilot_rst_n;
// wires                                               
wire dout_valid;
wire [15:0]  pilot_imag_dout;
wire [15:0]  pilot_real_dout;

integer  data_re, data_im;
                         
Insert_Pilot i1 (

	.din_valid(din_valid),
	.dout_valid(dout_valid),
	.index(index),
	.pilot_clk(pilot_clk),
	.pilot_imag_din(pilot_imag_din),
	.pilot_imag_dout(pilot_imag_dout),
	.pilot_real_din(pilot_real_din),
	.pilot_real_dout(pilot_real_dout),
	.pilot_rst_n(pilot_rst_n)
);
initial                                                
begin  
data_re = $fopen("C:/Users/Administrator/Desktop/code/data/re_data.txt","r");
data_im = $fopen("C:/Users/Administrator/Desktop/code/data/im_data.txt","r");                                                
pilot_clk = 0;
pilot_rst_n = 0;
//din_ready = 0;
din_valid = 0;
#120;
pilot_rst_n = 1;
din_valid = 1;
#1920;     //48*40
din_valid = 0;
#1280;     //32*40
din_valid = 1;
#1920;     //48*40
din_valid = 0;
#1280;     //32*40
din_valid = 1;
#1920;     //48*40
$stop;                    
end                                                    
always #20 pilot_clk = ~pilot_clk; //25M
    	
always@(posedge pilot_clk) begin
	if(!pilot_rst_n)
		index <= 0;
	else begin
		if(din_valid) begin
			if(index == 47)
				index <= 0;
			else
			   index <= index + 1'b1;
		end
		else;
	end
end
			   

integer rc_x,ic_x,data_real_in_int,data_imag_in_int;

always@(negedge pilot_clk) begin
	if(!pilot_rst_n) begin
		pilot_real_din <= 0;
		pilot_imag_din <= 0;
	end
	else begin
		if(din_valid) begin
			//data_re = $fopen("C:/Users/Administrator/Desktop/code/data/re_data.txt","r");
			//data_im = $fopen("C:/Users/Administrator/Desktop/code/data/im_data.txt","r");
			rc_x = $fscanf(data_re,"%d",data_real_in_int);                                                           
			pilot_real_din <= data_real_in_int;
			ic_x = $fscanf(data_im,"%d",data_imag_in_int);                                                           
			pilot_imag_din <= data_imag_in_int;
		end
	end
end
endmodule
