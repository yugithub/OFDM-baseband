vlib work
vmap work work
vlog C:/Users/Administrator/Desktop/code/sim_lib/altera_mf.v
vlog add_cyclic_prefix.v
vlog cp_ram2port.v
vlog add_cyclic_prefix_tb.v
vsim add_cyclic_prefix_tb

                                                                                 
add wave -label cp_clk                                               /add_cyclic_prefix_tb/cp_clk                           
add wave -label cp_rst_n                                             /add_cyclic_prefix_tb/cp_rst_n                         
add wave -label din_valid                                            /add_cyclic_prefix_tb/din_valid 
##add wave -label din_en                                               /add_cyclic_prefix_tb/i1/din_en                        
add wave -radix unsigned -label cp_real_din                          /add_cyclic_prefix_tb/cp_real_din                         
add wave -radix unsigned -label cp_imag_din                          /add_cyclic_prefix_tb/cp_imag_din                                         
add wave -color Yellow -radix unsigned -label din_index              /add_cyclic_prefix_tb/din_index 
##add wave -color Yellow -radix unsigned -label index                  /add_cyclic_prefix_tb/i1/index 
add wave -color Yellow -label wctr                                     /add_cyclic_prefix_tb/i1/wctr 
add wave -color Yellow -label write_en                               /add_cyclic_prefix_tb/i1/write_en
add wave -color Yellow -radix unsigned -label write_addr             /add_cyclic_prefix_tb/i1/write_addr
add wave -radix unsigned -label ram_real_din                         /add_cyclic_prefix_tb/i1/ram_real_din                         
add wave -radix unsigned -label ram_imag_din                         /add_cyclic_prefix_tb/i1/ram_imag_din   
##add wave -color Yellow -radix unsigned -label state                  /add_cyclic_prefix_tb/i1/state 
add wave -color Cyan  -label rctr                                    /add_cyclic_prefix_tb/i1/rctr  
add wave -color Cyan -label read_en                                  /add_cyclic_prefix_tb/i1/read_en 
add wave -color Cyan -radix unsigned -label read_addr                /add_cyclic_prefix_tb/i1/read_addr
##add wave -color Cyan -label dout_en                                  /add_cyclic_prefix_tb/i1/dout_en                           
add wave -color Cyan -label dout_valid                               /add_cyclic_prefix_tb/dout_valid 
add wave -color Magenta -radix unsigned -label ram_imag_dout          /add_cyclic_prefix_tb/i1/ram_imag_dout                         
add wave -color Magenta -radix unsigned -label ram_real_dout          /add_cyclic_prefix_tb/i1/ram_real_dout                     
add wave -color Magenta -radix unsigned -label cp_imag_dout          /add_cyclic_prefix_tb/cp_imag_dout                         
add wave -color Magenta -radix unsigned -label cp_real_dout          /add_cyclic_prefix_tb/cp_real_dout 
                       
                                                                   
run -all;