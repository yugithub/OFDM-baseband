vlib work
vmap work work
vlog C:/Users/Administrator/Desktop/code/sim_lib/altera_mf.v
vlog her_ram2port.v
vlog hermitian.v
vlog hermitian_tb.v
vsim hermitian_tb

                                                                    
add wave -label her_clk                 		            /hermitian_tb/her_clk                           
add wave -label her_rst_n               		            /hermitian_tb/her_rst_n 
add wave -label din_valid               		            /hermitian_tb/din_valid 
add wave -radix unsigned -label din_index                   /hermitian_tb/din_index
add wave -label write_en                		            /hermitian_tb/ins/write_en
add wave -radix unsigned -label write_addrA                 /hermitian_tb/ins/write_addrA               
add wave -radix unsigned -label write_addrB                 /hermitian_tb/ins/write_addrB

add wave -radix dec -label her_real_din                     /hermitian_tb/her_real_din 
add wave -radix dec -label her_imag_din                     /hermitian_tb/her_imag_din
add wave -radix dec -label ramA_real_din                    /hermitian_tb/ins/ramA_real_din 
add wave -radix dec -label ramA_imag_din                    /hermitian_tb/ins/ramA_imag_din
add wave -radix dec -label ramB_real_din                    /hermitian_tb/ins/ramB_real_din 
add wave -radix dec -label ramB_imag_din                    /hermitian_tb/ins/ramB_imag_din

add wave -label read_en                		                /hermitian_tb/ins/read_en
add wave -label rctr                                        /hermitian_tb/ins/rctr
add wave -radix unsigned -label read_addr                   /hermitian_tb/ins/read_addr 
add wave -radix dec -label ramA_real_dout                   /hermitian_tb/ins/ramA_real_dout 
add wave -radix dec -label ramA_imag_dout                   /hermitian_tb/ins/ramA_imag_dout
add wave -radix dec -label ramA_real_buf                    /hermitian_tb/ins/ramA_real_buf 
add wave -radix dec -label ramA_imag_buf                    /hermitian_tb/ins/ramA_imag_buf
add wave -radix dec -label ramB_real_dout                   /hermitian_tb/ins/ramB_real_dout 
add wave -radix dec -label ramB_imag_dout                   /hermitian_tb/ins/ramB_imag_dout
add wave -radix dec -label ramB_real_buf                    /hermitian_tb/ins/ramB_real_buf 
add wave -radix dec -label ramB_imag_buf                    /hermitian_tb/ins/ramB_imag_buf
add wave -label dout_en                                     /hermitian_tb/ins/dout_en
add wave -radix unsigned -label dout_index                  /hermitian_tb/ins/dout_index
add wave -radix dec -label her_real_dout                    /hermitian_tb/her_real_dout   
add wave -radix dec -label her_imag_dout                    /hermitian_tb/her_imag_dout  
add wave -label dout_valid                                  /hermitian_tb/dout_valid                                                                  

run -all;