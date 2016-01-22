function map_dout = map(din,mode)
%映射方式为4QAM、16QAM、64QAM
%mode=1 为4QAM、mode=2 为16QAM、mode=3 为64QAM	
    switch mode
        case 1
			map_dout = QAM_code4(din);
		case 2
			map_dout = QAM_code16(din);
        case 3
			map_dout = QAM_code64(din);
		otherwise
			warning('没有编写');
	end
	
	
function qam4_dout = QAM_code4(din)
	codea = fi(1/(2^0.5),1,16,14); %归一化数据,并化为定点数
	code_a = codea.hex;
	code_a = hex2dec(code_a);
	codeb=fi(-1/(2^0.5),1,16,14);
	code_b = codeb.hex;
	code_b = hex2dec(code_b);
	
	len_data_in = length(din);
	mode_len = mod(len_data_in,2);     % 检查输入数据是否是2的倍数 
	data_in =[din ones(1,2-mode_len)];   %当输入数据序列不是2的倍数时在最后填1补充
	data_in = reshape(data_in,2,length(data_in)/2); %将串行数据流每2位分成一组
	[a,b]=size(data_in);
	real_map=zeros(1,b);
	imag_map=zeros(1,b);
	for i=1:b
		if(data_in(1,i) == 0)
			real_map(i) = code_b;
		end
		if(data_in(1,i) == 1)
			real_map(i) = code_a;
		end
		
        if(data_in(2,i) == 0)
			imag_map(i) = code_b;
		end
		if(data_in(2,i) == 1)
			imag_map(i) = code_a;
		end		
	end
	qam4_dout = complex(real_map,imag_map);
	
function qam16_dout = QAM_code16(din)
    codea = fi(-3/(10^0.5),1,16,14); %归一化数据,并化为定点数
	code_a = codea.hex;
	code_a = hex2dec(code_a);
	
	codeb=fi(-1/(10^0.5),1,16,14);
	code_b = codeb.hex;
	code_b = hex2dec(code_b);
	
	codec = fi(1/(10^0.5),1,16,14);
	code_c = codec.hex;
	code_c = hex2dec(code_c);
	
	coded=fi(3/(10^0.5),1,16,14);
	code_d = coded.hex;
	code_d = hex2dec(code_d);
	
	aa = -3/(10^0.5);
	bb = -1/(10^0.5);
	cc =  1/(10^0.5);
	dd =  3/(10^0.5);
	
	%%aa = -15543;
	%%bb = -5181;
	%%cc =  5181;
	%%dd =  15543;
	
	
	len_data_in = length(din);
	mode_len = mod(len_data_in,4);     % 检查输入数据是否是4的倍数 
	data_in =[din ones(1,4-mode_len)];   %当输入数据序列不是4的倍数时在最后填1补充
	
	data_in = reshape(data_in,4,(length(data_in))/4); %将串行数据流每4位分成一组
	[a,b]=size(data_in);
	real_map=zeros(1,b);
	imag_map=zeros(1,b);
	for i=1:b
		if(all(data_in(1:2,i) == [0 0]')) %实数部分
			real_map(i) = aa;%code_a
		end
		if(all(data_in(1:2,i) == [0 1]'))
			real_map(i) = bb;
		end
        if(all(data_in(1:2,i) == [1 1]'))
			real_map(i) = cc;
		end
		if(all(data_in(1:2,i) == [1 0]'))
			real_map(i) = dd;
		end
		
		if(all(data_in(3:4,i) == [0 0]'))  %虚数部分
			imag_map(i) = aa;
		end
		if(all(data_in(3:4,i) == [0 1]'))
			imag_map(i) = bb;
		end
        if(all(data_in(3:4,i) == [1 1]'))
			imag_map(i) = cc;
		end
		if(all(data_in(3:4,i) == [1 0]'))
			imag_map(i) = dd;
		end
	end
	qam16_dout = complex(real_map,imag_map);
		
function qam64_dout = QAM_code64(din)
    codea = fi(-7/(42^0.5),1,16,14); %归一化数据,并化为定点数
	code_a = codea.hex;
	code_a = hex2dec(code_a);
	
	codeb = fi(-5/(42^0.5),1,16,14);
	code_b = codeb.hex;
	code_b = hex2dec(code_b);
	
	codec = fi(-3/(42^0.5),1,16,14);
	code_c = codec.hex;
	code_c = hex2dec(code_c);
	
	coded=fi(-1/(42^0.5),1,16,14);
	code_d = coded.hex;
	code_d = hex2dec(code_d);
	
	codee = fi(1/(42^0.5),1,16,14); 
	code_e = codee.hex;
	code_e = hex2dec(code_e);
	
	codef= fi(3/(42^0.5),1,16,14);
	code_f = codef.hex;
	code_f = hex2dec(code_f);
	
	codeg = fi(5/(42^0.5),1,16,14);
	code_g = codeg.hex;
	code_g = hex2dec(code_g);
	
	codeh=fi(7/(42^0.5),1,16,14);
	code_h = codeh.hex;
	code_h = hex2dec(code_h);
	
	len_data_in = length(din);
	mode_len = mod(len_data_in,6);     % 检查输入数据是否是6的倍数 
	data_in =[din ones(1,6-mode_len)];   %当输入数据序列不是6的倍数时在最后填1补充
	
	data_in = reshape(data_in,6,length(data_in)/6); %将串行数据流每4位分成一组
	[a,b]=size(data_in);
	real_map=zeros(1,b);
    imag_map=zeros(1,b);
	for i=1:b
		if(all(data_in(1:3,i) == [0 0 0]')) %实数部分
			real_map(i) = code_a;
		end
		if(all(data_in(1:3,i) == [0 0 1]'))
			real_map(i) = code_b;
		end
        if(all(data_in(1:3,i) == [0 1 1]'))
			real_map(i) = code_c;
		end
		if(all(data_in(1:3,i) == [0 1 0]'))
			real_map(i) = code_d;
		end
		if(all(data_in(1:3,i) == [1 1 0]'))  
			real_map(i) = code_e;
		end
		if(all(data_in(1:3,i) == [1 1 1]'))
			real_map(i) = code_f;
		end
        if(all(data_in(1:3,i) == [1 0 1]'))
			real_map(i) = code_g;
		end
		if(all(data_in(1:3,i) == [1 0 0]'))
			real_map(i) = code_h;
		end
		
		if(all(data_in(4:6,i) == [0 0 0]')) %虚数部分
			imag_map(i) = code_a;
		end
		if(all(data_in(4:6,i) == [0 0 1]'))
			imag_map(i) = code_b;
		end
        if(all(data_in(4:6,i) == [0 1 1]'))
			imag_map(i) = code_c;
		end
		if(all(data_in(4:6,i) == [0 1 0]'))
			imag_map(i) = code_d;
		end
		if(all(data_in(4:6,i) == [1 1 0]'))  
			imag_map(i) = code_e;
		end
		if(all(data_in(4:6,i) == [1 1 1]'))
			imag_map(i) = code_f;
		end
        if(all(data_in(4:6,i) == [1 0 1]'))
			imag_map(i) = code_g;
		end
		if(all(data_in(4:6,i) == [1 0 0]'))
			imag_map(i) = code_h;
		end
		
	end
	qam64_dout = complex(real_map,imag_map);