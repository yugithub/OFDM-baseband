function conj_data = hermitian_conj(data_din)
%%对输入序列进行 共轭对称 变换
%%共轭对称求法
%%  Xe(n) = 0.5*( X(n) + conj(X(N-n)) ) 0<= n <=N-1
%% 
	[conja,conjb] = size(data_din);
	
	condata = conj(data_din);
	conj_data = zeros(conja,conjb);
	
	for i = 1:conja
		conj_data(i,1) = 0.5*( data_din(i,1) + condata(i,1) );
		for j = 2:conjb
			conj_data(i,j) = 0.5*( data_din(i,j) + condata(i, conjb+2-j) );
		end
	end

