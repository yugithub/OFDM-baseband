% //映射后的星座图
% //定点数数据格式: 字长    16 bit
% //                符号位  1 bit
% //                整数位  1 bit
% //                小数位  14 bit
clc
clear
close all
realstr = textread('QAM16_MAP_real_data.txt','%s');
imagstr = textread('QAM16_MAP_imag_data.txt','%s');
% fidr = fopen('QAM16_MAP_real_data.txt','r');
% fidi = fopen('QAM16_MAP_imag_data.txt','r');
% real = fscanf(fidr,'%16s',2);
% imag = fscanf(fidi,'%s');
% fclose(fidr);
% fclose(fidi);
realdec = bin2dec(realstr);
imagdec = bin2dec(imagstr);

realdec(find(realdec > 32768)) = realdec(find(realdec > 32768)) - 65536;
imagdec(find(imagdec > 32768)) = imagdec(find(imagdec > 32768)) - 65536;


real = realdec / (2^14);    %定点数转为浮点数
imag = imagdec / (2^14);

qammapdata = complex(real,imag);
%scatterplot(qammapdata);
scatterPlot = commscope.ScatterPlot('SamplesPerSymbol',1,'Constellation',qammapdata);
scatterPlot.PlotSettings.Constellation = 'on';
scatterPlot.PlotSettings.ConstellationStyle = 'r*';

  
