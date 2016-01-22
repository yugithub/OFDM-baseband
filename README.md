verilog实现OFDM基带

开发工具：Quartus II 15.0 (64-bit) Modelsim SE-64 10.2c
FPGA型号： Cyclone V SX SoC—5CSXFC6D6F31C6N
硬件平台：SoCKit( Cyclone V) + ARRADIO(AD9361)

目录说明
matlab_sim : ofdm基带发送部分matlab仿真代码
scripts : Modelsim功能仿真脚本文件
sim ：Modelsim功能仿真工作目录及输出结果
source ：ofdm基带发送部分Verilog代码及其功能仿真代码
synthesis ：Quartus II工程文件
tb : ofdm基带发送部分功能仿真顶层文件

Modelsim功能仿真ofdm基带发送部分
切换modelsim路径至scripts目录下，执行do tx_msim.tcl
