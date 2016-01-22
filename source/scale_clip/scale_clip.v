//功能：数据位宽扩展与裁剪

module scale_clip(
	input [15:0] sc_real_din,
	input [15:0] sc_imag_din,
	input [5:0]  exp,
	output  [17:0] sc_real_dout,   //16+8-6=18
	output  [17:0] sc_imag_dout);
	
	reg [23:0] full_range_real_out; //根据数据手册，N=64,Quad Output Engine,Exponent Scaling Values ,Max=-8,Min=-4
	reg [23:0] full_range_imag_out; //IFFT real_value = data*2^(-exp)/N. 
	
	assign sc_real_dout = full_range_real_out[23:6];
	assign sc_imag_dout = full_range_imag_out[23:6];
	//数据为扩展，data*2^(-exp)
	always@(*) begin
		case (exp)
			6'b111000 : //-8
				begin
					full_range_real_out[23:0] <= {sc_real_din[15:0],8'b0};
					full_range_imag_out[23:0] <= {sc_imag_din[15:0],8'b0};
				end
			6'b111001 : //-7
				begin
					full_range_real_out[23] <= {sc_real_din[15]};
					full_range_real_out[22:0] <= {sc_real_din[15:0],7'b0};
					full_range_imag_out[23] <= {sc_imag_din[15]};
					full_range_imag_out[22:0] <= {sc_imag_din[15:0],7'b0};
				end
			6'b111010 : //-6
				begin
					full_range_real_out[23:22] <= {sc_real_din[15],sc_real_din[15]};
					full_range_real_out[21:0] <= {sc_real_din[15:0],6'b0};
					full_range_imag_out[23:22] <= {sc_imag_din[15],sc_imag_din[15]};
					full_range_imag_out[21:0] <= {sc_imag_din[15:0],6'b0};
				end
			6'b111011 : //-5
				begin
					full_range_real_out[23:21] <= {3{sc_real_din[15]}};
					full_range_real_out[20:0] <= {sc_real_din[15:0],5'b0};
					full_range_imag_out[23:21] <= {3{sc_imag_din[15]}};
					full_range_imag_out[20:0] <= {sc_imag_din[15:0],5'b0};
				end
			6'b111100 : //-4
				begin
					full_range_real_out[23:20] <= {4{sc_real_din[15]}};
					full_range_real_out[19:0] <= {sc_real_din[15:0],4'b0};
					full_range_imag_out[23:20] <= {4{sc_imag_din[15]}};
					full_range_imag_out[19:0] <= {sc_imag_din[15:0],4'b0};
				end
		endcase
	end	
endmodule
