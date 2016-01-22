
vlib work
vmap work work

vlog C:/Users/Administrator/Desktop/clk_div_test/sim_lib/altera_primitives.v                   
vlog C:/Users/Administrator/Desktop/clk_div_test/sim_lib/220model.v                             
vlog C:/Users/Administrator/Desktop/clk_div_test/sim_lib/sgate.v                               
vlog C:/Users/Administrator/Desktop/clk_div_test/sim_lib/altera_mf.v                          
vlog C:/Users/Administrator/Desktop/clk_div_test/sim_lib/altera_lnsim.sv                        
vlog C:/Users/Administrator/Desktop/clk_div_test/sim_lib/cyclonev_atoms_ncrypt.v      
vlog C:/Users/Administrator/Desktop/clk_div_test/sim_lib/cyclonev_hmi_atoms_ncrypt.v     
vlog C:/Users/Administrator/Desktop/clk_div_test/sim_lib/cyclonev_atoms.v                      
vlog C:/Users/Administrator/Desktop/clk_div_test/sim_lib/cyclonev_hssi_atoms_ncrypt.v    
vlog C:/Users/Administrator/Desktop/clk_div_test/sim_lib/cyclonev_hssi_atoms.v                  
vlog C:/Users/Administrator/Desktop/clk_div_test/sim_lib/cyclonev_pcie_hip_atoms_ncrypt.v
vlog C:/Users/Administrator/Desktop/clk_div_test/sim_lib/cyclonev_pcie_hip_atoms.v            


vlog clk_pll.vo
vlog clk_pll_0002.v
vlog clk_pll.v
vlog clk_pll_tb.v
vsim clk_pll_tb

add wave -label clk_in                      /clk_pll_tb/clk_in
add wave -label clk_pll_rst                 /clk_pll_tb/clk_pll_rst
add wave -color Yellow -label clk_20M       /clk_pll_tb/clk_20M
add wave -color Magenta -label clk_80M      /clk_pll_tb/clk_80M

run -all;