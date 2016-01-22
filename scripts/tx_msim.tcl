## QUARTUS 15.0.0 Build 145 04/22/2015 SJ Full Version
#------------------------------------------------------------------------------
# Directory locations

set quartus_sim_lib   "D:/altera/15.0/quartus/eda/sim_lib"
set quartus_sim_lib_mentor   "D:/altera/15.0/quartus/eda/sim_lib/mentor"

set proj_topdir       ".."

set workdir             "$proj_topdir/sim"
set srcdir              "$proj_topdir/source"
set scriptdir           "$proj_topdir/scripts"
set tbdir               "$proj_topdir/tb"

#------------------------------------------------------------------------------
# Set Simulation timing parameters 
set SimTime 409600

set TimeResolution 1ps

set bForceRecompile 0

# Project name
set proj_nam  "ofdm_tx"

# Close existing ModelSim simulation 
quit -sim

# Top level
set top_level "tx_top_tb"

 #------------------------------------------------------------------------------
 # Open/Create Modelsim Project
 #------------------------------------------------------------------------------
	if {[file exist [project env]] > 0} {project close}
	cd $workdir

	if {[file exist "${workdir}//${proj_nam}.mpf"] == 0} {
	  project new ${workdir}// ${proj_nam} 
	} else	{
	project open ${proj_nam}
	}

 #------------------------------------------------------------------------------
 # Create WORK directory IF it does not already exist
 #------------------------------------------------------------------------------
 # Create default work directory if not present
 if {[file exist work] ==0} 	{
   exec vlib work
   exec vmap work work}      

 #------------------------------------------------------------------------------
 # Compile ALTERA LIBRARIES
 #------------------------------------------------------------------------------
	vlib altera_ver
	vmap altera_ver altera_ver
	vlog -vlog01compat -work altera_ver $quartus_sim_lib/altera_primitives.v
	
	vlib lpm_ver
	vmap lpm_ver lpm_ver
	vlog -vlog01compat -work lpm_ver $quartus_sim_lib/220model.v
	
	vlib sgate_ver
	vmap sgate_ver sgate_ver
	vlog -vlog01compat -work sgate_ver $quartus_sim_lib/sgate.v
	
	vlib altera_mf_ver
	vmap altera_mf_ver altera_mf_ver
	vlog -vlog01compat -work altera_mf_ver $quartus_sim_lib/altera_mf.v
	
	vlib altera_lnsim_ver 
	vmap altera_lnsim_ver altera_lnsim_ver
	vlog -sv -work altera_lnsim_ver $quartus_sim_lib/altera_lnsim.sv
	
	vlib cyclonev_hssi_ver
	vmap cyclonev_hssi_ver cyclonev_hssi_ver
	vlog -vlog01compat -work cyclonev_hssi_ver $quartus_sim_lib/cyclonev_hssi_atoms.v
	vlog -work cyclonev_hssi_ver $quartus_sim_lib_mentor/cyclonev_hssi_atoms_ncrypt.v
	
	vlib cyclonev_pcie_hip_ver
	vmap cyclonev_pcie_hip_ver cyclonev_pcie_hip_ver
	vlog -vlog01compat -work cyclonev_pcie_hip_ver $quartus_sim_lib/cyclonev_pcie_hip_atoms.v
	vlog -work cyclonev_pcie_hip_ver $quartus_sim_lib_mentor/cyclonev_pcie_hip_atoms_ncrypt.v
	
	vlib cyclonev_ver
	vmap cyclonev_ver cyclonev_ver
	vlog -vlog01compat -work cyclonev_ver $quartus_sim_lib/cyclonev_atoms.v
	vlog -work cyclonev_ver $quartus_sim_lib_mentor/cyclonev_atoms_ncrypt.v
	vlog -work cyclonev_ver $quartus_sim_lib_mentor/cyclonev_hmi_atoms_ncrypt.v
 #------------------------------------------------------------------------------
 # Compile Source Verilog files
 #------------------------------------------------------------------------------
	vlog -vlog01compat -work work "$srcdir/clk/clk_pll.vo"
	vlog -vlog01compat -work work "$srcdir/clk/clk_pll_0002.v"
	vlog -vlog01compat -work work "$srcdir/clk/clk_pll.v"
        
	vlog -vlog01compat -work work "$srcdir/prbs/prbs15.v"
        
	vlog -vlog01compat -work work "$srcdir/map/QAM16_MAP.v"
        
	vlog -vlog01compat -work work "$srcdir/pilot/Insert_Pilot.v"
	vlog -vlog01compat -work work "$srcdir/pilot/pilot_ram2port.v"
       
	vlog -vlog01compat -work work "$srcdir/hermitian/hermitian.v"
	vlog -vlog01compat -work work "$srcdir/hermitian/her_ram2port.v"
        
	vlog -vlog01compat -work work "$srcdir/ifft/ifft_sim/ifft_clac.v"
	vlog -vlog01compat -work work "$srcdir/ifft/ifft_sim/fft_core.vo"
        
	vlog -vlog01compat -work work "$srcdir/scale_clip/scale_clip.v"
        
	vlog -vlog01compat -work work "$srcdir/cp/add_cyclic_prefix.v"
	vlog -vlog01compat -work work "$srcdir/cp/cp_ram2port.v"
       
	vlog -vlog01compat -work work "$srcdir/tx_top.v"
	vlog -vlog01compat -work work "$tbdir/tx_top_tb.v"


 #------------------------------------------------------------------------------
 # Copying files over to simulation directory
 #------------------------------------------------------------------------------
	file copy -force  $srcdir/pilot/pilot_data.mif $workdir
	
	file copy -force  $srcdir/ifft/ifft_sim/fft_core_1n64sin.hex $workdir
	file copy -force  $srcdir/ifft/ifft_sim/fft_core_2n64sin.hex $workdir
	file copy -force  $srcdir/ifft/ifft_sim/fft_core_3n64sin.hex $workdir
	file copy -force  $srcdir/ifft/ifft_sim/fft_core_1n64cos.hex $workdir
	file copy -force  $srcdir/ifft/ifft_sim/fft_core_2n64cos.hex $workdir
	file copy -force  $srcdir/ifft/ifft_sim/fft_core_3n64cos.hex $workdir
  

 #------------------------------------------------------------------------------
 # LOAD Top level entity for simulation
 #------------------------------------------------------------------------------
	vsim -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L cyclonev_ver -L work $top_level

 #------------------------------------------------------------------------------
 # Load Waveform File
 #------------------------------------------------------------------------------
	do $scriptdir/tx_sim.do

#  #------------------------------------------------------------------------------
#  # Run Simulation
#  #------------------------------------------------------------------------------
  set StdArithNoWarnings  1

  run $SimTime ns;