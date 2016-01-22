function pilot_data = insert_pilot(din)
	
	P = fi(1,1,16,14);   %%将导频符�?转为有符号定点数
	N = fi(-1,1,16,14);  %%将导频符�?1转为有符号定点数
	Pilot_P = P.hex;
	Pilot_P = hex2dec(Pilot_P);
	Pilot_N = N.hex;
	Pilot_N = hex2dec(Pilot_N);
	              
	pilot_sig_P = complex(1,1);%complex(Pilot_P, Pilot_P);
	pilot_sig_N = complex(-1,-1);%complex(Pilot_N,Pilot_N);
	%%pilot_sig_P = complex(16384,16384); 
    %%pilot_sig_N = complex(-16384,-16384);	 
	%pilot_sig_P = complex(Pilot_P, Pilot_P);
	%pilot_sig_N = complex(Pilot_N,Pilot_N);
    
	%数据映射后形成连续串行的复数值，�?8个分成一组，每一组对应一个OFDM符号
	len = length(din);
	len = len - mod(len,48);
	%pilot_din = reshape(din(1:len),len/48,48); %矩阵pilot_din每一行对应一个OFDM符号
	pilot_din = reshape(din(1:len),48,len/48);
	pilot_din_x = real(pilot_din);
	pilot_din_y = imag(pilot_din);
	pilot_din = complex(pilot_din_x',pilot_din_y');
	[pa,pb] = size(pilot_din);
	pilot_data = zeros(pa,64);
	
	for i = 1:pa    
		 pilot_data(i,7+1)  = pilot_sig_P;  %%导频插入位置7�?1�?3�?7
         pilot_data(i,21+1) = pilot_sig_N;
         pilot_data(i,43+1) = pilot_sig_P;
         pilot_data(i,57+1) = pilot_sig_P;
	end
	
	for i = 1:pa                                       %matlab的下标从1�?��
		for j = 1:pb
			if(0+1 <= j && j <= 4+1)
				pilot_data(i,j+38) = pilot_din(i,j);
			elseif(5+1<= j && j <= 17+1)
				pilot_data(i,j+39) = pilot_din(i,j);
			elseif(18+1 <= j && j <= 23+1)
				pilot_data(i,j+40) = pilot_din(i,j);
			elseif(24+1 <= j && j <= 29+1)
				pilot_data(i,j-23) = pilot_din(i,j);
			elseif(30+1 <= j && j <= 42+1)
				pilot_data(i,j-22) = pilot_din(i,j);
			elseif(43+1 <= j && j <= 47+1)
				pilot_data(i,j-21) = pilot_din(i,j);
			else ;
			end
		end
	end
				
				
				
				
				
				
				
	     