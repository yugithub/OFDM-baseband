vlib work
vmap work work
vlog prbs15.v
vlog prbs15_tb.v
vsim prbs15_tb

                                                                    
add wave -label prbs_clk                 /prbs15_tb/prbs_clk                           
add wave -label prbs_rst_n               /prbs15_tb/prbs_rst_n 
add wave -label trig_en                  /prbs15_tb/trig_en  
##add wave -radix unsigned -label cycles   /prbs15_tb/cycles                       
add wave -label prbs_mem                 /prbs15_tb/ins/prbs_mem 
add wave -label dout_valid                  /prbs15_tb/dout_valid
add wave -label prbs_out                 /prbs15_tb/prbs_out   
                                                                  

run -all;