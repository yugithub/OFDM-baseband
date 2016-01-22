vlib work
vmap work work
vlog C:/Users/Administrator/Desktop/code/sim_lib/altera_mf.v
vlog Insert_Pilot.v
vlog pilot_ram2port.v
vlog Insert_Pilot_tb.v
vsim Insert_Pilot_tb

                                                                                         
add wave -label pilot_clk                                            /Insert_Pilot_tb/pilot_clk                           
add wave -label pilot_rst_n                                          /Insert_Pilot_tb/pilot_rst_n                         
add wave -color Yellow -label din_valid                              /Insert_Pilot_tb/din_valid  
add wave -color Yellow -label din_en                                 /Insert_Pilot_tb/i1/din_en                       
add wave -radix unsigned -label pilot_real_din                       /Insert_Pilot_tb/pilot_real_din                         
add wave -radix unsigned -label pilot_imag_din                       /Insert_Pilot_tb/pilot_imag_din  
add wave -radix unsigned -label re_din_buf                           /Insert_Pilot_tb/i1/re_din_buf                         
add wave -radix unsigned -label im_din_buf                           /Insert_Pilot_tb/i1/im_din_buf    
add wave -color Yellow -radix unsigned -label ram_imag_din           /Insert_Pilot_tb/i1/ram_imag_din                         
add wave -color Yellow -radix unsigned -label ram_real_din           /Insert_Pilot_tb/i1/ram_real_din                   
                      
add wave -radix unsigned -label index                                /Insert_Pilot_tb/index 
add wave -radix unsigned -label index_reg                            /Insert_Pilot_tb/i1/index_reg

add wave -color Yellow -radix unsigned -label write_addr             /Insert_Pilot_tb/i1/write_addr 
add wave -color Yellow -label write_en                               /Insert_Pilot_tb/i1/write_en
add wave -color Cyan -label read_en                                  /Insert_Pilot_tb/i1/read_en 
add wave -color Cyan -radix unsigned -label read_addr                /Insert_Pilot_tb/i1/read_addr                         
add wave -color Cyan -label dout_en                                  /Insert_Pilot_tb/i1/dout_en                         
add wave -color Magenta -radix unsigned -label pilot_imag_dout       /Insert_Pilot_tb/pilot_imag_dout                         
add wave -color Magenta -radix unsigned -label pilot_real_dout       /Insert_Pilot_tb/pilot_real_dout 
add wave -color Magenta -radix unsigned -label dout_valid            /Insert_Pilot_tb/dout_valid 
##add wave -color Magenta -radix unsigned -label                     /Insert_Pilot_tb/i1/ram_imag_dout                         
##add wave -color Magenta -radix unsigned -label                     /Insert_Pilot_tb/i1/ram_real_dout                        
                                                                    
##add wave -noupdate -color Magenta -format Literal -radix unsigned
run -all;