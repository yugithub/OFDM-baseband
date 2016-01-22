%PRBS序列发生器
function prbs_out = PRBS(shifitreg_len,pol_a,pol_b)
%生成常用PRBS 7,PRBS 15,,PRBS 23,PRBS 31,
%对应多项式X^7+X^6+1, X^15+X^14+1, X^23+X^18+1, X^31+X^28+1,

	period = 2^shifitreg_len-1;
	reg=ones(1,shifitreg_len);   
	prbs_out=zeros(1,period);
	for i=1:period
		prbs_out(i)=reg(pol_a);
		temp=reg(pol_b);
		for j=shifitreg_len:-1:2
			reg(j)=reg(j-1);
		end
		reg(1)=xor(prbs_out(i),temp);
	end