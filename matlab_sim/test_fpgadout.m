%%%验证fpga输出数据的频谱
	data = textread('cp_real_output.txt');
	float_data = data / (2^14); %%转为浮点数
	len = length(float_data);
	f=fftshift(fft(float_data));
    p=10*log10(abs(f));
    x=-20:40/len:20;
	plot(x(1:len),p)
    xlabel('频率 (MHz)'); ylabel('幅度 (dB)');