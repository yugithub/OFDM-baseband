function cp_dout = add_cp(din)
	[cp_a,cp_b] = size(din);
	cp_dout = zeros(cp_a,cp_b + 16);  %插入16个循环前�?
	cp_dout=[din(:,49:64) din];
    %cp_dout(:,1)=cp_dout(:,1)*0.5;
    %cp_dout(:,80)=cp_dout(:,80)*0.5;