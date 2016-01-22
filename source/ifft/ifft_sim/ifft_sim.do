
vlib work
vmap work work
vlog C:/Users/Administrator/Desktop/fft_test/sim_lib/altera_primitives.v                   
vlog C:/Users/Administrator/Desktop/fft_test/sim_lib/220model.v                             
vlog C:/Users/Administrator/Desktop/fft_test/sim_lib/sgate.v                               
vlog C:/Users/Administrator/Desktop/fft_test/sim_lib/altera_mf.v                          
vlog C:/Users/Administrator/Desktop/fft_test/sim_lib/altera_lnsim.sv                        
vlog C:/Users/Administrator/Desktop/fft_test/sim_lib/cyclonev_atoms_ncrypt.v      
vlog C:/Users/Administrator/Desktop/fft_test/sim_lib/cyclonev_hmi_atoms_ncrypt.v     
vlog C:/Users/Administrator/Desktop/fft_test/sim_lib/cyclonev_atoms.v                      
vlog C:/Users/Administrator/Desktop/fft_test/sim_lib/cyclonev_hssi_atoms_ncrypt.v    
vlog C:/Users/Administrator/Desktop/fft_test/sim_lib/cyclonev_hssi_atoms.v                  
vlog C:/Users/Administrator/Desktop/fft_test/sim_lib/cyclonev_pcie_hip_atoms_ncrypt.v
vlog C:/Users/Administrator/Desktop/fft_test/sim_lib/cyclonev_pcie_hip_atoms.v            


vlog fft_core.vo
vlog ifft_clac.v
vlog ifft_clac_tb.v
vsim ifft_clac_tb

                                                                    
add wave -label ifft_clk                 		            /ifft_clac_tb/ifft_clk                           
add wave -label ifft_rst_n               		            /ifft_clac_tb/ifft_rst_n 
add wave -label din_valid               		            /ifft_clac_tb/din_valid 
add wave -radix dec -label ifft_real_din                    /ifft_clac_tb/ifft_real_din 
add wave -radix dec -label ifft_imag_din                    /ifft_clac_tb/ifft_imag_din
add wave -color Yellow -label sink_valid                    /ifft_clac_tb/dut/sink_valid
add wave -color Yellow -label sink_ready                    /ifft_clac_tb/dut/sink_ready
add wave -color Yellow -label inverse                       /ifft_clac_tb/dut/inverse
add wave -color Yellow -label sink_sop                      /ifft_clac_tb/dut/sink_sop 
add wave -color Yellow -label sink_eop                      /ifft_clac_tb/dut/sink_eop
add wave -color Yellow -radix dec -label sink_real          /ifft_clac_tb/dut/sink_real 
add wave -color Yellow -radix dec -label sink_imag          /ifft_clac_tb/dut/sink_imag                                                            

add wave -color Magenta -radix dec -label ifft_real_dout    /ifft_clac_tb/ifft_real_dout   
add wave -color Magenta -radix dec -label ifft_imag_dout    /ifft_clac_tb/ifft_imag_dout 
add wave -color Magenta -radix unsigned -label dout_index   /ifft_clac_tb/dout_index
add wave -color Magenta -radix dec -label dout_exp          /ifft_clac_tb/dout_exp                                                                  
add wave -color Magenta -label source_ready                 /ifft_clac_tb/dut/source_ready
add wave -color Magenta -label source_sop                   /ifft_clac_tb/dut/source_sop
add wave -color Magenta -label source_eop                   /ifft_clac_tb/dut/source_eop
add wave -color Magenta -label dout_valid                   /ifft_clac_tb/dout_valid
add wave -color Magenta -label source_error                 /ifft_clac_tb/dut/source_error
run -all;