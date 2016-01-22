vlib work
vmap work work
vlog QAM16_MAP.v
vlog QAM16_MAP_tb.v
vsim QAM16_MAP_tb


                                                                     
add wave -label qam_clk                                 /QAM16_MAP_tb/qam_clk  
add wave -label qam_rst_n                               /QAM16_MAP_tb/qam_rst_n     
add wave -label din_valid                               /QAM16_MAP_tb/din_valid                                          
add wave -label din_mem                                 /QAM16_MAP_tb/i1/din_mem                       
add wave -radix unsigned -label div_cnt                 /QAM16_MAP_tb/i1/div_cnt   
add wave -label map_en                                  /QAM16_MAP_tb/i1/map_en                       
add wave -radix unsigned -label qam_dout_real_mem       /QAM16_MAP_tb/i1/qam_dout_real_mem   
add wave -radix unsigned -label qam_dout_imag_mem       /QAM16_MAP_tb/i1/qam_dout_imag_mem   
add wave -radix unsigned -label qam_dout_real           /QAM16_MAP_tb/qam_dout_real                         
add wave -radix unsigned -label qam_dout_imag           /QAM16_MAP_tb/qam_dout_imag 
add wave -label dout_en                                 /QAM16_MAP_tb/i1/dout_en 
add wave -radix unsigned -label dout_cnt                /QAM16_MAP_tb/i1/dout_cnt
add wave -radix unsigned -label dout_index              /QAM16_MAP_tb/dout_index
add wave -label dout_valid                              /QAM16_MAP_tb/dout_valid 
                       
run -all;