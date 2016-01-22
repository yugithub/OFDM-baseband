vlib work
vmap work work

vlog scale_clip.v
vlog scale_clip_tb.v
vsim scale_clip_tb

                                                                    
add wave -label clk                 		                /scale_clip_tb/clk                           


add wave -radix dec -label sc_real_din                    /scale_clip_tb/sc_real_din 
add wave -radix dec -label sc_imag_din                    /scale_clip_tb/sc_imag_din
add wave -radix dec -label exp                            /scale_clip_tb/ins/exp 
add wave -radix dec -label full_range_real_out            /scale_clip_tb/ins/full_range_real_out                    
add wave -radix dec -label full_range_imag_out            /scale_clip_tb/ins/full_range_imag_out                    
add wave -color Magenta -radix dec -label sc_real_dout    /scale_clip_tb/sc_real_dout   
add wave -color Magenta -radix dec -label sc_imag_dout    /scale_clip_tb/sc_imag_dout  

run -all;