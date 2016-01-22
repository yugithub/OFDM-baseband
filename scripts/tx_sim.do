## Set waveform display


add wave -divider "Clks & Resets"
add wave -label clk                                     /$top_level/clk
add wave -label rst_n                                   /$top_level/rst_n
add wave -radix unsigned -label cp_real_dout            /$top_level/cp_real_dout
add wave -radix unsigned -label cp_imag_dout            /$top_level/cp_imag_dout

add wave -divider "Clk Div"
add wave -label clk_80                                 /$top_level/tx_top_ins/clk_80
add wave -label clk_20                                  /$top_level/tx_top_ins/clk_20

add wave -divider "PRBS_15"
add wave -radix bin -label prbs_out                     /$top_level/tx_top_ins/prbs/prbs_out

add wave -divider "QAM16 MAP"
add wave -radix bin -label qam_in                       /$top_level/tx_top_ins/map/qam_din
add wave -radix unsigned -label qam_dout_real           /$top_level/tx_top_ins/map/qam_dout_real
add wave -radix unsigned -label qam_dout_imag           /$top_level/tx_top_ins/map/qam_dout_imag
add wave -label dout_valid                              /$top_level/tx_top_ins/map/dout_valid
add wave -radix unsigned -label dout_index              /$top_level/tx_top_ins/map/dout_index

add wave -divider "Insert Pilot"
add wave -label pilot_clk                               /$top_level/tx_top_ins/pilot/pilot_clk
add wave -label pilot_rst_n                             /$top_level/tx_top_ins/pilot/pilot_rst_n
add wave -label din_valid                               /$top_level/tx_top_ins/pilot/din_valid
add wave -radix unsigned -label index                   /$top_level/tx_top_ins/pilot/index
add wave -radix unsigned -label pilot_real_din          /$top_level/tx_top_ins/pilot/pilot_real_din
add wave -radix unsigned -label pilot_imag_din          /$top_level/tx_top_ins/pilot/pilot_imag_din 

add wave -radix unsigned -label re_din_buf              /$top_level/tx_top_ins/pilot/re_din_buf
add wave -radix unsigned -label im_din_buf              /$top_level/tx_top_ins/pilot/im_din_buf
add wave -label din_en                                  /$top_level/tx_top_ins/pilot/din_en
add wave -radix unsigned -label index_reg               /$top_level/tx_top_ins/pilot/index_reg
add wave -label write_en                                /$top_level/tx_top_ins/pilot/write_en
add wave -radix unsigned -label write_addr              /$top_level/tx_top_ins/pilot/write_addr
add wave -radix unsigned -label ram_real_din            /$top_level/tx_top_ins/pilot/ram_real_din
add wave -radix unsigned -label ram_imag_din            /$top_level/tx_top_ins/pilot/ram_imag_din
add wave -label read_en                                 /$top_level/tx_top_ins/pilot/read_en
add wave -radix unsigned -label read_addr               /$top_level/tx_top_ins/pilot/read_addr
add wave -radix unsigned -label ram_real_dout           /$top_level/tx_top_ins/pilot/ram_real_dout
add wave -radix unsigned -label ram_imag_dout           /$top_level/tx_top_ins/pilot/ram_imag_dout
add wave -label dout_en                                 /$top_level/tx_top_ins/pilot/dout_en
add wave -radix unsigned -label pilot/pilot_real_dout   /$top_level/tx_top_ins/pilot/pilot_real_dout
add wave -radix unsigned -label pilot/pilot_imag_dout   /$top_level/tx_top_ins/pilot/pilot_imag_dout
add wave -label dout_valid                              /$top_level/tx_top_ins/pilot/dout_valid                                                                  

add wave -divider "hermitian"                          
add wave -label her_clk                 		           /$top_level/tx_top_ins/her_ins/her_clk                           
add wave -label her_rst_n               		           /$top_level/tx_top_ins/her_ins/her_rst_n 
add wave -label din_valid               		           /$top_level/tx_top_ins/her_ins/din_valid 
add wave -label write_en                		           /$top_level/tx_top_ins/her_ins/write_en
add wave -radix unsigned -label write_addrA                /$top_level/tx_top_ins/her_ins/write_addrA               
add wave -radix unsigned -label write_addrB                /$top_level/tx_top_ins/her_ins/write_addrB
add wave -radix unsigned -label din_index                  /$top_level/tx_top_ins/her_ins/din_index
add wave -radix dec -label her_real_din                    /$top_level/tx_top_ins/her_ins/her_real_din 
add wave -radix dec -label her_imag_din                    /$top_level/tx_top_ins/her_ins/her_imag_din
add wave -radix dec -label ramA_real_din                   /$top_level/tx_top_ins/her_ins/ramA_real_din 
add wave -radix dec -label ramA_imag_din                   /$top_level/tx_top_ins/her_ins/ramA_imag_din
add wave -radix dec -label ramB_real_din                   /$top_level/tx_top_ins/her_ins/ramB_real_din 
add wave -radix dec -label ramB_imag_din                   /$top_level/tx_top_ins/her_ins/ramB_imag_din
                                                           
add wave -label read_en                		               /$top_level/tx_top_ins/her_ins/read_en
add wave -label rctr                                       /$top_level/tx_top_ins/her_ins/rctr
add wave -radix unsigned -label read_addr                  /$top_level/tx_top_ins/her_ins/read_addr 
add wave -radix dec -label ramA_real_dout                  /$top_level/tx_top_ins/her_ins/ramA_real_dout 
add wave -radix dec -label ramA_imag_dout                  /$top_level/tx_top_ins/her_ins/ramA_imag_dout
add wave -radix dec -label ramA_real_buf                   /$top_level/tx_top_ins/her_ins/ramA_real_buf 
add wave -radix dec -label ramA_imag_buf                   /$top_level/tx_top_ins/her_ins/ramA_imag_buf
add wave -radix dec -label ramB_real_dout                  /$top_level/tx_top_ins/her_ins/ramB_real_dout 
add wave -radix dec -label ramB_imag_dout                  /$top_level/tx_top_ins/her_ins/ramB_imag_dout
add wave -radix dec -label ramB_real_buf                   /$top_level/tx_top_ins/her_ins/ramB_real_buf 
add wave -radix dec -label ramB_imag_buf                   /$top_level/tx_top_ins/her_ins/ramB_imag_buf
add wave -label dout_en                                    /$top_level/tx_top_ins/her_ins/dout_en
add wave -radix dec -label her_real_dout                   /$top_level/tx_top_ins/her_ins/her_real_dout   
add wave -radix dec -label her_imag_dout                   /$top_level/tx_top_ins/her_ins/her_imag_dout  
add wave -label dout_valid                                 /$top_level/tx_top_ins/her_ins/dout_valid         



add wave -divider "IFFT"    
add wave -label ifft_clk                 		            /$top_level/tx_top_ins/ifft/ifft_clk                           
add wave -label ifft_rst_n               		            /$top_level/tx_top_ins/ifft/ifft_rst_n 
add wave -label din_valid               		            /$top_level/tx_top_ins/ifft/din_valid 
add wave -radix dec -label ifft_real_din                    /$top_level/tx_top_ins/ifft/ifft_real_din 
add wave -radix dec -label ifft_imag_din                    /$top_level/tx_top_ins/ifft/ifft_imag_din
add wave -color Yellow -label sink_valid                    /$top_level/tx_top_ins/ifft/sink_valid
add wave -color Yellow -label sink_ready                    /$top_level/tx_top_ins/ifft/sink_ready
add wave -color Yellow -label inverse                       /$top_level/tx_top_ins/ifft/inverse
add wave -radix unsigned -label frame_cnt                   /$top_level/tx_top_ins/ifft/frame_cnt
add wave -color Yellow -label sink_sop                      /$top_level/tx_top_ins/ifft/sink_sop 
add wave -color Yellow -label sink_eop                      /$top_level/tx_top_ins/ifft/sink_eop
add wave -color Yellow -radix dec -label sink_real          /$top_level/tx_top_ins/ifft/sink_real 
add wave -color Yellow -radix dec -label sink_imag          /$top_level/tx_top_ins/ifft/sink_imag                                                            
                                                         
add wave -color Magenta -radix dec -label ifft_real_dout    /$top_level/tx_top_ins/ifft/ifft_real_dout   
add wave -color Magenta -radix dec -label ifft_imag_dout    /$top_level/tx_top_ins/ifft/ifft_imag_dout 
add wave -color Magenta -radix unsigned -label dout_index   /$top_level/tx_top_ins/ifft/dout_index
add wave -color Magenta -radix dec -label dout_exp          /$top_level/tx_top_ins/ifft/dout_exp                                                                  
add wave -color Magenta -label source_ready                 /$top_level/tx_top_ins/ifft/source_ready
add wave -color Magenta -label source_sop                   /$top_level/tx_top_ins/ifft/source_sop
add wave -color Magenta -label source_eop                   /$top_level/tx_top_ins/ifft/source_eop
add wave -color Magenta -label dout_valid                   /$top_level/tx_top_ins/ifft/dout_valid
add wave -color Magenta -label source_error                 /$top_level/tx_top_ins/ifft/source_error             


add wave -divider "scale_clip"                                               
add wave -radix dec -label sc_real_din                    /$top_level/tx_top_ins/sc_ins/sc_real_din 
add wave -radix dec -label sc_imag_din                    /$top_level/tx_top_ins/sc_ins/sc_imag_din
add wave -radix dec -label exp                            /$top_level/tx_top_ins/sc_ins/exp 
add wave -radix dec -label full_range_real_out            /$top_level/tx_top_ins/sc_ins/full_range_real_out                    
add wave -radix dec -label full_range_imag_out            /$top_level/tx_top_ins/sc_ins/full_range_imag_out                    
add wave -color Magenta -radix dec -label sc_real_dout    /$top_level/tx_top_ins/sc_ins/sc_real_dout   
add wave -color Magenta -radix dec -label sc_imag_dout    /$top_level/tx_top_ins/sc_ins/sc_imag_dout


add wave -divider "Add CP"   
add wave -label cp_clk                                               /$top_level/tx_top_ins/cp/cp_clk                           
add wave -label cp_rst_n                                             /$top_level/tx_top_ins/cp/cp_rst_n                         
add wave -label din_valid                                            /$top_level/tx_top_ins/cp/din_valid 
add wave -radix unsigned -label cp_real_din                          /$top_level/tx_top_ins/cp/cp_real_din                         
add wave -radix unsigned -label cp_imag_din                          /$top_level/tx_top_ins/cp/cp_imag_din                                         
add wave -color Yellow -radix unsigned -label din_index              /$top_level/tx_top_ins/cp/din_index 
add wave -color Yellow -label wctr                                   /$top_level/tx_top_ins/cp/wctr 
add wave -color Yellow -label write_en                               /$top_level/tx_top_ins/cp/write_en
add wave -color Yellow -radix unsigned -label write_addr             /$top_level/tx_top_ins/cp/write_addr
add wave -radix unsigned -label ram_real_din                         /$top_level/tx_top_ins/cp/ram_real_din                         
add wave -radix unsigned -label ram_imag_din                         /$top_level/tx_top_ins/cp/ram_imag_din   
add wave -color Cyan  -label rctr                                    /$top_level/tx_top_ins/cp/rctr  
add wave -color Cyan -label read_en                                  /$top_level/tx_top_ins/cp/read_en 
add wave -color Cyan -radix unsigned -label read_addr                /$top_level/tx_top_ins/cp/read_addr
add wave -color Cyan -label dout_valid                               /$top_level/tx_top_ins/cp/dout_valid 
add wave -color Magenta -radix unsigned -label ram_imag_dout         /$top_level/tx_top_ins/cp/ram_imag_dout                         
add wave -color Magenta -radix unsigned -label ram_real_dout         /$top_level/tx_top_ins/cp/ram_real_dout                     
add wave -color Magenta -radix unsigned -label cp_imag_dout          /$top_level/tx_top_ins/cp/cp_imag_dout                         
add wave -color Magenta -radix unsigned -label cp_real_dout          /$top_level/tx_top_ins/cp/cp_real_dout 