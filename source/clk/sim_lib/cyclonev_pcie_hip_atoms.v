// Copyright (C) 1991-2013 Altera Corporation
// This simulation model contains highly confidential and
// proprietary information of Altera and is being provided
// in accordance with and subject to the protections of the
// applicable Altera Program License Subscription Agreement
// which governs its use and disclosure. Your use of Altera
// Corporation's design tools, logic functions and other
// software and tools, and its AMPP partner logic functions,
// and any output files any of the foregoing (including device
// programming or simulation files), and any associated
// documentation or information are expressly subject to the
// terms and conditions of the Altera Program License Subscription
// Agreement, Altera MegaCore Function License Agreement, or other
// applicable license agreement, including, without limitation,
// that your use is for the sole purpose of simulating designs for
// use exclusively in logic devices manufactured by Altera and sold
// by Altera or its authorized distributors. Please refer to the
// applicable agreement for further details. Altera products and
// services are protected under numerous U.S. and foreign patents,
// maskwork rights, copyrights and other intellectual property laws.
// Altera assumes no responsibility or liability arising out of the
// application or use of this simulation model.
// Quartus II 13.1.0 Build 158 09/25/2013
`timescale 1 ps/1 ps

module cyclonev_hd_altpe2_hip_top (
   usermode,                   // use to gate off input signal
   hippartialreconfign,        // use to gate off output signal
   csrclk,
   csrin,
   csren,
   csrout,
   csrcbdin,
   csrtcsrin,
   csrdin,
   csrseg,
   csrenscan,
   csrtverify,
   csrloadcsr,
   csrpipein,
   csrdout,
   csrpipeout,
   avmmrstn,
   avmmclk,
   avmmwrite,
   avmmread,
   avmmbyteen,
   avmmaddress,
   avmmwritedata,
   sershiftload,
   interfacesel,
   avmmreaddata,
   mdioclk,
   mdioin,
   cbhipmdioen,
   mdiodevaddr,
   mdioout,
   mdiooenn,
   lmidout,
   lmiack,
   lmirden,
   lmiwren,
   lmiaddr,
   lmidin,
   resetstatus,
   l2exit,
   hotrstexit,
   dlupexit,
   pldclk,
   pldsrst,
   pldrst,
   phyrst,
   physrst,
   coreclkin,
   coreclkout,
   corerst,
   corepor,
   corecrst,
   coresrst,
   swdnwake,
   swuphotrst,
   swdnin,
   swupin,
   rxvalidvc0,
   rxerrvc0,
   rxbardecvc0,
   rxsopvc00,
   rxeopvc00,
   rxdatavc00,
   rxbevc00,
   rxsopvc01,
   rxeopvc01,
   rxdatavc01,
   rxbevc01,
   rxfifofullvc0,
   rxfifoemptyvc0,
   rxfifowrpvc0,
   rxfifordpvc0,
   txcredvc0,
   txreadyvc0,
   txfifofullvc0,
   txfifoemptyvc0,
   txfifowrpvc0,
   txfifordpvc0,
   rxmaskvc0,
   rxreadyvc0,
   txvalidvc0,
   txerrvc0,
   txsopvc00,
   txeopvc00,
   txdatavc00,
   txsopvc01,
   txeopvc01,
   txdatavc01,
   tlpmetosr,
   tlpmetocr,
   tlpmevent,
   tlpmdata,
   tlpmauxpwr,
   tlcfgsts,
   tlcfgstswr,
   tlcfgctl,
   tlcfgctlwr,
   tlcfgadd,
   tlappintaack,
   tlappmsiack,
   intstatus,
   tlappintasts,
   tlappmsireq,
   tlappmsitc,
   tlappmsinum,
   tlaermsinum,
   tlpexmsinum,
   tlhpgctrler,
   laneact,          // Mux with tlcfgsts[80:77]
   dlltssm,          // Mux with tlcfgsts[75:71]
   clrrxpath,        // Mux with tlcfgsts[70:70]
   dlcurrentspeed,      // Mux with tlcfgsts[60:59]
   dlcomclkreg,  // ww51.5 change by Ning Xue
   dlvcctrl,
   dlctrllink2,
   testouthip,
   ev1us,
   ev128ns,
   wakeoen,
   serrout,
   tlslotclkcfg,
   mode,
   testinhip,
   cplerr,
   pcierr,
   rate0,
   rate1,
   rate2,
   rate3,
   rate4,
   rate5,
   rate6,
   rate7,
   rate8,
   //ratetiedtognd,
   eidleinfersel0,
   txdeemph0,
   txmargin0,
   txdata0,
   txdatak0,
   txdetectrx0,
   txelecidle0,
   txcompl0,
   rxpolarity0,
   powerdown0,
   rxdata0,
   rxdatak0,
   rxvalid0,
   phystatus0,
   rxelecidle0,
   rxstatus0,
   eidleinfersel1,
   txdeemph1,
   txmargin1,
   txdata1,
   txdatak1,
   txdetectrx1,
   txelecidle1,
   txcompl1,
   rxpolarity1,
   powerdown1,
   rxdata1,
   rxdatak1,
   rxvalid1,
   phystatus1,
   rxelecidle1,
   rxstatus1,
   eidleinfersel2,
   txdeemph2,
   txmargin2,
   txdata2,
   txdatak2,
   txdetectrx2,
   txelecidle2,
   txcompl2,
   rxpolarity2,
   powerdown2,
   rxdata2,
   rxdatak2,
   rxvalid2,
   phystatus2,
   rxelecidle2,
   rxstatus2,
   eidleinfersel3,
   txdeemph3,
   txmargin3,
   txdata3,
   txdatak3,
   txdetectrx3,
   txelecidle3,
   txcompl3,
   rxpolarity3,
   powerdown3,
   rxdata3,
   rxdatak3,
   rxvalid3,
   phystatus3,
   rxelecidle3,
   rxstatus3,
   eidleinfersel4,
   txdeemph4,
   txmargin4,
   txdata4,
   txdatak4,
   txdetectrx4,
   txelecidle4,
   txcompl4,
   rxpolarity4,
   powerdown4,
   rxdata4,
   rxdatak4,
   rxvalid4,
   phystatus4,
   rxelecidle4,
   rxstatus4,
   eidleinfersel5,
   txdeemph5,
   txmargin5,
   txdata5,
   txdatak5,
   txdetectrx5,
   txelecidle5,
   txcompl5,
   rxpolarity5,
   powerdown5,
   rxdata5,
   rxdatak5,
   rxvalid5,
   phystatus5,
   rxelecidle5,
   rxstatus5,
   eidleinfersel6,
   txdeemph6,
   txmargin6,
   txdata6,
   txdatak6,
   txdetectrx6,
   txelecidle6,
   txcompl6,
   rxpolarity6,
   powerdown6,
   rxdata6,
   rxdatak6,
   rxvalid6,
   phystatus6,
   rxelecidle6,
   rxstatus6,
   eidleinfersel7,
   txdeemph7,
   txmargin7,
   txdata7,
   txdatak7,
   txdetectrx7,
   txelecidle7,
   txcompl7,
   rxpolarity7,
   powerdown7,
   rxdata7,
   rxdatak7,
   rxvalid7,
   phystatus7,
   rxelecidle7,
   rxstatus7,
   ltssml0state,      // LTSSM L0 State flag
   // REGSCAN I/Os for MRAM I/O testing
   bisttestenn,         // BIST-related I/Os for MRAM
   bistscanin,             // Shared between 3 MRAM BISTs
   bistscanenn,             // Shared between 3 MRAM BISTs
   bistenn,
   bistscanoutrpl,
   bistscanoutrcv0,
   bistscanoutrcv1,
   bistdonearpl,
   bistdonebrpl,
   bistpassrpl,
   derrrpl,
   derrcorextrpl,
   bistdonearcv0,
   bistdonebrcv0,
   bistpassrcv0,
   derrcorextrcv0,
   derrcorextrcv1,
   bistdonearcv1,
   bistdonebrcv1,
   bistpassrcv1,
   //derrcorextrcv1,
   // scan test IO
   scanmoden,
   scanenn,
   dpriorefclkdig,
   // FRZ signals for MRAMs
   nfrzdrv,
   frzreg,
   frzlogic,
   // Redundancy IDs for the 3 MRAMs
   //idrpl,
   //idrcv0,
   //idrcv1,
   //Hard Reset Inputs
   pinperstn,              // Active low PCIE reset from PCIE Interface PIN
   pldperstn,              // Active low PCIE reset from PLD core
   pldclrpmapcshipn,       // From PLD Active low signal To Hard Reset Ctrl, reset the PMA/PCS/HIP
   pldclrpcshipn,          // From PLD Active low signal To Hard Reset Ctrl, reset the PCS/HIP
   pldclrhipn,             // From PLD Active low signal To Hard Reset Ctrl, reset the HIP NON STICKY Bits (CRST & SRST)
   // Control signals from Control Block and POR
   iocsrrdydly,             // I/O CSR Ready Delayed (Low when IOCSR is not configured)
   plniotri,
   entest,
   por,
   //Hard Reset Controller
   frefclk0,
   frefclk1,
   frefclk2,
   frefclk3,
   frefclk4,
   frefclk5,
   frefclk6,
   frefclk7,
   frefclk8,

   rxfreqtxcmuplllock0,
   rxfreqtxcmuplllock1,
   rxfreqtxcmuplllock2,
   rxfreqtxcmuplllock3,
   rxfreqtxcmuplllock4,
   rxfreqtxcmuplllock5,
   rxfreqtxcmuplllock6,
   rxfreqtxcmuplllock7,
   rxfreqtxcmuplllock8,

   rxpllphaselock0,
   rxpllphaselock1,
   rxpllphaselock2,
   rxpllphaselock3,
   rxpllphaselock4,
   rxpllphaselock5,
   rxpllphaselock6,
   rxpllphaselock7,
   rxpllphaselock8,

   txpcsrstn0,
   txpcsrstn1,
   txpcsrstn2,
   txpcsrstn3,
   txpcsrstn4,
   txpcsrstn5,
   txpcsrstn6,
   txpcsrstn7,
   txpcsrstn8,

   rxpcsrstn0,
   rxpcsrstn1,
   rxpcsrstn2,
   rxpcsrstn3,
   rxpcsrstn4,
   rxpcsrstn5,
   rxpcsrstn6,
   rxpcsrstn7,
   rxpcsrstn8,

   txpmasyncp0,
   txpmasyncp1,
   txpmasyncp2,
   txpmasyncp3,
   txpmasyncp4,
   txpmasyncp5,
   txpmasyncp6,
   txpmasyncp7,
   txpmasyncp8,

   rxpmarstb0,
   rxpmarstb1,
   rxpmarstb2,
   rxpmarstb3,
   rxpmarstb4,
   rxpmarstb5,
   rxpmarstb6,
   rxpmarstb7,
   rxpmarstb8,

   rxbardecfuncnumvc0,
   tlpmeventfunc,
   tlappintafuncnum,
   tlappintbsts,
   tlappintbfuncnum,
   tlappintcsts,
   tlappintcfuncnum,
   tlappintdsts,
   tlappintdfuncnum,
   tlappmsifunc,
   cplpending,
   cplerrfunc,
   flrreset,
   cvpconfigready,
   cvpen,
   cvpconfigerror,
   cvpconfigdone,
   cvpclk,
   cvpdata,
   cvpstartxfer,
   cvpconfig,
   cvpfullconfig,
   pclkch0,
   pclkch1,
   pclkcentral,
   pllfixedclkch0,
   pllfixedclkch1,
   pllfixedclkcentral,
   tlappintback,
   tlappintcack,
   tlappintdack,
   //tlcfgctladd,
   flrsts,
   rxfreqlocked0,
   rxfreqlocked1,
   rxfreqlocked2,
   rxfreqlocked3,
   rxfreqlocked4,
   rxfreqlocked5,
   rxfreqlocked6,
   rxfreqlocked7,
   txswing0,
   txswing1,
   txswing2,
   txswing3,
   txswing4,
   txswing5,
   txswing6,
   txswing7,
   txcredfchipcons, // TL to AL Indicates that HIP consumed one of PH PD, NPH, NPD, CH, CD
   txcredfcinfinite, // TL to AL Indicates if this is an infinite credit PH PD, NPH, NPD, CH, CD
   txcredhdrfcp,    // TL to AL Header credit of the received FC Posted.
   txcreddatafcp,   // TL to AL Signals the Data credit of the received FC Posted
   txcredhdrfcnp,   // TL to AL Header credit of the received FC Non Posted
   txcreddatafcnp,  // TL to AL Signals the Data credit of the received FC Non Posted
   txcredhdrfccp,   // TL to AL Header credit of the received FC completion.
   txcreddatafccp,  // TL to AL Signals the Data credit of the received FC completion
   // Debug signals
   dbgpipex1rx,
   // Simulation only
   vcc_hd,
   vss_hd,
   // Extra signals
   hipextrain,
   hipextraclkin,
   r2cerrext,
   successfulspeednegotiationint,
   hipextraout,
   hipextraclkout,
   pldcoreready,
   pldclkinuse



);

   parameter func_mode = "disable"; //Valid values: DISABLE|ENABLE
   parameter bonding_mode = "bond_disable";  //Valid values: BOND_DISABLE|X8_G1G2|X8_G3|X4|X2|X1
   parameter prot_mode = "disabled_prot_mode";  //Valid values: PIPE_G1|PIPE_G2|PIPE_G3|DISABLED_PROT_MODE
   parameter pcie_spec_1p0_compliance = "spec_1p1";   //Valid values: SPEC_1P1|SPEC_1P0A
   parameter vc_enable = "single_vc";  //Valid values: SINGLE_VC
   parameter enable_slot_register = "false"; //Valid values: TRUE|FALSE
   parameter pcie_mode = "shared_mode";   //Valid values: EP_NATIVE|EP_LEGACY|RP|SW_UP|SW_DN|BRIDGE|SWITCH_MODE|SHARED_MODE
   parameter multi_function = "one_fun"; //Valid values: "one_func", "two_func", "three_func", "four_func", "five_func", "six_func", "seven_func", "eight_func"
   parameter bypass_cdc = "false";  //Valid values: TRUE|FALSE
   parameter cdc_clk_relation = "plesiochronous"; //Valid values: plesiochronous|mesochronous
   parameter enable_rx_reordering = "true";  //Valid values: TRUE|FALSE
   parameter enable_rx_buffer_checking = "false";  //Valid values: TRUE|FALSE
   parameter single_rx_detect_data = 4'b0;   //Valid values: 4
   parameter single_rx_detect = "single_rx_detect";   //Valid values: SINGLE_RX_DETECT
   parameter use_crc_forwarding = "false";   //Valid values: TRUE|FALSE
   parameter bypass_tl = "false";   //Valid values: TRUE|FALSE
   parameter gen12_lane_rate_mode = "gen1"; //Valid values: GEN1|GEN1_GEN2|GEN1_GEN2_GEN3
   parameter lane_mask = "x4";   //Valid values: X1|X2|X4|X8
   parameter disable_link_x2_support = "false"; //Valid values: TRUE|FALSE
   parameter national_inst_thru_enhance = "true";  //Valid values: TRUE|FALSE
   parameter disable_tag_check = "enable"; //Valid values: ENABLE|DISABLE
   parameter port_link_number_data = 8'b1;   //Valid values: 8
   parameter port_link_number = "port_link_number";   //Valid values: PORT_LINK_NUMBER
   parameter device_number_data = 5'b0;   //Valid values: 5
   parameter device_number = "device_number";   //Valid values: DEVICE_NUMBER
   parameter bypass_clk_switch = "false"; //Valid values: FALSE|TRUE
   parameter core_clk_out_sel = "div_1";  //Valid values: DIV_1|DIV_2|DIV_4|DIV_8
   parameter core_clk_divider = "div_1";  //Valid values: DIV_1|DIV_2|DIV_4|DIV_8
   parameter core_clk_source = "pll_fixed_clk"; //Valid values: PLL_FIXED_CLK|PCLK|CORE_CLK_IN
   parameter core_clk_sel = "pld_clk"; //Valid values: PLD_CLK|CORE_CLK_250
   parameter disable_clk_switch = "disable"; //Valid values: ENABLE|DISABLE
   parameter core_clk_disable_clk_switch = "pld_clk"; //Valid values: PLD_CLK|CORE_CLK_250
   parameter slotclk_cfg = "dynamic_slotclkcfg"; //possible values are "static_slotclkcfgon", "static_slotclkcfgoff", "dynamic_slotclkcfg"
   parameter tx_swing_data = 8'b0;
   parameter tx_swing = "tx_swing";
   parameter enable_ch0_pclk_out = "pclk_ch01";   //Valid values: pclk_ch01|pclk_central
   parameter enable_ch01_pclk_out = "pclk_ch0"; //Valid values: PCLK_CH0|PCLK_CH1
   parameter pipex1_debug_sel = "disable";   //Valid values: DISABLE|ENABLE
   parameter pclk_out_sel = "pclk"; //Valid values: PCLK|CORE_CLK_IN

   //Func 0 - Config Register Settings START -------------
   parameter vendor_id_data_0 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_0 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_0 = 16'b1;   //Valid values: 16
   parameter device_id_0 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_0 = 8'b1;  //Valid values: 8
   parameter revision_id_0 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_0 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_0 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_0 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_0 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_0 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_0 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_0 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_0 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_0 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_0 = 3'b0; //Valid values: 3
   parameter maximum_current_0 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_0 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_0 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_0 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_0 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_0 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_0 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_0 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_0 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_0 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_0 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_0 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_0 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_0 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_0 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_0 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_0 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_0 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_0 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_0 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_0 = 3'b111;  //Valid values: 3
   parameter indicator_0 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_0 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_0 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_0 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_0 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_0 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_0 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_0 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_0 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_0 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_0 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_0 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_0 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_0 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_0 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_0 = 13'b0; //Valid values: 13
   parameter slot_number_0 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_0 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_0 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_0 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_0 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_0 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_0 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_0 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_0 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_0 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_0 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_0 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_0 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_0 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_0 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_0 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_0 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_0 = 11'b0;   //Valid values: 11
   parameter msix_table_size_0 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_0 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_0 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_0 = 29'b0; //Valid values: 29
   parameter msix_table_offset_0 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_0 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_0 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_0 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_0 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_0 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_0 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_0 = 16'b0; //Valid values: 16
   parameter ssvid_0 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_0 = 16'b0;  //Valid values: 16
   parameter ssid_0 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_0 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_0 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_0 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_0 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_0 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_0 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_0 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_0 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_0 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_0 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_0 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_0 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_0 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_0 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_0 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_0 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_0 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_0 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_0 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_0 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_0 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_0 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_0 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_0 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_0 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_0 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_0 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_0 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_0 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_0 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_0 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_0 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_0 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_0 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_0 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_0 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_0 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_0 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_0 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_0 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 0 - Config Register Settings END -------------

   //Func 1 - Config Register Settings START -------------
   parameter vendor_id_data_1 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_1 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_1 = 16'b1;   //Valid values: 16
   parameter device_id_1 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_1 = 8'b1;  //Valid values: 8
   parameter revision_id_1 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_1 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_1 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_1 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_1 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_1 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_1 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_1 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_1 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_1 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_1 = 3'b0; //Valid values: 3
   parameter maximum_current_1 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_1 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_1 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_1 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_1 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_1 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_1 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_1 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_1 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_1 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_1 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_1 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_1 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_1 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_1 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_1 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_1 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_1 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_1 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_1 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_1 = 3'b111;  //Valid values: 3
   parameter indicator_1 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_1 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_1 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_1 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_1 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_1 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_1 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_1 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_1 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_1 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_1 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_1 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_1 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_1 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_1 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_1 = 13'b0; //Valid values: 13
   parameter slot_number_1 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_1 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_1 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_1 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_1 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_1 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_1 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_1 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_1 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_1 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_1 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_1 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_1 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_1 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_1 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_1 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_1 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_1 = 11'b0;   //Valid values: 11
   parameter msix_table_size_1 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_1 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_1 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_1 = 29'b0; //Valid values: 29
   parameter msix_table_offset_1 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_1 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_1 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_1 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_1 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_1 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_1 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_1 = 16'b0; //Valid values: 16
   parameter ssvid_1 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_1 = 16'b0;  //Valid values: 16
   parameter ssid_1 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_1 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_1 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_1 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_1 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_1 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_1 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_1 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_1 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_1 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_1 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_1 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_1 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_1 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_1 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_1 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_1 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_1 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_1 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_1 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_1 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_1 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_1 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_1 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_1 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_1 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_1 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_1 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_1 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_1 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_1 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_1 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_1 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_1 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_1 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_1 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_1 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_1 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_1 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_1 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_1 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 1 - Config Register Settings END -------------

   //Func 2 - Config Register Settings START -------------
   parameter vendor_id_data_2 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_2 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_2 = 16'b1;   //Valid values: 16
   parameter device_id_2 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_2 = 8'b1;  //Valid values: 8
   parameter revision_id_2 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_2 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_2 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_2 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_2 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_2 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_2 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_2 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_2 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_2 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_2 = 3'b0; //Valid values: 3
   parameter maximum_current_2 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_2 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_2 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_2 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_2 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_2 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_2 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_2 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_2 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_2 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_2 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_2 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_2 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_2 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_2 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_2 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_2 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_2 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_2 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_2 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_2 = 3'b111;  //Valid values: 3
   parameter indicator_2 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_2 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_2 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_2 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_2 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_2 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_2 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_2 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_2 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_2 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_2 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_2 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_2 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_2 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_2 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_2 = 13'b0; //Valid values: 13
   parameter slot_number_2 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_2 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_2 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_2 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_2 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_2 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_2 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_2 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_2 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_2 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_2 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_2 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_2 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_2 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_2 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_2 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_2 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_2 = 11'b0;   //Valid values: 11
   parameter msix_table_size_2 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_2 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_2 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_2 = 29'b0; //Valid values: 29
   parameter msix_table_offset_2 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_2 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_2 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_2 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_2 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_2 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_2 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_2 = 16'b0; //Valid values: 16
   parameter ssvid_2 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_2 = 16'b0;  //Valid values: 16
   parameter ssid_2 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_2 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_2 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_2 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_2 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_2 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_2 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_2 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_2 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_2 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_2 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_2 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_2 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_2 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_2 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_2 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_2 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_2 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_2 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_2 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_2 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_2 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_2 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_2 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_2 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_2 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_2 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_2 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_2 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_2 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_2 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_2 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_2 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_2 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_2 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_2 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_2 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_2 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_2 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_2 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_2 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 2 - Config Register Settings END -------------

   //Func 3 - Config Register Settings START -------------
   parameter vendor_id_data_3 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_3 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_3 = 16'b1;   //Valid values: 16
   parameter device_id_3 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_3 = 8'b1;  //Valid values: 8
   parameter revision_id_3 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_3 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_3 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_3 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_3 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_3 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_3 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_3 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_3 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_3 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_3 = 3'b0; //Valid values: 3
   parameter maximum_current_3 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_3 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_3 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_3 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_3 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_3 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_3 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_3 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_3 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_3 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_3 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_3 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_3 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_3 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_3 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_3 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_3 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_3 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_3 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_3 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_3 = 3'b111;  //Valid values: 3
   parameter indicator_3 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_3 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_3 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_3 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_3 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_3 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_3 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_3 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_3 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_3 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_3 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_3 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_3 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_3 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_3 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_3 = 13'b0; //Valid values: 13
   parameter slot_number_3 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_3 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_3 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_3 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_3 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_3 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_3 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_3 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_3 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_3 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_3 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_3 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_3 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_3 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_3 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_3 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_3 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_3 = 11'b0;   //Valid values: 11
   parameter msix_table_size_3 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_3 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_3 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_3 = 29'b0; //Valid values: 29
   parameter msix_table_offset_3 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_3 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_3 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_3 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_3 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_3 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_3 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_3 = 16'b0; //Valid values: 16
   parameter ssvid_3 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_3 = 16'b0;  //Valid values: 16
   parameter ssid_3 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_3 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_3 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_3 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_3 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_3 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_3 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_3 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_3 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_3 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_3 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_3 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_3 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_3 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_3 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_3 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_3 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_3 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_3 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_3 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_3 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_3 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_3 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_3 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_3 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_3 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_3 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_3 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_3 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_3 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_3 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_3 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_3 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_3 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_3 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_3 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_3 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_3 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_3 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_3 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_3 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 3 - Config Register Settings END -------------

   //Func 4 - Config Register Settings START -------------
   parameter vendor_id_data_4 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_4 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_4 = 16'b1;   //Valid values: 16
   parameter device_id_4 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_4 = 8'b1;  //Valid values: 8
   parameter revision_id_4 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_4 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_4 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_4 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_4 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_4 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_4 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_4 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_4 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_4 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_4 = 3'b0; //Valid values: 3
   parameter maximum_current_4 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_4 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_4 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_4 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_4 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_4 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_4 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_4 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_4 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_4 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_4 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_4 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_4 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_4 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_4 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_4 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_4 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_4 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_4 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_4 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_4 = 3'b111;  //Valid values: 3
   parameter indicator_4 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_4 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_4 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_4 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_4 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_4 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_4 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_4 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_4 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_4 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_4 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_4 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_4 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_4 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_4 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_4 = 13'b0; //Valid values: 13
   parameter slot_number_4 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_4 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_4 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_4 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_4 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_4 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_4 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_4 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_4 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_4 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_4 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_4 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_4 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_4 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_4 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_4 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_4 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_4 = 11'b0;   //Valid values: 11
   parameter msix_table_size_4 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_4 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_4 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_4 = 29'b0; //Valid values: 29
   parameter msix_table_offset_4 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_4 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_4 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_4 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_4 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_4 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_4 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_4 = 16'b0; //Valid values: 16
   parameter ssvid_4 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_4 = 16'b0;  //Valid values: 16
   parameter ssid_4 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_4 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_4 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_4 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_4 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_4 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_4 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_4 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_4 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_4 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_4 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_4 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_4 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_4 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_4 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_4 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_4 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_4 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_4 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_4 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_4 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_4 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_4 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_4 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_4 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_4 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_4 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_4 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_4 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_4 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_4 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_4 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_4 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_4 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_4 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_4 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_4 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_4 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_4 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_4 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_4 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 4 - Config Register Settings END -------------

   //Func 5 - Config Register Settings START -------------
   parameter vendor_id_data_5 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_5 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_5 = 16'b1;   //Valid values: 16
   parameter device_id_5 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_5 = 8'b1;  //Valid values: 8
   parameter revision_id_5 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_5 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_5 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_5 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_5 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_5 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_5 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_5 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_5 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_5 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_5 = 3'b0; //Valid values: 3
   parameter maximum_current_5 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_5 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_5 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_5 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_5 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_5 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_5 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_5 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_5 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_5 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_5 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_5 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_5 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_5 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_5 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_5 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_5 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_5 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_5 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_5 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_5 = 3'b111;  //Valid values: 3
   parameter indicator_5 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_5 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_5 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_5 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_5 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_5 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_5 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_5 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_5 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_5 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_5 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_5 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_5 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_5 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_5 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_5 = 13'b0; //Valid values: 13
   parameter slot_number_5 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_5 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_5 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_5 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_5 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_5 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_5 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_5 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_5 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_5 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_5 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_5 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_5 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_5 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_5 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_5 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_5 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_5 = 11'b0;   //Valid values: 11
   parameter msix_table_size_5 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_5 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_5 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_5 = 29'b0; //Valid values: 29
   parameter msix_table_offset_5 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_5 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_5 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_5 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_5 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_5 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_5 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_5 = 16'b0; //Valid values: 16
   parameter ssvid_5 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_5 = 16'b0;  //Valid values: 16
   parameter ssid_5 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_5 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_5 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_5 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_5 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_5 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_5 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_5 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_5 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_5 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_5 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_5 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_5 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_5 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_5 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_5 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_5 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_5 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_5 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_5 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_5 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_5 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_5 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_5 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_5 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_5 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_5 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_5 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_5 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_5 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_5 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_5 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_5 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_5 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_5 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_5 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_5 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_5 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_5 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_5 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_5 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 5 - Config Register Settings END -------------

   //Func 6 - Config Register Settings START -------------
   parameter vendor_id_data_6 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_6 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_6 = 16'b1;   //Valid values: 16
   parameter device_id_6 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_6 = 8'b1;  //Valid values: 8
   parameter revision_id_6 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_6 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_6 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_6 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_6 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_6 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_6 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_6 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_6 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_6 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_6 = 3'b0; //Valid values: 3
   parameter maximum_current_6 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_6 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_6 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_6 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_6 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_6 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_6 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_6 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_6 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_6 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_6 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_6 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_6 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_6 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_6 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_6 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_6 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_6 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_6 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_6 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_6 = 3'b111;  //Valid values: 3
   parameter indicator_6 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_6 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_6 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_6 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_6 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_6 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_6 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_6 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_6 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_6 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_6 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_6 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_6 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_6 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_6 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_6 = 13'b0; //Valid values: 13
   parameter slot_number_6 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_6 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_6 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_6 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_6 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_6 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_6 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_6 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_6 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_6 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_6 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_6 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_6 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_6 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_6 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_6 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_6 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_6 = 11'b0;   //Valid values: 11
   parameter msix_table_size_6 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_6 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_6 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_6 = 29'b0; //Valid values: 29
   parameter msix_table_offset_6 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_6 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_6 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_6 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_6 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_6 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_6 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_6 = 16'b0; //Valid values: 16
   parameter ssvid_6 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_6 = 16'b0;  //Valid values: 16
   parameter ssid_6 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_6 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_6 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_6 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_6 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_6 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_6 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_6 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_6 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_6 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_6 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_6 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_6 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_6 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_6 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_6 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_6 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_6 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_6 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_6 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_6 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_6 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_6 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_6 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_6 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_6 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_6 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_6 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_6 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_6 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_6 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_6 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_6 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_6 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_6 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_6 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_6 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_6 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_6 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_6 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_6 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 6 - Config Register Settings END -------------

   //Func 7 - Config Register Settings START -------------
   parameter vendor_id_data_7 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_7 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_7 = 16'b1;   //Valid values: 16
   parameter device_id_7 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_7 = 8'b1;  //Valid values: 8
   parameter revision_id_7 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_7 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_7 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_7 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_7 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_7 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_7 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_7 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_7 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_7 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_7 = 3'b0; //Valid values: 3
   parameter maximum_current_7 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_7 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_7 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_7 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_7 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_7 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_7 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_7 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_7 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_7 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_7 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_7 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_7 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_7 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_7 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_7 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_7 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_7 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_7 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_7 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_7 = 3'b111;  //Valid values: 3
   parameter indicator_7 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_7 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_7 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_7 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_7 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_7 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_7 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_7 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_7 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_7 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_7 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_7 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_7 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_7 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_7 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_7 = 13'b0; //Valid values: 13
   parameter slot_number_7 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_7 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_7 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_7 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_7 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_7 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_7 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_7 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_7 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_7 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_7 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_7 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_7 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_7 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_7 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_7 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_7 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_7 = 11'b0;   //Valid values: 11
   parameter msix_table_size_7 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_7 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_7 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_7 = 29'b0; //Valid values: 29
   parameter msix_table_offset_7 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_7 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_7 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_7 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_7 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_7 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_7 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_7 = 16'b0; //Valid values: 16
   parameter ssvid_7 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_7 = 16'b0;  //Valid values: 16
   parameter ssid_7 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_7 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_7 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_7 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_7 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_7 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_7 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_7 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_7 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_7 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_7 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_7 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_7 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_7 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_7 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_7 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_7 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_7 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_7 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_7 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_7 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_7 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_7 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_7 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_7 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_7 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_7 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_7 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_7 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_7 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_7 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_7 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_7 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_7 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_7 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_7 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_7 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_7 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_7 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_7 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_7 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 7 - Config Register Settings END -------------


   parameter porttype_func0 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func1 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func2 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func3 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func4 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func5 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func6 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func7 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter rxfreqlk_cnt_data = 20'h0;
   parameter rxfreqlk_cnt = "rxfreqlk_prog_cnt"; //Valid values: RXFREQLK_PROG_CNT
   parameter rxfreqlk_cnt_en = "true"; //Vaild values: TRUE|FALSE
   parameter testmode_control = "disable"; //Valid values: ENABLE|DISABLE
   parameter skp_insertion_control = "disable"; //Valid values: ENABLE|DISABLE
   parameter tx_l0s_adjust = "disable"; //Valid values: ENABLE|DISABLE
   parameter rx_cdc_almost_full_data = 4'h0; //Valid values: 4
   parameter rx_cdc_almost_full = "rx_cdc_almost_full";  //Valid values: RX_CDC_ALMOST_FULL
   parameter tx_cdc_almost_full_data = 4'h0; //Valid values: 4
   parameter tx_cdc_almost_full = "tx_cdc_almost_full";  //Valid values: TX_CDC_ALMOST_FULL
   parameter rx_l0s_count_idl_data = 8'b0;   //Valid values: 8
   parameter rx_l0s_count_idl = "rx_l0s_count_idl";   //Valid values: RX_L0S_COUNT_IDL
   parameter cdc_dummy_insert_limit_data = 4'h0;   //Valid values: 4
   parameter cdc_dummy_insert_limit = "cdc_dummy_insert_limit";   //Valid values: CDC_DUMMY_INSERT_LIMIT
   parameter ei_delay_powerdown_count_data = 8'b1010; //Valid values: 8
   parameter ei_delay_powerdown_count = "ei_delay_powerdown_count";  //Valid values: EI_DELAY_POWERDOWN_COUNT
   parameter millisecond_cycle_count_data = 20'b0; //Valid values: 20
   parameter millisecond_cycle_count = "millisecond_cycle_count"; //Valid values: MILLISECOND_CYCLE_COUNT
   parameter skp_os_schedule_count_data = 11'b0;   //Valid values: 11
   parameter skp_os_schedule_count = "skp_os_schedule_count";  //Valid values: SKP_OS_SCHEDULE_COUNT
   parameter fc_init_timer_data = 11'b10000000000; //Valid values: 11
   parameter fc_init_timer = "fc_init_timer";   //Valid values: FC_INIT_TIMER
   parameter l01_entry_latency_data = 5'b11111; //Valid values: 5
   parameter l01_entry_latency = "l01_entry_latency"; //Valid values: L01_ENTRY_LATENCY
   parameter flow_control_update_count_data = 5'b11110;  //Valid values: 5
   parameter flow_control_update_count = "flow_control_update_count";   //Valid values: FLOW_CONTROL_UPDATE_COUNT
   parameter flow_control_timeout_count_data = 8'b11001000; //Valid values: 8
   parameter flow_control_timeout_count = "flow_control_timeout_count"; //Valid values: FLOW_CONTROL_TIMEOUT_COUNT
   parameter vc0_rx_flow_ctrl_posted_header_data = 8'b110010;  //Valid values:8'h12
   parameter vc0_rx_flow_ctrl_posted_header = "vc0_rx_flow_ctrl_posted_header";  //Valid values: VC0_RX_FLOW_CTRL_POSTED_HEADER
   parameter vc0_rx_flow_ctrl_posted_data_data = 12'b000001011110;   //Valid values: 12'h5E
   parameter vc0_rx_flow_ctrl_posted_data = "vc0_rx_flow_ctrl_posted_data";   //Valid values: VC0_RX_FLOW_CTRL_POSTED_DATA
   parameter vc0_rx_flow_ctrl_nonposted_header_data = 8'b00100000;  //Valid values: 8'h20
   parameter vc0_rx_flow_ctrl_nonposted_header = "vc0_rx_flow_ctrl_nonposted_header";  //Valid values: VC0_RX_FLOW_CTRL_NONPOSTED_HEADER
   parameter vc0_rx_flow_ctrl_nonposted_data_data = 8'b0;   //Valid values: 8'h00
   parameter vc0_rx_flow_ctrl_nonposted_data = "vc0_rx_flow_ctrl_nonposted_data";   //Valid values: VC0_RX_FLOW_CTRL_NONPOSTED_DATA
   parameter vc0_rx_flow_ctrl_compl_header_data = 8'b0;  //Valid values: 8'b0
   parameter vc0_rx_flow_ctrl_compl_header = "vc0_rx_flow_ctrl_compl_header"; //Valid values: VC0_RX_FLOW_CTRL_COMPL_HEADER
   parameter vc0_rx_flow_ctrl_compl_data_data = 12'b0; //Valid values: 12'b0
   parameter vc0_rx_flow_ctrl_compl_data = "vc0_rx_flow_ctrl_compl_data";  //Valid values: VC0_RX_FLOW_CTRL_COMPL_DATA
   parameter rx_ptr0_posted_dpram_min_data = 10'b0;   //Valid values: 11
   parameter rx_ptr0_posted_dpram_min = "rx_ptr0_posted_dpram_min";  //Valid values: RX_PTR0_POSTED_DPRAM_MIN
   parameter rx_ptr0_posted_dpram_max_data = 10'b0;   //Valid values: 11
   parameter rx_ptr0_posted_dpram_max = "rx_ptr0_posted_dpram_max";  //Valid values: RX_PTR0_POSTED_DPRAM_MAX
   parameter rx_ptr0_nonposted_dpram_min_data = 10'b0;   //Valid values: 11
   parameter rx_ptr0_nonposted_dpram_min = "rx_ptr0_nonposted_dpram_min";  //Valid values: RX_PTR0_NONPOSTED_DPRAM_MIN
   parameter rx_ptr0_nonposted_dpram_max_data = 10'b0;   //Valid values: 11
   parameter rx_ptr0_nonposted_dpram_max = "rx_ptr0_nonposted_dpram_max";  //Valid values: RX_PTR0_NONPOSTED_DPRAM_MAX
   parameter retry_buffer_last_active_address_data = 8'b11111111; //Valid values: 10
   //parameter retry_buffer_last_active_address = "retry_buffer_last_active_address"; //Valid values: RETRY_BUFFER_LAST_ACTIVE_ADDRESS
   parameter retry_buffer_memory_settings_data           = 16'h0006;
   parameter retry_buffer_memory_settings = "retry_buffer_memory_settings";   //Valid values: RETRY_BUFFER_MEMORY_SETTINGS
   parameter vc0_rx_buffer_memory_settings_data          = 16'h0006;
   parameter vc0_rx_buffer_memory_settings = "vc0_rx_buffer_memory_settings"; //Valid values: VC0_RX_BUFFER_MEMORY_SETTINGS
   parameter bist_memory_settings_data = 75'b0; //Valid values: 75
   parameter bist_memory_settings = "bist_memory_settings"; //Valid values: BIST_MEMORY_SETTINGS
   parameter bridge_66mhzcap = "true"; //Valid values: TRUE|FALSE
   parameter fastb2bcap = "true";  //Valid values: TRUE|FALSE
   parameter devseltim = "fast_devsel_decoding"; //Valid values: FAST_DEVSEL_DECODING|MEDIUM_DEVSEL_DECODING|SLOW_DEVSEL_DECODING|RESERVED
   parameter memwrinv = "ro"; //Valid values: RO|RW
   parameter credit_buffer_allocation_aux = "balanced";  //Valid values: BALANCED|INITIATOR|TARGET|ABSOLUTE
   parameter enable_adapter_half_rate_mode = "false"; //Valid values: TRUE|FALSE
   parameter vc0_clk_enable = "true";  //Valid values: TRUE|FALSE
   parameter vc1_clk_enable = "false"; //Valid values: TRUE|FALSE
   parameter register_pipe_signals = "false";   //Valid values: TRUE|FALSE
   parameter iei_enable_settings = "gen2_infei_infsd_gen1_infei_sd"; //Valid values: DISABLE_IEI_LOGIC|GEN2_INFEI_INFSD_GEN1_INFEI_INFSD|GEN2_INFEI_GEN1_INFEI|GEN2_INFEI_GEN1_INFEI_SD|GEN2_INFEI_INFSD_GEN1_INFEI_SD
   parameter lattim_ro_data = 7'b0001000; //Valid values: RO|RW
   parameter lattim = "ro"; //Valid values: RO|RW
   parameter br_rcb = "ro"; //Valid values: RO|RW
   parameter vsec_id_data = 16'h1172;  //Valid values: 16
   parameter vsec_id = "vsec_id";   //Valid values: VSEC_ID
   parameter cvp_enable = "cvp_dis"; // Enable CVP
   parameter cvp_rate_sel = "full_rate";  //Valid values: FULL_RATE|HALF_RATE
   parameter hard_reset_bypass = "false"; //Valid values: FALSE|TRUE
   parameter cvp_data_compressed = "false";  //Valid values: FALSE|TRUE
   parameter cvp_data_encrypted = "false";   //Valid values: FALSE|TRUE
   parameter cvp_mode_reset = "false"; //Valid values: FALSE|TRUE
   parameter cvp_clk_reset = "false";  //Valid values: FALSE|TRUE
   parameter vsec_cap_data = 4'b0;  //Valid values: 4
   parameter vsec_cap = "vsec_cap"; //Valid values: VSEC_CAP
   parameter jtag_id_data = 128'b0;  //Valid values: 128
   parameter jtag_id = "jtag_id";   //Valid values: JTAG_ID
   parameter user_id_data = 16'b0;  //Valid values: 16
   parameter user_id = "user_id";   //Valid values: USER_ID
   parameter disable_auto_crs = "disable"; //Valid values: DISABLE|ENABLE
   /*
   */

   // Simulation only Parameter
   parameter altpe2_hip_base_addr_1 = 32'b00000000000000000000000000000000;
   parameter altpe2_hip_base_addr_2 = 32'b00000000000000000000000000000000;
   parameter altpe2_hip_base_addr_3 = 32'b00000000000000000000000000000000;
   parameter altpe2_hip_base_addr_4 = 32'b00000000000000000000000000000000;
   parameter altpe2_hip_base_addr_5 = 32'b00000000000000000000000000000000;
   parameter altpe2_hip_base_addr_6 = 32'b00000000000000000000000000000000;
   parameter altpe2_hip_base_addr_user_1 = 10'b0000000000;
   parameter altpe2_hip_base_addr_user_2 = 10'b0001000000;
   parameter altpe2_hip_base_addr_user_3 = 10'b0010000000;
   parameter altpe2_hip_base_addr_user_4 = 10'b0011000000;
   parameter altpe2_hip_base_addr_user_5 = 10'b0100000000;
   parameter altpe2_hip_base_addr_user_6 = 10'b0101000000;

   parameter cvp_mdio_dis_csr_ctrl_1 = "mdio_dis_cvp_dis";
   parameter cvp_mdio_dis_csr_ctrl_2 = "mdio_dis_cvp_dis";
   parameter cvp_mdio_dis_csr_ctrl_3 = "mdio_dis_cvp_dis";
   parameter cvp_mdio_dis_csr_ctrl_4 = "mdio_dis_cvp_dis";
   parameter cvp_mdio_dis_csr_ctrl_5 = "mdio_dis_cvp_dis";
   parameter cvp_mdio_dis_csr_ctrl_6 = "mdio_dis_cvp_dis";

   parameter dft_broadcast_en_1 = "broadcast_dis";
   parameter dft_broadcast_en_2 = "broadcast_dis";
   parameter dft_broadcast_en_3 = "broadcast_dis";
   parameter dft_broadcast_en_4 = "broadcast_dis";
   parameter dft_broadcast_en_5 = "broadcast_dis";
   parameter dft_broadcast_en_6 = "broadcast_dis";

   parameter electromech_interlock_0 = "false";
   parameter electromech_interlock_1 = "false";
   parameter electromech_interlock_2 = "false";
   parameter electromech_interlock_3 = "false";
   parameter electromech_interlock_4 = "false";
   parameter electromech_interlock_5 = "false";
   parameter electromech_interlock_6 = "false";
   parameter electromech_interlock_7 = "false";

   parameter force_mdio_dis_csr_ctrl_1 = "mdio_dis_force_dis";
   parameter force_mdio_dis_csr_ctrl_2 = "mdio_dis_force_dis";
   parameter force_mdio_dis_csr_ctrl_3 = "mdio_dis_force_dis";
   parameter force_mdio_dis_csr_ctrl_4 = "mdio_dis_force_dis";
   parameter force_mdio_dis_csr_ctrl_5 = "mdio_dis_force_dis";
   parameter force_mdio_dis_csr_ctrl_6 = "mdio_dis_force_dis";

   parameter mdio_cb_opbit_enable = "enable";
   parameter plniotri_gate = "disable";
   parameter power_isolation_en_1 = "power_isolation_dis";
   parameter power_isolation_en_1_data = 1'b0;
   parameter power_isolation_en_2 = "power_isolation_dis";
   parameter power_isolation_en_2_data = 1'b0;
   parameter power_isolation_en_3 = "power_isolation_dis";
   parameter power_isolation_en_3_data = 1'b0;
   parameter power_isolation_en_4 = "power_isolation_dis";
   parameter power_isolation_en_4_data = 1'b0;
   parameter power_isolation_en_5 = "power_isolation_dis";
   parameter power_isolation_en_5_data = 1'b0;
   parameter power_isolation_en_6 = "power_isolation_dis";
   parameter power_isolation_en_6_data = 1'b0;
   parameter retry_buffer_last_active_address = "retry_buffer_last_active_address";
   parameter sup_mode = "user_mode";

   // Hard reset controller section

   parameter hrdrstctrl_en                      = "hrdrstctrl_dis";//"hrdrstctrl_dis", "hrdrstctrl_en".

   parameter rstctrl_pld_clr                    = "false";// "false", "true".
   parameter rstctrl_debug_en                   = "false";// "false", "true".
   parameter rstctrl_force_inactive_rst         = "false";// "false", "true".
   parameter rstctrl_perst_enable               = "level";// "level", "neg_edge", "not_used".
   parameter rstctrl_hip_ep                     = "hip_ep";      //"hip_ep", "hip_not_ep".
   parameter rstctrl_hard_block_enable          = "hard_rst_ctl";//"hard_rst_ctl", "pld_rst_ctl".
   parameter rstctrl_rx_pma_rstb_inv            = "false";//"false", "true".
   parameter rstctrl_tx_pma_rstb_inv            = "false";//"false", "true".
   parameter rstctrl_rx_pcs_rst_n_inv           = "false";//"false", "true".
   parameter rstctrl_tx_pcs_rst_n_inv           = "false";//"false", "true".
   parameter rstctrl_altpe2_crst_n_inv          = "false";//"false", "true".
   parameter rstctrl_altpe2_srst_n_inv          = "false";//"false", "true".
   parameter rstctrl_altpe2_rst_n_inv           = "false";//"false", "true".
   parameter rstctrl_tx_pma_syncp_inv           = "false";//"false", "true".
   parameter rstctrl_1us_count_fref_clk         = "rstctrl_1us_cnt";//
   parameter rstctrl_1us_count_fref_clk_value   = 20'b00000000000000111111;//
   parameter rstctrl_1ms_count_fref_clk         = "rstctrl_1ms_cnt";//
   parameter rstctrl_1ms_count_fref_clk_value   = 20'b00001111010000100100;//

   parameter rstctrl_off_cal_done_select        = "not_active";// "ch0_sel", "ch01_sel", "ch0123_sel", "ch0123_5678_sel", "not_active".
   parameter rstctrl_rx_pma_rstb_cmu_select     = "not_active";// "ch1cmu_sel", "ch4cmu_sel", "ch4_10cmu_sel", "not_active".
   parameter rstctrl_rx_pma_rstb_select         = "not_active";// "ch01_out", "ch014_out", "ch01234_out", "ch012345678_out", "ch012345678_10_out", "not_active".
   parameter rstctrl_rx_pll_freq_lock_select    = "not_active";// "ch0_sel", "ch01_sel", "ch0123_sel", "ch0123_5678_sel", "not_active", "ch0_phs_sel", "ch01_phs_sel", "ch0123_phs_sel", "ch0123_5678_phs_sel".
   parameter rstctrl_mask_tx_pll_lock_select    = "not_active";// "ch1_sel", "ch4_sel", "ch4_10_sel", "not_active".
   parameter rstctrl_rx_pll_lock_select         = "not_active";// "ch0_sel", "ch01_sel", "ch0123_sel", "ch0123_5678_sel", "not_active".
   parameter rstctrl_perstn_select              = "perstn_pin";// "perstn_pin", "perstn_pld".
   parameter rstctrl_tx_lc_pll_rstb_select      = "not_active";// "ch1_out", "ch7_out", "not_active".
   parameter rstctrl_fref_clk_select            = "ch0_sel";// "ch0_sel", "ch1_sel", "ch2_sel", "ch3_sel", "ch4_sel", "ch5_sel", "ch6_sel", "ch7_sel", "ch8_sel", "ch9_sel", "ch10_sel", "ch11_sel".
   parameter rstctrl_off_cal_en_select          = "not_active";// "ch0_out", "ch01_out", "ch0123_out", "ch0123_5678_out", "not_active".
   parameter rstctrl_tx_pma_syncp_select        = "not_active";// "ch1_out", "ch4_out", "ch4_10_out", "not_active".
   parameter rstctrl_rx_pcs_rst_n_select        = "not_active";// "ch0_out", "ch01_out", "ch0123_out", "ch012345678_out", "ch012345678_10_out", "not_active".
   parameter rstctrl_tx_cmu_pll_lock_select     = "not_active";// "ch1_sel", "ch4_sel", "ch4_10_sel", "not_active".
   parameter rstctrl_tx_pcs_rst_n_select        = "not_active";// "ch0_out", "ch01_out", "ch0123_out", "ch012345678_out", "ch012345678_10_out", "not_active".
   parameter rstctrl_tx_lc_pll_lock_select      = "not_active";// "ch1_sel", "ch7_sel", "not_active".

   parameter rstctrl_timer_a        = "rstctrl_timer_a";
   parameter rstctrl_timer_a_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_a_value  = 8'b00001010;
   parameter rstctrl_timer_b        = "rstctrl_timer_b";
   parameter rstctrl_timer_b_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_b_value  = 8'b00001010;
   parameter rstctrl_timer_c        = "rstctrl_timer_c";
   parameter rstctrl_timer_c_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_c_value  = 8'b00001010;
   parameter rstctrl_timer_d        = "rstctrl_timer_d";
   parameter rstctrl_timer_d_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_d_value  = 8'b00010100;
   parameter rstctrl_timer_e        = "rstctrl_timer_e";
   parameter rstctrl_timer_e_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_e_value  = 8'h1;
   parameter rstctrl_timer_f        = "rstctrl_timer_f";
   parameter rstctrl_timer_f_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_f_value  = 8'b00001010;
   parameter rstctrl_timer_g        = "rstctrl_timer_g";
   parameter rstctrl_timer_g_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_g_value  = 8'b00001010;
   parameter rstctrl_timer_h        = "rstctrl_timer_h";
   parameter rstctrl_timer_h_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_h_value  = 8'b00000100;
   parameter rstctrl_timer_i        = "rstctrl_timer_i";
   parameter rstctrl_timer_i_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_i_value  = 8'b00010100;
   parameter rstctrl_timer_j        = "rstctrl_timer_j";
   parameter rstctrl_timer_j_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_j_value  = 8'b00010100;
   parameter rstctrl_ltssm_disable  = "false";               //possible values are "true", "false"
   parameter cvp_isolation        = "enable"; //possible values are "enable" "disable"

   output pldclkinuse;
   output  [5:0]     txcredfchipcons; //PLD TL to AL Indicates that HIP consumed one of PH PD, NPH, NPD, CH, CD
   output  [5:0]     txcredfcinfinite; //PLD TL to AL Indicates if this is an infinite credit PH PD, NPH, NPD, CH, CD
   output  [7:0]     txcredhdrfcp;    //PLD TL to AL Header credit of the received FC Posted.
   output  [11:0]    txcreddatafcp;   //PLD TL to AL Signals the Data credit of the received FC Posted
   output  [7:0]     txcredhdrfcnp;   //PLD TL to AL Header credit of the received FC Non Posted
   output  [11:0]    txcreddatafcnp;  //PLD TL to AL Signals the Data credit of the received FC Non Posted
   output  [7:0]     txcredhdrfccp;   //PLD TL to AL Header credit of the received FC completion.
   output  [11:0]    txcreddatafccp;  //PLD TL to AL Signals the Data credit of the received FC completion
   output cvpclk;                     //CB
   output [31:0] cvpdata;             //CB
   output cvpstartxfer;              //CB
   output cvpconfig;                  //CB
   output cvpfullconfig;             //CB
   output tlappintback;             //PLD
   output tlappintcack;             //PLD
   output tlappintdack;             //PLD
   output [7:0] flrsts;               //PLD
   output txswing0;            //PCS-PMA
   output txswing1;            //PCS-PMA
   output txswing2;            //PCS-PMA
   output txswing3;            //PCS-PMA
   output txswing4;            //PCS-PMA
   output txswing5;            //PCS-PMA
   output txswing6;            //PCS-PMA
   output txswing7;            //PCS-PMA

   input pldcoreready;
   input usermode;                    //CB    -- use to gate off input signal
   input hippartialreconfign;         //CB    -- use to gate off output signal
   input [2:0] tlpmeventfunc;       //PLD
   input [2:0] tlappintafuncnum;   //PLD
   input tlappintbsts;              //PLD
   input [2:0] tlappintbfuncnum;   //PLD
   input tlappintcsts;              //PLD
   input [2:0] tlappintcfuncnum;   //PLD
   input tlappintdsts;              //PLD
   input [2:0] tlappintdfuncnum;   //PLD
   input [2:0] tlappmsifunc;        //PLD
   input [7:0] cplpending;            //PLD
   input [2:0] cplerrfunc;           //PLD
   input [7:0] flrreset;              //PLD
   input cvpconfigready;             //CB
   input cvpen;                       //CB
   input cvpconfigerror;             //CB
   input cvpconfigdone;              //CB



   input pclkch0;                     //PCS-PMA
   input pclkch1;                     //PCS-PMA
   input pclkcentral;                 //PCS-PMA
   input pllfixedclkch0;            //PCS-PMA
   input pllfixedclkch1;            //PCS-PMA
   input pllfixedclkcentral;        //PCS-PMA

   input rxfreqlocked0;            //PCS-PMA
   input rxfreqlocked1;            //PCS-PMA
   input rxfreqlocked2;            //PCS-PMA
   input rxfreqlocked3;            //PCS-PMA
   input rxfreqlocked4;            //PCS-PMA
   input rxfreqlocked5;            //PCS-PMA
   input rxfreqlocked6;            //PCS-PMA
   input rxfreqlocked7;            //PCS-PMA

   // CSR interface
   input   csrclk;                //CB    // CSR clock
   input   csrin;                 //CB    // Serial CSR input
   input   csren;                 //CB    // CSR enable
   output  csrout;                //CB    // Serial CSR output

   // CSR test mux interface
   input  csrcbdin;               //CB    // CSR configuration mode data input
   input  csrtcsrin;              //CB    // CSR test/scan mode data input
   input  csrdin;                 //CB    // Previous CSR bit data output
   input  csrseg;                 //CB    // VSS for Seg0, VCC for seg[31:1]
   input  csrenscan;              //CB    // enable scan control input
   input  csrtverify;             //CB    // test verify control input
   input  csrloadcsr;            //CB    // JTAG scan mode control input
   input  csrpipein;             //CB    // Input to the Pipeline register to suport 200MHz
   output csrdout;                //CB    // CSR input MUX Data output
   output csrpipeout;            //CB    // Pipelined register data output

   // AVMM interface
   input   avmmrstn;             //PLD   // DPRIO reset
   input   avmmclk;               //PLD   // DPRIO clock
   input   avmmwrite;             //PLD   // write enable input
   input   avmmread;              //PLD   // read enable input
   input   [1:0]   avmmbyteen;   //PLD   // Byte enable
   input   [9:0]   avmmaddress;   //PLD   // address input
   input   [15:0]  avmmwritedata; //PLD   // write data input
   input   sershiftload;         //CB    // 1'b1=shift in data from si into scan flop
                                           // 1'b0=load data from writedata into scan flop
   input   interfacesel;          //PLD   // Interface selection inputs
                                           // 1'b1: select CSR as a source for CRAM
                                           // 1'b0: select Avalon-MM interface
   output  [15:0]  avmmreaddata;  //PLD   // Read data output

   // MDIO interface
   input   mdioclk;               //PLD   // MDIO clock
   input   mdioin;                //PLD   // MDIO serial input
   input   cbhipmdioen;         //PLD   // Control block option bit to block MDIO IOs
   input   [1:0]   mdiodevaddr;  //PLD   // MDIO device address tied at PLD interface

   output  mdioout;               //PLD   // MDIO serial output
   output  mdiooenn;             //PLD   // MDIO output enable


   // LMI interface
   output [31:0]   lmidout;       //PLD
   output          lmiack;        //PLD
   input           lmirden;       //PLD
   input           lmiwren;       //PLD
   input  [14:0]   lmiaddr;       //PLD
   input  [31:0]   lmidin;        //PLD

   // Global clock and reset IOs
   output           resetstatus;  //PLD
   output           l2exit;       //PLD
   output           hotrstexit;   //PLD
   output           dlupexit;     //PLD

   input            pldclk;       //PLD
   input            pldsrst;      //PLD
   input            pldrst;       //PLD
   //input            phyclk;
   //input            pllfixedclk;
   input            phyrst;       //PLD
   input            physrst;      //PLD
   //input            coreclk;
   input       coreclkin;        //PLD
   output      coreclkout;       //PLD
   input       corerst;           //PLD
   input       corepor;           //PLD
   input       corecrst;          //PLD
   input       coresrst;          //PLD


   // Global signals for SW mode
   output           swdnwake;         //PLD
   output           swuphotrst;       //PLD

   input  [2:0]     swdnin;       //PLD
   input  [6:0]     swupin;       //PLD

   // User Interface signals for VC0
   output        rxvalidvc0;     //PLD
   output        rxerrvc0;           //PLD   // uncorrectable error
   output [2:0]  rxbardecfuncnumvc0;  //PLD
   output [7:0]  rxbardecvc0;       //PLD
   output        rxsopvc00;     //PLD
   output        rxeopvc00;     //PLD
   output [63:0] rxdatavc00;    //PLD
   output [7:0]  rxbevc00;      //PLD
   output        rxsopvc01;     //PLD
   output        rxeopvc01;     //PLD
   output [63:0] rxdatavc01;    //PLD
   output [7:0]  rxbevc01;      //PLD
   output        rxfifofullvc0; //PLD
   output        rxfifoemptyvc0;//PLD
   output [3:0]  rxfifowrpvc0;  //PLD
   output [3:0]  rxfifordpvc0;  //PLD
   output [35:0] txcredvc0;      //PLD
   output        txreadyvc0;     //PLD
     //for FIFO monitoring
   output           txfifofullvc0;  //PLD
   output           txfifoemptyvc0; //PLD
   output [3:0]     txfifowrpvc0;   //PLD
   output [3:0]     txfifordpvc0;   //PLD

   input            rxmaskvc0;       //PLD
   input            rxreadyvc0;      //PLD
   input            txvalidvc0;      //PLD
   input            txerrvc0;        //PLD
   input            txsopvc00;      //PLD
   input            txeopvc00;      //PLD
   input  [63:0]    txdatavc00;     //PLD
   input            txsopvc01;      //PLD
   input            txeopvc01;      //PLD
   input  [63:0]    txdatavc01;     //PLD

   // User Interface signals for VC1
     //for FIFO monitoring



   // Power Management signals
   output           tlpmetosr;      //PLD

   input            tlpmetocr;      //PLD
   input            tlpmevent;       //PLD
   input  [9:0]     tlpmdata;        //PLD
   input            tlpmauxpwr;      //PLD

   // Control Status Register signals
   output [122:0]   tlcfgsts;        //PLD
   output           tlcfgstswr;     //PLD
   output [31:0]    tlcfgctl;        //PLD
   output           tlcfgctlwr;     //PLD
   output [6:0]     tlcfgadd;        //PLD

   // Interrupt signals
   output           tlappintaack;   //PLD
   output           tlappmsiack;    //PLD
   output [3:0]     intstatus;        //PLD
   output [3:0]     laneact;          //PLD
   output [4:0]     dlltssm;          //PLD
   output           clrrxpath;        //PLD
   output [1:0]     dlcurrentspeed;  //PLD

   input            tlappintasts;   //PLD
   input            tlappmsireq;    //PLD
   input [2:0]      tlappmsitc;     //PLD
   input [4:0]      tlappmsinum;    //PLD
   input [4:0]      tlaermsinum;    //PLD
   input [4:0]      tlpexmsinum;    //PLD
   input [4:0]      tlhpgctrler;     //PLD


   input            dlcomclkreg;     //PLD   // ww51.5 change by Ning Xue
   input  [7:0]     dlvcctrl;        //PLD
   input  [12:0]    dlctrllink2;     //PLD

   // Test Port Interface signals
   output [63:0]    testouthip;  //PLD
   output           ev1us;        //PLD
   output           ev128ns;      //PLD
   output           wakeoen;      //PLD
   output           serrout;      //PLD

   input            tlslotclkcfg;//PLD
   input  [1:0]     mode;          //PLD
   input  [39:0]    testinhip;   //PLD
   input  [6:0]     cplerr;       //PLD
   input  [15:0]    pcierr;       //PLD

   // PIPE interface signals
   output           rate0;         //PCS
   output           rate1;         //PCS
   output           rate2;         //PCS
   output           rate3;         //PCS
   output           rate4;         //PCS
   output           rate5;         //PCS
   output           rate6;         //PCS
   output           rate7;         //PCS
   output           rate8;         //PCS
   //output           ratetiedtognd;  //PCS
   output [2:0]     eidleinfersel0;  //PCS
   output [2:0]     eidleinfersel1;  //PCS
   output [2:0]     eidleinfersel2;  //PCS
   output [2:0]     eidleinfersel3;  //PCS
   output [2:0]     eidleinfersel4;  //PCS
   output [2:0]     eidleinfersel5;  //PCS
   output [2:0]     eidleinfersel6;  //PCS
   output [2:0]     eidleinfersel7;  //PCS
   output           txdeemph0;        //PCS
   output           txdeemph1;        //PCS
   output           txdeemph2;            //PCS
   output           txdeemph3;            //PCS
   output           txdeemph4;            //PCS
   output           txdeemph5;            //PCS
   output           txdeemph6;            //PCS
   output           txdeemph7;            //PCS
   output [2:0]     txmargin0;            //PCS
   output [2:0]     txmargin1;            //PCS
   output [2:0]     txmargin2;            //PCS
   output [2:0]     txmargin3;            //PCS
   output [2:0]     txmargin4;            //PCS
   output [2:0]     txmargin5;            //PCS
   output [2:0]     txmargin6;            //PCS
   output [2:0]     txmargin7;            //PCS
   // interface with the PHY PCS Lane 0
   output [7:0]     txdata0;               //PCS
   output           txdatak0;              //PCS
   output           txdetectrx0;           //PCS
   output           txelecidle0;           //PCS
   output           txcompl0;              //PCS
   output           rxpolarity0;           //PCS
   output [1:0]     powerdown0;            //PCS

   input  [7:0]     rxdata0;       //PCS
   input            rxdatak0;      //PCS
   input            rxvalid0;      //PCS
   input            phystatus0;        //PCS
   input            rxelecidle0;       //PCS
   input  [2:0]     rxstatus0;         //PCS
   // interface with the PHY PCS Lane 1
   output [7:0]     txdata1;       //PCS
   output           txdatak1;      //PCS
   output           txdetectrx1;       //PCS
   output           txelecidle1;       //PCS
   output           txcompl1;      //PCS
   output           rxpolarity1;       //PCS
   output [1:0]     powerdown1;        //PCS

   input  [7:0]     rxdata1;       //PCS
   input            rxdatak1;      //PCS
   input            rxvalid1;      //PCS
   input            phystatus1;        //PCS
   input            rxelecidle1;       //PCS
   input  [2:0]     rxstatus1;         //PCS
   // interface with the PHY PCS Lane 2
   output [7:0]     txdata2;       //PCS
   output           txdatak2;      //PCS
   output           txdetectrx2;       //PCS
   output           txelecidle2;       //PCS
   output           txcompl2;      //PCS
   output           rxpolarity2;       //PCS
   output [1:0]     powerdown2;        //PCS

   input  [7:0]     rxdata2;       //PCS
   input            rxdatak2;      //PCS
   input            rxvalid2;      //PCS
   input            phystatus2;        //PCS
   input            rxelecidle2;       //PCS
   input  [2:0]     rxstatus2;         //PCS
   // interface with the PHY PCS Lane 3
   output [7:0]     txdata3;       //PCS
   output           txdatak3;      //PCS
   output           txdetectrx3;       //PCS
   output           txelecidle3;       //PCS
   output           txcompl3;      //PCS
   output           rxpolarity3;       //PCS
   output [1:0]     powerdown3;        //PCS

   input  [7:0]     rxdata3;       //PCS
   input            rxdatak3;      //PCS
   input            rxvalid3;      //PCS
   input            phystatus3;        //PCS
   input            rxelecidle3;       //PCS
   input  [2:0]     rxstatus3;         //PCS
   // interface with the PHY PCS Lane 4
   output [7:0]     txdata4;       //PCS
   output           txdatak4;      //PCS
   output           txdetectrx4;       //PCS
   output           txelecidle4;       //PCS
   output           txcompl4;      //PCS
   output           rxpolarity4;       //PCS
   output [1:0]     powerdown4;        //PCS

   input  [7:0]     rxdata4;       //PCS
   input            rxdatak4;      //PCS
   input            rxvalid4;      //PCS
   input            phystatus4;        //PCS
   input            rxelecidle4;       //PCS
   input  [2:0]     rxstatus4;         //PCS
   // interface with the PHY PCS Lane 5
   output [7:0]     txdata5;       //PCS
   output           txdatak5;      //PCS
   output           txdetectrx5;       //PCS
   output           txelecidle5;       //PCS
   output           txcompl5;      //PCS
   output           rxpolarity5;       //PCS
   output [1:0]     powerdown5;        //PCS

   input  [7:0]     rxdata5;       //PCS
   input            rxdatak5;      //PCS
   input            rxvalid5;      //PCS
   input            phystatus5;        //PCS
   input            rxelecidle5;       //PCS
   input  [2:0]     rxstatus5;         //PCS
   // interface with the PHY PCS Lane 6
   output [7:0]     txdata6;       //PCS
   output           txdatak6;      //PCS
   output           txdetectrx6;       //PCS
   output           txelecidle6;       //PCS
   output           txcompl6;      //PCS
   output           rxpolarity6;       //PCS
   output [1:0]     powerdown6;        //PCS

   input  [7:0]     rxdata6;       //PCS
   input            rxdatak6;      //PCS
   input            rxvalid6;      //PCS
   input            phystatus6;        //PCS
   input            rxelecidle6;       //PCS
   input  [2:0]     rxstatus6;         //PCS
   // interface with the PHY PCS Lane 7
   output [7:0]     txdata7;       //PCS
   output           txdatak7;      //PCS
   output           txdetectrx7;       //PCS
   output           txelecidle7;       //PCS
   output           txcompl7;      //PCS
   output           rxpolarity7;       //PCS
   output [1:0]     powerdown7;        //PCS

   input  [7:0]     rxdata7;       //PCS
   input            rxdatak7;      //PCS
   input            rxvalid7;      //PCS
   input            phystatus7;        //PCS
   input            rxelecidle7;       //PCS
   input  [2:0]     rxstatus7;         //PCS

   // LTSSM L0 State output
   output         ltssml0state;      //PLD

   // REGSCAN I/Os for MRAM I/O testing
   //input              mramregscanen;
   //input              mramregscanin;
   //output             mramregscanout;
   //input          mramhiptestenable;

   // BIST inputs/outputs
   input            bisttestenn;       //PLD -- shared for all 3 memory blocks
   input            bistenn;        //PLD
   input            bistscanin;           //PLD -- shared for all 3 memory blocks
   input            bistscanenn;           //PLD -- shared for all 3 memory blocks

   //input            bistenrcv0;       //PLD
   //input            bistenrcv1;     //PLD

   output           bistscanoutrpl;  //PLD
   output           bistdonearpl;    //PLD
   output           bistdonebrpl;    //PLD
   output           bistpassrpl;     //PLD
   output           derrrpl;      //PLD
   output           derrcorextrpl;  //PLD

   output           bistscanoutrcv0; //PLD
   output           bistdonearcv0;   //PLD
   output           bistdonebrcv0;   //PLD
   output           bistpassrcv0;    //PLD
   output           derrcorextrcv0; //PLD
   output           derrcorextrcv1; //PLD

   output           bistscanoutrcv1; //PLD
   output           bistdonearcv1;   //PLD
   output           bistdonebrcv1;   //PLD
   output           bistpassrcv1;    //PLD
   //output           derrcorextrcv1; //PLD -- Currently PCIe has a single virtual channel

   // scan test IO
   input       scanmoden;        //PLD
   input       scanenn;            //PLD
   input       dpriorefclkdig;       //PLD

   // FRZ signals for MRAMs
   input       nfrzdrv;            //PLD
   input       frzreg;         //PLD
   input       frzlogic;           //PLD

   // Redundancy IDs for the MRAMs
   //input   [7:0]   idrpl;         //PLD
   //input   [7:0]   idrcv0;        //PLD
   //input   [7:0]   idrcv1;        //PLD

   // Hard Reset Inputs
   input       pinperstn;                // Active low PCIE reset from PCIE Interface PIN
   input       pldperstn;                // Active low PCIE reset from PLD core
   input       pldclrpmapcshipn;         //PLD -- From PLD Active low signal To Hard Reset Ctrl, reset the PMA/PCS/HIP
   input       pldclrpcshipn;            //PLD -- From PLD Active low signal To Hard Reset Ctrl, reset the PCS/HIP
   input       pldclrhipn;               //PLD -- From PLD Active low signal To Hard Reset Ctrl, reset the HIP NON STICKY Bits (CRST & SRST)
   // Hard Reset Inputs (From Control Block)
   input       iocsrrdydly;               //CB -- I/O CSR Ready Delayed (Low when IOCSR is not configured)
   input       plniotri;           //CB
   input       entest;         //CB
   input       por;           //CB


   // Debug I/Os
   input   [14:0]  dbgpipex1rx;      //PLD


   output successfulspeednegotiationint;
   output r2cerrext;

   // Extra inputs/outputs
   output  [29:0]   hipextraout;          //PLD
   output  [1:0]   hipextraclkout;
   input   [29:0]  hipextrain;        //
   input   [1:0]   hipextraclkin;

   // Reset Control Interface Ch0-Ch9
   output  txpcsrstn0;          //PCS
   output  txpcsrstn1;          //PCS
   output  txpcsrstn2;          //PCS
   output  txpcsrstn3;          //PCS
   output  txpcsrstn4;          //PCS
   output  txpcsrstn5;          //PCS
   output  txpcsrstn6;          //PCS
   output  txpcsrstn7;          //PCS
   output  txpcsrstn8;          //PCS

   output  rxpcsrstn0;          //PCS
   output  rxpcsrstn1;          //PCS
   output  rxpcsrstn2;          //PCS
   output  rxpcsrstn3;          //PCS
   output  rxpcsrstn4;          //PCS
   output  rxpcsrstn5;          //PCS
   output  rxpcsrstn6;          //PCS
   output  rxpcsrstn7;          //PCS
   output  rxpcsrstn8;          //PCS

   output  txpmasyncp0;          //PCS
   output  txpmasyncp1;          //PCS
   output  txpmasyncp2;                  //PCS
   output  txpmasyncp3;                  //PCS
   output  txpmasyncp4;                  //PCS
   output  txpmasyncp5;                  //PCS
   output  txpmasyncp6;                  //PCS
   output  txpmasyncp7;                  //PCS
   output  txpmasyncp8;                  //PCS

   output  rxpmarstb0;                  //PCS
   output  rxpmarstb1;                  //PCS
   output  rxpmarstb2;                  //PCS
   output  rxpmarstb3;                  //PCS
   output  rxpmarstb4;                  //PCS
   output  rxpmarstb5;                  //PCS
   output  rxpmarstb6;                  //PCS
   output  rxpmarstb7;                  //PCS
   output  rxpmarstb8;                  //PCS



   input   frefclk0;                  //PCS
   input   frefclk1;                  //PCS
   input   frefclk2;                  //PCS
   input   frefclk3;                  //PCS
   input   frefclk4;                  //PCS
   input   frefclk5;                  //PCS
   input   frefclk6;                  //PCS
   input   frefclk7;                  //PCS
   input   frefclk8;                  //PCS



   input   rxfreqtxcmuplllock0;                  //PCS
   input   rxfreqtxcmuplllock1;                  //PCS
   input   rxfreqtxcmuplllock2;                  //PCS
   input   rxfreqtxcmuplllock3;                  //PCS
   input   rxfreqtxcmuplllock4;                  //PCS
   input   rxfreqtxcmuplllock5;                  //PCS
   input   rxfreqtxcmuplllock6;                  //PCS
   input   rxfreqtxcmuplllock7;                  //PCS
   input   rxfreqtxcmuplllock8;                  //PCS

   input   rxpllphaselock0;                  //PCS
   input   rxpllphaselock1;                  //PCS
   input   rxpllphaselock2;                  //PCS
   input   rxpllphaselock3;                  //PCS
   input   rxpllphaselock4;                  //PCS
   input   rxpllphaselock5;                  //PCS
   input   rxpllphaselock6;                  //PCS
   input   rxpllphaselock7;                  //PCS
   input   rxpllphaselock8;                  //PCS

   input vcc_hd;
   input vss_hd;



   arriav_hd_altpe2_hip_top arriav_hd_altpe2_hip_top_i (
      .usermode(usermode),                   // use to gate off input signal
      .hippartialreconfign(hippartialreconfign),        // use to gate off output signal
      .csrclk(csrclk),
      .csrin(csrin),
      .csren(csren),
      .csrout(csrout),
      .csrcbdin(csrcbdin),
      .csrtcsrin(csrtcsrin),
      .csrdin(csrdin),
      .csrseg(csrseg),
      .csrenscan(csrenscan),
      .csrtverify(csrtverify),
      .csrloadcsr(csrloadcsr),
      .csrpipein(csrpipein),
      .csrdout(csrdout),
      .csrpipeout(csrpipeout),
      .avmmrstn(avmmrstn),
      .avmmclk(avmmclk),
      .avmmwrite(avmmwrite),
      .avmmread(avmmread),
      .avmmbyteen(avmmbyteen),
      .avmmaddress(avmmaddress),
      .avmmwritedata(avmmwritedata),
      .sershiftload(sershiftload),
      .interfacesel(interfacesel),
      .avmmreaddata(avmmreaddata),
      .mdioclk(mdioclk),
      .mdioin(mdioin),
      .cbhipmdioen(cbhipmdioen),
      .mdiodevaddr(mdiodevaddr),
      .mdioout(mdioout),
      .mdiooenn(mdiooenn),
      .lmidout(lmidout),
      .lmiack(lmiack),
      .lmirden(lmirden),
      .lmiwren(lmiwren),
      .lmiaddr(lmiaddr),
      .lmidin(lmidin),
      .resetstatus(resetstatus),
      .l2exit(l2exit),
      .hotrstexit(hotrstexit),
      .dlupexit(dlupexit),
      .pldclk(pldclk),
      .pldsrst(pldsrst),
      .pldrst(pldrst),
      .phyrst(phyrst),
      .physrst(physrst),
      .coreclkin(coreclkin),
      .coreclkout(coreclkout),
      .corerst(corerst),
      .corepor(corepor),
      .corecrst(corecrst),
      .coresrst(coresrst),
      .swdnwake(swdnwake),
      .swuphotrst(swuphotrst),
      .swdnin(swdnin),
      .swupin(swupin),
      .rxvalidvc0(rxvalidvc0),
      .rxerrvc0(rxerrvc0),
      .rxbardecvc0(rxbardecvc0),
      .rxsopvc00(rxsopvc00),
      .rxeopvc00(rxeopvc00),
      .rxdatavc00(rxdatavc00),
      .rxbevc00(rxbevc00),
      .rxsopvc01(rxsopvc01),
      .rxeopvc01(rxeopvc01),
      .rxdatavc01(rxdatavc01),
      .rxbevc01(rxbevc01),
      .rxfifofullvc0(rxfifofullvc0),
      .rxfifoemptyvc0(rxfifoemptyvc0),
      .rxfifowrpvc0(rxfifowrpvc0),
      .rxfifordpvc0(rxfifordpvc0),
      .txcredvc0(txcredvc0),
      .txreadyvc0(txreadyvc0),
      .txfifofullvc0(txfifofullvc0),
      .txfifoemptyvc0(txfifoemptyvc0),
      .txfifowrpvc0(txfifowrpvc0),
      .txfifordpvc0(txfifordpvc0),
      .rxmaskvc0(rxmaskvc0),
      .rxreadyvc0(rxreadyvc0),
      .txvalidvc0(txvalidvc0),
      .txerrvc0(txerrvc0),
      .txsopvc00(txsopvc00),
      .txeopvc00(txeopvc00),
      .txdatavc00(txdatavc00),
      .txsopvc01(txsopvc01),
      .txeopvc01(txeopvc01),
      .txdatavc01(txdatavc01),
      .tlpmetosr(tlpmetosr),
      .tlpmetocr(tlpmetocr),
      .tlpmevent(tlpmevent),
      .tlpmdata(tlpmdata),
      .tlpmauxpwr(tlpmauxpwr),
      .tlcfgsts(tlcfgsts),
      .tlcfgstswr(tlcfgstswr),
      .tlcfgctl(tlcfgctl),
      .tlcfgctlwr(tlcfgctlwr),
      .tlcfgadd(tlcfgadd),
      .tlappintaack(tlappintaack),
      .tlappmsiack(tlappmsiack),
      .intstatus(intstatus),
      .tlappintasts(tlappintasts),
      .tlappmsireq(tlappmsireq),
      .tlappmsitc(tlappmsitc),
      .tlappmsinum(tlappmsinum),
      .tlaermsinum(tlaermsinum),
      .tlpexmsinum(tlpexmsinum),
      .tlhpgctrler(tlhpgctrler),
      .laneact(laneact),          // Mux with tlcfgsts[80:77]
      .dlltssm(dlltssm),          // Mux with tlcfgsts[75:71]
      .clrrxpath(clrrxpath),        // Mux with tlcfgsts[70:70]
      .dlcurrentspeed(dlcurrentspeed),      // Mux with tlcfgsts[60:59]
      .dlcomclkreg(dlcomclkreg),  // ww51.5 change by Ning Xue
      .dlvcctrl(dlvcctrl),
      .dlctrllink2(dlctrllink2),
      .testouthip(testouthip),
      .ev1us(ev1us),
      .ev128ns(ev128ns),
      .wakeoen(wakeoen),
      .serrout(serrout),
      .tlslotclkcfg(tlslotclkcfg),
      .mode(mode),
      .testinhip(testinhip),
      .cplerr(cplerr),
      .pcierr(pcierr),
      .rate0(rate0),
      .rate1(rate1),
      .rate2(rate2),
      .rate3(rate3),
      .rate4(rate4),
      .rate5(rate5),
      .rate6(rate6),
      .rate7(rate7),
      .rate8(rate8),
      .eidleinfersel0(eidleinfersel0),
      .txdeemph0(txdeemph0),
      .txmargin0(txmargin0),
      .txdata0(txdata0),
      .txdatak0(txdatak0),
      .txdetectrx0(txdetectrx0),
      .txelecidle0(txelecidle0),
      .txcompl0(txcompl0),
      .rxpolarity0(rxpolarity0),
      .powerdown0(powerdown0),
      .rxdata0(rxdata0),
      .rxdatak0(rxdatak0),
      .rxvalid0(rxvalid0),
      .phystatus0(phystatus0),
      .rxelecidle0(rxelecidle0),
      .rxstatus0(rxstatus0),
      .eidleinfersel1(eidleinfersel1),
      .txdeemph1(txdeemph1),
      .txmargin1(txmargin1),
      .txdata1(txdata1),
      .txdatak1(txdatak1),
      .txdetectrx1(txdetectrx1),
      .txelecidle1(txelecidle1),
      .txcompl1(txcompl1),
      .rxpolarity1(rxpolarity1),
      .powerdown1(powerdown1),
      .rxdata1(rxdata1),
      .rxdatak1(rxdatak1),
      .rxvalid1(rxvalid1),
      .phystatus1(phystatus1),
      .rxelecidle1(rxelecidle1),
      .rxstatus1(rxstatus1),
      .eidleinfersel2(eidleinfersel2),
      .txdeemph2(txdeemph2),
      .txmargin2(txmargin2),
      .txdata2(txdata2),
      .txdatak2(txdatak2),
      .txdetectrx2(txdetectrx2),
      .txelecidle2(txelecidle2),
      .txcompl2(txcompl2),
      .rxpolarity2(rxpolarity2),
      .powerdown2(powerdown2),
      .rxdata2(rxdata2),
      .rxdatak2(rxdatak2),
      .rxvalid2(rxvalid2),
      .phystatus2(phystatus2),
      .rxelecidle2(rxelecidle2),
      .rxstatus2(rxstatus2),
      .eidleinfersel3(eidleinfersel3),
      .txdeemph3(txdeemph3),
      .txmargin3(txmargin3),
      .txdata3(txdata3),
      .txdatak3(txdatak3),
      .txdetectrx3(txdetectrx3),
      .txelecidle3(txelecidle3),
      .txcompl3(txcompl3),
      .rxpolarity3(rxpolarity3),
      .powerdown3(powerdown3),
      .rxdata3(rxdata3),
      .rxdatak3(rxdatak3),
      .rxvalid3(rxvalid3),
      .phystatus3(phystatus3),
      .rxelecidle3(rxelecidle3),
      .rxstatus3(rxstatus3),
      .eidleinfersel4(eidleinfersel4),
      .txdeemph4(txdeemph4),
      .txmargin4(txmargin4),
      .txdata4(txdata4),
      .txdatak4(txdatak4),
      .txdetectrx4(txdetectrx4),
      .txelecidle4(txelecidle4),
      .txcompl4(txcompl4),
      .rxpolarity4(rxpolarity4),
      .powerdown4(powerdown4),
      .rxdata4(rxdata4),
      .rxdatak4(rxdatak4),
      .rxvalid4(rxvalid4),
      .phystatus4(phystatus4),
      .rxelecidle4(rxelecidle4),
      .rxstatus4(rxstatus4),
      .eidleinfersel5(eidleinfersel5),
      .txdeemph5(txdeemph5),
      .txmargin5(txmargin5),
      .txdata5(txdata5),
      .txdatak5(txdatak5),
      .txdetectrx5(txdetectrx5),
      .txelecidle5(txelecidle5),
      .txcompl5(txcompl5),
      .rxpolarity5(rxpolarity5),
      .powerdown5(powerdown5),
      .rxdata5(rxdata5),
      .rxdatak5(rxdatak5),
      .rxvalid5(rxvalid5),
      .phystatus5(phystatus5),
      .rxelecidle5(rxelecidle5),
      .rxstatus5(rxstatus5),
      .eidleinfersel6(eidleinfersel6),
      .txdeemph6(txdeemph6),
      .txmargin6(txmargin6),
      .txdata6(txdata6),
      .txdatak6(txdatak6),
      .txdetectrx6(txdetectrx6),
      .txelecidle6(txelecidle6),
      .txcompl6(txcompl6),
      .rxpolarity6(rxpolarity6),
      .powerdown6(powerdown6),
      .rxdata6(rxdata6),
      .rxdatak6(rxdatak6),
      .rxvalid6(rxvalid6),
      .phystatus6(phystatus6),
      .rxelecidle6(rxelecidle6),
      .rxstatus6(rxstatus6),
      .eidleinfersel7(eidleinfersel7),
      .txdeemph7(txdeemph7),
      .txmargin7(txmargin7),
      .txdata7(txdata7),
      .txdatak7(txdatak7),
      .txdetectrx7(txdetectrx7),
      .txelecidle7(txelecidle7),
      .txcompl7(txcompl7),
      .rxpolarity7(rxpolarity7),
      .powerdown7(powerdown7),
      .rxdata7(rxdata7),
      .rxdatak7(rxdatak7),
      .rxvalid7(rxvalid7),
      .phystatus7(phystatus7),
      .rxelecidle7(rxelecidle7),
      .rxstatus7(rxstatus7),
      .ltssml0state(ltssml0state),      // LTSSM L0 State flag
      // REGSCAN I/Os for MRAM I/O testing
      .bisttestenn(bisttestenn),         // BIST-related I/Os for MRAM
      .bistscanin(bistscanin),             // Shared between 3 MRAM BISTs
      .bistscanenn(bistscanenn),             // Shared between 3 MRAM BISTs
      .bistenn(bistenn),
      .bistscanoutrpl(bistscanoutrpl),
      .bistscanoutrcv0(bistscanoutrcv0),
      .bistscanoutrcv1(bistscanoutrcv1),
      .bistdonearpl(bistdonearpl),
      .bistdonebrpl(bistdonebrpl),
      .bistpassrpl(bistpassrpl),
      .derrrpl(derrrpl),
      .derrcorextrpl(derrcorextrpl),
      .bistdonearcv0(bistdonearcv0),
      .bistdonebrcv0(bistdonebrcv0),
      .bistpassrcv0(bistpassrcv0),
      .derrcorextrcv0(derrcorextrcv0),
      .bistdonearcv1(bistdonearcv1),
      .bistdonebrcv1(bistdonebrcv1),
      .bistpassrcv1(bistpassrcv1),
      // scan test IO
      .scanmoden(scanmoden),
      .scanenn(scanenn),
      .dpriorefclkdig(dpriorefclkdig),
      // FRZ signals for MRAMs
      .nfrzdrv(nfrzdrv),
      .frzreg(frzreg),
      .frzlogic(frzlogic),
      // Redundancy IDs for the 3 MRAMs
      //Hard Reset Inputs
      .pinperstn(pinperstn),              // Active low PCIE reset from PCIE Interface PIN
      .pldperstn(pldperstn),              // Active low PCIE reset from PLD core
      .pldclrpmapcshipn(pldclrpmapcshipn),       // From PLD Active low signal To Hard Reset Ctrl(//), reset the PMA/PCS/HIP
      .pldclrpcshipn(pldclrpcshipn),          // From PLD Active low signal To Hard Reset Ctrl(//), reset the PCS/HIP
      .pldclrhipn(pldclrhipn),             // From PLD Active low signal To Hard Reset Ctrl(//), reset the HIP NON STICKY Bits (CRST & SRST)
      // Control signals from Control Block and POR
      .iocsrrdydly(1'b1),             // I/O CSR Ready Delayed (Low when IOCSR is not configured)
      .plniotri(1'b1),
      .entest(1'b0),
      .por(1'b0),
      //Hard Reset Controller
      .frefclk0(frefclk0),
      .frefclk1(frefclk1),
      .frefclk2(frefclk2),
      .frefclk3(frefclk3),
      .frefclk4(frefclk4),
      .frefclk5(frefclk5),
      .frefclk6(frefclk6),
      .frefclk7(frefclk7),
      .frefclk8(frefclk8),

      .rxfreqtxcmuplllock0(rxfreqtxcmuplllock0),
      .rxfreqtxcmuplllock1(rxfreqtxcmuplllock1),
      .rxfreqtxcmuplllock2(rxfreqtxcmuplllock2),
      .rxfreqtxcmuplllock3(rxfreqtxcmuplllock3),
      .rxfreqtxcmuplllock4(rxfreqtxcmuplllock4),
      .rxfreqtxcmuplllock5(rxfreqtxcmuplllock5),
      .rxfreqtxcmuplllock6(rxfreqtxcmuplllock6),
      .rxfreqtxcmuplllock7(rxfreqtxcmuplllock7),
      .rxfreqtxcmuplllock8(rxfreqtxcmuplllock8),

      .rxpllphaselock0(rxpllphaselock0),
      .rxpllphaselock1(rxpllphaselock1),
      .rxpllphaselock2(rxpllphaselock2),
      .rxpllphaselock3(rxpllphaselock3),
      .rxpllphaselock4(rxpllphaselock4),
      .rxpllphaselock5(rxpllphaselock5),
      .rxpllphaselock6(rxpllphaselock6),
      .rxpllphaselock7(rxpllphaselock7),
      .rxpllphaselock8(rxpllphaselock8),

      .txpcsrstn0(txpcsrstn0),
      .txpcsrstn1(txpcsrstn1),
      .txpcsrstn2(txpcsrstn2),
      .txpcsrstn3(txpcsrstn3),
      .txpcsrstn4(txpcsrstn4),
      .txpcsrstn5(txpcsrstn5),
      .txpcsrstn6(txpcsrstn6),
      .txpcsrstn7(txpcsrstn7),
      .txpcsrstn8(txpcsrstn8),

      .rxpcsrstn0(rxpcsrstn0),
      .rxpcsrstn1(rxpcsrstn1),
      .rxpcsrstn2(rxpcsrstn2),
      .rxpcsrstn3(rxpcsrstn3),
      .rxpcsrstn4(rxpcsrstn4),
      .rxpcsrstn5(rxpcsrstn5),
      .rxpcsrstn6(rxpcsrstn6),
      .rxpcsrstn7(rxpcsrstn7),
      .rxpcsrstn8(rxpcsrstn8),

      .txpmasyncp0(txpmasyncp0),
      .txpmasyncp1(txpmasyncp1),
      .txpmasyncp2(txpmasyncp2),
      .txpmasyncp3(txpmasyncp3),
      .txpmasyncp4(txpmasyncp4),
      .txpmasyncp5(txpmasyncp5),
      .txpmasyncp6(txpmasyncp6),
      .txpmasyncp7(txpmasyncp7),
      .txpmasyncp8(txpmasyncp8),

      .rxpmarstb0(rxpmarstb0),
      .rxpmarstb1(rxpmarstb1),
      .rxpmarstb2(rxpmarstb2),
      .rxpmarstb3(rxpmarstb3),
      .rxpmarstb4(rxpmarstb4),
      .rxpmarstb5(rxpmarstb5),
      .rxpmarstb6(rxpmarstb6),
      .rxpmarstb7(rxpmarstb7),
      .rxpmarstb8(rxpmarstb8),

      .rxbardecfuncnumvc0(rxbardecfuncnumvc0),
      .tlpmeventfunc(tlpmeventfunc),
      .tlappintafuncnum(tlappintafuncnum),
      .tlappintbsts(tlappintbsts),
      .tlappintbfuncnum(tlappintbfuncnum),
      .tlappintcsts(tlappintcsts),
      .tlappintcfuncnum(tlappintcfuncnum),
      .tlappintdsts(tlappintdsts),
      .tlappintdfuncnum(tlappintdfuncnum),
      .tlappmsifunc(tlappmsifunc),
      .cplpending(cplpending),
      .cplerrfunc(cplerrfunc),
      .flrreset(flrreset),
      .cvpconfigready(cvpconfigready),
      .cvpen(cvpen),
      .cvpconfigerror(cvpconfigerror),
      .cvpconfigdone(cvpconfigdone),
      .cvpclk(cvpclk),
      .cvpdata(cvpdata),
      .cvpstartxfer(cvpstartxfer),
      .cvpconfig(cvpconfig),
      .cvpfullconfig(cvpfullconfig),
      .pclkch0(pclkch0),
      .pclkch1(pclkch1),
      .pclkcentral(pclkcentral),
      .pllfixedclkch0(pllfixedclkch0),
      .pllfixedclkch1(pllfixedclkch1),
      .pllfixedclkcentral(pllfixedclkcentral),
      .tlappintback(tlappintback),
      .tlappintcack(tlappintcack),
      .tlappintdack(tlappintdack),
      //tlcfgctladd(tlcfgctladd),
      .flrsts(flrsts),
      .rxfreqlocked0(rxfreqlocked0),
      .rxfreqlocked1(rxfreqlocked1),
      .rxfreqlocked2(rxfreqlocked2),
      .rxfreqlocked3(rxfreqlocked3),
      .rxfreqlocked4(rxfreqlocked4),
      .rxfreqlocked5(rxfreqlocked5),
      .rxfreqlocked6(rxfreqlocked6),
      .rxfreqlocked7(rxfreqlocked7),
      .txswing0(txswing0),
      .txswing1(txswing1),
      .txswing2(txswing2),
      .txswing3(txswing3),
      .txswing4(txswing4),
      .txswing5(txswing5),
      .txswing6(txswing6),
      .txswing7(txswing7),
      .txcredfchipcons(txcredfchipcons), // TL to AL Indicates that HIP consumed one of PH PD(//), NPH(NPH), NPD(NPD), CH(CH), CD
      .txcredfcinfinite(txcredfcinfinite), // TL to AL Indicates if this is an infinite credit PH PD(//), NPH(NPH), NPD(NPD), CH(CH), CD
      .txcredhdrfcp(txcredhdrfcp),    // TL to AL Header credit of the received FC Posted.
      .txcreddatafcp(txcreddatafcp),   // TL to AL Signals the Data credit of the received FC Posted
      .txcredhdrfcnp(txcredhdrfcnp),   // TL to AL Header credit of the received FC Non Posted
      .txcreddatafcnp(txcreddatafcnp),  // TL to AL Signals the Data credit of the received FC Non Posted
      .txcredhdrfccp(txcredhdrfccp),   // TL to AL Header credit of the received FC completion.
      .txcreddatafccp(txcreddatafccp),  // TL to AL Signals the Data credit of the received FC completion
      // Debug signals
      .dbgpipex1rx(dbgpipex1rx),
      // Extra signals
      .hipextrain(hipextrain),
      .hipextraclkin(hipextraclkin),
      .r2cerrext(r2cerrext),
      .successfulspeednegotiationint(successfulspeednegotiationint),
      .hipextraout(hipextraout),
      .hipextraclkout(hipextraclkout),
      .pldcoreready(pldcoreready),
      .pldclkinuse(pldclkinuse)
   );

defparam arriav_hd_altpe2_hip_top_i.func_mode = func_mode;
defparam arriav_hd_altpe2_hip_top_i.bonding_mode = bonding_mode;
defparam arriav_hd_altpe2_hip_top_i.prot_mode = prot_mode;
defparam arriav_hd_altpe2_hip_top_i.pcie_spec_1p0_compliance = pcie_spec_1p0_compliance;
defparam arriav_hd_altpe2_hip_top_i.vc_enable = vc_enable;
defparam arriav_hd_altpe2_hip_top_i.enable_slot_register = enable_slot_register;
defparam arriav_hd_altpe2_hip_top_i.pcie_mode = pcie_mode;
defparam arriav_hd_altpe2_hip_top_i.multi_function = multi_function;
defparam arriav_hd_altpe2_hip_top_i.bypass_cdc = bypass_cdc;
defparam arriav_hd_altpe2_hip_top_i.cdc_clk_relation = cdc_clk_relation;
defparam arriav_hd_altpe2_hip_top_i.enable_rx_reordering = enable_rx_reordering;
defparam arriav_hd_altpe2_hip_top_i.enable_rx_buffer_checking = enable_rx_buffer_checking;
defparam arriav_hd_altpe2_hip_top_i.single_rx_detect_data = single_rx_detect_data;
defparam arriav_hd_altpe2_hip_top_i.single_rx_detect = single_rx_detect;
defparam arriav_hd_altpe2_hip_top_i.use_crc_forwarding = use_crc_forwarding;
defparam arriav_hd_altpe2_hip_top_i.bypass_tl = bypass_tl;
defparam arriav_hd_altpe2_hip_top_i.gen12_lane_rate_mode = gen12_lane_rate_mode;
defparam arriav_hd_altpe2_hip_top_i.lane_mask = lane_mask;
defparam arriav_hd_altpe2_hip_top_i.disable_link_x2_support = disable_link_x2_support;
defparam arriav_hd_altpe2_hip_top_i.national_inst_thru_enhance = national_inst_thru_enhance;
defparam arriav_hd_altpe2_hip_top_i.disable_tag_check = disable_tag_check;
defparam arriav_hd_altpe2_hip_top_i.port_link_number_data = port_link_number_data;
defparam arriav_hd_altpe2_hip_top_i.port_link_number = port_link_number;
defparam arriav_hd_altpe2_hip_top_i.device_number_data = device_number_data;
defparam arriav_hd_altpe2_hip_top_i.device_number = device_number;
defparam arriav_hd_altpe2_hip_top_i.bypass_clk_switch = bypass_clk_switch;
defparam arriav_hd_altpe2_hip_top_i.core_clk_out_sel = core_clk_out_sel;
defparam arriav_hd_altpe2_hip_top_i.core_clk_divider = core_clk_divider;
defparam arriav_hd_altpe2_hip_top_i.core_clk_source = core_clk_source;
defparam arriav_hd_altpe2_hip_top_i.core_clk_sel = core_clk_sel;
defparam arriav_hd_altpe2_hip_top_i.disable_clk_switch = disable_clk_switch;
defparam arriav_hd_altpe2_hip_top_i.core_clk_disable_clk_switch = core_clk_disable_clk_switch;
defparam arriav_hd_altpe2_hip_top_i.slotclk_cfg = slotclk_cfg;
defparam arriav_hd_altpe2_hip_top_i.tx_swing_data = tx_swing_data;
defparam arriav_hd_altpe2_hip_top_i.tx_swing = tx_swing;
defparam arriav_hd_altpe2_hip_top_i.enable_ch0_pclk_out = enable_ch0_pclk_out;
defparam arriav_hd_altpe2_hip_top_i.enable_ch01_pclk_out = enable_ch01_pclk_out;
defparam arriav_hd_altpe2_hip_top_i.pipex1_debug_sel = pipex1_debug_sel;
defparam arriav_hd_altpe2_hip_top_i.pclk_out_sel = pclk_out_sel;

//Func 0 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_i.vendor_id_data_0 = vendor_id_data_0;
defparam arriav_hd_altpe2_hip_top_i.vendor_id_0 = vendor_id_0;
defparam arriav_hd_altpe2_hip_top_i.device_id_data_0 = device_id_data_0;
defparam arriav_hd_altpe2_hip_top_i.device_id_0 = device_id_0;
defparam arriav_hd_altpe2_hip_top_i.revision_id_data_0 = revision_id_data_0;
defparam arriav_hd_altpe2_hip_top_i.revision_id_0 = revision_id_0;
defparam arriav_hd_altpe2_hip_top_i.class_code_data_0 = class_code_data_0;
defparam arriav_hd_altpe2_hip_top_i.class_code_0 = class_code_0;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_data_0 = subsystem_vendor_id_data_0;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_0 = subsystem_vendor_id_0;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_data_0 = subsystem_device_id_data_0;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_0 = subsystem_device_id_0;
defparam arriav_hd_altpe2_hip_top_i.no_soft_reset_0 = no_soft_reset_0;
defparam arriav_hd_altpe2_hip_top_i.intel_id_access_0 = intel_id_access_0;
defparam arriav_hd_altpe2_hip_top_i.device_specific_init_0 = device_specific_init_0;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_data_0 = maximum_current_data_0;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_0 = maximum_current_0;
defparam arriav_hd_altpe2_hip_top_i.d1_support_0 = d1_support_0;
defparam arriav_hd_altpe2_hip_top_i.d2_support_0 = d2_support_0;
defparam arriav_hd_altpe2_hip_top_i.d0_pme_0 = d0_pme_0;
defparam arriav_hd_altpe2_hip_top_i.d1_pme_0 = d1_pme_0;
defparam arriav_hd_altpe2_hip_top_i.d2_pme_0 = d2_pme_0;
defparam arriav_hd_altpe2_hip_top_i.d3_hot_pme_0 = d3_hot_pme_0;
defparam arriav_hd_altpe2_hip_top_i.d3_cold_pme_0 = d3_cold_pme_0;
defparam arriav_hd_altpe2_hip_top_i.use_aer_0 = use_aer_0;
defparam arriav_hd_altpe2_hip_top_i.low_priority_vc_0 = low_priority_vc_0;
defparam arriav_hd_altpe2_hip_top_i.vc_arbitration_0 = vc_arbitration_0;
defparam arriav_hd_altpe2_hip_top_i.disable_snoop_packet_0 = disable_snoop_packet_0;
defparam arriav_hd_altpe2_hip_top_i.max_payload_size_0 = max_payload_size_0;
defparam arriav_hd_altpe2_hip_top_i.surprise_down_error_support_0 = surprise_down_error_support_0;
defparam arriav_hd_altpe2_hip_top_i.dll_active_report_support_0 = dll_active_report_support_0;
defparam arriav_hd_altpe2_hip_top_i.extend_tag_field_0 = extend_tag_field_0;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_data_0 = endpoint_l0_latency_data_0;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_0 = endpoint_l0_latency_0;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_data_0 = endpoint_l1_latency_data_0;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_0 = endpoint_l1_latency_0;
defparam arriav_hd_altpe2_hip_top_i.indicator_data_0 = indicator_data_0;
defparam arriav_hd_altpe2_hip_top_i.indicator_0 = indicator_0;
defparam arriav_hd_altpe2_hip_top_i.role_based_error_reporting_0 = role_based_error_reporting_0;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_data_0 = slot_power_scale_data_0;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_0 = slot_power_scale_0;
defparam arriav_hd_altpe2_hip_top_i.max_link_width_0 = max_link_width_0;
defparam arriav_hd_altpe2_hip_top_i.enable_l1_aspm_0 = enable_l1_aspm_0;
defparam arriav_hd_altpe2_hip_top_i.enable_l0s_aspm_0 = enable_l0s_aspm_0;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_data_0 = l1_exit_latency_sameclock_data_0;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_0 = l1_exit_latency_sameclock_0;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_data_0 = l1_exit_latency_diffclock_data_0;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_0 = l1_exit_latency_diffclock_0;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_data_0 = hot_plug_support_data_0;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_0 = hot_plug_support_0;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_data_0 = slot_power_limit_data_0;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_0 = slot_power_limit_0;
defparam arriav_hd_altpe2_hip_top_i.slot_number_data_0 = slot_number_data_0;
defparam arriav_hd_altpe2_hip_top_i.slot_number_0 = slot_number_0;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_data_0 = diffclock_nfts_count_data_0;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_0 = diffclock_nfts_count_0;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_data_0 = sameclock_nfts_count_data_0;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_0 = sameclock_nfts_count_0;
defparam arriav_hd_altpe2_hip_top_i.completion_timeout_0 = completion_timeout_0;
defparam arriav_hd_altpe2_hip_top_i.enable_completion_timeout_disable_0 = enable_completion_timeout_disable_0;
defparam arriav_hd_altpe2_hip_top_i.extended_tag_reset_0 = extended_tag_reset_0;
defparam arriav_hd_altpe2_hip_top_i.ecrc_check_capable_0 = ecrc_check_capable_0;
defparam arriav_hd_altpe2_hip_top_i.ecrc_gen_capable_0 = ecrc_gen_capable_0;
defparam arriav_hd_altpe2_hip_top_i.no_command_completed_0 = no_command_completed_0;
defparam arriav_hd_altpe2_hip_top_i.msi_multi_message_capable_0 = msi_multi_message_capable_0;
defparam arriav_hd_altpe2_hip_top_i.msi_64bit_addressing_capable_0 = msi_64bit_addressing_capable_0;
defparam arriav_hd_altpe2_hip_top_i.msi_masking_capable_0 = msi_masking_capable_0;
defparam arriav_hd_altpe2_hip_top_i.msi_support_0 = msi_support_0;
defparam arriav_hd_altpe2_hip_top_i.interrupt_pin_0 = interrupt_pin_0;
defparam arriav_hd_altpe2_hip_top_i.enable_function_msix_support_0 = enable_function_msix_support_0;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_data_0 = msix_table_size_data_0;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_0 = msix_table_size_0;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_data_0 = msix_table_bir_data_0;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_0 = msix_table_bir_0;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_data_0 = msix_table_offset_data_0;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_0 = msix_table_offset_0;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_data_0 = msix_pba_bir_data_0;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_0 = msix_pba_bir_0;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_data_0 = msix_pba_offset_data_0;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_0 = msix_pba_offset_0;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_vga_enable_0 = bridge_port_vga_enable_0;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_ssid_support_0 = bridge_port_ssid_support_0;
defparam arriav_hd_altpe2_hip_top_i.ssvid_data_0 = ssvid_data_0;
defparam arriav_hd_altpe2_hip_top_i.ssvid_0 = ssvid_0;
defparam arriav_hd_altpe2_hip_top_i.ssid_data_0 = ssid_data_0;
defparam arriav_hd_altpe2_hip_top_i.ssid_0 = ssid_0;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_data_0 = eie_before_nfts_count_data_0;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_0 = eie_before_nfts_count_0;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_data_0 = gen2_diffclock_nfts_count_data_0;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_0 = gen2_diffclock_nfts_count_0;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_data_0 = gen2_sameclock_nfts_count_data_0;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_0 = gen2_sameclock_nfts_count_0;
defparam arriav_hd_altpe2_hip_top_i.deemphasis_enable_0 = deemphasis_enable_0;
defparam arriav_hd_altpe2_hip_top_i.pcie_spec_version_0 = pcie_spec_version_0;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_data_0 = l0_exit_latency_sameclock_data_0;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_0 = l0_exit_latency_sameclock_0;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_data_0 = l0_exit_latency_diffclock_data_0;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_0 = l0_exit_latency_diffclock_0;
defparam arriav_hd_altpe2_hip_top_i.rx_ei_l0s_0 = rx_ei_l0s_0;
defparam arriav_hd_altpe2_hip_top_i.l2_async_logic_0 = l2_async_logic_0;
defparam arriav_hd_altpe2_hip_top_i.aspm_optionality_0 = aspm_optionality_0;
defparam arriav_hd_altpe2_hip_top_i.flr_capability_0 = flr_capability_0;
defparam arriav_hd_altpe2_hip_top_i.bar0_io_space_0 = bar0_io_space_0;
defparam arriav_hd_altpe2_hip_top_i.bar0_64bit_mem_space_0 = bar0_64bit_mem_space_0;
defparam arriav_hd_altpe2_hip_top_i.bar0_prefetchable_0 = bar0_prefetchable_0;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_data_0 = bar0_size_mask_data_0;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_0 = bar0_size_mask_0;
defparam arriav_hd_altpe2_hip_top_i.bar1_io_space_0 = bar1_io_space_0;
defparam arriav_hd_altpe2_hip_top_i.bar1_64bit_mem_space_0 = bar1_64bit_mem_space_0;
defparam arriav_hd_altpe2_hip_top_i.bar1_prefetchable_0 = bar1_prefetchable_0;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_data_0 = bar1_size_mask_data_0;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_0 = bar1_size_mask_0;
defparam arriav_hd_altpe2_hip_top_i.bar2_io_space_0 = bar2_io_space_0;
defparam arriav_hd_altpe2_hip_top_i.bar2_64bit_mem_space_0 = bar2_64bit_mem_space_0;
defparam arriav_hd_altpe2_hip_top_i.bar2_prefetchable_0 = bar2_prefetchable_0;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_data_0 = bar2_size_mask_data_0;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_0 = bar2_size_mask_0;
defparam arriav_hd_altpe2_hip_top_i.bar3_io_space_0 = bar3_io_space_0;
defparam arriav_hd_altpe2_hip_top_i.bar3_64bit_mem_space_0 = bar3_64bit_mem_space_0;
defparam arriav_hd_altpe2_hip_top_i.bar3_prefetchable_0 = bar3_prefetchable_0;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_data_0 = bar3_size_mask_data_0;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_0 = bar3_size_mask_0;
defparam arriav_hd_altpe2_hip_top_i.bar4_io_space_0 = bar4_io_space_0;
defparam arriav_hd_altpe2_hip_top_i.bar4_64bit_mem_space_0 = bar4_64bit_mem_space_0;
defparam arriav_hd_altpe2_hip_top_i.bar4_prefetchable_0 = bar4_prefetchable_0;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_data_0 = bar4_size_mask_data_0;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_0 = bar4_size_mask_0;
defparam arriav_hd_altpe2_hip_top_i.bar5_io_space_0 = bar5_io_space_0;
defparam arriav_hd_altpe2_hip_top_i.bar5_64bit_mem_space_0 = bar5_64bit_mem_space_0;
defparam arriav_hd_altpe2_hip_top_i.bar5_prefetchable_0 = bar5_prefetchable_0;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_data_0 = bar5_size_mask_data_0;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_0 = bar5_size_mask_0;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_data_0 = expansion_base_address_register_data_0;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_0 = expansion_base_address_register_0;
defparam arriav_hd_altpe2_hip_top_i.io_window_addr_width_0 = io_window_addr_width_0;
defparam arriav_hd_altpe2_hip_top_i.prefetchable_mem_window_addr_width_0 = prefetchable_mem_window_addr_width_0;
//Func 0 - Config Register Settings END -------------

//Func 1 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_i.vendor_id_data_1 = vendor_id_data_1;
defparam arriav_hd_altpe2_hip_top_i.vendor_id_1 = vendor_id_1;
defparam arriav_hd_altpe2_hip_top_i.device_id_data_1 = device_id_data_1;
defparam arriav_hd_altpe2_hip_top_i.device_id_1 = device_id_1;
defparam arriav_hd_altpe2_hip_top_i.revision_id_data_1 = revision_id_data_1;
defparam arriav_hd_altpe2_hip_top_i.revision_id_1 = revision_id_1;
defparam arriav_hd_altpe2_hip_top_i.class_code_data_1 = class_code_data_1;
defparam arriav_hd_altpe2_hip_top_i.class_code_1 = class_code_1;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_data_1 = subsystem_vendor_id_data_1;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_1 = subsystem_vendor_id_1;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_data_1 = subsystem_device_id_data_1;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_1 = subsystem_device_id_1;
defparam arriav_hd_altpe2_hip_top_i.no_soft_reset_1 = no_soft_reset_1;
defparam arriav_hd_altpe2_hip_top_i.intel_id_access_1 = intel_id_access_1;
defparam arriav_hd_altpe2_hip_top_i.device_specific_init_1 = device_specific_init_1;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_data_1 = maximum_current_data_1;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_1 = maximum_current_1;
defparam arriav_hd_altpe2_hip_top_i.d1_support_1 = d1_support_1;
defparam arriav_hd_altpe2_hip_top_i.d2_support_1 = d2_support_1;
defparam arriav_hd_altpe2_hip_top_i.d0_pme_1 = d0_pme_1;
defparam arriav_hd_altpe2_hip_top_i.d1_pme_1 = d1_pme_1;
defparam arriav_hd_altpe2_hip_top_i.d2_pme_1 = d2_pme_1;
defparam arriav_hd_altpe2_hip_top_i.d3_hot_pme_1 = d3_hot_pme_1;
defparam arriav_hd_altpe2_hip_top_i.d3_cold_pme_1 = d3_cold_pme_1;
defparam arriav_hd_altpe2_hip_top_i.use_aer_1 = use_aer_1;
defparam arriav_hd_altpe2_hip_top_i.low_priority_vc_1 = low_priority_vc_1;
defparam arriav_hd_altpe2_hip_top_i.vc_arbitration_1 = vc_arbitration_1;
defparam arriav_hd_altpe2_hip_top_i.disable_snoop_packet_1 = disable_snoop_packet_1;
defparam arriav_hd_altpe2_hip_top_i.max_payload_size_1 = max_payload_size_1;
defparam arriav_hd_altpe2_hip_top_i.surprise_down_error_support_1 = surprise_down_error_support_1;
defparam arriav_hd_altpe2_hip_top_i.dll_active_report_support_1 = dll_active_report_support_1;
defparam arriav_hd_altpe2_hip_top_i.extend_tag_field_1 = extend_tag_field_1;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_data_1 = endpoint_l0_latency_data_1;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_1 = endpoint_l0_latency_1;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_data_1 = endpoint_l1_latency_data_1;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_1 = endpoint_l1_latency_1;
defparam arriav_hd_altpe2_hip_top_i.indicator_data_1 = indicator_data_1;
defparam arriav_hd_altpe2_hip_top_i.indicator_1 = indicator_1;
defparam arriav_hd_altpe2_hip_top_i.role_based_error_reporting_1 = role_based_error_reporting_1;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_data_1 = slot_power_scale_data_1;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_1 = slot_power_scale_1;
defparam arriav_hd_altpe2_hip_top_i.max_link_width_1 = max_link_width_1;
defparam arriav_hd_altpe2_hip_top_i.enable_l1_aspm_1 = enable_l1_aspm_1;
defparam arriav_hd_altpe2_hip_top_i.enable_l0s_aspm_1 = enable_l0s_aspm_1;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_data_1 = l1_exit_latency_sameclock_data_1;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_1 = l1_exit_latency_sameclock_1;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_data_1 = l1_exit_latency_diffclock_data_1;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_1 = l1_exit_latency_diffclock_1;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_data_1 = hot_plug_support_data_1;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_1 = hot_plug_support_1;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_data_1 = slot_power_limit_data_1;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_1 = slot_power_limit_1;
defparam arriav_hd_altpe2_hip_top_i.slot_number_data_1 = slot_number_data_1;
defparam arriav_hd_altpe2_hip_top_i.slot_number_1 = slot_number_1;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_data_1 = diffclock_nfts_count_data_1;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_1 = diffclock_nfts_count_1;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_data_1 = sameclock_nfts_count_data_1;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_1 = sameclock_nfts_count_1;
defparam arriav_hd_altpe2_hip_top_i.completion_timeout_1 = completion_timeout_1;
defparam arriav_hd_altpe2_hip_top_i.enable_completion_timeout_disable_1 = enable_completion_timeout_disable_1;
defparam arriav_hd_altpe2_hip_top_i.extended_tag_reset_1 = extended_tag_reset_1;
defparam arriav_hd_altpe2_hip_top_i.ecrc_check_capable_1 = ecrc_check_capable_1;
defparam arriav_hd_altpe2_hip_top_i.ecrc_gen_capable_1 = ecrc_gen_capable_1;
defparam arriav_hd_altpe2_hip_top_i.no_command_completed_1 = no_command_completed_1;
defparam arriav_hd_altpe2_hip_top_i.msi_multi_message_capable_1 = msi_multi_message_capable_1;
defparam arriav_hd_altpe2_hip_top_i.msi_64bit_addressing_capable_1 = msi_64bit_addressing_capable_1;
defparam arriav_hd_altpe2_hip_top_i.msi_masking_capable_1 = msi_masking_capable_1;
defparam arriav_hd_altpe2_hip_top_i.msi_support_1 = msi_support_1;
defparam arriav_hd_altpe2_hip_top_i.interrupt_pin_1 = interrupt_pin_1;
defparam arriav_hd_altpe2_hip_top_i.enable_function_msix_support_1 = enable_function_msix_support_1;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_data_1 = msix_table_size_data_1;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_1 = msix_table_size_1;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_data_1 = msix_table_bir_data_1;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_1 = msix_table_bir_1;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_data_1 = msix_table_offset_data_1;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_1 = msix_table_offset_1;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_data_1 = msix_pba_bir_data_1;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_1 = msix_pba_bir_1;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_data_1 = msix_pba_offset_data_1;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_1 = msix_pba_offset_1;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_vga_enable_1 = bridge_port_vga_enable_1;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_ssid_support_1 = bridge_port_ssid_support_1;
defparam arriav_hd_altpe2_hip_top_i.ssvid_data_1 = ssvid_data_1;
defparam arriav_hd_altpe2_hip_top_i.ssvid_1 = ssvid_1;
defparam arriav_hd_altpe2_hip_top_i.ssid_data_1 = ssid_data_1;
defparam arriav_hd_altpe2_hip_top_i.ssid_1 = ssid_1;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_data_1 = eie_before_nfts_count_data_1;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_1 = eie_before_nfts_count_1;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_data_1 = gen2_diffclock_nfts_count_data_1;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_1 = gen2_diffclock_nfts_count_1;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_data_1 = gen2_sameclock_nfts_count_data_1;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_1 = gen2_sameclock_nfts_count_1;
defparam arriav_hd_altpe2_hip_top_i.deemphasis_enable_1 = deemphasis_enable_1;
defparam arriav_hd_altpe2_hip_top_i.pcie_spec_version_1 = pcie_spec_version_1;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_data_1 = l0_exit_latency_sameclock_data_1;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_1 = l0_exit_latency_sameclock_1;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_data_1 = l0_exit_latency_diffclock_data_1;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_1 = l0_exit_latency_diffclock_1;
defparam arriav_hd_altpe2_hip_top_i.rx_ei_l0s_1 = rx_ei_l0s_1;
defparam arriav_hd_altpe2_hip_top_i.l2_async_logic_1 = l2_async_logic_1;
defparam arriav_hd_altpe2_hip_top_i.aspm_optionality_1 = aspm_optionality_1;
defparam arriav_hd_altpe2_hip_top_i.flr_capability_1 = flr_capability_1;
defparam arriav_hd_altpe2_hip_top_i.bar0_io_space_1 = bar0_io_space_1;
defparam arriav_hd_altpe2_hip_top_i.bar0_64bit_mem_space_1 = bar0_64bit_mem_space_1;
defparam arriav_hd_altpe2_hip_top_i.bar0_prefetchable_1 = bar0_prefetchable_1;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_data_1 = bar0_size_mask_data_1;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_1 = bar0_size_mask_1;
defparam arriav_hd_altpe2_hip_top_i.bar1_io_space_1 = bar1_io_space_1;
defparam arriav_hd_altpe2_hip_top_i.bar1_64bit_mem_space_1 = bar1_64bit_mem_space_1;
defparam arriav_hd_altpe2_hip_top_i.bar1_prefetchable_1 = bar1_prefetchable_1;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_data_1 = bar1_size_mask_data_1;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_1 = bar1_size_mask_1;
defparam arriav_hd_altpe2_hip_top_i.bar2_io_space_1 = bar2_io_space_1;
defparam arriav_hd_altpe2_hip_top_i.bar2_64bit_mem_space_1 = bar2_64bit_mem_space_1;
defparam arriav_hd_altpe2_hip_top_i.bar2_prefetchable_1 = bar2_prefetchable_1;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_data_1 = bar2_size_mask_data_1;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_1 = bar2_size_mask_1;
defparam arriav_hd_altpe2_hip_top_i.bar3_io_space_1 = bar3_io_space_1;
defparam arriav_hd_altpe2_hip_top_i.bar3_64bit_mem_space_1 = bar3_64bit_mem_space_1;
defparam arriav_hd_altpe2_hip_top_i.bar3_prefetchable_1 = bar3_prefetchable_1;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_data_1 = bar3_size_mask_data_1;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_1 = bar3_size_mask_1;
defparam arriav_hd_altpe2_hip_top_i.bar4_io_space_1 = bar4_io_space_1;
defparam arriav_hd_altpe2_hip_top_i.bar4_64bit_mem_space_1 = bar4_64bit_mem_space_1;
defparam arriav_hd_altpe2_hip_top_i.bar4_prefetchable_1 = bar4_prefetchable_1;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_data_1 = bar4_size_mask_data_1;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_1 = bar4_size_mask_1;
defparam arriav_hd_altpe2_hip_top_i.bar5_io_space_1 = bar5_io_space_1;
defparam arriav_hd_altpe2_hip_top_i.bar5_64bit_mem_space_1 = bar5_64bit_mem_space_1;
defparam arriav_hd_altpe2_hip_top_i.bar5_prefetchable_1 = bar5_prefetchable_1;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_data_1 = bar5_size_mask_data_1;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_1 = bar5_size_mask_1;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_data_1 = expansion_base_address_register_data_1;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_1 = expansion_base_address_register_1;
defparam arriav_hd_altpe2_hip_top_i.io_window_addr_width_1 = io_window_addr_width_1;
defparam arriav_hd_altpe2_hip_top_i.prefetchable_mem_window_addr_width_1 = prefetchable_mem_window_addr_width_1;
//Func 1 - Config Register Settings END -------------

//Func 2 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_i.vendor_id_data_2 = vendor_id_data_2;
defparam arriav_hd_altpe2_hip_top_i.vendor_id_2 = vendor_id_2;
defparam arriav_hd_altpe2_hip_top_i.device_id_data_2 = device_id_data_2;
defparam arriav_hd_altpe2_hip_top_i.device_id_2 = device_id_2;
defparam arriav_hd_altpe2_hip_top_i.revision_id_data_2 = revision_id_data_2;
defparam arriav_hd_altpe2_hip_top_i.revision_id_2 = revision_id_2;
defparam arriav_hd_altpe2_hip_top_i.class_code_data_2 = class_code_data_2;
defparam arriav_hd_altpe2_hip_top_i.class_code_2 = class_code_2;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_data_2 = subsystem_vendor_id_data_2;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_2 = subsystem_vendor_id_2;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_data_2 = subsystem_device_id_data_2;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_2 = subsystem_device_id_2;
defparam arriav_hd_altpe2_hip_top_i.no_soft_reset_2 = no_soft_reset_2;
defparam arriav_hd_altpe2_hip_top_i.intel_id_access_2 = intel_id_access_2;
defparam arriav_hd_altpe2_hip_top_i.device_specific_init_2 = device_specific_init_2;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_data_2 = maximum_current_data_2;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_2 = maximum_current_2;
defparam arriav_hd_altpe2_hip_top_i.d1_support_2 = d1_support_2;
defparam arriav_hd_altpe2_hip_top_i.d2_support_2 = d2_support_2;
defparam arriav_hd_altpe2_hip_top_i.d0_pme_2 = d0_pme_2;
defparam arriav_hd_altpe2_hip_top_i.d1_pme_2 = d1_pme_2;
defparam arriav_hd_altpe2_hip_top_i.d2_pme_2 = d2_pme_2;
defparam arriav_hd_altpe2_hip_top_i.d3_hot_pme_2 = d3_hot_pme_2;
defparam arriav_hd_altpe2_hip_top_i.d3_cold_pme_2 = d3_cold_pme_2;
defparam arriav_hd_altpe2_hip_top_i.use_aer_2 = use_aer_2;
defparam arriav_hd_altpe2_hip_top_i.low_priority_vc_2 = low_priority_vc_2;
defparam arriav_hd_altpe2_hip_top_i.vc_arbitration_2 = vc_arbitration_2;
defparam arriav_hd_altpe2_hip_top_i.disable_snoop_packet_2 = disable_snoop_packet_2;
defparam arriav_hd_altpe2_hip_top_i.max_payload_size_2 = max_payload_size_2;
defparam arriav_hd_altpe2_hip_top_i.surprise_down_error_support_2 = surprise_down_error_support_2;
defparam arriav_hd_altpe2_hip_top_i.dll_active_report_support_2 = dll_active_report_support_2;
defparam arriav_hd_altpe2_hip_top_i.extend_tag_field_2 = extend_tag_field_2;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_data_2 = endpoint_l0_latency_data_2;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_2 = endpoint_l0_latency_2;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_data_2 = endpoint_l1_latency_data_2;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_2 = endpoint_l1_latency_2;
defparam arriav_hd_altpe2_hip_top_i.indicator_data_2 = indicator_data_2;
defparam arriav_hd_altpe2_hip_top_i.indicator_2 = indicator_2;
defparam arriav_hd_altpe2_hip_top_i.role_based_error_reporting_2 = role_based_error_reporting_2;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_data_2 = slot_power_scale_data_2;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_2 = slot_power_scale_2;
defparam arriav_hd_altpe2_hip_top_i.max_link_width_2 = max_link_width_2;
defparam arriav_hd_altpe2_hip_top_i.enable_l1_aspm_2 = enable_l1_aspm_2;
defparam arriav_hd_altpe2_hip_top_i.enable_l0s_aspm_2 = enable_l0s_aspm_2;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_data_2 = l1_exit_latency_sameclock_data_2;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_2 = l1_exit_latency_sameclock_2;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_data_2 = l1_exit_latency_diffclock_data_2;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_2 = l1_exit_latency_diffclock_2;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_data_2 = hot_plug_support_data_2;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_2 = hot_plug_support_2;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_data_2 = slot_power_limit_data_2;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_2 = slot_power_limit_2;
defparam arriav_hd_altpe2_hip_top_i.slot_number_data_2 = slot_number_data_2;
defparam arriav_hd_altpe2_hip_top_i.slot_number_2 = slot_number_2;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_data_2 = diffclock_nfts_count_data_2;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_2 = diffclock_nfts_count_2;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_data_2 = sameclock_nfts_count_data_2;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_2 = sameclock_nfts_count_2;
defparam arriav_hd_altpe2_hip_top_i.completion_timeout_2 = completion_timeout_2;
defparam arriav_hd_altpe2_hip_top_i.enable_completion_timeout_disable_2 = enable_completion_timeout_disable_2;
defparam arriav_hd_altpe2_hip_top_i.extended_tag_reset_2 = extended_tag_reset_2;
defparam arriav_hd_altpe2_hip_top_i.ecrc_check_capable_2 = ecrc_check_capable_2;
defparam arriav_hd_altpe2_hip_top_i.ecrc_gen_capable_2 = ecrc_gen_capable_2;
defparam arriav_hd_altpe2_hip_top_i.no_command_completed_2 = no_command_completed_2;
defparam arriav_hd_altpe2_hip_top_i.msi_multi_message_capable_2 = msi_multi_message_capable_2;
defparam arriav_hd_altpe2_hip_top_i.msi_64bit_addressing_capable_2 = msi_64bit_addressing_capable_2;
defparam arriav_hd_altpe2_hip_top_i.msi_masking_capable_2 = msi_masking_capable_2;
defparam arriav_hd_altpe2_hip_top_i.msi_support_2 = msi_support_2;
defparam arriav_hd_altpe2_hip_top_i.interrupt_pin_2 = interrupt_pin_2;
defparam arriav_hd_altpe2_hip_top_i.enable_function_msix_support_2 = enable_function_msix_support_2;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_data_2 = msix_table_size_data_2;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_2 = msix_table_size_2;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_data_2 = msix_table_bir_data_2;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_2 = msix_table_bir_2;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_data_2 = msix_table_offset_data_2;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_2 = msix_table_offset_2;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_data_2 = msix_pba_bir_data_2;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_2 = msix_pba_bir_2;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_data_2 = msix_pba_offset_data_2;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_2 = msix_pba_offset_2;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_vga_enable_2 = bridge_port_vga_enable_2;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_ssid_support_2 = bridge_port_ssid_support_2;
defparam arriav_hd_altpe2_hip_top_i.ssvid_data_2 = ssvid_data_2;
defparam arriav_hd_altpe2_hip_top_i.ssvid_2 = ssvid_2;
defparam arriav_hd_altpe2_hip_top_i.ssid_data_2 = ssid_data_2;
defparam arriav_hd_altpe2_hip_top_i.ssid_2 = ssid_2;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_data_2 = eie_before_nfts_count_data_2;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_2 = eie_before_nfts_count_2;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_data_2 = gen2_diffclock_nfts_count_data_2;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_2 = gen2_diffclock_nfts_count_2;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_data_2 = gen2_sameclock_nfts_count_data_2;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_2 = gen2_sameclock_nfts_count_2;
defparam arriav_hd_altpe2_hip_top_i.deemphasis_enable_2 = deemphasis_enable_2;
defparam arriav_hd_altpe2_hip_top_i.pcie_spec_version_2 = pcie_spec_version_2;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_data_2 = l0_exit_latency_sameclock_data_2;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_2 = l0_exit_latency_sameclock_2;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_data_2 = l0_exit_latency_diffclock_data_2;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_2 = l0_exit_latency_diffclock_2;
defparam arriav_hd_altpe2_hip_top_i.rx_ei_l0s_2 = rx_ei_l0s_2;
defparam arriav_hd_altpe2_hip_top_i.l2_async_logic_2 = l2_async_logic_2;
defparam arriav_hd_altpe2_hip_top_i.aspm_optionality_2 = aspm_optionality_2;
defparam arriav_hd_altpe2_hip_top_i.flr_capability_2 = flr_capability_2;
defparam arriav_hd_altpe2_hip_top_i.bar0_io_space_2 = bar0_io_space_2;
defparam arriav_hd_altpe2_hip_top_i.bar0_64bit_mem_space_2 = bar0_64bit_mem_space_2;
defparam arriav_hd_altpe2_hip_top_i.bar0_prefetchable_2 = bar0_prefetchable_2;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_data_2 = bar0_size_mask_data_2;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_2 = bar0_size_mask_2;
defparam arriav_hd_altpe2_hip_top_i.bar1_io_space_2 = bar1_io_space_2;
defparam arriav_hd_altpe2_hip_top_i.bar1_64bit_mem_space_2 = bar1_64bit_mem_space_2;
defparam arriav_hd_altpe2_hip_top_i.bar1_prefetchable_2 = bar1_prefetchable_2;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_data_2 = bar1_size_mask_data_2;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_2 = bar1_size_mask_2;
defparam arriav_hd_altpe2_hip_top_i.bar2_io_space_2 = bar2_io_space_2;
defparam arriav_hd_altpe2_hip_top_i.bar2_64bit_mem_space_2 = bar2_64bit_mem_space_2;
defparam arriav_hd_altpe2_hip_top_i.bar2_prefetchable_2 = bar2_prefetchable_2;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_data_2 = bar2_size_mask_data_2;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_2 = bar2_size_mask_2;
defparam arriav_hd_altpe2_hip_top_i.bar3_io_space_2 = bar3_io_space_2;
defparam arriav_hd_altpe2_hip_top_i.bar3_64bit_mem_space_2 = bar3_64bit_mem_space_2;
defparam arriav_hd_altpe2_hip_top_i.bar3_prefetchable_2 = bar3_prefetchable_2;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_data_2 = bar3_size_mask_data_2;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_2 = bar3_size_mask_2;
defparam arriav_hd_altpe2_hip_top_i.bar4_io_space_2 = bar4_io_space_2;
defparam arriav_hd_altpe2_hip_top_i.bar4_64bit_mem_space_2 = bar4_64bit_mem_space_2;
defparam arriav_hd_altpe2_hip_top_i.bar4_prefetchable_2 = bar4_prefetchable_2;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_data_2 = bar4_size_mask_data_2;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_2 = bar4_size_mask_2;
defparam arriav_hd_altpe2_hip_top_i.bar5_io_space_2 = bar5_io_space_2;
defparam arriav_hd_altpe2_hip_top_i.bar5_64bit_mem_space_2 = bar5_64bit_mem_space_2;
defparam arriav_hd_altpe2_hip_top_i.bar5_prefetchable_2 = bar5_prefetchable_2;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_data_2 = bar5_size_mask_data_2;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_2 = bar5_size_mask_2;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_data_2 = expansion_base_address_register_data_2;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_2 = expansion_base_address_register_2;
defparam arriav_hd_altpe2_hip_top_i.io_window_addr_width_2 = io_window_addr_width_2;
defparam arriav_hd_altpe2_hip_top_i.prefetchable_mem_window_addr_width_2 = prefetchable_mem_window_addr_width_2;
//Func 2 - Config Register Settings END -------------

//Func 3 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_i.vendor_id_data_3 = vendor_id_data_3;
defparam arriav_hd_altpe2_hip_top_i.vendor_id_3 = vendor_id_3;
defparam arriav_hd_altpe2_hip_top_i.device_id_data_3 = device_id_data_3;
defparam arriav_hd_altpe2_hip_top_i.device_id_3 = device_id_3;
defparam arriav_hd_altpe2_hip_top_i.revision_id_data_3 = revision_id_data_3;
defparam arriav_hd_altpe2_hip_top_i.revision_id_3 = revision_id_3;
defparam arriav_hd_altpe2_hip_top_i.class_code_data_3 = class_code_data_3;
defparam arriav_hd_altpe2_hip_top_i.class_code_3 = class_code_3;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_data_3 = subsystem_vendor_id_data_3;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_3 = subsystem_vendor_id_3;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_data_3 = subsystem_device_id_data_3;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_3 = subsystem_device_id_3;
defparam arriav_hd_altpe2_hip_top_i.no_soft_reset_3 = no_soft_reset_3;
defparam arriav_hd_altpe2_hip_top_i.intel_id_access_3 = intel_id_access_3;
defparam arriav_hd_altpe2_hip_top_i.device_specific_init_3 = device_specific_init_3;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_data_3 = maximum_current_data_3;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_3 = maximum_current_3;
defparam arriav_hd_altpe2_hip_top_i.d1_support_3 = d1_support_3;
defparam arriav_hd_altpe2_hip_top_i.d2_support_3 = d2_support_3;
defparam arriav_hd_altpe2_hip_top_i.d0_pme_3 = d0_pme_3;
defparam arriav_hd_altpe2_hip_top_i.d1_pme_3 = d1_pme_3;
defparam arriav_hd_altpe2_hip_top_i.d2_pme_3 = d2_pme_3;
defparam arriav_hd_altpe2_hip_top_i.d3_hot_pme_3 = d3_hot_pme_3;
defparam arriav_hd_altpe2_hip_top_i.d3_cold_pme_3 = d3_cold_pme_3;
defparam arriav_hd_altpe2_hip_top_i.use_aer_3 = use_aer_3;
defparam arriav_hd_altpe2_hip_top_i.low_priority_vc_3 = low_priority_vc_3;
defparam arriav_hd_altpe2_hip_top_i.vc_arbitration_3 = vc_arbitration_3;
defparam arriav_hd_altpe2_hip_top_i.disable_snoop_packet_3 = disable_snoop_packet_3;
defparam arriav_hd_altpe2_hip_top_i.max_payload_size_3 = max_payload_size_3;
defparam arriav_hd_altpe2_hip_top_i.surprise_down_error_support_3 = surprise_down_error_support_3;
defparam arriav_hd_altpe2_hip_top_i.dll_active_report_support_3 = dll_active_report_support_3;
defparam arriav_hd_altpe2_hip_top_i.extend_tag_field_3 = extend_tag_field_3;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_data_3 = endpoint_l0_latency_data_3;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_3 = endpoint_l0_latency_3;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_data_3 = endpoint_l1_latency_data_3;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_3 = endpoint_l1_latency_3;
defparam arriav_hd_altpe2_hip_top_i.indicator_data_3 = indicator_data_3;
defparam arriav_hd_altpe2_hip_top_i.indicator_3 = indicator_3;
defparam arriav_hd_altpe2_hip_top_i.role_based_error_reporting_3 = role_based_error_reporting_3;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_data_3 = slot_power_scale_data_3;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_3 = slot_power_scale_3;
defparam arriav_hd_altpe2_hip_top_i.max_link_width_3 = max_link_width_3;
defparam arriav_hd_altpe2_hip_top_i.enable_l1_aspm_3 = enable_l1_aspm_3;
defparam arriav_hd_altpe2_hip_top_i.enable_l0s_aspm_3 = enable_l0s_aspm_3;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_data_3 = l1_exit_latency_sameclock_data_3;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_3 = l1_exit_latency_sameclock_3;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_data_3 = l1_exit_latency_diffclock_data_3;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_3 = l1_exit_latency_diffclock_3;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_data_3 = hot_plug_support_data_3;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_3 = hot_plug_support_3;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_data_3 = slot_power_limit_data_3;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_3 = slot_power_limit_3;
defparam arriav_hd_altpe2_hip_top_i.slot_number_data_3 = slot_number_data_3;
defparam arriav_hd_altpe2_hip_top_i.slot_number_3 = slot_number_3;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_data_3 = diffclock_nfts_count_data_3;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_3 = diffclock_nfts_count_3;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_data_3 = sameclock_nfts_count_data_3;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_3 = sameclock_nfts_count_3;
defparam arriav_hd_altpe2_hip_top_i.completion_timeout_3 = completion_timeout_3;
defparam arriav_hd_altpe2_hip_top_i.enable_completion_timeout_disable_3 = enable_completion_timeout_disable_3;
defparam arriav_hd_altpe2_hip_top_i.extended_tag_reset_3 = extended_tag_reset_3;
defparam arriav_hd_altpe2_hip_top_i.ecrc_check_capable_3 = ecrc_check_capable_3;
defparam arriav_hd_altpe2_hip_top_i.ecrc_gen_capable_3 = ecrc_gen_capable_3;
defparam arriav_hd_altpe2_hip_top_i.no_command_completed_3 = no_command_completed_3;
defparam arriav_hd_altpe2_hip_top_i.msi_multi_message_capable_3 = msi_multi_message_capable_3;
defparam arriav_hd_altpe2_hip_top_i.msi_64bit_addressing_capable_3 = msi_64bit_addressing_capable_3;
defparam arriav_hd_altpe2_hip_top_i.msi_masking_capable_3 = msi_masking_capable_3;
defparam arriav_hd_altpe2_hip_top_i.msi_support_3 = msi_support_3;
defparam arriav_hd_altpe2_hip_top_i.interrupt_pin_3 = interrupt_pin_3;
defparam arriav_hd_altpe2_hip_top_i.enable_function_msix_support_3 = enable_function_msix_support_3;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_data_3 = msix_table_size_data_3;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_3 = msix_table_size_3;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_data_3 = msix_table_bir_data_3;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_3 = msix_table_bir_3;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_data_3 = msix_table_offset_data_3;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_3 = msix_table_offset_3;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_data_3 = msix_pba_bir_data_3;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_3 = msix_pba_bir_3;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_data_3 = msix_pba_offset_data_3;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_3 = msix_pba_offset_3;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_vga_enable_3 = bridge_port_vga_enable_3;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_ssid_support_3 = bridge_port_ssid_support_3;
defparam arriav_hd_altpe2_hip_top_i.ssvid_data_3 = ssvid_data_3;
defparam arriav_hd_altpe2_hip_top_i.ssvid_3 = ssvid_3;
defparam arriav_hd_altpe2_hip_top_i.ssid_data_3 = ssid_data_3;
defparam arriav_hd_altpe2_hip_top_i.ssid_3 = ssid_3;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_data_3 = eie_before_nfts_count_data_3;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_3 = eie_before_nfts_count_3;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_data_3 = gen2_diffclock_nfts_count_data_3;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_3 = gen2_diffclock_nfts_count_3;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_data_3 = gen2_sameclock_nfts_count_data_3;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_3 = gen2_sameclock_nfts_count_3;
defparam arriav_hd_altpe2_hip_top_i.deemphasis_enable_3 = deemphasis_enable_3;
defparam arriav_hd_altpe2_hip_top_i.pcie_spec_version_3 = pcie_spec_version_3;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_data_3 = l0_exit_latency_sameclock_data_3;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_3 = l0_exit_latency_sameclock_3;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_data_3 = l0_exit_latency_diffclock_data_3;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_3 = l0_exit_latency_diffclock_3;
defparam arriav_hd_altpe2_hip_top_i.rx_ei_l0s_3 = rx_ei_l0s_3;
defparam arriav_hd_altpe2_hip_top_i.l2_async_logic_3 = l2_async_logic_3;
defparam arriav_hd_altpe2_hip_top_i.aspm_optionality_3 = aspm_optionality_3;
defparam arriav_hd_altpe2_hip_top_i.flr_capability_3 = flr_capability_3;
defparam arriav_hd_altpe2_hip_top_i.bar0_io_space_3 = bar0_io_space_3;
defparam arriav_hd_altpe2_hip_top_i.bar0_64bit_mem_space_3 = bar0_64bit_mem_space_3;
defparam arriav_hd_altpe2_hip_top_i.bar0_prefetchable_3 = bar0_prefetchable_3;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_data_3 = bar0_size_mask_data_3;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_3 = bar0_size_mask_3;
defparam arriav_hd_altpe2_hip_top_i.bar1_io_space_3 = bar1_io_space_3;
defparam arriav_hd_altpe2_hip_top_i.bar1_64bit_mem_space_3 = bar1_64bit_mem_space_3;
defparam arriav_hd_altpe2_hip_top_i.bar1_prefetchable_3 = bar1_prefetchable_3;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_data_3 = bar1_size_mask_data_3;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_3 = bar1_size_mask_3;
defparam arriav_hd_altpe2_hip_top_i.bar2_io_space_3 = bar2_io_space_3;
defparam arriav_hd_altpe2_hip_top_i.bar2_64bit_mem_space_3 = bar2_64bit_mem_space_3;
defparam arriav_hd_altpe2_hip_top_i.bar2_prefetchable_3 = bar2_prefetchable_3;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_data_3 = bar2_size_mask_data_3;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_3 = bar2_size_mask_3;
defparam arriav_hd_altpe2_hip_top_i.bar3_io_space_3 = bar3_io_space_3;
defparam arriav_hd_altpe2_hip_top_i.bar3_64bit_mem_space_3 = bar3_64bit_mem_space_3;
defparam arriav_hd_altpe2_hip_top_i.bar3_prefetchable_3 = bar3_prefetchable_3;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_data_3 = bar3_size_mask_data_3;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_3 = bar3_size_mask_3;
defparam arriav_hd_altpe2_hip_top_i.bar4_io_space_3 = bar4_io_space_3;
defparam arriav_hd_altpe2_hip_top_i.bar4_64bit_mem_space_3 = bar4_64bit_mem_space_3;
defparam arriav_hd_altpe2_hip_top_i.bar4_prefetchable_3 = bar4_prefetchable_3;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_data_3 = bar4_size_mask_data_3;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_3 = bar4_size_mask_3;
defparam arriav_hd_altpe2_hip_top_i.bar5_io_space_3 = bar5_io_space_3;
defparam arriav_hd_altpe2_hip_top_i.bar5_64bit_mem_space_3 = bar5_64bit_mem_space_3;
defparam arriav_hd_altpe2_hip_top_i.bar5_prefetchable_3 = bar5_prefetchable_3;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_data_3 = bar5_size_mask_data_3;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_3 = bar5_size_mask_3;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_data_3 = expansion_base_address_register_data_3;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_3 = expansion_base_address_register_3;
defparam arriav_hd_altpe2_hip_top_i.io_window_addr_width_3 = io_window_addr_width_3;
defparam arriav_hd_altpe2_hip_top_i.prefetchable_mem_window_addr_width_3 = prefetchable_mem_window_addr_width_3;
//Func 3 - Config Register Settings END -------------

//Func 4 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_i.vendor_id_data_4 = vendor_id_data_4;
defparam arriav_hd_altpe2_hip_top_i.vendor_id_4 = vendor_id_4;
defparam arriav_hd_altpe2_hip_top_i.device_id_data_4 = device_id_data_4;
defparam arriav_hd_altpe2_hip_top_i.device_id_4 = device_id_4;
defparam arriav_hd_altpe2_hip_top_i.revision_id_data_4 = revision_id_data_4;
defparam arriav_hd_altpe2_hip_top_i.revision_id_4 = revision_id_4;
defparam arriav_hd_altpe2_hip_top_i.class_code_data_4 = class_code_data_4;
defparam arriav_hd_altpe2_hip_top_i.class_code_4 = class_code_4;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_data_4 = subsystem_vendor_id_data_4;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_4 = subsystem_vendor_id_4;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_data_4 = subsystem_device_id_data_4;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_4 = subsystem_device_id_4;
defparam arriav_hd_altpe2_hip_top_i.no_soft_reset_4 = no_soft_reset_4;
defparam arriav_hd_altpe2_hip_top_i.intel_id_access_4 = intel_id_access_4;
defparam arriav_hd_altpe2_hip_top_i.device_specific_init_4 = device_specific_init_4;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_data_4 = maximum_current_data_4;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_4 = maximum_current_4;
defparam arriav_hd_altpe2_hip_top_i.d1_support_4 = d1_support_4;
defparam arriav_hd_altpe2_hip_top_i.d2_support_4 = d2_support_4;
defparam arriav_hd_altpe2_hip_top_i.d0_pme_4 = d0_pme_4;
defparam arriav_hd_altpe2_hip_top_i.d1_pme_4 = d1_pme_4;
defparam arriav_hd_altpe2_hip_top_i.d2_pme_4 = d2_pme_4;
defparam arriav_hd_altpe2_hip_top_i.d3_hot_pme_4 = d3_hot_pme_4;
defparam arriav_hd_altpe2_hip_top_i.d3_cold_pme_4 = d3_cold_pme_4;
defparam arriav_hd_altpe2_hip_top_i.use_aer_4 = use_aer_4;
defparam arriav_hd_altpe2_hip_top_i.low_priority_vc_4 = low_priority_vc_4;
defparam arriav_hd_altpe2_hip_top_i.vc_arbitration_4 = vc_arbitration_4;
defparam arriav_hd_altpe2_hip_top_i.disable_snoop_packet_4 = disable_snoop_packet_4;
defparam arriav_hd_altpe2_hip_top_i.max_payload_size_4 = max_payload_size_4;
defparam arriav_hd_altpe2_hip_top_i.surprise_down_error_support_4 = surprise_down_error_support_4;
defparam arriav_hd_altpe2_hip_top_i.dll_active_report_support_4 = dll_active_report_support_4;
defparam arriav_hd_altpe2_hip_top_i.extend_tag_field_4 = extend_tag_field_4;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_data_4 = endpoint_l0_latency_data_4;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_4 = endpoint_l0_latency_4;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_data_4 = endpoint_l1_latency_data_4;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_4 = endpoint_l1_latency_4;
defparam arriav_hd_altpe2_hip_top_i.indicator_data_4 = indicator_data_4;
defparam arriav_hd_altpe2_hip_top_i.indicator_4 = indicator_4;
defparam arriav_hd_altpe2_hip_top_i.role_based_error_reporting_4 = role_based_error_reporting_4;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_data_4 = slot_power_scale_data_4;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_4 = slot_power_scale_4;
defparam arriav_hd_altpe2_hip_top_i.max_link_width_4 = max_link_width_4;
defparam arriav_hd_altpe2_hip_top_i.enable_l1_aspm_4 = enable_l1_aspm_4;
defparam arriav_hd_altpe2_hip_top_i.enable_l0s_aspm_4 = enable_l0s_aspm_4;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_data_4 = l1_exit_latency_sameclock_data_4;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_4 = l1_exit_latency_sameclock_4;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_data_4 = l1_exit_latency_diffclock_data_4;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_4 = l1_exit_latency_diffclock_4;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_data_4 = hot_plug_support_data_4;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_4 = hot_plug_support_4;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_data_4 = slot_power_limit_data_4;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_4 = slot_power_limit_4;
defparam arriav_hd_altpe2_hip_top_i.slot_number_data_4 = slot_number_data_4;
defparam arriav_hd_altpe2_hip_top_i.slot_number_4 = slot_number_4;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_data_4 = diffclock_nfts_count_data_4;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_4 = diffclock_nfts_count_4;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_data_4 = sameclock_nfts_count_data_4;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_4 = sameclock_nfts_count_4;
defparam arriav_hd_altpe2_hip_top_i.completion_timeout_4 = completion_timeout_4;
defparam arriav_hd_altpe2_hip_top_i.enable_completion_timeout_disable_4 = enable_completion_timeout_disable_4;
defparam arriav_hd_altpe2_hip_top_i.extended_tag_reset_4 = extended_tag_reset_4;
defparam arriav_hd_altpe2_hip_top_i.ecrc_check_capable_4 = ecrc_check_capable_4;
defparam arriav_hd_altpe2_hip_top_i.ecrc_gen_capable_4 = ecrc_gen_capable_4;
defparam arriav_hd_altpe2_hip_top_i.no_command_completed_4 = no_command_completed_4;
defparam arriav_hd_altpe2_hip_top_i.msi_multi_message_capable_4 = msi_multi_message_capable_4;
defparam arriav_hd_altpe2_hip_top_i.msi_64bit_addressing_capable_4 = msi_64bit_addressing_capable_4;
defparam arriav_hd_altpe2_hip_top_i.msi_masking_capable_4 = msi_masking_capable_4;
defparam arriav_hd_altpe2_hip_top_i.msi_support_4 = msi_support_4;
defparam arriav_hd_altpe2_hip_top_i.interrupt_pin_4 = interrupt_pin_4;
defparam arriav_hd_altpe2_hip_top_i.enable_function_msix_support_4 = enable_function_msix_support_4;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_data_4 = msix_table_size_data_4;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_4 = msix_table_size_4;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_data_4 = msix_table_bir_data_4;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_4 = msix_table_bir_4;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_data_4 = msix_table_offset_data_4;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_4 = msix_table_offset_4;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_data_4 = msix_pba_bir_data_4;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_4 = msix_pba_bir_4;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_data_4 = msix_pba_offset_data_4;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_4 = msix_pba_offset_4;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_vga_enable_4 = bridge_port_vga_enable_4;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_ssid_support_4 = bridge_port_ssid_support_4;
defparam arriav_hd_altpe2_hip_top_i.ssvid_data_4 = ssvid_data_4;
defparam arriav_hd_altpe2_hip_top_i.ssvid_4 = ssvid_4;
defparam arriav_hd_altpe2_hip_top_i.ssid_data_4 = ssid_data_4;
defparam arriav_hd_altpe2_hip_top_i.ssid_4 = ssid_4;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_data_4 = eie_before_nfts_count_data_4;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_4 = eie_before_nfts_count_4;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_data_4 = gen2_diffclock_nfts_count_data_4;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_4 = gen2_diffclock_nfts_count_4;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_data_4 = gen2_sameclock_nfts_count_data_4;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_4 = gen2_sameclock_nfts_count_4;
defparam arriav_hd_altpe2_hip_top_i.deemphasis_enable_4 = deemphasis_enable_4;
defparam arriav_hd_altpe2_hip_top_i.pcie_spec_version_4 = pcie_spec_version_4;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_data_4 = l0_exit_latency_sameclock_data_4;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_4 = l0_exit_latency_sameclock_4;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_data_4 = l0_exit_latency_diffclock_data_4;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_4 = l0_exit_latency_diffclock_4;
defparam arriav_hd_altpe2_hip_top_i.rx_ei_l0s_4 = rx_ei_l0s_4;
defparam arriav_hd_altpe2_hip_top_i.l2_async_logic_4 = l2_async_logic_4;
defparam arriav_hd_altpe2_hip_top_i.aspm_optionality_4 = aspm_optionality_4;
defparam arriav_hd_altpe2_hip_top_i.flr_capability_4 = flr_capability_4;
defparam arriav_hd_altpe2_hip_top_i.bar0_io_space_4 = bar0_io_space_4;
defparam arriav_hd_altpe2_hip_top_i.bar0_64bit_mem_space_4 = bar0_64bit_mem_space_4;
defparam arriav_hd_altpe2_hip_top_i.bar0_prefetchable_4 = bar0_prefetchable_4;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_data_4 = bar0_size_mask_data_4;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_4 = bar0_size_mask_4;
defparam arriav_hd_altpe2_hip_top_i.bar1_io_space_4 = bar1_io_space_4;
defparam arriav_hd_altpe2_hip_top_i.bar1_64bit_mem_space_4 = bar1_64bit_mem_space_4;
defparam arriav_hd_altpe2_hip_top_i.bar1_prefetchable_4 = bar1_prefetchable_4;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_data_4 = bar1_size_mask_data_4;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_4 = bar1_size_mask_4;
defparam arriav_hd_altpe2_hip_top_i.bar2_io_space_4 = bar2_io_space_4;
defparam arriav_hd_altpe2_hip_top_i.bar2_64bit_mem_space_4 = bar2_64bit_mem_space_4;
defparam arriav_hd_altpe2_hip_top_i.bar2_prefetchable_4 = bar2_prefetchable_4;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_data_4 = bar2_size_mask_data_4;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_4 = bar2_size_mask_4;
defparam arriav_hd_altpe2_hip_top_i.bar3_io_space_4 = bar3_io_space_4;
defparam arriav_hd_altpe2_hip_top_i.bar3_64bit_mem_space_4 = bar3_64bit_mem_space_4;
defparam arriav_hd_altpe2_hip_top_i.bar3_prefetchable_4 = bar3_prefetchable_4;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_data_4 = bar3_size_mask_data_4;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_4 = bar3_size_mask_4;
defparam arriav_hd_altpe2_hip_top_i.bar4_io_space_4 = bar4_io_space_4;
defparam arriav_hd_altpe2_hip_top_i.bar4_64bit_mem_space_4 = bar4_64bit_mem_space_4;
defparam arriav_hd_altpe2_hip_top_i.bar4_prefetchable_4 = bar4_prefetchable_4;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_data_4 = bar4_size_mask_data_4;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_4 = bar4_size_mask_4;
defparam arriav_hd_altpe2_hip_top_i.bar5_io_space_4 = bar5_io_space_4;
defparam arriav_hd_altpe2_hip_top_i.bar5_64bit_mem_space_4 = bar5_64bit_mem_space_4;
defparam arriav_hd_altpe2_hip_top_i.bar5_prefetchable_4 = bar5_prefetchable_4;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_data_4 = bar5_size_mask_data_4;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_4 = bar5_size_mask_4;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_data_4 = expansion_base_address_register_data_4;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_4 = expansion_base_address_register_4;
defparam arriav_hd_altpe2_hip_top_i.io_window_addr_width_4 = io_window_addr_width_4;
defparam arriav_hd_altpe2_hip_top_i.prefetchable_mem_window_addr_width_4 = prefetchable_mem_window_addr_width_4;
//Func 4 - Config Register Settings END -------------

//Func 5 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_i.vendor_id_data_5 = vendor_id_data_5;
defparam arriav_hd_altpe2_hip_top_i.vendor_id_5 = vendor_id_5;
defparam arriav_hd_altpe2_hip_top_i.device_id_data_5 = device_id_data_5;
defparam arriav_hd_altpe2_hip_top_i.device_id_5 = device_id_5;
defparam arriav_hd_altpe2_hip_top_i.revision_id_data_5 = revision_id_data_5;
defparam arriav_hd_altpe2_hip_top_i.revision_id_5 = revision_id_5;
defparam arriav_hd_altpe2_hip_top_i.class_code_data_5 = class_code_data_5;
defparam arriav_hd_altpe2_hip_top_i.class_code_5 = class_code_5;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_data_5 = subsystem_vendor_id_data_5;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_5 = subsystem_vendor_id_5;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_data_5 = subsystem_device_id_data_5;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_5 = subsystem_device_id_5;
defparam arriav_hd_altpe2_hip_top_i.no_soft_reset_5 = no_soft_reset_5;
defparam arriav_hd_altpe2_hip_top_i.intel_id_access_5 = intel_id_access_5;
defparam arriav_hd_altpe2_hip_top_i.device_specific_init_5 = device_specific_init_5;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_data_5 = maximum_current_data_5;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_5 = maximum_current_5;
defparam arriav_hd_altpe2_hip_top_i.d1_support_5 = d1_support_5;
defparam arriav_hd_altpe2_hip_top_i.d2_support_5 = d2_support_5;
defparam arriav_hd_altpe2_hip_top_i.d0_pme_5 = d0_pme_5;
defparam arriav_hd_altpe2_hip_top_i.d1_pme_5 = d1_pme_5;
defparam arriav_hd_altpe2_hip_top_i.d2_pme_5 = d2_pme_5;
defparam arriav_hd_altpe2_hip_top_i.d3_hot_pme_5 = d3_hot_pme_5;
defparam arriav_hd_altpe2_hip_top_i.d3_cold_pme_5 = d3_cold_pme_5;
defparam arriav_hd_altpe2_hip_top_i.use_aer_5 = use_aer_5;
defparam arriav_hd_altpe2_hip_top_i.low_priority_vc_5 = low_priority_vc_5;
defparam arriav_hd_altpe2_hip_top_i.vc_arbitration_5 = vc_arbitration_5;
defparam arriav_hd_altpe2_hip_top_i.disable_snoop_packet_5 = disable_snoop_packet_5;
defparam arriav_hd_altpe2_hip_top_i.max_payload_size_5 = max_payload_size_5;
defparam arriav_hd_altpe2_hip_top_i.surprise_down_error_support_5 = surprise_down_error_support_5;
defparam arriav_hd_altpe2_hip_top_i.dll_active_report_support_5 = dll_active_report_support_5;
defparam arriav_hd_altpe2_hip_top_i.extend_tag_field_5 = extend_tag_field_5;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_data_5 = endpoint_l0_latency_data_5;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_5 = endpoint_l0_latency_5;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_data_5 = endpoint_l1_latency_data_5;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_5 = endpoint_l1_latency_5;
defparam arriav_hd_altpe2_hip_top_i.indicator_data_5 = indicator_data_5;
defparam arriav_hd_altpe2_hip_top_i.indicator_5 = indicator_5;
defparam arriav_hd_altpe2_hip_top_i.role_based_error_reporting_5 = role_based_error_reporting_5;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_data_5 = slot_power_scale_data_5;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_5 = slot_power_scale_5;
defparam arriav_hd_altpe2_hip_top_i.max_link_width_5 = max_link_width_5;
defparam arriav_hd_altpe2_hip_top_i.enable_l1_aspm_5 = enable_l1_aspm_5;
defparam arriav_hd_altpe2_hip_top_i.enable_l0s_aspm_5 = enable_l0s_aspm_5;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_data_5 = l1_exit_latency_sameclock_data_5;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_5 = l1_exit_latency_sameclock_5;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_data_5 = l1_exit_latency_diffclock_data_5;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_5 = l1_exit_latency_diffclock_5;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_data_5 = hot_plug_support_data_5;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_5 = hot_plug_support_5;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_data_5 = slot_power_limit_data_5;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_5 = slot_power_limit_5;
defparam arriav_hd_altpe2_hip_top_i.slot_number_data_5 = slot_number_data_5;
defparam arriav_hd_altpe2_hip_top_i.slot_number_5 = slot_number_5;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_data_5 = diffclock_nfts_count_data_5;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_5 = diffclock_nfts_count_5;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_data_5 = sameclock_nfts_count_data_5;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_5 = sameclock_nfts_count_5;
defparam arriav_hd_altpe2_hip_top_i.completion_timeout_5 = completion_timeout_5;
defparam arriav_hd_altpe2_hip_top_i.enable_completion_timeout_disable_5 = enable_completion_timeout_disable_5;
defparam arriav_hd_altpe2_hip_top_i.extended_tag_reset_5 = extended_tag_reset_5;
defparam arriav_hd_altpe2_hip_top_i.ecrc_check_capable_5 = ecrc_check_capable_5;
defparam arriav_hd_altpe2_hip_top_i.ecrc_gen_capable_5 = ecrc_gen_capable_5;
defparam arriav_hd_altpe2_hip_top_i.no_command_completed_5 = no_command_completed_5;
defparam arriav_hd_altpe2_hip_top_i.msi_multi_message_capable_5 = msi_multi_message_capable_5;
defparam arriav_hd_altpe2_hip_top_i.msi_64bit_addressing_capable_5 = msi_64bit_addressing_capable_5;
defparam arriav_hd_altpe2_hip_top_i.msi_masking_capable_5 = msi_masking_capable_5;
defparam arriav_hd_altpe2_hip_top_i.msi_support_5 = msi_support_5;
defparam arriav_hd_altpe2_hip_top_i.interrupt_pin_5 = interrupt_pin_5;
defparam arriav_hd_altpe2_hip_top_i.enable_function_msix_support_5 = enable_function_msix_support_5;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_data_5 = msix_table_size_data_5;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_5 = msix_table_size_5;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_data_5 = msix_table_bir_data_5;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_5 = msix_table_bir_5;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_data_5 = msix_table_offset_data_5;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_5 = msix_table_offset_5;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_data_5 = msix_pba_bir_data_5;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_5 = msix_pba_bir_5;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_data_5 = msix_pba_offset_data_5;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_5 = msix_pba_offset_5;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_vga_enable_5 = bridge_port_vga_enable_5;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_ssid_support_5 = bridge_port_ssid_support_5;
defparam arriav_hd_altpe2_hip_top_i.ssvid_data_5 = ssvid_data_5;
defparam arriav_hd_altpe2_hip_top_i.ssvid_5 = ssvid_5;
defparam arriav_hd_altpe2_hip_top_i.ssid_data_5 = ssid_data_5;
defparam arriav_hd_altpe2_hip_top_i.ssid_5 = ssid_5;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_data_5 = eie_before_nfts_count_data_5;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_5 = eie_before_nfts_count_5;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_data_5 = gen2_diffclock_nfts_count_data_5;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_5 = gen2_diffclock_nfts_count_5;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_data_5 = gen2_sameclock_nfts_count_data_5;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_5 = gen2_sameclock_nfts_count_5;
defparam arriav_hd_altpe2_hip_top_i.deemphasis_enable_5 = deemphasis_enable_5;
defparam arriav_hd_altpe2_hip_top_i.pcie_spec_version_5 = pcie_spec_version_5;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_data_5 = l0_exit_latency_sameclock_data_5;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_5 = l0_exit_latency_sameclock_5;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_data_5 = l0_exit_latency_diffclock_data_5;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_5 = l0_exit_latency_diffclock_5;
defparam arriav_hd_altpe2_hip_top_i.rx_ei_l0s_5 = rx_ei_l0s_5;
defparam arriav_hd_altpe2_hip_top_i.l2_async_logic_5 = l2_async_logic_5;
defparam arriav_hd_altpe2_hip_top_i.aspm_optionality_5 = aspm_optionality_5;
defparam arriav_hd_altpe2_hip_top_i.flr_capability_5 = flr_capability_5;
defparam arriav_hd_altpe2_hip_top_i.bar0_io_space_5 = bar0_io_space_5;
defparam arriav_hd_altpe2_hip_top_i.bar0_64bit_mem_space_5 = bar0_64bit_mem_space_5;
defparam arriav_hd_altpe2_hip_top_i.bar0_prefetchable_5 = bar0_prefetchable_5;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_data_5 = bar0_size_mask_data_5;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_5 = bar0_size_mask_5;
defparam arriav_hd_altpe2_hip_top_i.bar1_io_space_5 = bar1_io_space_5;
defparam arriav_hd_altpe2_hip_top_i.bar1_64bit_mem_space_5 = bar1_64bit_mem_space_5;
defparam arriav_hd_altpe2_hip_top_i.bar1_prefetchable_5 = bar1_prefetchable_5;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_data_5 = bar1_size_mask_data_5;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_5 = bar1_size_mask_5;
defparam arriav_hd_altpe2_hip_top_i.bar2_io_space_5 = bar2_io_space_5;
defparam arriav_hd_altpe2_hip_top_i.bar2_64bit_mem_space_5 = bar2_64bit_mem_space_5;
defparam arriav_hd_altpe2_hip_top_i.bar2_prefetchable_5 = bar2_prefetchable_5;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_data_5 = bar2_size_mask_data_5;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_5 = bar2_size_mask_5;
defparam arriav_hd_altpe2_hip_top_i.bar3_io_space_5 = bar3_io_space_5;
defparam arriav_hd_altpe2_hip_top_i.bar3_64bit_mem_space_5 = bar3_64bit_mem_space_5;
defparam arriav_hd_altpe2_hip_top_i.bar3_prefetchable_5 = bar3_prefetchable_5;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_data_5 = bar3_size_mask_data_5;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_5 = bar3_size_mask_5;
defparam arriav_hd_altpe2_hip_top_i.bar4_io_space_5 = bar4_io_space_5;
defparam arriav_hd_altpe2_hip_top_i.bar4_64bit_mem_space_5 = bar4_64bit_mem_space_5;
defparam arriav_hd_altpe2_hip_top_i.bar4_prefetchable_5 = bar4_prefetchable_5;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_data_5 = bar4_size_mask_data_5;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_5 = bar4_size_mask_5;
defparam arriav_hd_altpe2_hip_top_i.bar5_io_space_5 = bar5_io_space_5;
defparam arriav_hd_altpe2_hip_top_i.bar5_64bit_mem_space_5 = bar5_64bit_mem_space_5;
defparam arriav_hd_altpe2_hip_top_i.bar5_prefetchable_5 = bar5_prefetchable_5;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_data_5 = bar5_size_mask_data_5;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_5 = bar5_size_mask_5;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_data_5 = expansion_base_address_register_data_5;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_5 = expansion_base_address_register_5;
defparam arriav_hd_altpe2_hip_top_i.io_window_addr_width_5 = io_window_addr_width_5;
defparam arriav_hd_altpe2_hip_top_i.prefetchable_mem_window_addr_width_5 = prefetchable_mem_window_addr_width_5;
//Func 5 - Config Register Settings END -------------

//Func 6 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_i.vendor_id_data_6 = vendor_id_data_6;
defparam arriav_hd_altpe2_hip_top_i.vendor_id_6 = vendor_id_6;
defparam arriav_hd_altpe2_hip_top_i.device_id_data_6 = device_id_data_6;
defparam arriav_hd_altpe2_hip_top_i.device_id_6 = device_id_6;
defparam arriav_hd_altpe2_hip_top_i.revision_id_data_6 = revision_id_data_6;
defparam arriav_hd_altpe2_hip_top_i.revision_id_6 = revision_id_6;
defparam arriav_hd_altpe2_hip_top_i.class_code_data_6 = class_code_data_6;
defparam arriav_hd_altpe2_hip_top_i.class_code_6 = class_code_6;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_data_6 = subsystem_vendor_id_data_6;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_6 = subsystem_vendor_id_6;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_data_6 = subsystem_device_id_data_6;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_6 = subsystem_device_id_6;
defparam arriav_hd_altpe2_hip_top_i.no_soft_reset_6 = no_soft_reset_6;
defparam arriav_hd_altpe2_hip_top_i.intel_id_access_6 = intel_id_access_6;
defparam arriav_hd_altpe2_hip_top_i.device_specific_init_6 = device_specific_init_6;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_data_6 = maximum_current_data_6;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_6 = maximum_current_6;
defparam arriav_hd_altpe2_hip_top_i.d1_support_6 = d1_support_6;
defparam arriav_hd_altpe2_hip_top_i.d2_support_6 = d2_support_6;
defparam arriav_hd_altpe2_hip_top_i.d0_pme_6 = d0_pme_6;
defparam arriav_hd_altpe2_hip_top_i.d1_pme_6 = d1_pme_6;
defparam arriav_hd_altpe2_hip_top_i.d2_pme_6 = d2_pme_6;
defparam arriav_hd_altpe2_hip_top_i.d3_hot_pme_6 = d3_hot_pme_6;
defparam arriav_hd_altpe2_hip_top_i.d3_cold_pme_6 = d3_cold_pme_6;
defparam arriav_hd_altpe2_hip_top_i.use_aer_6 = use_aer_6;
defparam arriav_hd_altpe2_hip_top_i.low_priority_vc_6 = low_priority_vc_6;
defparam arriav_hd_altpe2_hip_top_i.vc_arbitration_6 = vc_arbitration_6;
defparam arriav_hd_altpe2_hip_top_i.disable_snoop_packet_6 = disable_snoop_packet_6;
defparam arriav_hd_altpe2_hip_top_i.max_payload_size_6 = max_payload_size_6;
defparam arriav_hd_altpe2_hip_top_i.surprise_down_error_support_6 = surprise_down_error_support_6;
defparam arriav_hd_altpe2_hip_top_i.dll_active_report_support_6 = dll_active_report_support_6;
defparam arriav_hd_altpe2_hip_top_i.extend_tag_field_6 = extend_tag_field_6;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_data_6 = endpoint_l0_latency_data_6;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_6 = endpoint_l0_latency_6;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_data_6 = endpoint_l1_latency_data_6;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_6 = endpoint_l1_latency_6;
defparam arriav_hd_altpe2_hip_top_i.indicator_data_6 = indicator_data_6;
defparam arriav_hd_altpe2_hip_top_i.indicator_6 = indicator_6;
defparam arriav_hd_altpe2_hip_top_i.role_based_error_reporting_6 = role_based_error_reporting_6;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_data_6 = slot_power_scale_data_6;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_6 = slot_power_scale_6;
defparam arriav_hd_altpe2_hip_top_i.max_link_width_6 = max_link_width_6;
defparam arriav_hd_altpe2_hip_top_i.enable_l1_aspm_6 = enable_l1_aspm_6;
defparam arriav_hd_altpe2_hip_top_i.enable_l0s_aspm_6 = enable_l0s_aspm_6;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_data_6 = l1_exit_latency_sameclock_data_6;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_6 = l1_exit_latency_sameclock_6;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_data_6 = l1_exit_latency_diffclock_data_6;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_6 = l1_exit_latency_diffclock_6;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_data_6 = hot_plug_support_data_6;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_6 = hot_plug_support_6;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_data_6 = slot_power_limit_data_6;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_6 = slot_power_limit_6;
defparam arriav_hd_altpe2_hip_top_i.slot_number_data_6 = slot_number_data_6;
defparam arriav_hd_altpe2_hip_top_i.slot_number_6 = slot_number_6;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_data_6 = diffclock_nfts_count_data_6;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_6 = diffclock_nfts_count_6;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_data_6 = sameclock_nfts_count_data_6;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_6 = sameclock_nfts_count_6;
defparam arriav_hd_altpe2_hip_top_i.completion_timeout_6 = completion_timeout_6;
defparam arriav_hd_altpe2_hip_top_i.enable_completion_timeout_disable_6 = enable_completion_timeout_disable_6;
defparam arriav_hd_altpe2_hip_top_i.extended_tag_reset_6 = extended_tag_reset_6;
defparam arriav_hd_altpe2_hip_top_i.ecrc_check_capable_6 = ecrc_check_capable_6;
defparam arriav_hd_altpe2_hip_top_i.ecrc_gen_capable_6 = ecrc_gen_capable_6;
defparam arriav_hd_altpe2_hip_top_i.no_command_completed_6 = no_command_completed_6;
defparam arriav_hd_altpe2_hip_top_i.msi_multi_message_capable_6 = msi_multi_message_capable_6;
defparam arriav_hd_altpe2_hip_top_i.msi_64bit_addressing_capable_6 = msi_64bit_addressing_capable_6;
defparam arriav_hd_altpe2_hip_top_i.msi_masking_capable_6 = msi_masking_capable_6;
defparam arriav_hd_altpe2_hip_top_i.msi_support_6 = msi_support_6;
defparam arriav_hd_altpe2_hip_top_i.interrupt_pin_6 = interrupt_pin_6;
defparam arriav_hd_altpe2_hip_top_i.enable_function_msix_support_6 = enable_function_msix_support_6;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_data_6 = msix_table_size_data_6;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_6 = msix_table_size_6;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_data_6 = msix_table_bir_data_6;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_6 = msix_table_bir_6;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_data_6 = msix_table_offset_data_6;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_6 = msix_table_offset_6;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_data_6 = msix_pba_bir_data_6;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_6 = msix_pba_bir_6;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_data_6 = msix_pba_offset_data_6;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_6 = msix_pba_offset_6;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_vga_enable_6 = bridge_port_vga_enable_6;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_ssid_support_6 = bridge_port_ssid_support_6;
defparam arriav_hd_altpe2_hip_top_i.ssvid_data_6 = ssvid_data_6;
defparam arriav_hd_altpe2_hip_top_i.ssvid_6 = ssvid_6;
defparam arriav_hd_altpe2_hip_top_i.ssid_data_6 = ssid_data_6;
defparam arriav_hd_altpe2_hip_top_i.ssid_6 = ssid_6;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_data_6 = eie_before_nfts_count_data_6;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_6 = eie_before_nfts_count_6;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_data_6 = gen2_diffclock_nfts_count_data_6;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_6 = gen2_diffclock_nfts_count_6;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_data_6 = gen2_sameclock_nfts_count_data_6;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_6 = gen2_sameclock_nfts_count_6;
defparam arriav_hd_altpe2_hip_top_i.deemphasis_enable_6 = deemphasis_enable_6;
defparam arriav_hd_altpe2_hip_top_i.pcie_spec_version_6 = pcie_spec_version_6;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_data_6 = l0_exit_latency_sameclock_data_6;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_6 = l0_exit_latency_sameclock_6;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_data_6 = l0_exit_latency_diffclock_data_6;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_6 = l0_exit_latency_diffclock_6;
defparam arriav_hd_altpe2_hip_top_i.rx_ei_l0s_6 = rx_ei_l0s_6;
defparam arriav_hd_altpe2_hip_top_i.l2_async_logic_6 = l2_async_logic_6;
defparam arriav_hd_altpe2_hip_top_i.aspm_optionality_6 = aspm_optionality_6;
defparam arriav_hd_altpe2_hip_top_i.flr_capability_6 = flr_capability_6;
defparam arriav_hd_altpe2_hip_top_i.bar0_io_space_6 = bar0_io_space_6;
defparam arriav_hd_altpe2_hip_top_i.bar0_64bit_mem_space_6 = bar0_64bit_mem_space_6;
defparam arriav_hd_altpe2_hip_top_i.bar0_prefetchable_6 = bar0_prefetchable_6;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_data_6 = bar0_size_mask_data_6;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_6 = bar0_size_mask_6;
defparam arriav_hd_altpe2_hip_top_i.bar1_io_space_6 = bar1_io_space_6;
defparam arriav_hd_altpe2_hip_top_i.bar1_64bit_mem_space_6 = bar1_64bit_mem_space_6;
defparam arriav_hd_altpe2_hip_top_i.bar1_prefetchable_6 = bar1_prefetchable_6;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_data_6 = bar1_size_mask_data_6;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_6 = bar1_size_mask_6;
defparam arriav_hd_altpe2_hip_top_i.bar2_io_space_6 = bar2_io_space_6;
defparam arriav_hd_altpe2_hip_top_i.bar2_64bit_mem_space_6 = bar2_64bit_mem_space_6;
defparam arriav_hd_altpe2_hip_top_i.bar2_prefetchable_6 = bar2_prefetchable_6;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_data_6 = bar2_size_mask_data_6;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_6 = bar2_size_mask_6;
defparam arriav_hd_altpe2_hip_top_i.bar3_io_space_6 = bar3_io_space_6;
defparam arriav_hd_altpe2_hip_top_i.bar3_64bit_mem_space_6 = bar3_64bit_mem_space_6;
defparam arriav_hd_altpe2_hip_top_i.bar3_prefetchable_6 = bar3_prefetchable_6;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_data_6 = bar3_size_mask_data_6;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_6 = bar3_size_mask_6;
defparam arriav_hd_altpe2_hip_top_i.bar4_io_space_6 = bar4_io_space_6;
defparam arriav_hd_altpe2_hip_top_i.bar4_64bit_mem_space_6 = bar4_64bit_mem_space_6;
defparam arriav_hd_altpe2_hip_top_i.bar4_prefetchable_6 = bar4_prefetchable_6;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_data_6 = bar4_size_mask_data_6;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_6 = bar4_size_mask_6;
defparam arriav_hd_altpe2_hip_top_i.bar5_io_space_6 = bar5_io_space_6;
defparam arriav_hd_altpe2_hip_top_i.bar5_64bit_mem_space_6 = bar5_64bit_mem_space_6;
defparam arriav_hd_altpe2_hip_top_i.bar5_prefetchable_6 = bar5_prefetchable_6;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_data_6 = bar5_size_mask_data_6;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_6 = bar5_size_mask_6;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_data_6 = expansion_base_address_register_data_6;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_6 = expansion_base_address_register_6;
defparam arriav_hd_altpe2_hip_top_i.io_window_addr_width_6 = io_window_addr_width_6;
defparam arriav_hd_altpe2_hip_top_i.prefetchable_mem_window_addr_width_6 = prefetchable_mem_window_addr_width_6;
//Func 6 - Config Register Settings END -------------

//Func 7 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_i.vendor_id_data_7 = vendor_id_data_7;
defparam arriav_hd_altpe2_hip_top_i.vendor_id_7 = vendor_id_7;
defparam arriav_hd_altpe2_hip_top_i.device_id_data_7 = device_id_data_7;
defparam arriav_hd_altpe2_hip_top_i.device_id_7 = device_id_7;
defparam arriav_hd_altpe2_hip_top_i.revision_id_data_7 = revision_id_data_7;
defparam arriav_hd_altpe2_hip_top_i.revision_id_7 = revision_id_7;
defparam arriav_hd_altpe2_hip_top_i.class_code_data_7 = class_code_data_7;
defparam arriav_hd_altpe2_hip_top_i.class_code_7 = class_code_7;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_data_7 = subsystem_vendor_id_data_7;
defparam arriav_hd_altpe2_hip_top_i.subsystem_vendor_id_7 = subsystem_vendor_id_7;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_data_7 = subsystem_device_id_data_7;
defparam arriav_hd_altpe2_hip_top_i.subsystem_device_id_7 = subsystem_device_id_7;
defparam arriav_hd_altpe2_hip_top_i.no_soft_reset_7 = no_soft_reset_7;
defparam arriav_hd_altpe2_hip_top_i.intel_id_access_7 = intel_id_access_7;
defparam arriav_hd_altpe2_hip_top_i.device_specific_init_7 = device_specific_init_7;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_data_7 = maximum_current_data_7;
defparam arriav_hd_altpe2_hip_top_i.maximum_current_7 = maximum_current_7;
defparam arriav_hd_altpe2_hip_top_i.d1_support_7 = d1_support_7;
defparam arriav_hd_altpe2_hip_top_i.d2_support_7 = d2_support_7;
defparam arriav_hd_altpe2_hip_top_i.d0_pme_7 = d0_pme_7;
defparam arriav_hd_altpe2_hip_top_i.d1_pme_7 = d1_pme_7;
defparam arriav_hd_altpe2_hip_top_i.d2_pme_7 = d2_pme_7;
defparam arriav_hd_altpe2_hip_top_i.d3_hot_pme_7 = d3_hot_pme_7;
defparam arriav_hd_altpe2_hip_top_i.d3_cold_pme_7 = d3_cold_pme_7;
defparam arriav_hd_altpe2_hip_top_i.use_aer_7 = use_aer_7;
defparam arriav_hd_altpe2_hip_top_i.low_priority_vc_7 = low_priority_vc_7;
defparam arriav_hd_altpe2_hip_top_i.vc_arbitration_7 = vc_arbitration_7;
defparam arriav_hd_altpe2_hip_top_i.disable_snoop_packet_7 = disable_snoop_packet_7;
defparam arriav_hd_altpe2_hip_top_i.max_payload_size_7 = max_payload_size_7;
defparam arriav_hd_altpe2_hip_top_i.surprise_down_error_support_7 = surprise_down_error_support_7;
defparam arriav_hd_altpe2_hip_top_i.dll_active_report_support_7 = dll_active_report_support_7;
defparam arriav_hd_altpe2_hip_top_i.extend_tag_field_7 = extend_tag_field_7;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_data_7 = endpoint_l0_latency_data_7;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l0_latency_7 = endpoint_l0_latency_7;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_data_7 = endpoint_l1_latency_data_7;
defparam arriav_hd_altpe2_hip_top_i.endpoint_l1_latency_7 = endpoint_l1_latency_7;
defparam arriav_hd_altpe2_hip_top_i.indicator_data_7 = indicator_data_7;
defparam arriav_hd_altpe2_hip_top_i.indicator_7 = indicator_7;
defparam arriav_hd_altpe2_hip_top_i.role_based_error_reporting_7 = role_based_error_reporting_7;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_data_7 = slot_power_scale_data_7;
defparam arriav_hd_altpe2_hip_top_i.slot_power_scale_7 = slot_power_scale_7;
defparam arriav_hd_altpe2_hip_top_i.max_link_width_7 = max_link_width_7;
defparam arriav_hd_altpe2_hip_top_i.enable_l1_aspm_7 = enable_l1_aspm_7;
defparam arriav_hd_altpe2_hip_top_i.enable_l0s_aspm_7 = enable_l0s_aspm_7;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_data_7 = l1_exit_latency_sameclock_data_7;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_sameclock_7 = l1_exit_latency_sameclock_7;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_data_7 = l1_exit_latency_diffclock_data_7;
defparam arriav_hd_altpe2_hip_top_i.l1_exit_latency_diffclock_7 = l1_exit_latency_diffclock_7;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_data_7 = hot_plug_support_data_7;
defparam arriav_hd_altpe2_hip_top_i.hot_plug_support_7 = hot_plug_support_7;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_data_7 = slot_power_limit_data_7;
defparam arriav_hd_altpe2_hip_top_i.slot_power_limit_7 = slot_power_limit_7;
defparam arriav_hd_altpe2_hip_top_i.slot_number_data_7 = slot_number_data_7;
defparam arriav_hd_altpe2_hip_top_i.slot_number_7 = slot_number_7;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_data_7 = diffclock_nfts_count_data_7;
defparam arriav_hd_altpe2_hip_top_i.diffclock_nfts_count_7 = diffclock_nfts_count_7;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_data_7 = sameclock_nfts_count_data_7;
defparam arriav_hd_altpe2_hip_top_i.sameclock_nfts_count_7 = sameclock_nfts_count_7;
defparam arriav_hd_altpe2_hip_top_i.completion_timeout_7 = completion_timeout_7;
defparam arriav_hd_altpe2_hip_top_i.enable_completion_timeout_disable_7 = enable_completion_timeout_disable_7;
defparam arriav_hd_altpe2_hip_top_i.extended_tag_reset_7 = extended_tag_reset_7;
defparam arriav_hd_altpe2_hip_top_i.ecrc_check_capable_7 = ecrc_check_capable_7;
defparam arriav_hd_altpe2_hip_top_i.ecrc_gen_capable_7 = ecrc_gen_capable_7;
defparam arriav_hd_altpe2_hip_top_i.no_command_completed_7 = no_command_completed_7;
defparam arriav_hd_altpe2_hip_top_i.msi_multi_message_capable_7 = msi_multi_message_capable_7;
defparam arriav_hd_altpe2_hip_top_i.msi_64bit_addressing_capable_7 = msi_64bit_addressing_capable_7;
defparam arriav_hd_altpe2_hip_top_i.msi_masking_capable_7 = msi_masking_capable_7;
defparam arriav_hd_altpe2_hip_top_i.msi_support_7 = msi_support_7;
defparam arriav_hd_altpe2_hip_top_i.interrupt_pin_7 = interrupt_pin_7;
defparam arriav_hd_altpe2_hip_top_i.enable_function_msix_support_7 = enable_function_msix_support_7;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_data_7 = msix_table_size_data_7;
defparam arriav_hd_altpe2_hip_top_i.msix_table_size_7 = msix_table_size_7;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_data_7 = msix_table_bir_data_7;
defparam arriav_hd_altpe2_hip_top_i.msix_table_bir_7 = msix_table_bir_7;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_data_7 = msix_table_offset_data_7;
defparam arriav_hd_altpe2_hip_top_i.msix_table_offset_7 = msix_table_offset_7;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_data_7 = msix_pba_bir_data_7;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_bir_7 = msix_pba_bir_7;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_data_7 = msix_pba_offset_data_7;
defparam arriav_hd_altpe2_hip_top_i.msix_pba_offset_7 = msix_pba_offset_7;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_vga_enable_7 = bridge_port_vga_enable_7;
defparam arriav_hd_altpe2_hip_top_i.bridge_port_ssid_support_7 = bridge_port_ssid_support_7;
defparam arriav_hd_altpe2_hip_top_i.ssvid_data_7 = ssvid_data_7;
defparam arriav_hd_altpe2_hip_top_i.ssvid_7 = ssvid_7;
defparam arriav_hd_altpe2_hip_top_i.ssid_data_7 = ssid_data_7;
defparam arriav_hd_altpe2_hip_top_i.ssid_7 = ssid_7;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_data_7 = eie_before_nfts_count_data_7;
defparam arriav_hd_altpe2_hip_top_i.eie_before_nfts_count_7 = eie_before_nfts_count_7;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_data_7 = gen2_diffclock_nfts_count_data_7;
defparam arriav_hd_altpe2_hip_top_i.gen2_diffclock_nfts_count_7 = gen2_diffclock_nfts_count_7;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_data_7 = gen2_sameclock_nfts_count_data_7;
defparam arriav_hd_altpe2_hip_top_i.gen2_sameclock_nfts_count_7 = gen2_sameclock_nfts_count_7;
defparam arriav_hd_altpe2_hip_top_i.deemphasis_enable_7 = deemphasis_enable_7;
defparam arriav_hd_altpe2_hip_top_i.pcie_spec_version_7 = pcie_spec_version_7;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_data_7 = l0_exit_latency_sameclock_data_7;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_sameclock_7 = l0_exit_latency_sameclock_7;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_data_7 = l0_exit_latency_diffclock_data_7;
defparam arriav_hd_altpe2_hip_top_i.l0_exit_latency_diffclock_7 = l0_exit_latency_diffclock_7;
defparam arriav_hd_altpe2_hip_top_i.rx_ei_l0s_7 = rx_ei_l0s_7;
defparam arriav_hd_altpe2_hip_top_i.l2_async_logic_7 = l2_async_logic_7;
defparam arriav_hd_altpe2_hip_top_i.aspm_optionality_7 = aspm_optionality_7;
defparam arriav_hd_altpe2_hip_top_i.flr_capability_7 = flr_capability_7;
defparam arriav_hd_altpe2_hip_top_i.bar0_io_space_7 = bar0_io_space_7;
defparam arriav_hd_altpe2_hip_top_i.bar0_64bit_mem_space_7 = bar0_64bit_mem_space_7;
defparam arriav_hd_altpe2_hip_top_i.bar0_prefetchable_7 = bar0_prefetchable_7;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_data_7 = bar0_size_mask_data_7;
defparam arriav_hd_altpe2_hip_top_i.bar0_size_mask_7 = bar0_size_mask_7;
defparam arriav_hd_altpe2_hip_top_i.bar1_io_space_7 = bar1_io_space_7;
defparam arriav_hd_altpe2_hip_top_i.bar1_64bit_mem_space_7 = bar1_64bit_mem_space_7;
defparam arriav_hd_altpe2_hip_top_i.bar1_prefetchable_7 = bar1_prefetchable_7;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_data_7 = bar1_size_mask_data_7;
defparam arriav_hd_altpe2_hip_top_i.bar1_size_mask_7 = bar1_size_mask_7;
defparam arriav_hd_altpe2_hip_top_i.bar2_io_space_7 = bar2_io_space_7;
defparam arriav_hd_altpe2_hip_top_i.bar2_64bit_mem_space_7 = bar2_64bit_mem_space_7;
defparam arriav_hd_altpe2_hip_top_i.bar2_prefetchable_7 = bar2_prefetchable_7;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_data_7 = bar2_size_mask_data_7;
defparam arriav_hd_altpe2_hip_top_i.bar2_size_mask_7 = bar2_size_mask_7;
defparam arriav_hd_altpe2_hip_top_i.bar3_io_space_7 = bar3_io_space_7;
defparam arriav_hd_altpe2_hip_top_i.bar3_64bit_mem_space_7 = bar3_64bit_mem_space_7;
defparam arriav_hd_altpe2_hip_top_i.bar3_prefetchable_7 = bar3_prefetchable_7;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_data_7 = bar3_size_mask_data_7;
defparam arriav_hd_altpe2_hip_top_i.bar3_size_mask_7 = bar3_size_mask_7;
defparam arriav_hd_altpe2_hip_top_i.bar4_io_space_7 = bar4_io_space_7;
defparam arriav_hd_altpe2_hip_top_i.bar4_64bit_mem_space_7 = bar4_64bit_mem_space_7;
defparam arriav_hd_altpe2_hip_top_i.bar4_prefetchable_7 = bar4_prefetchable_7;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_data_7 = bar4_size_mask_data_7;
defparam arriav_hd_altpe2_hip_top_i.bar4_size_mask_7 = bar4_size_mask_7;
defparam arriav_hd_altpe2_hip_top_i.bar5_io_space_7 = bar5_io_space_7;
defparam arriav_hd_altpe2_hip_top_i.bar5_64bit_mem_space_7 = bar5_64bit_mem_space_7;
defparam arriav_hd_altpe2_hip_top_i.bar5_prefetchable_7 = bar5_prefetchable_7;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_data_7 = bar5_size_mask_data_7;
defparam arriav_hd_altpe2_hip_top_i.bar5_size_mask_7 = bar5_size_mask_7;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_data_7 = expansion_base_address_register_data_7;
defparam arriav_hd_altpe2_hip_top_i.expansion_base_address_register_7 = expansion_base_address_register_7;
defparam arriav_hd_altpe2_hip_top_i.io_window_addr_width_7 = io_window_addr_width_7;
defparam arriav_hd_altpe2_hip_top_i.prefetchable_mem_window_addr_width_7 = prefetchable_mem_window_addr_width_7;
//Func 7 - Config Register Settings END -------------


defparam arriav_hd_altpe2_hip_top_i.porttype_func0 = porttype_func0;
defparam arriav_hd_altpe2_hip_top_i.porttype_func1 = porttype_func1;
defparam arriav_hd_altpe2_hip_top_i.porttype_func2 = porttype_func2;
defparam arriav_hd_altpe2_hip_top_i.porttype_func3 = porttype_func3;
defparam arriav_hd_altpe2_hip_top_i.porttype_func4 = porttype_func4;
defparam arriav_hd_altpe2_hip_top_i.porttype_func5 = porttype_func5;
defparam arriav_hd_altpe2_hip_top_i.porttype_func6 = porttype_func6;
defparam arriav_hd_altpe2_hip_top_i.porttype_func7 = porttype_func7;
defparam arriav_hd_altpe2_hip_top_i.rxfreqlk_cnt_data = rxfreqlk_cnt_data;
defparam arriav_hd_altpe2_hip_top_i.rxfreqlk_cnt = rxfreqlk_cnt;
defparam arriav_hd_altpe2_hip_top_i.rxfreqlk_cnt_en = rxfreqlk_cnt_en;
defparam arriav_hd_altpe2_hip_top_i.testmode_control = testmode_control;
defparam arriav_hd_altpe2_hip_top_i.skp_insertion_control = skp_insertion_control;
defparam arriav_hd_altpe2_hip_top_i.tx_l0s_adjust = tx_l0s_adjust;
defparam arriav_hd_altpe2_hip_top_i.rx_cdc_almost_full_data = rx_cdc_almost_full_data;
defparam arriav_hd_altpe2_hip_top_i.rx_cdc_almost_full = rx_cdc_almost_full;
defparam arriav_hd_altpe2_hip_top_i.tx_cdc_almost_full_data = tx_cdc_almost_full_data;
defparam arriav_hd_altpe2_hip_top_i.tx_cdc_almost_full = tx_cdc_almost_full;
defparam arriav_hd_altpe2_hip_top_i.rx_l0s_count_idl_data = rx_l0s_count_idl_data;
defparam arriav_hd_altpe2_hip_top_i.rx_l0s_count_idl = rx_l0s_count_idl;
defparam arriav_hd_altpe2_hip_top_i.cdc_dummy_insert_limit_data = cdc_dummy_insert_limit_data;
defparam arriav_hd_altpe2_hip_top_i.cdc_dummy_insert_limit = cdc_dummy_insert_limit;
defparam arriav_hd_altpe2_hip_top_i.ei_delay_powerdown_count_data = ei_delay_powerdown_count_data;
defparam arriav_hd_altpe2_hip_top_i.ei_delay_powerdown_count = ei_delay_powerdown_count;
defparam arriav_hd_altpe2_hip_top_i.millisecond_cycle_count_data = millisecond_cycle_count_data;
defparam arriav_hd_altpe2_hip_top_i.millisecond_cycle_count = millisecond_cycle_count;
defparam arriav_hd_altpe2_hip_top_i.skp_os_schedule_count_data = skp_os_schedule_count_data;
defparam arriav_hd_altpe2_hip_top_i.skp_os_schedule_count = skp_os_schedule_count;
defparam arriav_hd_altpe2_hip_top_i.fc_init_timer_data = fc_init_timer_data;
defparam arriav_hd_altpe2_hip_top_i.fc_init_timer = fc_init_timer;
defparam arriav_hd_altpe2_hip_top_i.l01_entry_latency_data = l01_entry_latency_data;
defparam arriav_hd_altpe2_hip_top_i.l01_entry_latency = l01_entry_latency;
defparam arriav_hd_altpe2_hip_top_i.flow_control_update_count_data = flow_control_update_count_data;
defparam arriav_hd_altpe2_hip_top_i.flow_control_update_count = flow_control_update_count;
defparam arriav_hd_altpe2_hip_top_i.flow_control_timeout_count_data = flow_control_timeout_count_data;
defparam arriav_hd_altpe2_hip_top_i.flow_control_timeout_count = flow_control_timeout_count;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_flow_ctrl_posted_header_data = vc0_rx_flow_ctrl_posted_header_data;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_flow_ctrl_posted_header = vc0_rx_flow_ctrl_posted_header;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_flow_ctrl_posted_data_data = vc0_rx_flow_ctrl_posted_data_data;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_flow_ctrl_posted_data = vc0_rx_flow_ctrl_posted_data;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_flow_ctrl_nonposted_header_data = vc0_rx_flow_ctrl_nonposted_header_data;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_flow_ctrl_nonposted_header = vc0_rx_flow_ctrl_nonposted_header;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_flow_ctrl_nonposted_data_data = vc0_rx_flow_ctrl_nonposted_data_data;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_flow_ctrl_nonposted_data = vc0_rx_flow_ctrl_nonposted_data;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_flow_ctrl_compl_header_data = vc0_rx_flow_ctrl_compl_header_data;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_flow_ctrl_compl_header = vc0_rx_flow_ctrl_compl_header;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_flow_ctrl_compl_data_data = vc0_rx_flow_ctrl_compl_data_data;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_flow_ctrl_compl_data = vc0_rx_flow_ctrl_compl_data;
defparam arriav_hd_altpe2_hip_top_i.rx_ptr0_posted_dpram_min_data = rx_ptr0_posted_dpram_min_data;
defparam arriav_hd_altpe2_hip_top_i.rx_ptr0_posted_dpram_min = rx_ptr0_posted_dpram_min;
defparam arriav_hd_altpe2_hip_top_i.rx_ptr0_posted_dpram_max_data = rx_ptr0_posted_dpram_max_data;
defparam arriav_hd_altpe2_hip_top_i.rx_ptr0_posted_dpram_max = rx_ptr0_posted_dpram_max;
defparam arriav_hd_altpe2_hip_top_i.rx_ptr0_nonposted_dpram_min_data = rx_ptr0_nonposted_dpram_min_data;
defparam arriav_hd_altpe2_hip_top_i.rx_ptr0_nonposted_dpram_min = rx_ptr0_nonposted_dpram_min;
defparam arriav_hd_altpe2_hip_top_i.rx_ptr0_nonposted_dpram_max_data = rx_ptr0_nonposted_dpram_max_data;
defparam arriav_hd_altpe2_hip_top_i.rx_ptr0_nonposted_dpram_max = rx_ptr0_nonposted_dpram_max;
defparam arriav_hd_altpe2_hip_top_i.retry_buffer_last_active_address_data = retry_buffer_last_active_address_data;
//defparam arriav_hd_altpe2_hip_top_i.retry_buffer_last_active_address = retry_buffer_last_active_address;
defparam arriav_hd_altpe2_hip_top_i.retry_buffer_memory_settings_data           = retry_buffer_memory_settings_data;
defparam arriav_hd_altpe2_hip_top_i.retry_buffer_memory_settings = retry_buffer_memory_settings;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_buffer_memory_settings_data          = vc0_rx_buffer_memory_settings_data;
defparam arriav_hd_altpe2_hip_top_i.vc0_rx_buffer_memory_settings = vc0_rx_buffer_memory_settings;
defparam arriav_hd_altpe2_hip_top_i.bist_memory_settings_data = bist_memory_settings_data;
defparam arriav_hd_altpe2_hip_top_i.bist_memory_settings = bist_memory_settings;
defparam arriav_hd_altpe2_hip_top_i.bridge_66mhzcap = bridge_66mhzcap;
defparam arriav_hd_altpe2_hip_top_i.fastb2bcap = fastb2bcap;
defparam arriav_hd_altpe2_hip_top_i.devseltim = devseltim;
defparam arriav_hd_altpe2_hip_top_i.memwrinv = memwrinv;
defparam arriav_hd_altpe2_hip_top_i.credit_buffer_allocation_aux = credit_buffer_allocation_aux;
defparam arriav_hd_altpe2_hip_top_i.enable_adapter_half_rate_mode = enable_adapter_half_rate_mode;
defparam arriav_hd_altpe2_hip_top_i.vc0_clk_enable = vc0_clk_enable;
defparam arriav_hd_altpe2_hip_top_i.vc1_clk_enable = vc1_clk_enable;
defparam arriav_hd_altpe2_hip_top_i.register_pipe_signals = register_pipe_signals;
defparam arriav_hd_altpe2_hip_top_i.iei_enable_settings = iei_enable_settings;
defparam arriav_hd_altpe2_hip_top_i.lattim_ro_data = lattim_ro_data;
defparam arriav_hd_altpe2_hip_top_i.lattim = lattim;
defparam arriav_hd_altpe2_hip_top_i.br_rcb = br_rcb;
defparam arriav_hd_altpe2_hip_top_i.vsec_id_data = vsec_id_data;
defparam arriav_hd_altpe2_hip_top_i.vsec_id = vsec_id;
defparam arriav_hd_altpe2_hip_top_i.cvp_enable = cvp_enable;
defparam arriav_hd_altpe2_hip_top_i.cvp_rate_sel = cvp_rate_sel;
defparam arriav_hd_altpe2_hip_top_i.hard_reset_bypass = hard_reset_bypass;
defparam arriav_hd_altpe2_hip_top_i.cvp_data_compressed = cvp_data_compressed;
defparam arriav_hd_altpe2_hip_top_i.cvp_data_encrypted = cvp_data_encrypted;
defparam arriav_hd_altpe2_hip_top_i.cvp_mode_reset = cvp_mode_reset;
defparam arriav_hd_altpe2_hip_top_i.cvp_clk_reset = cvp_clk_reset;
defparam arriav_hd_altpe2_hip_top_i.vsec_cap_data = vsec_cap_data;
defparam arriav_hd_altpe2_hip_top_i.vsec_cap = vsec_cap;
defparam arriav_hd_altpe2_hip_top_i.jtag_id_data = jtag_id_data;
defparam arriav_hd_altpe2_hip_top_i.jtag_id = jtag_id;
defparam arriav_hd_altpe2_hip_top_i.user_id_data = user_id_data;
defparam arriav_hd_altpe2_hip_top_i.user_id = user_id;
defparam arriav_hd_altpe2_hip_top_i.disable_auto_crs = disable_auto_crs;
/*
*/

// Hard reset controller section;

defparam arriav_hd_altpe2_hip_top_i.hrdrstctrl_en                      = hrdrstctrl_en;

defparam arriav_hd_altpe2_hip_top_i.rstctrl_pld_clr                    = rstctrl_pld_clr;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_debug_en                   = rstctrl_debug_en;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_force_inactive_rst         = rstctrl_force_inactive_rst;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_perst_enable               = rstctrl_perst_enable;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_hip_ep                     = rstctrl_hip_ep;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_hard_block_enable          = rstctrl_hard_block_enable;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_rx_pma_rstb_inv            = rstctrl_rx_pma_rstb_inv;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_tx_pma_rstb_inv            = rstctrl_tx_pma_rstb_inv;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_rx_pcs_rst_n_inv           = rstctrl_rx_pcs_rst_n_inv;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_tx_pcs_rst_n_inv           = rstctrl_tx_pcs_rst_n_inv;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_altpe2_crst_n_inv          = rstctrl_altpe2_crst_n_inv;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_altpe2_srst_n_inv          = rstctrl_altpe2_srst_n_inv;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_altpe2_rst_n_inv           = rstctrl_altpe2_rst_n_inv;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_tx_pma_syncp_inv           = rstctrl_tx_pma_syncp_inv;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_1us_count_fref_clk         = rstctrl_1us_count_fref_clk;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_1us_count_fref_clk_value   = rstctrl_1us_count_fref_clk_value;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_1ms_count_fref_clk         = rstctrl_1ms_count_fref_clk;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_1ms_count_fref_clk_value   = rstctrl_1ms_count_fref_clk_value;

defparam arriav_hd_altpe2_hip_top_i.rstctrl_off_cal_done_select        = rstctrl_off_cal_done_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_rx_pma_rstb_cmu_select     = rstctrl_rx_pma_rstb_cmu_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_rx_pma_rstb_select         = rstctrl_rx_pma_rstb_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_rx_pll_freq_lock_select    = rstctrl_rx_pll_freq_lock_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_mask_tx_pll_lock_select    = rstctrl_mask_tx_pll_lock_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_rx_pll_lock_select         = rstctrl_rx_pll_lock_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_perstn_select              = rstctrl_perstn_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_tx_lc_pll_rstb_select      = rstctrl_tx_lc_pll_rstb_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_fref_clk_select            = rstctrl_fref_clk_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_off_cal_en_select          = rstctrl_off_cal_en_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_tx_pma_syncp_select        = rstctrl_tx_pma_syncp_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_rx_pcs_rst_n_select        = rstctrl_rx_pcs_rst_n_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_tx_cmu_pll_lock_select     = rstctrl_tx_cmu_pll_lock_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_tx_pcs_rst_n_select        = rstctrl_tx_pcs_rst_n_select;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_tx_lc_pll_lock_select      = rstctrl_tx_lc_pll_lock_select;

defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_a        = rstctrl_timer_a;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_a_type   = rstctrl_timer_a_type;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_a_value  = rstctrl_timer_a_value;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_b        = rstctrl_timer_b;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_b_type   = rstctrl_timer_b_type;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_b_value  = rstctrl_timer_b_value;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_c        = rstctrl_timer_c;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_c_type   = rstctrl_timer_c_type;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_c_value  = rstctrl_timer_c_value;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_d        = rstctrl_timer_d;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_d_type   = rstctrl_timer_d_type;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_d_value  = rstctrl_timer_d_value;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_e        = rstctrl_timer_e;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_e_type   = rstctrl_timer_e_type;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_e_value  = rstctrl_timer_e_value;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_f        = rstctrl_timer_f;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_f_type   = rstctrl_timer_f_type;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_f_value  = rstctrl_timer_f_value;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_g        = rstctrl_timer_g;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_g_type   = rstctrl_timer_g_type;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_g_value  = rstctrl_timer_g_value;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_h        = rstctrl_timer_h;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_h_type   = rstctrl_timer_h_type;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_h_value  = rstctrl_timer_h_value;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_i        = rstctrl_timer_i;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_i_type   = rstctrl_timer_i_type;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_i_value  = rstctrl_timer_i_value;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_j        = rstctrl_timer_j;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_j_type   = rstctrl_timer_j_type;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_timer_j_value  = rstctrl_timer_j_value;
defparam arriav_hd_altpe2_hip_top_i.rstctrl_ltssm_disable  = rstctrl_ltssm_disable;
defparam arriav_hd_altpe2_hip_top_i.cvp_isolation          = cvp_isolation;

endmodule //arriav_hssi_gen3_pcie_hip


module arriav_hd_altpe2_hip_top (
   usermode,                   // use to gate off input signal
   hippartialreconfign,        // use to gate off output signal
   csrclk,
   csrin,
   csren,
   csrout,
   csrcbdin,
   csrtcsrin,
   csrdin,
   csrseg,
   csrenscan,
   csrtverify,
   csrloadcsr,
   csrpipein,
   csrdout,
   csrpipeout,
   avmmrstn,
   avmmclk,
   avmmwrite,
   avmmread,
   avmmbyteen,
   avmmaddress,
   avmmwritedata,
   sershiftload,
   interfacesel,
   avmmreaddata,
   mdioclk,
   mdioin,
   cbhipmdioen,
   mdiodevaddr,
   mdioout,
   mdiooenn,
   lmidout,
   lmiack,
   lmirden,
   lmiwren,
   lmiaddr,
   lmidin,
   resetstatus,
   l2exit,
   hotrstexit,
   dlupexit,
   pldclk,
   pldsrst,
   pldrst,
   phyrst,
   physrst,
   coreclkin,
   coreclkout,
   corerst,
   corepor,
   corecrst,
   coresrst,
   swdnwake,
   swuphotrst,
   swdnin,
   swupin,
   rxvalidvc0,
   rxerrvc0,
   rxbardecvc0,
   rxsopvc00,
   rxeopvc00,
   rxdatavc00,
   rxbevc00,
   rxsopvc01,
   rxeopvc01,
   rxdatavc01,
   rxbevc01,
   rxfifofullvc0,
   rxfifoemptyvc0,
   rxfifowrpvc0,
   rxfifordpvc0,
   txcredvc0,
   txreadyvc0,
   txfifofullvc0,
   txfifoemptyvc0,
   txfifowrpvc0,
   txfifordpvc0,
   rxmaskvc0,
   rxreadyvc0,
   txvalidvc0,
   txerrvc0,
   txsopvc00,
   txeopvc00,
   txdatavc00,
   txsopvc01,
   txeopvc01,
   txdatavc01,
   tlpmetosr,
   tlpmetocr,
   tlpmevent,
   tlpmdata,
   tlpmauxpwr,
   tlcfgsts,
   tlcfgstswr,
   tlcfgctl,
   tlcfgctlwr,
   tlcfgadd,
   tlappintaack,
   tlappmsiack,
   intstatus,
   tlappintasts,
   tlappmsireq,
   tlappmsitc,
   tlappmsinum,
   tlaermsinum,
   tlpexmsinum,
   tlhpgctrler,
   //dlup,             // MUX with tlcfgsts[97:97]
   //dlvcstatus,      // Mux with tlcfgsts[96:89]
   //dlerrdll,        // Mux with tlcfgsts[88:84]
   //dlerrphy,        // Mux with tlcfgsts[83:83]
   //dlrpbufemp,      // Mux with tlcfgsts[82:82]
   //dldllreq,        // Mux with tlcfgsts[81:81]
   laneact,          // Mux with tlcfgsts[80:77]
   //linkup,           // Mux with tlcfgsts[76:76]
   dlltssm,          // Mux with tlcfgsts[75:71]
   clrrxpath,        // Mux with tlcfgsts[70:70]
   //dlrxvalpm,      // Mux with tlcfgsts[69:69]
   //dlrxtyppm,          // Mux with tlcfgsts[68:66]
   //dltxackpm,      // Mux with tlcfgsts[65:65]
   //dlackphypm,      // Mux with tlcfgsts[64:63]
   //dlrstentercompbit, // Mux with tlcfgsts[62:62]
   //dlrsttxmarginfield,    // Mux with tlcfgsts[61:61]
   dlcurrentspeed,      // Mux with tlcfgsts[60:59]
   //dlcurrentdeemp,      // Mux with tlcfgsts[58:58]
   //dllinkautobdwstatus,   // Mux with tlcfgsts[57:57]
   //dllinkbdwmngstatus,    // Mux with tlcfgsts[56:56]
   //dlackrequpfc,       // Mux with tlcfgsts[55:55]
   //dlacksndupfc,       // Mux with tlcfgsts[54:54]
   //dlrxecrcchk, // Mux with tlappmsinum[4]
   //dlaspmcr0,    // Mux with tlpmauxpwr
   dlcomclkreg,  // ww51.5 change by Ning Xue
   dlvcctrl,
   //dlvcidmap, // Mux with tlpmdata , cplpending, cplerr ,cplerrfunc
   //dlinhdllp, // Mux with tlpexmsinum[5]
   //dlreqwake, // Mux with tlaermsinum[5]
   //dltxcfgextsy, // Mux with tlpmetocr
   //dltxreqpm, // Mux with tlpmevent
   //dltxtyppm,  // Mux with tlpmeventfunc
   //dlmaxploaddcr, // Mux with cplerrfunc
   //dlreqphypm,  // Mux with tlpexmsinum[4:0]
   //dlreqphycfg, // Mux with  tlaermsinum[4:0]
   //dlrequpfc, // Mux with tlappmsinum[0]
   //dlsndupfc, // Mux with tlappmsinum[1]
   //dltypupfc, // Mux with tlappmsinum[3:0]
   //dlvcidupfc, // Mux with tlappmsitc[2:0]
   //dlhdrupfc, // Mux with tlappintdsts, tlappintdfuncnum, tlappmsireq, tlappmsifunc
   //dldataupfc, // Mux with tlappintasts   tlappintafuncnum tlappintbsts tlappintbfuncnum tlappintcsts tlappintcfuncnum
   dlctrllink2,
   testouthip,
   ev1us,
   ev128ns,
   wakeoen,
   serrout,
   tlslotclkcfg,
   mode,
   testinhip,
   cplerr,
   pcierr,
   rate0,
   rate1,
   rate2,
   rate3,
   rate4,
   rate5,
   rate6,
   rate7,
   rate8,
   //ratetiedtognd,
   eidleinfersel0,
   txdeemph0,
   txmargin0,
   txdata0,
   txdatak0,
   txdetectrx0,
   txelecidle0,
   txcompl0,
   rxpolarity0,
   powerdown0,
   rxdata0,
   rxdatak0,
   rxvalid0,
   phystatus0,
   rxelecidle0,
   rxstatus0,
   eidleinfersel1,
   txdeemph1,
   txmargin1,
   txdata1,
   txdatak1,
   txdetectrx1,
   txelecidle1,
   txcompl1,
   rxpolarity1,
   powerdown1,
   rxdata1,
   rxdatak1,
   rxvalid1,
   phystatus1,
   rxelecidle1,
   rxstatus1,
   eidleinfersel2,
   txdeemph2,
   txmargin2,
   txdata2,
   txdatak2,
   txdetectrx2,
   txelecidle2,
   txcompl2,
   rxpolarity2,
   powerdown2,
   rxdata2,
   rxdatak2,
   rxvalid2,
   phystatus2,
   rxelecidle2,
   rxstatus2,
   eidleinfersel3,
   txdeemph3,
   txmargin3,
   txdata3,
   txdatak3,
   txdetectrx3,
   txelecidle3,
   txcompl3,
   rxpolarity3,
   powerdown3,
   rxdata3,
   rxdatak3,
   rxvalid3,
   phystatus3,
   rxelecidle3,
   rxstatus3,
   eidleinfersel4,
   txdeemph4,
   txmargin4,
   txdata4,
   txdatak4,
   txdetectrx4,
   txelecidle4,
   txcompl4,
   rxpolarity4,
   powerdown4,
   rxdata4,
   rxdatak4,
   rxvalid4,
   phystatus4,
   rxelecidle4,
   rxstatus4,
   eidleinfersel5,
   txdeemph5,
   txmargin5,
   txdata5,
   txdatak5,
   txdetectrx5,
   txelecidle5,
   txcompl5,
   rxpolarity5,
   powerdown5,
   rxdata5,
   rxdatak5,
   rxvalid5,
   phystatus5,
   rxelecidle5,
   rxstatus5,
   eidleinfersel6,
   txdeemph6,
   txmargin6,
   txdata6,
   txdatak6,
   txdetectrx6,
   txelecidle6,
   txcompl6,
   rxpolarity6,
   powerdown6,
   rxdata6,
   rxdatak6,
   rxvalid6,
   phystatus6,
   rxelecidle6,
   rxstatus6,
   eidleinfersel7,
   txdeemph7,
   txmargin7,
   txdata7,
   txdatak7,
   txdetectrx7,
   txelecidle7,
   txcompl7,
   rxpolarity7,
   powerdown7,
   rxdata7,
   rxdatak7,
   rxvalid7,
   phystatus7,
   rxelecidle7,
   rxstatus7,
   ltssml0state,      // LTSSM L0 State flag
   // REGSCAN I/Os for MRAM I/O testing
   //mramregscanen,
   //mramregscanin,
   //mramregscanout,
   //mramhiptestenable,
   bisttestenn,         // BIST-related I/Os for MRAM
   bistscanin,             // Shared between 3 MRAM BISTs
   bistscanenn,             // Shared between 3 MRAM BISTs
   bistenn,
   //bistenrcv0,
   //bistenrcv1,
   bistscanoutrpl,
   bistscanoutrcv0,
   bistscanoutrcv1,
   bistdonearpl,
   bistdonebrpl,
   bistpassrpl,
   derrrpl,
   derrcorextrpl,
   bistdonearcv0,
   bistdonebrcv0,
   bistpassrcv0,
   derrcorextrcv0,
   bistdonearcv1,
   bistdonebrcv1,
   bistpassrcv1,
   //derrcorextrcv1,
   // scan test IO
   scanmoden,
   scanenn,
   dpriorefclkdig,
   // FRZ signals for MRAMs
   nfrzdrv,
   frzreg,
   frzlogic,
   // Redundancy IDs for the 3 MRAMs
   //idrpl,
   //idrcv0,
   //idrcv1,
   //Hard Reset Inputs
   pinperstn,              // Active low PCIE reset from PCIE Interface PIN
   pldperstn,              // Active low PCIE reset from PLD core
   pldclrpmapcshipn,       // From PLD Active low signal To Hard Reset Ctrl, reset the PMA/PCS/HIP
   pldclrpcshipn,          // From PLD Active low signal To Hard Reset Ctrl, reset the PCS/HIP
   pldclrhipn,             // From PLD Active low signal To Hard Reset Ctrl, reset the HIP NON STICKY Bits (CRST & SRST)
   // Control signals from Control Block and POR
   iocsrrdydly,             // I/O CSR Ready Delayed (Low when IOCSR is not configured)
   plniotri,
   entest,
   por,
   //Hard Reset Controller
   frefclk0,
   frefclk1,
   frefclk2,
   frefclk3,
   frefclk4,
   frefclk5,
   frefclk6,
   frefclk7,
   frefclk8,

   //offcaldone0,
   //offcaldone1,
   //offcaldone2,
   //offcaldone3,
   //offcaldone4,
   //offcaldone5,
   //offcaldone6,
   //offcaldone7,
   //offcaldone8,

   //txlcplllock0,
   //txlcplllock1,
   //txlcplllock2,
   //txlcplllock3,
   //txlcplllock4,
   //txlcplllock5,
   //txlcplllock6,
   //txlcplllock7,
   //txlcplllock8,

   rxfreqtxcmuplllock0,
   rxfreqtxcmuplllock1,
   rxfreqtxcmuplllock2,
   rxfreqtxcmuplllock3,
   rxfreqtxcmuplllock4,
   rxfreqtxcmuplllock5,
   rxfreqtxcmuplllock6,
   rxfreqtxcmuplllock7,
   rxfreqtxcmuplllock8,

   rxpllphaselock0,
   rxpllphaselock1,
   rxpllphaselock2,
   rxpllphaselock3,
   rxpllphaselock4,
   rxpllphaselock5,
   rxpllphaselock6,
   rxpllphaselock7,
   rxpllphaselock8,

   //masktxplllock0,       // Signal indicating masking of TX PLL lock
   //masktxplllock1,       // Signal indicating masking of TX PLL lock
   //masktxplllock2,       // Signal indicating masking of TX PLL lock
   //masktxplllock3,       // Signal indicating masking of TX PLL lock
   //masktxplllock4,       // Signal indicating masking of TX PLL lock
   //masktxplllock5,       // Signal indicating masking of TX PLL lock
   //masktxplllock6,       // Signal indicating masking of TX PLL lock
   //masktxplllock7,       // Signal indicating masking of TX PLL lock
   //masktxplllock8,       // Signal indicating masking of TX PLL lock

   txpcsrstn0,
   txpcsrstn1,
   txpcsrstn2,
   txpcsrstn3,
   txpcsrstn4,
   txpcsrstn5,
   txpcsrstn6,
   txpcsrstn7,
   txpcsrstn8,

   rxpcsrstn0,
   rxpcsrstn1,
   rxpcsrstn2,
   rxpcsrstn3,
   rxpcsrstn4,
   rxpcsrstn5,
   rxpcsrstn6,
   rxpcsrstn7,
   rxpcsrstn8,

   txpmasyncp0,
   txpmasyncp1,
   txpmasyncp2,
   txpmasyncp3,
   txpmasyncp4,
   txpmasyncp5,
   txpmasyncp6,
   txpmasyncp7,
   txpmasyncp8,

   rxpmarstb0,
   rxpmarstb1,
   rxpmarstb2,
   rxpmarstb3,
   rxpmarstb4,
   rxpmarstb5,
   rxpmarstb6,
   rxpmarstb7,
   rxpmarstb8,

   //txlcpllrstb0,
   //txlcpllrstb1,
   //txlcpllrstb2,
   //txlcpllrstb3,
   //txlcpllrstb4,
   //txlcpllrstb5,
   //txlcpllrstb6,
   //txlcpllrstb7,
   //txlcpllrstb8,

   //offcalen0,
   //offcalen1,
   //offcalen2,
   //offcalen3,
   //offcalen4,
   //offcalen5,
   //offcalen6,
   //offcalen7,
   //offcalen8,

   rxbardecfuncnumvc0,
   tlpmeventfunc,
   tlappintafuncnum,
   tlappintbsts,
   tlappintbfuncnum,
   tlappintcsts,
   tlappintcfuncnum,
   tlappintdsts,
   tlappintdfuncnum,
   tlappmsifunc,
   cplpending,
   cplerrfunc,
   flrreset,
   cvpconfigready,
   cvpen,
   cvpconfigerror,
   cvpconfigdone,
   cvpclk,
   cvpdata,
   cvpstartxfer,
   cvpconfig,
   cvpfullconfig,
   pclkch0,
   pclkch1,
   pclkcentral,
   pllfixedclkch0,
   pllfixedclkch1,
   pllfixedclkcentral,
   tlappintback,
   tlappintcack,
   tlappintdack,
   //tlcfgctladd,
   flrsts,
   rxfreqlocked0,
   rxfreqlocked1,
   rxfreqlocked2,
   rxfreqlocked3,
   rxfreqlocked4,
   rxfreqlocked5,
   rxfreqlocked6,
   rxfreqlocked7,
   txswing0,
   txswing1,
   txswing2,
   txswing3,
   txswing4,
   txswing5,
   txswing6,
   txswing7,
   txcredfchipcons, // TL to AL Indicates that HIP consumed one of PH PD, NPH, NPD, CH, CD
   txcredfcinfinite, // TL to AL Indicates if this is an infinite credit PH PD, NPH, NPD, CH, CD
   txcredhdrfcp,    // TL to AL Header credit of the received FC Posted.
   txcreddatafcp,   // TL to AL Signals the Data credit of the received FC Posted
   txcredhdrfcnp,   // TL to AL Header credit of the received FC Non Posted
   txcreddatafcnp,  // TL to AL Signals the Data credit of the received FC Non Posted
   txcredhdrfccp,   // TL to AL Header credit of the received FC completion.
   txcreddatafccp,  // TL to AL Signals the Data credit of the received FC completion
   // Debug signals
   dbgpipex1rx,
   // Extra signals
   hipextrain,
   hipextraclkin,
   r2cerrext,
   successfulspeednegotiationint,
   hipextraout,
   hipextraclkout,
   pldcoreready,
   pldclkinuse
);

   parameter func_mode = "disable"; //Valid values: DISABLE|ENABLE
   parameter bonding_mode = "bond_disable";  //Valid values: BOND_DISABLE|X8_G1G2|X8_G3|X4|X2|X1
   parameter prot_mode = "disabled_prot_mode";  //Valid values: PIPE_G1|PIPE_G2|PIPE_G3|DISABLED_PROT_MODE
   parameter pcie_spec_1p0_compliance = "spec_1p1";   //Valid values: SPEC_1P1|SPEC_1P0A
   parameter vc_enable = "single_vc";  //Valid values: SINGLE_VC
   parameter enable_slot_register = "false"; //Valid values: TRUE|FALSE
   parameter pcie_mode = "shared_mode";   //Valid values: EP_NATIVE|EP_LEGACY|RP|SW_UP|SW_DN|BRIDGE|SWITCH_MODE|SHARED_MODE
   parameter multi_function = "one_fun"; //Valid values: "one_func", "two_func", "three_func", "four_func", "five_func", "six_func", "seven_func", "eight_func"
   parameter bypass_cdc = "false";  //Valid values: TRUE|FALSE
   parameter cdc_clk_relation = "plesiochronous"; //Valid values: plesiochronous|mesochronous
   parameter enable_rx_reordering = "true";  //Valid values: TRUE|FALSE
   parameter enable_rx_buffer_checking = "false";  //Valid values: TRUE|FALSE
   parameter single_rx_detect_data = 4'b0;   //Valid values: 4
   parameter single_rx_detect = "single_rx_detect";   //Valid values: SINGLE_RX_DETECT
   parameter use_crc_forwarding = "false";   //Valid values: TRUE|FALSE
   parameter bypass_tl = "false";   //Valid values: TRUE|FALSE
   parameter gen12_lane_rate_mode = "gen1"; //Valid values: GEN1|GEN1_GEN2|GEN1_GEN2_GEN3
   parameter lane_mask = "x4";   //Valid values: X1|X2|X4|X8
   parameter disable_link_x2_support = "false"; //Valid values: TRUE|FALSE
   parameter national_inst_thru_enhance = "true";  //Valid values: TRUE|FALSE
   parameter disable_tag_check = "enable"; //Valid values: ENABLE|DISABLE
   parameter port_link_number_data = 8'b1;   //Valid values: 8
   parameter port_link_number = "port_link_number";   //Valid values: PORT_LINK_NUMBER
   parameter device_number_data = 5'b0;   //Valid values: 5
   parameter device_number = "device_number";   //Valid values: DEVICE_NUMBER
   parameter bypass_clk_switch = "false"; //Valid values: FALSE|TRUE
   parameter core_clk_out_sel = "div_1";  //Valid values: DIV_1|DIV_2|DIV_4|DIV_8
   parameter core_clk_divider = "div_1";  //Valid values: DIV_1|DIV_2|DIV_4|DIV_8
   parameter core_clk_source = "pll_fixed_clk"; //Valid values: PLL_FIXED_CLK|PCLK|CORE_CLK_IN
   parameter core_clk_sel = "pld_clk"; //Valid values: PLD_CLK|CORE_CLK_250
   parameter disable_clk_switch = "disable"; //Valid values: ENABLE|DISABLE
   parameter core_clk_disable_clk_switch = "pld_clk"; //Valid values: PLD_CLK|CORE_CLK_250
   parameter slotclk_cfg = "dynamic_slotclkcfg"; //possible values are "static_slotclkcfgon", "static_slotclkcfgoff", "dynamic_slotclkcfg"
   parameter tx_swing_data = 8'b0;
   parameter tx_swing = "tx_swing";
   parameter enable_ch0_pclk_out = "pclk_ch01";   //Valid values: pclk_ch01|pclk_central
   parameter enable_ch01_pclk_out = "pclk_ch0"; //Valid values: PCLK_CH0|PCLK_CH1
   parameter pipex1_debug_sel = "disable";   //Valid values: DISABLE|ENABLE
   parameter pclk_out_sel = "pclk"; //Valid values: PCLK|CORE_CLK_IN

   //Func 0 - Config Register Settings START -------------
   parameter vendor_id_data_0 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_0 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_0 = 16'b1;   //Valid values: 16
   parameter device_id_0 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_0 = 8'b1;  //Valid values: 8
   parameter revision_id_0 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_0 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_0 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_0 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_0 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_0 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_0 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_0 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_0 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_0 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_0 = 3'b0; //Valid values: 3
   parameter maximum_current_0 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_0 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_0 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_0 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_0 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_0 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_0 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_0 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_0 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_0 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_0 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_0 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_0 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_0 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_0 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_0 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_0 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_0 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_0 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_0 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_0 = 3'b111;  //Valid values: 3
   parameter indicator_0 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_0 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_0 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_0 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_0 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_0 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_0 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_0 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_0 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_0 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_0 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_0 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_0 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_0 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_0 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_0 = 13'b0; //Valid values: 13
   parameter slot_number_0 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_0 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_0 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_0 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_0 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_0 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_0 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_0 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_0 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_0 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_0 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_0 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_0 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_0 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_0 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_0 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_0 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_0 = 11'b0;   //Valid values: 11
   parameter msix_table_size_0 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_0 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_0 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_0 = 29'b0; //Valid values: 29
   parameter msix_table_offset_0 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_0 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_0 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_0 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_0 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_0 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_0 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_0 = 16'b0; //Valid values: 16
   parameter ssvid_0 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_0 = 16'b0;  //Valid values: 16
   parameter ssid_0 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_0 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_0 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_0 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_0 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_0 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_0 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_0 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_0 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_0 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_0 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_0 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_0 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_0 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_0 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_0 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_0 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_0 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_0 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_0 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_0 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_0 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_0 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_0 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_0 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_0 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_0 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_0 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_0 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_0 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_0 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_0 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_0 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_0 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_0 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_0 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_0 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_0 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_0 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_0 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_0 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_0 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 0 - Config Register Settings END -------------

   //Func 1 - Config Register Settings START -------------
   parameter vendor_id_data_1 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_1 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_1 = 16'b1;   //Valid values: 16
   parameter device_id_1 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_1 = 8'b1;  //Valid values: 8
   parameter revision_id_1 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_1 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_1 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_1 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_1 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_1 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_1 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_1 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_1 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_1 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_1 = 3'b0; //Valid values: 3
   parameter maximum_current_1 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_1 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_1 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_1 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_1 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_1 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_1 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_1 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_1 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_1 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_1 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_1 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_1 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_1 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_1 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_1 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_1 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_1 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_1 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_1 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_1 = 3'b111;  //Valid values: 3
   parameter indicator_1 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_1 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_1 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_1 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_1 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_1 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_1 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_1 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_1 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_1 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_1 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_1 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_1 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_1 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_1 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_1 = 13'b0; //Valid values: 13
   parameter slot_number_1 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_1 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_1 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_1 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_1 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_1 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_1 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_1 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_1 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_1 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_1 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_1 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_1 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_1 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_1 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_1 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_1 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_1 = 11'b0;   //Valid values: 11
   parameter msix_table_size_1 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_1 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_1 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_1 = 29'b0; //Valid values: 29
   parameter msix_table_offset_1 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_1 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_1 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_1 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_1 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_1 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_1 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_1 = 16'b0; //Valid values: 16
   parameter ssvid_1 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_1 = 16'b0;  //Valid values: 16
   parameter ssid_1 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_1 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_1 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_1 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_1 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_1 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_1 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_1 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_1 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_1 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_1 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_1 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_1 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_1 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_1 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_1 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_1 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_1 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_1 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_1 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_1 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_1 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_1 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_1 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_1 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_1 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_1 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_1 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_1 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_1 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_1 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_1 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_1 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_1 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_1 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_1 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_1 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_1 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_1 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_1 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_1 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_1 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 1 - Config Register Settings END -------------

   //Func 2 - Config Register Settings START -------------
   parameter vendor_id_data_2 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_2 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_2 = 16'b1;   //Valid values: 16
   parameter device_id_2 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_2 = 8'b1;  //Valid values: 8
   parameter revision_id_2 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_2 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_2 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_2 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_2 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_2 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_2 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_2 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_2 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_2 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_2 = 3'b0; //Valid values: 3
   parameter maximum_current_2 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_2 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_2 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_2 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_2 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_2 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_2 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_2 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_2 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_2 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_2 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_2 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_2 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_2 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_2 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_2 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_2 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_2 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_2 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_2 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_2 = 3'b111;  //Valid values: 3
   parameter indicator_2 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_2 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_2 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_2 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_2 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_2 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_2 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_2 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_2 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_2 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_2 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_2 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_2 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_2 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_2 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_2 = 13'b0; //Valid values: 13
   parameter slot_number_2 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_2 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_2 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_2 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_2 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_2 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_2 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_2 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_2 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_2 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_2 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_2 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_2 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_2 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_2 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_2 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_2 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_2 = 11'b0;   //Valid values: 11
   parameter msix_table_size_2 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_2 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_2 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_2 = 29'b0; //Valid values: 29
   parameter msix_table_offset_2 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_2 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_2 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_2 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_2 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_2 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_2 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_2 = 16'b0; //Valid values: 16
   parameter ssvid_2 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_2 = 16'b0;  //Valid values: 16
   parameter ssid_2 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_2 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_2 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_2 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_2 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_2 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_2 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_2 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_2 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_2 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_2 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_2 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_2 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_2 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_2 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_2 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_2 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_2 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_2 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_2 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_2 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_2 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_2 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_2 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_2 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_2 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_2 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_2 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_2 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_2 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_2 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_2 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_2 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_2 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_2 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_2 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_2 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_2 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_2 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_2 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_2 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_2 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 2 - Config Register Settings END -------------

   //Func 3 - Config Register Settings START -------------
   parameter vendor_id_data_3 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_3 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_3 = 16'b1;   //Valid values: 16
   parameter device_id_3 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_3 = 8'b1;  //Valid values: 8
   parameter revision_id_3 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_3 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_3 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_3 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_3 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_3 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_3 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_3 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_3 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_3 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_3 = 3'b0; //Valid values: 3
   parameter maximum_current_3 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_3 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_3 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_3 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_3 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_3 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_3 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_3 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_3 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_3 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_3 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_3 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_3 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_3 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_3 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_3 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_3 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_3 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_3 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_3 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_3 = 3'b111;  //Valid values: 3
   parameter indicator_3 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_3 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_3 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_3 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_3 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_3 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_3 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_3 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_3 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_3 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_3 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_3 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_3 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_3 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_3 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_3 = 13'b0; //Valid values: 13
   parameter slot_number_3 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_3 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_3 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_3 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_3 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_3 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_3 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_3 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_3 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_3 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_3 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_3 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_3 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_3 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_3 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_3 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_3 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_3 = 11'b0;   //Valid values: 11
   parameter msix_table_size_3 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_3 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_3 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_3 = 29'b0; //Valid values: 29
   parameter msix_table_offset_3 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_3 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_3 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_3 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_3 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_3 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_3 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_3 = 16'b0; //Valid values: 16
   parameter ssvid_3 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_3 = 16'b0;  //Valid values: 16
   parameter ssid_3 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_3 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_3 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_3 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_3 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_3 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_3 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_3 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_3 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_3 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_3 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_3 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_3 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_3 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_3 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_3 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_3 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_3 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_3 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_3 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_3 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_3 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_3 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_3 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_3 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_3 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_3 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_3 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_3 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_3 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_3 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_3 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_3 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_3 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_3 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_3 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_3 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_3 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_3 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_3 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_3 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_3 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 3 - Config Register Settings END -------------

   //Func 4 - Config Register Settings START -------------
   parameter vendor_id_data_4 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_4 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_4 = 16'b1;   //Valid values: 16
   parameter device_id_4 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_4 = 8'b1;  //Valid values: 8
   parameter revision_id_4 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_4 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_4 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_4 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_4 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_4 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_4 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_4 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_4 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_4 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_4 = 3'b0; //Valid values: 3
   parameter maximum_current_4 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_4 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_4 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_4 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_4 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_4 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_4 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_4 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_4 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_4 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_4 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_4 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_4 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_4 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_4 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_4 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_4 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_4 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_4 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_4 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_4 = 3'b111;  //Valid values: 3
   parameter indicator_4 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_4 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_4 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_4 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_4 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_4 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_4 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_4 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_4 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_4 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_4 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_4 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_4 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_4 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_4 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_4 = 13'b0; //Valid values: 13
   parameter slot_number_4 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_4 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_4 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_4 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_4 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_4 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_4 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_4 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_4 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_4 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_4 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_4 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_4 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_4 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_4 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_4 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_4 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_4 = 11'b0;   //Valid values: 11
   parameter msix_table_size_4 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_4 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_4 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_4 = 29'b0; //Valid values: 29
   parameter msix_table_offset_4 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_4 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_4 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_4 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_4 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_4 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_4 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_4 = 16'b0; //Valid values: 16
   parameter ssvid_4 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_4 = 16'b0;  //Valid values: 16
   parameter ssid_4 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_4 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_4 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_4 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_4 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_4 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_4 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_4 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_4 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_4 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_4 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_4 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_4 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_4 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_4 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_4 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_4 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_4 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_4 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_4 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_4 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_4 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_4 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_4 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_4 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_4 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_4 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_4 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_4 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_4 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_4 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_4 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_4 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_4 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_4 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_4 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_4 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_4 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_4 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_4 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_4 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_4 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 4 - Config Register Settings END -------------

   //Func 5 - Config Register Settings START -------------
   parameter vendor_id_data_5 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_5 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_5 = 16'b1;   //Valid values: 16
   parameter device_id_5 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_5 = 8'b1;  //Valid values: 8
   parameter revision_id_5 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_5 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_5 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_5 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_5 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_5 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_5 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_5 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_5 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_5 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_5 = 3'b0; //Valid values: 3
   parameter maximum_current_5 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_5 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_5 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_5 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_5 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_5 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_5 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_5 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_5 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_5 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_5 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_5 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_5 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_5 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_5 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_5 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_5 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_5 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_5 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_5 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_5 = 3'b111;  //Valid values: 3
   parameter indicator_5 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_5 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_5 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_5 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_5 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_5 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_5 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_5 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_5 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_5 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_5 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_5 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_5 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_5 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_5 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_5 = 13'b0; //Valid values: 13
   parameter slot_number_5 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_5 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_5 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_5 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_5 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_5 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_5 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_5 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_5 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_5 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_5 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_5 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_5 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_5 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_5 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_5 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_5 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_5 = 11'b0;   //Valid values: 11
   parameter msix_table_size_5 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_5 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_5 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_5 = 29'b0; //Valid values: 29
   parameter msix_table_offset_5 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_5 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_5 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_5 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_5 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_5 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_5 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_5 = 16'b0; //Valid values: 16
   parameter ssvid_5 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_5 = 16'b0;  //Valid values: 16
   parameter ssid_5 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_5 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_5 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_5 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_5 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_5 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_5 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_5 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_5 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_5 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_5 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_5 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_5 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_5 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_5 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_5 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_5 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_5 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_5 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_5 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_5 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_5 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_5 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_5 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_5 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_5 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_5 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_5 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_5 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_5 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_5 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_5 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_5 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_5 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_5 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_5 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_5 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_5 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_5 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_5 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_5 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_5 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 5 - Config Register Settings END -------------

   //Func 6 - Config Register Settings START -------------
   parameter vendor_id_data_6 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_6 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_6 = 16'b1;   //Valid values: 16
   parameter device_id_6 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_6 = 8'b1;  //Valid values: 8
   parameter revision_id_6 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_6 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_6 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_6 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_6 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_6 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_6 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_6 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_6 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_6 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_6 = 3'b0; //Valid values: 3
   parameter maximum_current_6 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_6 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_6 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_6 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_6 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_6 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_6 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_6 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_6 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_6 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_6 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_6 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_6 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_6 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_6 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_6 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_6 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_6 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_6 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_6 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_6 = 3'b111;  //Valid values: 3
   parameter indicator_6 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_6 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_6 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_6 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_6 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_6 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_6 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_6 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_6 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_6 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_6 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_6 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_6 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_6 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_6 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_6 = 13'b0; //Valid values: 13
   parameter slot_number_6 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_6 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_6 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_6 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_6 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_6 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_6 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_6 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_6 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_6 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_6 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_6 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_6 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_6 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_6 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_6 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_6 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_6 = 11'b0;   //Valid values: 11
   parameter msix_table_size_6 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_6 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_6 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_6 = 29'b0; //Valid values: 29
   parameter msix_table_offset_6 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_6 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_6 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_6 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_6 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_6 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_6 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_6 = 16'b0; //Valid values: 16
   parameter ssvid_6 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_6 = 16'b0;  //Valid values: 16
   parameter ssid_6 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_6 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_6 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_6 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_6 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_6 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_6 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_6 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_6 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_6 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_6 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_6 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_6 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_6 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_6 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_6 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_6 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_6 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_6 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_6 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_6 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_6 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_6 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_6 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_6 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_6 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_6 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_6 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_6 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_6 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_6 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_6 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_6 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_6 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_6 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_6 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_6 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_6 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_6 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_6 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_6 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_6 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 6 - Config Register Settings END -------------

   //Func 7 - Config Register Settings START -------------
   parameter vendor_id_data_7 = 16'b1000101110010;   //Valid values: 16
   parameter vendor_id_7 = "vendor_id";  //Valid values: VENDOR_ID
   parameter device_id_data_7 = 16'b1;   //Valid values: 16
   parameter device_id_7 = "device_id";  //Valid values: DEVICE_ID
   parameter revision_id_data_7 = 8'b1;  //Valid values: 8
   parameter revision_id_7 = "revision_id"; //Valid values: REVISION_ID
   parameter class_code_data_7 = 24'b111111110000000000000000;   //Valid values: 24
   parameter class_code_7 = "class_code";   //Valid values: CLASS_CODE
   parameter subsystem_vendor_id_data_7 = 16'b1000101110010;  //Valid values: 16
   parameter subsystem_vendor_id_7 = "subsystem_vendor_id";   //Valid values: SUBSYSTEM_VENDOR_ID
   parameter subsystem_device_id_data_7 = 16'b1;  //Valid values: 16
   parameter subsystem_device_id_7 = "subsystem_device_id";   //Valid values: SUBSYSTEM_DEVICE_ID
   parameter no_soft_reset_7 = "false";  //Valid values: TRUE|FALSE
   parameter intel_id_access_7 = "false"; //Valid values: TRUE|FALSE
   parameter device_specific_init_7 = "false"; //Valid values TRUE|FALSE
   parameter maximum_current_data_7 = 3'b0; //Valid values: 3
   parameter maximum_current_7 = "maximum_current";  //Valid values: MAXIMUM_CURRENT
   parameter d1_support_7 = "false";  //Valid values: TRUE|FALSE
   parameter d2_support_7 = "false";  //Valid values: TRUE|FALSE
   parameter d0_pme_7 = "false";   //Valid values: TRUE|FALSE
   parameter d1_pme_7 = "false";   //Valid values: TRUE|FALSE
   parameter d2_pme_7 = "false";   //Valid values: TRUE|FALSE
   parameter d3_hot_pme_7 = "false";  //Valid values: TRUE|FALSE
   parameter d3_cold_pme_7 = "false"; //Valid values: TRUE|FALSE
   parameter use_aer_7 = "false";  //Valid values: TRUE|FALSE
   parameter low_priority_vc_7 = "single_vc";  //Valid values: SINGLE_VC
   parameter vc_arbitration_7 = "single_vc";   //Valid values: SINGLE_VC
   parameter disable_snoop_packet_7 = "false"; //Valid values: TRUE|FALSE
   parameter max_payload_size_7 = "payload_512";  //Valid values: PAYLOAD_128|PAYLOAD_256|PAYLOAD_512|PAYLOAD_1024|PAYLOAD_2048|PAYLOAD_4096
   parameter surprise_down_error_support_7 = "false";   //Valid values: TRUE|FALSE
   parameter dll_active_report_support_7 = "false";  //Valid values: TRUE|FALSE
   parameter extend_tag_field_7 = "false";  //Valid values: TRUE|FALSE
   parameter endpoint_l0_latency_data_7 = 3'b0;   //Valid values: 3
   parameter endpoint_l0_latency_7 = "endpoint_l0_latency";   //Valid values: ENDPOINT_L0_LATENCY
   parameter endpoint_l1_latency_data_7 = 3'b0;   //Valid values: 3
   parameter endpoint_l1_latency_7 = "endpoint_l1_latency";   //Valid values: ENDPOINT_L1_LATENCY
   parameter indicator_data_7 = 3'b111;  //Valid values: 3
   parameter indicator_7 = "indicator";  //Valid values: INDICATOR
   parameter role_based_error_reporting_7 = "false"; //Valid values: TRUE|FALSE
   parameter slot_power_scale_data_7 = 2'b0;   //Valid values: 2
   parameter slot_power_scale_7 = "slot_power_scale";   //Valid values: SLOT_POWER_SCALE
   parameter max_link_width_7 = "x4"; //Valid values: X1|X2|X4|X8
   parameter enable_l1_aspm_7 = "false"; //Valid values: TRUE|FALSE
   parameter enable_l0s_aspm_7 = "false";   //Valid values: TRUE|FALSE
   parameter l1_exit_latency_sameclock_data_7 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_sameclock_7 = "l1_exit_latency_sameclock";   //Valid values: L1_EXIT_LATENCY_SAMECLOCK
   parameter l1_exit_latency_diffclock_data_7 = 3'b0;   //Valid values: 3
   parameter l1_exit_latency_diffclock_7 = "l1_exit_latency_diffclock";   //Valid values: L1_EXIT_LATENCY_DIFFCLOCK
   parameter hot_plug_support_data_7 = 7'b0;   //Valid values: 7
   parameter hot_plug_support_7 = "hot_plug_support";   //Valid values: HOT_PLUG_SUPPORT
   parameter slot_power_limit_data_7 = 8'b0;   //Valid values: 8
   parameter slot_power_limit_7 = "slot_power_limit";   //Valid values: SLOT_POWER_LIMIT
   parameter slot_number_data_7 = 13'b0; //Valid values: 13
   parameter slot_number_7 = "slot_number"; //Valid values: SLOT_NUMBER
   parameter diffclock_nfts_count_data_7 = 8'b0;  //Valid values: 8
   parameter diffclock_nfts_count_7 = "diffclock_nfts_count"; //Valid values: DIFFCLOCK_NFTS_COUNT
   parameter sameclock_nfts_count_data_7 = 8'b0;  //Valid values: 8
   parameter sameclock_nfts_count_7 = "sameclock_nfts_count"; //Valid values: SAMECLOCK_NFTS_COUNT
   parameter completion_timeout_7 = "abcd"; //Valid values: NONE|A|B|AB|BC|ABC|BCD|ABCD
   parameter enable_completion_timeout_disable_7 = "true"; //Valid values: TRUE|FALSE
   parameter extended_tag_reset_7 = "false";   //Valid values: TRUE|FALSE
   parameter ecrc_check_capable_7 = "true"; //Valid values: TRUE|FALSE
   parameter ecrc_gen_capable_7 = "true";   //Valid values: TRUE|FALSE
   parameter no_command_completed_7 = "true";  //Valid values: TRUE|FALSE
   parameter msi_multi_message_capable_7 = "count_4";   //Valid values: COUNT_1|COUNT_2|COUNT_4|COUNT_8|COUNT_16|COUNT_32
   parameter msi_64bit_addressing_capable_7 = "true";   //Valid values: TRUE|FALSE
   parameter msi_masking_capable_7 = "false";  //Valid values: TRUE|FALSE
   parameter msi_support_7 = "true";  //Valid values: TRUE|FALSE
   parameter interrupt_pin_7 = "inta";   //Valid values: NONE|INTA|INTB|INTC|INTD
   parameter enable_function_msix_support_7 = "true";   //Valid values: TRUE|FALSE
   parameter msix_table_size_data_7 = 11'b0;   //Valid values: 11
   parameter msix_table_size_7 = "msix_table_size";  //Valid values: MSIX_TABLE_SIZE
   parameter msix_table_bir_data_7 = 3'b0;  //Valid values: 3
   parameter msix_table_bir_7 = "msix_table_bir"; //Valid values: MSIX_TABLE_BIR
   parameter msix_table_offset_data_7 = 29'b0; //Valid values: 29
   parameter msix_table_offset_7 = "msix_table_offset"; //Valid values: MSIX_TABLE_OFFSET
   parameter msix_pba_bir_data_7 = 3'b0; //Valid values: 3
   parameter msix_pba_bir_7 = "msix_pba_bir";  //Valid values: MSIX_PBA_BIR
   parameter msix_pba_offset_data_7 = 29'b0;   //Valid values: 29
   parameter msix_pba_offset_7 = "msix_pba_offset";  //Valid values: MSIX_PBA_OFFSET
   parameter bridge_port_vga_enable_7 = "false";  //Valid values: TRUE|FALSE
   parameter bridge_port_ssid_support_7 = "false";   //Valid values: TRUE|FALSE
   parameter ssvid_data_7 = 16'b0; //Valid values: 16
   parameter ssvid_7 = "ssvid"; //Valid values: SSVID
   parameter ssid_data_7 = 16'b0;  //Valid values: 16
   parameter ssid_7 = "ssid";   //Valid values: SSID
   parameter eie_before_nfts_count_data_7 = 4'b100;  //Valid values: 4
   parameter eie_before_nfts_count_7 = "eie_before_nfts_count";  //Valid values: EIE_BEFORE_NFTS_COUNT
   parameter gen2_diffclock_nfts_count_data_7 = 8'b11111111;  //Valid values: 8
   parameter gen2_diffclock_nfts_count_7 = "gen2_diffclock_nfts_count";   //Valid values: GEN2_DIFFCLOCK_NFTS_COUNT
   parameter gen2_sameclock_nfts_count_data_7 = 8'b11111111;  //Valid values: 8
   parameter gen2_sameclock_nfts_count_7 = "gen2_sameclock_nfts_count";   //Valid values: GEN2_SAMECLOCK_NFTS_COUNT
   parameter deemphasis_enable_7 = "false"; //Valid values: TRUE|FALSE
   parameter pcie_spec_version_7 = "v2"; //Valid values: V1|V2|V3
   parameter l0_exit_latency_sameclock_data_7 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_sameclock_7 = "l0_exit_latency_sameclock";   //Valid values: L0_EXIT_LATENCY_SAMECLOCK
   parameter l0_exit_latency_diffclock_data_7 = 3'b110; //Valid values: 3
   parameter l0_exit_latency_diffclock_7 = "l0_exit_latency_diffclock";   //Valid values: L0_EXIT_LATENCY_DIFFCLOCK
   parameter rx_ei_l0s_7 = "disable"; //Valid values: DISABLE|ENABLE
   parameter l2_async_logic_7 = "enable";   //Valid values: ENABLE|DISABLE
   parameter aspm_optionality_7 = "true";   //Valid values: TRUE|FALSE
   parameter flr_capability_7 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_io_space_7 = "false";  //Valid values: TRUE|FALSE
   parameter bar0_64bit_mem_space_7 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_prefetchable_7 = "true";  //Valid values: TRUE|FALSE
   parameter bar0_size_mask_data_7 = 28'b1111111111111111111111111111; //Valid values: 28
   parameter bar0_size_mask_7 = "bar0_size_mask"; //Valid values: BAR0_SIZE_MASK
   parameter bar1_io_space_7 = "false";  //Valid values: TRUE|FALSE
   parameter bar1_64bit_mem_space_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_prefetchable_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar1_size_mask_data_7 = 28'b0; //Valid values: 28
   parameter bar1_size_mask_7 = "bar1_size_mask"; //Valid values: BAR1_SIZE_MASK
   parameter bar2_io_space_7 = "false";  //Valid values: TRUE|FALSE
   parameter bar2_64bit_mem_space_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_prefetchable_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar2_size_mask_data_7 = 28'b0; //Valid values: 28
   parameter bar2_size_mask_7 = "bar2_size_mask"; //Valid values: BAR2_SIZE_MASK
   parameter bar3_io_space_7 = "false";  //Valid values: TRUE|FALSE
   parameter bar3_64bit_mem_space_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_prefetchable_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar3_size_mask_data_7 = 28'b0; //Valid values: 28
   parameter bar3_size_mask_7 = "bar3_size_mask"; //Valid values: BAR3_SIZE_MASK
   parameter bar4_io_space_7 = "false";  //Valid values: TRUE|FALSE
   parameter bar4_64bit_mem_space_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_prefetchable_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar4_size_mask_data_7 = 28'b0; //Valid values: 28
   parameter bar4_size_mask_7 = "bar4_size_mask"; //Valid values: BAR4_SIZE_MASK
   parameter bar5_io_space_7 = "false";  //Valid values: TRUE|FALSE
   parameter bar5_64bit_mem_space_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_prefetchable_7 = "false"; //Valid values: TRUE|FALSE
   parameter bar5_size_mask_data_7 = 28'b0; //Valid values: 28
   parameter bar5_size_mask_7 = "bar5_size_mask"; //Valid values: BAR5_SIZE_MASK
   parameter expansion_base_address_register_data_7 = 32'b0;  //Valid values: 32
   parameter expansion_base_address_register_7 = "expansion_base_address_register";   //Valid values: EXPANSION_BASE_ADDRESS_REGISTER
   parameter io_window_addr_width_7 = "window_32_bit";  //Valid values: NONE|WINDOW_16_BIT|WINDOW_32_BIT
   parameter prefetchable_mem_window_addr_width_7 = "prefetch_32";  //Valid values: PREFETCH_0|PREFETCH_32|PREFETCH_64
   //Func 7 - Config Register Settings END -------------


   parameter porttype_func0 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func1 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func2 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func3 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func4 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func5 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func6 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter porttype_func7 = "ep_native"; //Vaild values: bridge|ep_native|ep_legacy
   parameter rxfreqlk_cnt_data = 20'h0;
   parameter rxfreqlk_cnt = "rxfreqlk_prog_cnt"; //Valid values: RXFREQLK_PROG_CNT
   parameter rxfreqlk_cnt_en = "true"; //Vaild values: TRUE|FALSE
   parameter testmode_control = "disable"; //Valid values: ENABLE|DISABLE
   parameter skp_insertion_control = "disable"; //Valid values: ENABLE|DISABLE
   parameter tx_l0s_adjust = "disable"; //Valid values: ENABLE|DISABLE
   parameter rx_cdc_almost_full_data = 4'h0; //Valid values: 4
   parameter rx_cdc_almost_full = "rx_cdc_almost_full";  //Valid values: RX_CDC_ALMOST_FULL
   parameter tx_cdc_almost_full_data = 4'h0; //Valid values: 4
   parameter tx_cdc_almost_full = "tx_cdc_almost_full";  //Valid values: TX_CDC_ALMOST_FULL
   parameter rx_l0s_count_idl_data = 8'b0;   //Valid values: 8
   parameter rx_l0s_count_idl = "rx_l0s_count_idl";   //Valid values: RX_L0S_COUNT_IDL
   parameter cdc_dummy_insert_limit_data = 4'h0;   //Valid values: 4
   parameter cdc_dummy_insert_limit = "cdc_dummy_insert_limit";   //Valid values: CDC_DUMMY_INSERT_LIMIT
   parameter ei_delay_powerdown_count_data = 8'b1010; //Valid values: 8
   parameter ei_delay_powerdown_count = "ei_delay_powerdown_count";  //Valid values: EI_DELAY_POWERDOWN_COUNT
   parameter millisecond_cycle_count_data = 20'b0; //Valid values: 20
   parameter millisecond_cycle_count = "millisecond_cycle_count"; //Valid values: MILLISECOND_CYCLE_COUNT
   parameter skp_os_schedule_count_data = 11'b0;   //Valid values: 11
   parameter skp_os_schedule_count = "skp_os_schedule_count";  //Valid values: SKP_OS_SCHEDULE_COUNT
   parameter fc_init_timer_data = 11'b10000000000; //Valid values: 11
   parameter fc_init_timer = "fc_init_timer";   //Valid values: FC_INIT_TIMER
   parameter l01_entry_latency_data = 5'b11111; //Valid values: 5
   parameter l01_entry_latency = "l01_entry_latency"; //Valid values: L01_ENTRY_LATENCY
   parameter flow_control_update_count_data = 5'b11110;  //Valid values: 5
   parameter flow_control_update_count = "flow_control_update_count";   //Valid values: FLOW_CONTROL_UPDATE_COUNT
   parameter flow_control_timeout_count_data = 8'b11001000; //Valid values: 8
   parameter flow_control_timeout_count = "flow_control_timeout_count"; //Valid values: FLOW_CONTROL_TIMEOUT_COUNT
   parameter vc0_rx_flow_ctrl_posted_header_data = 8'b110010;  //Valid values:8'h12
   parameter vc0_rx_flow_ctrl_posted_header = "vc0_rx_flow_ctrl_posted_header";  //Valid values: VC0_RX_FLOW_CTRL_POSTED_HEADER
   parameter vc0_rx_flow_ctrl_posted_data_data = 12'b000001011110;   //Valid values: 12'h5E
   parameter vc0_rx_flow_ctrl_posted_data = "vc0_rx_flow_ctrl_posted_data";   //Valid values: VC0_RX_FLOW_CTRL_POSTED_DATA
   parameter vc0_rx_flow_ctrl_nonposted_header_data = 8'b00100000;  //Valid values: 8'h20
   parameter vc0_rx_flow_ctrl_nonposted_header = "vc0_rx_flow_ctrl_nonposted_header";  //Valid values: VC0_RX_FLOW_CTRL_NONPOSTED_HEADER
   parameter vc0_rx_flow_ctrl_nonposted_data_data = 8'b0;   //Valid values: 8'h00
   parameter vc0_rx_flow_ctrl_nonposted_data = "vc0_rx_flow_ctrl_nonposted_data";   //Valid values: VC0_RX_FLOW_CTRL_NONPOSTED_DATA
   parameter vc0_rx_flow_ctrl_compl_header_data = 8'b0;  //Valid values: 8'b0
   parameter vc0_rx_flow_ctrl_compl_header = "vc0_rx_flow_ctrl_compl_header"; //Valid values: VC0_RX_FLOW_CTRL_COMPL_HEADER
   parameter vc0_rx_flow_ctrl_compl_data_data = 12'b0; //Valid values: 12'b0
   parameter vc0_rx_flow_ctrl_compl_data = "vc0_rx_flow_ctrl_compl_data";  //Valid values: VC0_RX_FLOW_CTRL_COMPL_DATA
   parameter rx_ptr0_posted_dpram_min_data = 10'b0;   //Valid values: 11
   parameter rx_ptr0_posted_dpram_min = "rx_ptr0_posted_dpram_min";  //Valid values: RX_PTR0_POSTED_DPRAM_MIN
   parameter rx_ptr0_posted_dpram_max_data = 10'b0;   //Valid values: 11
   parameter rx_ptr0_posted_dpram_max = "rx_ptr0_posted_dpram_max";  //Valid values: RX_PTR0_POSTED_DPRAM_MAX
   parameter rx_ptr0_nonposted_dpram_min_data = 10'b0;   //Valid values: 11
   parameter rx_ptr0_nonposted_dpram_min = "rx_ptr0_nonposted_dpram_min";  //Valid values: RX_PTR0_NONPOSTED_DPRAM_MIN
   parameter rx_ptr0_nonposted_dpram_max_data = 10'b0;   //Valid values: 11
   parameter rx_ptr0_nonposted_dpram_max = "rx_ptr0_nonposted_dpram_max";  //Valid values: RX_PTR0_NONPOSTED_DPRAM_MAX
   parameter retry_buffer_last_active_address_data = 8'b11111111; //Valid values: 10
   //parameter retry_buffer_last_active_address = "retry_buffer_last_active_address"; //Valid values: RETRY_BUFFER_LAST_ACTIVE_ADDRESS
   parameter retry_buffer_memory_settings_data           = 16'h0006;
   parameter retry_buffer_memory_settings = "retry_buffer_memory_settings";   //Valid values: RETRY_BUFFER_MEMORY_SETTINGS
   parameter vc0_rx_buffer_memory_settings_data          = 16'h0006;
   parameter vc0_rx_buffer_memory_settings = "vc0_rx_buffer_memory_settings"; //Valid values: VC0_RX_BUFFER_MEMORY_SETTINGS
   parameter bist_memory_settings_data = 75'b0; //Valid values: 75
   parameter bist_memory_settings = "bist_memory_settings"; //Valid values: BIST_MEMORY_SETTINGS
   parameter bridge_66mhzcap = "true"; //Valid values: TRUE|FALSE
   parameter fastb2bcap = "true";  //Valid values: TRUE|FALSE
   parameter devseltim = "fast_devsel_decoding"; //Valid values: FAST_DEVSEL_DECODING|MEDIUM_DEVSEL_DECODING|SLOW_DEVSEL_DECODING|RESERVED
   parameter memwrinv = "ro"; //Valid values: RO|RW
   parameter credit_buffer_allocation_aux = "balanced";  //Valid values: BALANCED|INITIATOR|TARGET|ABSOLUTE
   parameter enable_adapter_half_rate_mode = "false"; //Valid values: TRUE|FALSE
   parameter vc0_clk_enable = "true";  //Valid values: TRUE|FALSE
   parameter vc1_clk_enable = "false"; //Valid values: TRUE|FALSE
   parameter register_pipe_signals = "false";   //Valid values: TRUE|FALSE
   parameter iei_enable_settings = "gen2_infei_infsd_gen1_infei_sd"; //Valid values: DISABLE_IEI_LOGIC|GEN2_INFEI_INFSD_GEN1_INFEI_INFSD|GEN2_INFEI_GEN1_INFEI|GEN2_INFEI_GEN1_INFEI_SD|GEN2_INFEI_INFSD_GEN1_INFEI_SD
   parameter lattim_ro_data = 7'b0001000; //Valid values: RO|RW
   parameter lattim = "ro"; //Valid values: RO|RW
   parameter br_rcb = "ro"; //Valid values: RO|RW
   parameter vsec_id_data = 16'h1172;  //Valid values: 16
   parameter vsec_id = "vsec_id";   //Valid values: VSEC_ID
   parameter cvp_enable = "cvp_dis"; // Enable CVP
   parameter cvp_rate_sel = "full_rate";  //Valid values: FULL_RATE|HALF_RATE
   parameter hard_reset_bypass = "false"; //Valid values: FALSE|TRUE
   parameter cvp_data_compressed = "false";  //Valid values: FALSE|TRUE
   parameter cvp_data_encrypted = "false";   //Valid values: FALSE|TRUE
   parameter cvp_mode_reset = "false"; //Valid values: FALSE|TRUE
   parameter cvp_clk_reset = "false";  //Valid values: FALSE|TRUE
   parameter vsec_cap_data = 4'b0;  //Valid values: 4
   parameter vsec_cap = "vsec_cap"; //Valid values: VSEC_CAP
   parameter jtag_id_data = 128'b0;  //Valid values: 128
   parameter jtag_id = "jtag_id";   //Valid values: JTAG_ID
   parameter user_id_data = 16'b0;  //Valid values: 16
   parameter user_id = "user_id";   //Valid values: USER_ID
   parameter disable_auto_crs = "disable"; //Valid values: DISABLE|ENABLE

   // Hard reset controller section

   parameter hrdrstctrl_en                      = "hrdrstctrl_dis";//"hrdrstctrl_dis", "hrdrstctrl_en".

   parameter rstctrl_pld_clr                    = "false";// "false", "true".
   parameter rstctrl_debug_en                   = "false";// "false", "true".
   parameter rstctrl_force_inactive_rst         = "false";// "false", "true".
   parameter rstctrl_perst_enable               = "level";// "level", "neg_edge", "not_used".
   parameter rstctrl_hip_ep                     = "hip_ep";      //"hip_ep", "hip_not_ep".
   parameter rstctrl_hard_block_enable          = "hard_rst_ctl";//"hard_rst_ctl", "pld_rst_ctl".
   parameter rstctrl_rx_pma_rstb_inv            = "false";//"false", "true".
   parameter rstctrl_tx_pma_rstb_inv            = "false";//"false", "true".
   parameter rstctrl_rx_pcs_rst_n_inv           = "false";//"false", "true".
   parameter rstctrl_tx_pcs_rst_n_inv           = "false";//"false", "true".
   parameter rstctrl_altpe2_crst_n_inv          = "false";//"false", "true".
   parameter rstctrl_altpe2_srst_n_inv          = "false";//"false", "true".
   parameter rstctrl_altpe2_rst_n_inv           = "false";//"false", "true".
   parameter rstctrl_tx_pma_syncp_inv           = "false";//"false", "true".
   parameter rstctrl_1us_count_fref_clk         = "rstctrl_1us_cnt";//
   parameter rstctrl_1us_count_fref_clk_value   = 20'b00000000000000111111;//
   parameter rstctrl_1ms_count_fref_clk         = "rstctrl_1ms_cnt";//
   parameter rstctrl_1ms_count_fref_clk_value   = 20'b00001111010000100100;//

   parameter rstctrl_off_cal_done_select        = "not_active";// "ch0_sel", "ch01_sel", "ch0123_sel", "ch0123_5678_sel", "not_active".
   parameter rstctrl_rx_pma_rstb_cmu_select     = "not_active";// "ch1cmu_sel", "ch4cmu_sel", "ch4_10cmu_sel", "not_active".
   parameter rstctrl_rx_pma_rstb_select         = "not_active";// "ch01_out", "ch014_out", "ch01234_out", "ch012345678_out", "ch012345678_10_out", "not_active".
   parameter rstctrl_rx_pll_freq_lock_select    = "not_active";// "ch0_sel", "ch01_sel", "ch0123_sel", "ch0123_5678_sel", "not_active", "ch0_phs_sel", "ch01_phs_sel", "ch0123_phs_sel", "ch0123_5678_phs_sel".
   parameter rstctrl_mask_tx_pll_lock_select    = "not_active";// "ch1_sel", "ch4_sel", "ch4_10_sel", "not_active".
   parameter rstctrl_rx_pll_lock_select         = "not_active";// "ch0_sel", "ch01_sel", "ch0123_sel", "ch0123_5678_sel", "not_active".
   parameter rstctrl_perstn_select              = "perstn_pin";// "perstn_pin", "perstn_pld".
   parameter rstctrl_tx_lc_pll_rstb_select      = "not_active";// "ch1_out", "ch7_out", "not_active".
   parameter rstctrl_fref_clk_select            = "ch0_sel";// "ch0_sel", "ch1_sel", "ch2_sel", "ch3_sel", "ch4_sel", "ch5_sel", "ch6_sel", "ch7_sel", "ch8_sel", "ch9_sel", "ch10_sel", "ch11_sel".
   parameter rstctrl_off_cal_en_select          = "not_active";// "ch0_out", "ch01_out", "ch0123_out", "ch0123_5678_out", "not_active".
   parameter rstctrl_tx_pma_syncp_select        = "not_active";// "ch1_out", "ch4_out", "ch4_10_out", "not_active".
   parameter rstctrl_rx_pcs_rst_n_select        = "not_active";// "ch0_out", "ch01_out", "ch0123_out", "ch012345678_out", "ch012345678_10_out", "not_active".
   parameter rstctrl_tx_cmu_pll_lock_select     = "not_active";// "ch1_sel", "ch4_sel", "ch4_10_sel", "not_active".
   parameter rstctrl_tx_pcs_rst_n_select        = "not_active";// "ch0_out", "ch01_out", "ch0123_out", "ch012345678_out", "ch012345678_10_out", "not_active".
   parameter rstctrl_tx_lc_pll_lock_select      = "not_active";// "ch1_sel", "ch7_sel", "not_active".

   parameter rstctrl_timer_a        = "rstctrl_timer_a";
   parameter rstctrl_timer_a_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_a_value  = 8'b00001010;
   parameter rstctrl_timer_b        = "rstctrl_timer_b";
   parameter rstctrl_timer_b_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_b_value  = 8'b00001010;
   parameter rstctrl_timer_c        = "rstctrl_timer_c";
   parameter rstctrl_timer_c_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_c_value  = 8'b00001010;
   parameter rstctrl_timer_d        = "rstctrl_timer_d";
   parameter rstctrl_timer_d_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_d_value  = 8'b00010100;
   parameter rstctrl_timer_e        = "rstctrl_timer_e";
   parameter rstctrl_timer_e_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_e_value  = 8'h1;
   parameter rstctrl_timer_f        = "rstctrl_timer_f";
   parameter rstctrl_timer_f_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_f_value  = 8'b00001010;
   parameter rstctrl_timer_g        = "rstctrl_timer_g";
   parameter rstctrl_timer_g_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_g_value  = 8'b00001010;
   parameter rstctrl_timer_h        = "rstctrl_timer_h";
   parameter rstctrl_timer_h_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_h_value  = 8'b00000100;
   parameter rstctrl_timer_i        = "rstctrl_timer_i";
   parameter rstctrl_timer_i_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_i_value  = 8'b00010100;
   parameter rstctrl_timer_j        = "rstctrl_timer_j";
   parameter rstctrl_timer_j_type   = "milli_secs";//possible values are: "not_enabled", "milli_secs", "micro_secs", "fref_cycles"
   parameter rstctrl_timer_j_value  = 8'b00010100;
   parameter rstctrl_ltssm_disable  = "false";               //possible values are "true", "false"
   parameter cvp_isolation        = "enable"; //possible values are "enable" "disable"

   output pldclkinuse;
   output  [5:0]     txcredfchipcons; //PLD TL to AL Indicates that HIP consumed one of PH PD, NPH, NPD, CH, CD
   output  [5:0]     txcredfcinfinite; //PLD TL to AL Indicates if this is an infinite credit PH PD, NPH, NPD, CH, CD
   output  [7:0]     txcredhdrfcp;    //PLD TL to AL Header credit of the received FC Posted.
   output  [11:0]    txcreddatafcp;   //PLD TL to AL Signals the Data credit of the received FC Posted
   output  [7:0]     txcredhdrfcnp;   //PLD TL to AL Header credit of the received FC Non Posted
   output  [11:0]    txcreddatafcnp;  //PLD TL to AL Signals the Data credit of the received FC Non Posted
   output  [7:0]     txcredhdrfccp;   //PLD TL to AL Header credit of the received FC completion.
   output  [11:0]    txcreddatafccp;  //PLD TL to AL Signals the Data credit of the received FC completion
   output cvpclk;                     //CB
   output [31:0] cvpdata;             //CB
   output cvpstartxfer;              //CB
   output cvpconfig;                  //CB
   output cvpfullconfig;             //CB
   output tlappintback;             //PLD
   output tlappintcack;             //PLD
   output tlappintdack;             //PLD
   output [7:0] flrsts;               //PLD
   output txswing0;            //PCS-PMA
   output txswing1;            //PCS-PMA
   output txswing2;            //PCS-PMA
   output txswing3;            //PCS-PMA
   output txswing4;            //PCS-PMA
   output txswing5;            //PCS-PMA
   output txswing6;            //PCS-PMA
   output txswing7;            //PCS-PMA

   input pldcoreready;
   input usermode;                    //CB    -- use to gate off input signal
   input hippartialreconfign;         //CB    -- use to gate off output signal
   input [2:0] tlpmeventfunc;       //PLD
   input [2:0] tlappintafuncnum;   //PLD
   input tlappintbsts;              //PLD
   input [2:0] tlappintbfuncnum;   //PLD
   input tlappintcsts;              //PLD
   input [2:0] tlappintcfuncnum;   //PLD
   input tlappintdsts;              //PLD
   input [2:0] tlappintdfuncnum;   //PLD
   input [2:0] tlappmsifunc;        //PLD
   input [7:0] cplpending;            //PLD
   input [2:0] cplerrfunc;           //PLD
   input [7:0] flrreset;              //PLD
   input cvpconfigready;             //CB
   input cvpen;                       //CB
   input cvpconfigerror;             //CB
   input cvpconfigdone;              //CB



   input pclkch0;                     //PCS-PMA
   input pclkch1;                     //PCS-PMA
   input pclkcentral;                 //PCS-PMA
   input pllfixedclkch0;            //PCS-PMA
   input pllfixedclkch1;            //PCS-PMA
   input pllfixedclkcentral;        //PCS-PMA

   input rxfreqlocked0;            //PCS-PMA
   input rxfreqlocked1;            //PCS-PMA
   input rxfreqlocked2;            //PCS-PMA
   input rxfreqlocked3;            //PCS-PMA
   input rxfreqlocked4;            //PCS-PMA
   input rxfreqlocked5;            //PCS-PMA
   input rxfreqlocked6;            //PCS-PMA
   input rxfreqlocked7;            //PCS-PMA

   // CSR interface
   input   csrclk;                //CB    // CSR clock
   input   csrin;                 //CB    // Serial CSR input
   input   csren;                 //CB    // CSR enable
   output  csrout;                //CB    // Serial CSR output

   // CSR test mux interface
   input  csrcbdin;               //CB    // CSR configuration mode data input
   input  csrtcsrin;              //CB    // CSR test/scan mode data input
   input  csrdin;                 //CB    // Previous CSR bit data output
   input  csrseg;                 //CB    // VSS for Seg0, VCC for seg[31:1]
   input  csrenscan;              //CB    // enable scan control input
   input  csrtverify;             //CB    // test verify control input
   input  csrloadcsr;            //CB    // JTAG scan mode control input
   input  csrpipein;             //CB    // Input to the Pipeline register to suport 200MHz
   output csrdout;                //CB    // CSR input MUX Data output
   output csrpipeout;            //CB    // Pipelined register data output

   // AVMM interface
   input   avmmrstn;             //PLD   // DPRIO reset
   input   avmmclk;               //PLD   // DPRIO clock
   input   avmmwrite;             //PLD   // write enable input
   input   avmmread;              //PLD   // read enable input
   input   [1:0]   avmmbyteen;   //PLD   // Byte enable
   input   [9:0]   avmmaddress;   //PLD   // address input
   input   [15:0]  avmmwritedata; //PLD   // write data input
   input   sershiftload;         //CB    // 1'b1=shift in data from si into scan flop
                                           // 1'b0=load data from writedata into scan flop
   input   interfacesel;          //PLD   // Interface selection inputs
                                           // 1'b1: select CSR as a source for CRAM
                                           // 1'b0: select Avalon-MM interface
   output  [15:0]  avmmreaddata;  //PLD   // Read data output

   // MDIO interface
   input   mdioclk;               //PLD   // MDIO clock
   input   mdioin;                //PLD   // MDIO serial input
   input   cbhipmdioen;         //PLD   // Control block option bit to block MDIO IOs
   input   [1:0]   mdiodevaddr;  //PLD   // MDIO device address tied at PLD interface

   output  mdioout;               //PLD   // MDIO serial output
   output  mdiooenn;             //PLD   // MDIO output enable


   // LMI interface
   output [31:0]   lmidout;       //PLD
   output          lmiack;        //PLD
   input           lmirden;       //PLD
   input           lmiwren;       //PLD
   input  [14:0]   lmiaddr;       //PLD
   input  [31:0]   lmidin;        //PLD

   // Global clock and reset IOs
   output           resetstatus;  //PLD
   output           l2exit;       //PLD
   output           hotrstexit;   //PLD
   output           dlupexit;     //PLD

   input            pldclk;       //PLD
   input            pldsrst;      //PLD
   input            pldrst;       //PLD
   //input            phyclk;
   //input            pllfixedclk;
   input            phyrst;       //PLD
   input            physrst;      //PLD
   //input            coreclk;
   input       coreclkin;        //PLD
   output      coreclkout;       //PLD
   input       corerst;           //PLD
   input       corepor;           //PLD
   input       corecrst;          //PLD
   input       coresrst;          //PLD


   // Global signals for SW mode
   output           swdnwake;         //PLD
   output           swuphotrst;       //PLD

   input  [2:0]     swdnin;       //PLD
   input  [6:0]     swupin;       //PLD

   // User Interface signals for VC0
   output        rxvalidvc0;     //PLD
   output        rxerrvc0;           //PLD   // uncorrectable error
   output [2:0]  rxbardecfuncnumvc0;  //PLD
   output [7:0]  rxbardecvc0;       //PLD
   output        rxsopvc00;     //PLD
   output        rxeopvc00;     //PLD
   output [63:0] rxdatavc00;    //PLD
   output [7:0]  rxbevc00;      //PLD
   output        rxsopvc01;     //PLD
   output        rxeopvc01;     //PLD
   output [63:0] rxdatavc01;    //PLD
   output [7:0]  rxbevc01;      //PLD
   output        rxfifofullvc0; //PLD
   output        rxfifoemptyvc0;//PLD
   output [3:0]  rxfifowrpvc0;  //PLD
   output [3:0]  rxfifordpvc0;  //PLD
   output [35:0] txcredvc0;      //PLD
   output        txreadyvc0;     //PLD
     //for FIFO monitoring
   output           txfifofullvc0;  //PLD
   output           txfifoemptyvc0; //PLD
   output [3:0]     txfifowrpvc0;   //PLD
   output [3:0]     txfifordpvc0;   //PLD

   input            rxmaskvc0;       //PLD
   input            rxreadyvc0;      //PLD
   input            txvalidvc0;      //PLD
   input            txerrvc0;        //PLD
   input            txsopvc00;      //PLD
   input            txeopvc00;      //PLD
   input  [63:0]    txdatavc00;     //PLD
   input            txsopvc01;      //PLD
   input            txeopvc01;      //PLD
   input  [63:0]    txdatavc01;     //PLD

   // User Interface signals for VC1
     //for FIFO monitoring



   // Power Management signals
   output           tlpmetosr;      //PLD

   input            tlpmetocr;      //PLD
   input            tlpmevent;       //PLD
   input  [9:0]     tlpmdata;        //PLD
   input            tlpmauxpwr;      //PLD

   // Control Status Register signals
   output [122:0]   tlcfgsts;        //PLD
   output           tlcfgstswr;     //PLD
   output [31:0]    tlcfgctl;        //PLD
   output           tlcfgctlwr;     //PLD
   output [6:0]     tlcfgadd;        //PLD

   // Interrupt signals
   output           tlappintaack;   //PLD
   output           tlappmsiack;    //PLD
   output [3:0]     intstatus;        //PLD
   output [3:0]     laneact;          //PLD
   output [4:0]     dlltssm;          //PLD
   output           clrrxpath;        //PLD
   output [1:0]     dlcurrentspeed;  //PLD

   input            tlappintasts;   //PLD
   input            tlappmsireq;    //PLD
   input [2:0]      tlappmsitc;     //PLD
   input [4:0]      tlappmsinum;    //PLD
   input [4:0]      tlaermsinum;    //PLD
   input [4:0]      tlpexmsinum;    //PLD
   input [4:0]      tlhpgctrler;     //PLD


   input            dlcomclkreg;     //PLD   // ww51.5 change by Ning Xue
   input  [7:0]     dlvcctrl;        //PLD
   input  [12:0]    dlctrllink2;     //PLD

   // Test Port Interface signals
   output [63:0]    testouthip;  //PLD
   output           ev1us;        //PLD
   output           ev128ns;      //PLD
   output           wakeoen;      //PLD
   output           serrout;      //PLD

   input            tlslotclkcfg;//PLD
   input  [1:0]     mode;          //PLD
   input  [39:0]    testinhip;   //PLD
   input  [6:0]     cplerr;       //PLD
   input  [15:0]    pcierr;       //PLD

   // PIPE interface signals
   output           rate0;         //PCS
   output           rate1;         //PCS
   output           rate2;         //PCS
   output           rate3;         //PCS
   output           rate4;         //PCS
   output           rate5;         //PCS
   output           rate6;         //PCS
   output           rate7;         //PCS
   output           rate8;         //PCS
   //output           ratetiedtognd;  //PCS
   output [2:0]     eidleinfersel0;  //PCS
   output [2:0]     eidleinfersel1;  //PCS
   output [2:0]     eidleinfersel2;  //PCS
   output [2:0]     eidleinfersel3;  //PCS
   output [2:0]     eidleinfersel4;  //PCS
   output [2:0]     eidleinfersel5;  //PCS
   output [2:0]     eidleinfersel6;  //PCS
   output [2:0]     eidleinfersel7;  //PCS
   output           txdeemph0;        //PCS
   output           txdeemph1;        //PCS
   output           txdeemph2;            //PCS
   output           txdeemph3;            //PCS
   output           txdeemph4;            //PCS
   output           txdeemph5;            //PCS
   output           txdeemph6;            //PCS
   output           txdeemph7;            //PCS
   output [2:0]     txmargin0;            //PCS
   output [2:0]     txmargin1;            //PCS
   output [2:0]     txmargin2;            //PCS
   output [2:0]     txmargin3;            //PCS
   output [2:0]     txmargin4;            //PCS
   output [2:0]     txmargin5;            //PCS
   output [2:0]     txmargin6;            //PCS
   output [2:0]     txmargin7;            //PCS
   // interface with the PHY PCS Lane 0
   output [7:0]     txdata0;               //PCS
   output           txdatak0;              //PCS
   output           txdetectrx0;           //PCS
   output           txelecidle0;           //PCS
   output           txcompl0;              //PCS
   output           rxpolarity0;           //PCS
   output [1:0]     powerdown0;            //PCS

   input  [7:0]     rxdata0;       //PCS
   input            rxdatak0;      //PCS
   input            rxvalid0;      //PCS
   input            phystatus0;        //PCS
   input            rxelecidle0;       //PCS
   input  [2:0]     rxstatus0;         //PCS
   // interface with the PHY PCS Lane 1
   output [7:0]     txdata1;       //PCS
   output           txdatak1;      //PCS
   output           txdetectrx1;       //PCS
   output           txelecidle1;       //PCS
   output           txcompl1;      //PCS
   output           rxpolarity1;       //PCS
   output [1:0]     powerdown1;        //PCS

   input  [7:0]     rxdata1;       //PCS
   input            rxdatak1;      //PCS
   input            rxvalid1;      //PCS
   input            phystatus1;        //PCS
   input            rxelecidle1;       //PCS
   input  [2:0]     rxstatus1;         //PCS
   // interface with the PHY PCS Lane 2
   output [7:0]     txdata2;       //PCS
   output           txdatak2;      //PCS
   output           txdetectrx2;       //PCS
   output           txelecidle2;       //PCS
   output           txcompl2;      //PCS
   output           rxpolarity2;       //PCS
   output [1:0]     powerdown2;        //PCS

   input  [7:0]     rxdata2;       //PCS
   input            rxdatak2;      //PCS
   input            rxvalid2;      //PCS
   input            phystatus2;        //PCS
   input            rxelecidle2;       //PCS
   input  [2:0]     rxstatus2;         //PCS
   // interface with the PHY PCS Lane 3
   output [7:0]     txdata3;       //PCS
   output           txdatak3;      //PCS
   output           txdetectrx3;       //PCS
   output           txelecidle3;       //PCS
   output           txcompl3;      //PCS
   output           rxpolarity3;       //PCS
   output [1:0]     powerdown3;        //PCS

   input  [7:0]     rxdata3;       //PCS
   input            rxdatak3;      //PCS
   input            rxvalid3;      //PCS
   input            phystatus3;        //PCS
   input            rxelecidle3;       //PCS
   input  [2:0]     rxstatus3;         //PCS
   // interface with the PHY PCS Lane 4
   output [7:0]     txdata4;       //PCS
   output           txdatak4;      //PCS
   output           txdetectrx4;       //PCS
   output           txelecidle4;       //PCS
   output           txcompl4;      //PCS
   output           rxpolarity4;       //PCS
   output [1:0]     powerdown4;        //PCS

   input  [7:0]     rxdata4;       //PCS
   input            rxdatak4;      //PCS
   input            rxvalid4;      //PCS
   input            phystatus4;        //PCS
   input            rxelecidle4;       //PCS
   input  [2:0]     rxstatus4;         //PCS
   // interface with the PHY PCS Lane 5
   output [7:0]     txdata5;       //PCS
   output           txdatak5;      //PCS
   output           txdetectrx5;       //PCS
   output           txelecidle5;       //PCS
   output           txcompl5;      //PCS
   output           rxpolarity5;       //PCS
   output [1:0]     powerdown5;        //PCS

   input  [7:0]     rxdata5;       //PCS
   input            rxdatak5;      //PCS
   input            rxvalid5;      //PCS
   input            phystatus5;        //PCS
   input            rxelecidle5;       //PCS
   input  [2:0]     rxstatus5;         //PCS
   // interface with the PHY PCS Lane 6
   output [7:0]     txdata6;       //PCS
   output           txdatak6;      //PCS
   output           txdetectrx6;       //PCS
   output           txelecidle6;       //PCS
   output           txcompl6;      //PCS
   output           rxpolarity6;       //PCS
   output [1:0]     powerdown6;        //PCS

   input  [7:0]     rxdata6;       //PCS
   input            rxdatak6;      //PCS
   input            rxvalid6;      //PCS
   input            phystatus6;        //PCS
   input            rxelecidle6;       //PCS
   input  [2:0]     rxstatus6;         //PCS
   // interface with the PHY PCS Lane 7
   output [7:0]     txdata7;       //PCS
   output           txdatak7;      //PCS
   output           txdetectrx7;       //PCS
   output           txelecidle7;       //PCS
   output           txcompl7;      //PCS
   output           rxpolarity7;       //PCS
   output [1:0]     powerdown7;        //PCS

   input  [7:0]     rxdata7;       //PCS
   input            rxdatak7;      //PCS
   input            rxvalid7;      //PCS
   input            phystatus7;        //PCS
   input            rxelecidle7;       //PCS
   input  [2:0]     rxstatus7;         //PCS

   // LTSSM L0 State output
   output         ltssml0state;      //PLD

   // BIST inputs/outputs
   input            bisttestenn;       //PLD -- shared for all 3 memory blocks
   input            bistenn;        //PLD
   input            bistscanin;           //PLD -- shared for all 3 memory blocks
   input            bistscanenn;           //PLD -- shared for all 3 memory blocks

   output           bistscanoutrpl;  //PLD
   output           bistdonearpl;    //PLD
   output           bistdonebrpl;    //PLD
   output           bistpassrpl;     //PLD
   output           derrrpl;      //PLD
   output           derrcorextrpl;  //PLD

   output           bistscanoutrcv0; //PLD
   output           bistdonearcv0;   //PLD
   output           bistdonebrcv0;   //PLD
   output           bistpassrcv0;    //PLD
   output           derrcorextrcv0; //PLD

   output           bistscanoutrcv1; //PLD
   output           bistdonearcv1;   //PLD
   output           bistdonebrcv1;   //PLD
   output           bistpassrcv1;    //PLD
   //output           derrcorextrcv1; //PLD -- Currently PCIe has a single virtual channel

   // scan test IO
   input       scanmoden;        //PLD
   input       scanenn;            //PLD
   input       dpriorefclkdig;       //PLD

   // FRZ signals for MRAMs
   input       nfrzdrv;            //PLD
   input       frzreg;         //PLD
   input       frzlogic;           //PLD

   // Redundancy IDs for the MRAMs

   // Hard Reset Inputs
   input       pinperstn;                // Active low PCIE reset from PCIE Interface PIN
   input       pldperstn;                // Active low PCIE reset from PLD core
   input       pldclrpmapcshipn;         //PLD -- From PLD Active low signal To Hard Reset Ctrl, reset the PMA/PCS/HIP
   input       pldclrpcshipn;            //PLD -- From PLD Active low signal To Hard Reset Ctrl, reset the PCS/HIP
   input       pldclrhipn;               //PLD -- From PLD Active low signal To Hard Reset Ctrl, reset the HIP NON STICKY Bits (CRST & SRST)
   // Hard Reset Inputs (From Control Block)
   input       iocsrrdydly;               //CB -- I/O CSR Ready Delayed (Low when IOCSR is not configured)
   input       plniotri;           //CB
   input       entest;         //CB
   input       por;           //CB


   // Debug I/Os
   input   [14:0]  dbgpipex1rx;      //PLD


   output successfulspeednegotiationint;
   output r2cerrext;

   // Extra inputs/outputs
   output  [29:0]   hipextraout;          //PLD
   output  [1:0]   hipextraclkout;
   input   [29:0]  hipextrain;        //
   input   [1:0]   hipextraclkin;

   // Reset Control Interface Ch0-Ch9
   output  txpcsrstn0;          //PCS
   output  txpcsrstn1;          //PCS
   output  txpcsrstn2;          //PCS
   output  txpcsrstn3;          //PCS
   output  txpcsrstn4;          //PCS
   output  txpcsrstn5;          //PCS
   output  txpcsrstn6;          //PCS
   output  txpcsrstn7;          //PCS
   output  txpcsrstn8;          //PCS

   output  rxpcsrstn0;          //PCS
   output  rxpcsrstn1;          //PCS
   output  rxpcsrstn2;          //PCS
   output  rxpcsrstn3;          //PCS
   output  rxpcsrstn4;          //PCS
   output  rxpcsrstn5;          //PCS
   output  rxpcsrstn6;          //PCS
   output  rxpcsrstn7;          //PCS
   output  rxpcsrstn8;          //PCS

   output  txpmasyncp0;          //PCS
   output  txpmasyncp1;          //PCS
   output  txpmasyncp2;                  //PCS
   output  txpmasyncp3;                  //PCS
   output  txpmasyncp4;                  //PCS
   output  txpmasyncp5;                  //PCS
   output  txpmasyncp6;                  //PCS
   output  txpmasyncp7;                  //PCS
   output  txpmasyncp8;                  //PCS

   output  rxpmarstb0;                  //PCS
   output  rxpmarstb1;                  //PCS
   output  rxpmarstb2;                  //PCS
   output  rxpmarstb3;                  //PCS
   output  rxpmarstb4;                  //PCS
   output  rxpmarstb5;                  //PCS
   output  rxpmarstb6;                  //PCS
   output  rxpmarstb7;                  //PCS
   output  rxpmarstb8;                  //PCS



   input   frefclk0;                  //PCS
   input   frefclk1;                  //PCS
   input   frefclk2;                  //PCS
   input   frefclk3;                  //PCS
   input   frefclk4;                  //PCS
   input   frefclk5;                  //PCS
   input   frefclk6;                  //PCS
   input   frefclk7;                  //PCS
   input   frefclk8;                  //PCS



   input   rxfreqtxcmuplllock0;                  //PCS
   input   rxfreqtxcmuplllock1;                  //PCS
   input   rxfreqtxcmuplllock2;                  //PCS
   input   rxfreqtxcmuplllock3;                  //PCS
   input   rxfreqtxcmuplllock4;                  //PCS
   input   rxfreqtxcmuplllock5;                  //PCS
   input   rxfreqtxcmuplllock6;                  //PCS
   input   rxfreqtxcmuplllock7;                  //PCS
   input   rxfreqtxcmuplllock8;                  //PCS

   input   rxpllphaselock0;                  //PCS
   input   rxpllphaselock1;                  //PCS
   input   rxpllphaselock2;                  //PCS
   input   rxpllphaselock3;                  //PCS
   input   rxpllphaselock4;                  //PCS
   input   rxpllphaselock5;                  //PCS
   input   rxpllphaselock6;                  //PCS
   input   rxpllphaselock7;                  //PCS
   input   rxpllphaselock8;                  //PCS

   arriav_hd_altpe2_hip_top_encrypted arriav_hd_altpe2_hip_top_encrypted_i (
      .usermode(usermode),                   // use to gate off input signal
      .hippartialreconfign(hippartialreconfign),        // use to gate off output signal
      .csrclk(csrclk),
      .csrin(csrin),
      .csren(csren),
      .csrout(csrout),
      .csrcbdin(csrcbdin),
      .csrtcsrin(csrtcsrin),
      .csrdin(csrdin),
      .csrseg(csrseg),
      .csrenscan(csrenscan),
      .csrtverify(csrtverify),
      .csrloadcsr(csrloadcsr),
      .csrpipein(csrpipein),
      .csrdout(csrdout),
      .csrpipeout(csrpipeout),
      .avmmrstn(avmmrstn),
      .avmmclk(avmmclk),
      .avmmwrite(avmmwrite),
      .avmmread(avmmread),
      .avmmbyteen(avmmbyteen),
      .avmmaddress(avmmaddress),
      .avmmwritedata(avmmwritedata),
      .sershiftload(sershiftload),
      .interfacesel(interfacesel),
      .avmmreaddata(avmmreaddata),
      .mdioclk(mdioclk),
      .mdioin(mdioin),
      .cbhipmdioen(cbhipmdioen),
      .mdiodevaddr(mdiodevaddr),
      .mdioout(mdioout),
      .mdiooenn(mdiooenn),
      .lmidout(lmidout),
      .lmiack(lmiack),
      .lmirden(lmirden),
      .lmiwren(lmiwren),
      .lmiaddr(lmiaddr),
      .lmidin(lmidin),
      .resetstatus(resetstatus),
      .l2exit(l2exit),
      .hotrstexit(hotrstexit),
      .dlupexit(dlupexit),
      .pldclk(pldclk),
      .pldsrst(pldsrst),
      .pldrst(pldrst),
      .phyrst(phyrst),
      .physrst(physrst),
      .coreclkin(coreclkin),
      .coreclkout(coreclkout),
      .corerst(corerst),
      .corepor(corepor),
      .corecrst(corecrst),
      .coresrst(coresrst),
      .swdnwake(swdnwake),
      .swuphotrst(swuphotrst),
      .swdnin(swdnin),
      .swupin(swupin),
      .rxvalidvc0(rxvalidvc0),
      .rxerrvc0(rxerrvc0),
      .rxbardecvc0(rxbardecvc0),
      .rxsopvc00(rxsopvc00),
      .rxeopvc00(rxeopvc00),
      .rxdatavc00(rxdatavc00),
      .rxbevc00(rxbevc00),
      .rxsopvc01(rxsopvc01),
      .rxeopvc01(rxeopvc01),
      .rxdatavc01(rxdatavc01),
      .rxbevc01(rxbevc01),
      .rxfifofullvc0(rxfifofullvc0),
      .rxfifoemptyvc0(rxfifoemptyvc0),
      .rxfifowrpvc0(rxfifowrpvc0),
      .rxfifordpvc0(rxfifordpvc0),
      .txcredvc0(txcredvc0),
      .txreadyvc0(txreadyvc0),
      .txfifofullvc0(txfifofullvc0),
      .txfifoemptyvc0(txfifoemptyvc0),
      .txfifowrpvc0(txfifowrpvc0),
      .txfifordpvc0(txfifordpvc0),
      .rxmaskvc0(rxmaskvc0),
      .rxreadyvc0(rxreadyvc0),
      .txvalidvc0(txvalidvc0),
      .txerrvc0(txerrvc0),
      .txsopvc00(txsopvc00),
      .txeopvc00(txeopvc00),
      .txdatavc00(txdatavc00),
      .txsopvc01(txsopvc01),
      .txeopvc01(txeopvc01),
      .txdatavc01(txdatavc01),
      .tlpmetosr(tlpmetosr),
      .tlpmetocr(tlpmetocr),
      .tlpmevent(tlpmevent),
      .tlpmdata(tlpmdata),
      .tlpmauxpwr(tlpmauxpwr),
      .tlcfgsts(tlcfgsts),
      .tlcfgstswr(tlcfgstswr),
      .tlcfgctl(tlcfgctl),
      .tlcfgctlwr(tlcfgctlwr),
      .tlcfgadd(tlcfgadd),
      .tlappintaack(tlappintaack),
      .tlappmsiack(tlappmsiack),
      .intstatus(intstatus),
      .tlappintasts(tlappintasts),
      .tlappmsireq(tlappmsireq),
      .tlappmsitc(tlappmsitc),
      .tlappmsinum(tlappmsinum),
      .tlaermsinum(tlaermsinum),
      .tlpexmsinum(tlpexmsinum),
      .tlhpgctrler(tlhpgctrler),
      .laneact(laneact),          // Mux with tlcfgsts[80:77]
      .dlltssm(dlltssm),          // Mux with tlcfgsts[75:71]
      .clrrxpath(clrrxpath),        // Mux with tlcfgsts[70:70]
      .dlcurrentspeed(dlcurrentspeed),      // Mux with tlcfgsts[60:59]
      .dlcomclkreg(dlcomclkreg),  // ww51.5 change by Ning Xue
      .dlvcctrl(dlvcctrl),
      .dlctrllink2(dlctrllink2),
      .testouthip(testouthip),
      .ev1us(ev1us),
      .ev128ns(ev128ns),
      .wakeoen(wakeoen),
      .serrout(serrout),
      .tlslotclkcfg(tlslotclkcfg),
      .mode(mode),
      .testinhip(testinhip),
      .cplerr(cplerr),
      .pcierr(pcierr),
      .rate0(rate0),
      .rate1(rate1),
      .rate2(rate2),
      .rate3(rate3),
      .rate4(rate4),
      .rate5(rate5),
      .rate6(rate6),
      .rate7(rate7),
      .rate8(rate8),
      .eidleinfersel0(eidleinfersel0),
      .txdeemph0(txdeemph0),
      .txmargin0(txmargin0),
      .txdata0(txdata0),
      .txdatak0(txdatak0),
      .txdetectrx0(txdetectrx0),
      .txelecidle0(txelecidle0),
      .txcompl0(txcompl0),
      .rxpolarity0(rxpolarity0),
      .powerdown0(powerdown0),
      .rxdata0(rxdata0),
      .rxdatak0(rxdatak0),
      .rxvalid0(rxvalid0),
      .phystatus0(phystatus0),
      .rxelecidle0(rxelecidle0),
      .rxstatus0(rxstatus0),
      .eidleinfersel1(eidleinfersel1),
      .txdeemph1(txdeemph1),
      .txmargin1(txmargin1),
      .txdata1(txdata1),
      .txdatak1(txdatak1),
      .txdetectrx1(txdetectrx1),
      .txelecidle1(txelecidle1),
      .txcompl1(txcompl1),
      .rxpolarity1(rxpolarity1),
      .powerdown1(powerdown1),
      .rxdata1(rxdata1),
      .rxdatak1(rxdatak1),
      .rxvalid1(rxvalid1),
      .phystatus1(phystatus1),
      .rxelecidle1(rxelecidle1),
      .rxstatus1(rxstatus1),
      .eidleinfersel2(eidleinfersel2),
      .txdeemph2(txdeemph2),
      .txmargin2(txmargin2),
      .txdata2(txdata2),
      .txdatak2(txdatak2),
      .txdetectrx2(txdetectrx2),
      .txelecidle2(txelecidle2),
      .txcompl2(txcompl2),
      .rxpolarity2(rxpolarity2),
      .powerdown2(powerdown2),
      .rxdata2(rxdata2),
      .rxdatak2(rxdatak2),
      .rxvalid2(rxvalid2),
      .phystatus2(phystatus2),
      .rxelecidle2(rxelecidle2),
      .rxstatus2(rxstatus2),
      .eidleinfersel3(eidleinfersel3),
      .txdeemph3(txdeemph3),
      .txmargin3(txmargin3),
      .txdata3(txdata3),
      .txdatak3(txdatak3),
      .txdetectrx3(txdetectrx3),
      .txelecidle3(txelecidle3),
      .txcompl3(txcompl3),
      .rxpolarity3(rxpolarity3),
      .powerdown3(powerdown3),
      .rxdata3(rxdata3),
      .rxdatak3(rxdatak3),
      .rxvalid3(rxvalid3),
      .phystatus3(phystatus3),
      .rxelecidle3(rxelecidle3),
      .rxstatus3(rxstatus3),
      .eidleinfersel4(eidleinfersel4),
      .txdeemph4(txdeemph4),
      .txmargin4(txmargin4),
      .txdata4(txdata4),
      .txdatak4(txdatak4),
      .txdetectrx4(txdetectrx4),
      .txelecidle4(txelecidle4),
      .txcompl4(txcompl4),
      .rxpolarity4(rxpolarity4),
      .powerdown4(powerdown4),
      .rxdata4(rxdata4),
      .rxdatak4(rxdatak4),
      .rxvalid4(rxvalid4),
      .phystatus4(phystatus4),
      .rxelecidle4(rxelecidle4),
      .rxstatus4(rxstatus4),
      .eidleinfersel5(eidleinfersel5),
      .txdeemph5(txdeemph5),
      .txmargin5(txmargin5),
      .txdata5(txdata5),
      .txdatak5(txdatak5),
      .txdetectrx5(txdetectrx5),
      .txelecidle5(txelecidle5),
      .txcompl5(txcompl5),
      .rxpolarity5(rxpolarity5),
      .powerdown5(powerdown5),
      .rxdata5(rxdata5),
      .rxdatak5(rxdatak5),
      .rxvalid5(rxvalid5),
      .phystatus5(phystatus5),
      .rxelecidle5(rxelecidle5),
      .rxstatus5(rxstatus5),
      .eidleinfersel6(eidleinfersel6),
      .txdeemph6(txdeemph6),
      .txmargin6(txmargin6),
      .txdata6(txdata6),
      .txdatak6(txdatak6),
      .txdetectrx6(txdetectrx6),
      .txelecidle6(txelecidle6),
      .txcompl6(txcompl6),
      .rxpolarity6(rxpolarity6),
      .powerdown6(powerdown6),
      .rxdata6(rxdata6),
      .rxdatak6(rxdatak6),
      .rxvalid6(rxvalid6),
      .phystatus6(phystatus6),
      .rxelecidle6(rxelecidle6),
      .rxstatus6(rxstatus6),
      .eidleinfersel7(eidleinfersel7),
      .txdeemph7(txdeemph7),
      .txmargin7(txmargin7),
      .txdata7(txdata7),
      .txdatak7(txdatak7),
      .txdetectrx7(txdetectrx7),
      .txelecidle7(txelecidle7),
      .txcompl7(txcompl7),
      .rxpolarity7(rxpolarity7),
      .powerdown7(powerdown7),
      .rxdata7(rxdata7),
      .rxdatak7(rxdatak7),
      .rxvalid7(rxvalid7),
      .phystatus7(phystatus7),
      .rxelecidle7(rxelecidle7),
      .rxstatus7(rxstatus7),
      .ltssml0state(ltssml0state),      // LTSSM L0 State flag
      // REGSCAN I/Os for MRAM I/O testing
      .bisttestenn(bisttestenn),         // BIST-related I/Os for MRAM
      .bistscanin(bistscanin),             // Shared between 3 MRAM BISTs
      .bistscanenn(bistscanenn),             // Shared between 3 MRAM BISTs
      .bistenn(bistenn),
      .bistscanoutrpl(bistscanoutrpl),
      .bistscanoutrcv0(bistscanoutrcv0),
      .bistscanoutrcv1(bistscanoutrcv1),
      .bistdonearpl(bistdonearpl),
      .bistdonebrpl(bistdonebrpl),
      .bistpassrpl(bistpassrpl),
      .derrrpl(derrrpl),
      .derrcorextrpl(derrcorextrpl),
      .bistdonearcv0(bistdonearcv0),
      .bistdonebrcv0(bistdonebrcv0),
      .bistpassrcv0(bistpassrcv0),
      .derrcorextrcv0(derrcorextrcv0),
      .bistdonearcv1(bistdonearcv1),
      .bistdonebrcv1(bistdonebrcv1),
      .bistpassrcv1(bistpassrcv1),
      //.derrcorextrcv1(derrcorextrcv1),
      // scan test IO
      .scanmoden(scanmoden),
      .scanenn(scanenn),
      .dpriorefclkdig(dpriorefclkdig),
      // FRZ signals for MRAMs
      .nfrzdrv(nfrzdrv),
      .frzreg(frzreg),
      .frzlogic(frzlogic),
      // Redundancy IDs for the 3 MRAMs
      //Hard Reset Inputs
      .pinperstn(pinperstn),              // Active low PCIE reset from PCIE Interface PIN
      .pldperstn(pldperstn),              // Active low PCIE reset from PLD core
      .pldclrpmapcshipn(pldclrpmapcshipn),       // From PLD Active low signal To Hard Reset Ctrl(//), reset the PMA/PCS/HIP
      .pldclrpcshipn(pldclrpcshipn),          // From PLD Active low signal To Hard Reset Ctrl(//), reset the PCS/HIP
      .pldclrhipn(pldclrhipn),             // From PLD Active low signal To Hard Reset Ctrl(//), reset the HIP NON STICKY Bits (CRST & SRST)
      // Control signals from Control Block and POR
      .iocsrrdydly(1'b1),             // I/O CSR Ready Delayed (Low when IOCSR is not configured)
      .plniotri(1'b1),
      .entest(1'b0),
      .por(1'b0),
      //Hard Reset Controller
      .frefclk0(frefclk0),
      .frefclk1(frefclk1),
      .frefclk2(frefclk2),
      .frefclk3(frefclk3),
      .frefclk4(frefclk4),
      .frefclk5(frefclk5),
      .frefclk6(frefclk6),
      .frefclk7(frefclk7),
      .frefclk8(frefclk8),

      .rxfreqtxcmuplllock0(rxfreqtxcmuplllock0),
      .rxfreqtxcmuplllock1(rxfreqtxcmuplllock1),
      .rxfreqtxcmuplllock2(rxfreqtxcmuplllock2),
      .rxfreqtxcmuplllock3(rxfreqtxcmuplllock3),
      .rxfreqtxcmuplllock4(rxfreqtxcmuplllock4),
      .rxfreqtxcmuplllock5(rxfreqtxcmuplllock5),
      .rxfreqtxcmuplllock6(rxfreqtxcmuplllock6),
      .rxfreqtxcmuplllock7(rxfreqtxcmuplllock7),
      .rxfreqtxcmuplllock8(rxfreqtxcmuplllock8),

      .rxpllphaselock0(rxpllphaselock0),
      .rxpllphaselock1(rxpllphaselock1),
      .rxpllphaselock2(rxpllphaselock2),
      .rxpllphaselock3(rxpllphaselock3),
      .rxpllphaselock4(rxpllphaselock4),
      .rxpllphaselock5(rxpllphaselock5),
      .rxpllphaselock6(rxpllphaselock6),
      .rxpllphaselock7(rxpllphaselock7),
      .rxpllphaselock8(rxpllphaselock8),

      .txpcsrstn0(txpcsrstn0),
      .txpcsrstn1(txpcsrstn1),
      .txpcsrstn2(txpcsrstn2),
      .txpcsrstn3(txpcsrstn3),
      .txpcsrstn4(txpcsrstn4),
      .txpcsrstn5(txpcsrstn5),
      .txpcsrstn6(txpcsrstn6),
      .txpcsrstn7(txpcsrstn7),
      .txpcsrstn8(txpcsrstn8),

      .rxpcsrstn0(rxpcsrstn0),
      .rxpcsrstn1(rxpcsrstn1),
      .rxpcsrstn2(rxpcsrstn2),
      .rxpcsrstn3(rxpcsrstn3),
      .rxpcsrstn4(rxpcsrstn4),
      .rxpcsrstn5(rxpcsrstn5),
      .rxpcsrstn6(rxpcsrstn6),
      .rxpcsrstn7(rxpcsrstn7),
      .rxpcsrstn8(rxpcsrstn8),

      .txpmasyncp0(txpmasyncp0),
      .txpmasyncp1(txpmasyncp1),
      .txpmasyncp2(txpmasyncp2),
      .txpmasyncp3(txpmasyncp3),
      .txpmasyncp4(txpmasyncp4),
      .txpmasyncp5(txpmasyncp5),
      .txpmasyncp6(txpmasyncp6),
      .txpmasyncp7(txpmasyncp7),
      .txpmasyncp8(txpmasyncp8),

      .rxpmarstb0(rxpmarstb0),
      .rxpmarstb1(rxpmarstb1),
      .rxpmarstb2(rxpmarstb2),
      .rxpmarstb3(rxpmarstb3),
      .rxpmarstb4(rxpmarstb4),
      .rxpmarstb5(rxpmarstb5),
      .rxpmarstb6(rxpmarstb6),
      .rxpmarstb7(rxpmarstb7),
      .rxpmarstb8(rxpmarstb8),

      .rxbardecfuncnumvc0(rxbardecfuncnumvc0),
      .tlpmeventfunc(tlpmeventfunc),
      .tlappintafuncnum(tlappintafuncnum),
      .tlappintbsts(tlappintbsts),
      .tlappintbfuncnum(tlappintbfuncnum),
      .tlappintcsts(tlappintcsts),
      .tlappintcfuncnum(tlappintcfuncnum),
      .tlappintdsts(tlappintdsts),
      .tlappintdfuncnum(tlappintdfuncnum),
      .tlappmsifunc(tlappmsifunc),
      .cplpending(cplpending),
      .cplerrfunc(cplerrfunc),
      .flrreset(flrreset),
      .cvpconfigready(cvpconfigready),
      .cvpen(cvpen),
      .cvpconfigerror(cvpconfigerror),
      .cvpconfigdone(cvpconfigdone),
      .cvpclk(cvpclk),
      .cvpdata(cvpdata),
      .cvpstartxfer(cvpstartxfer),
      .cvpconfig(cvpconfig),
      .cvpfullconfig(cvpfullconfig),
      .pclkch0(pclkch0),
      .pclkch1(pclkch1),
      .pclkcentral(pclkcentral),
      .pllfixedclkch0(pllfixedclkch0),
      .pllfixedclkch1(pllfixedclkch1),
      .pllfixedclkcentral(pllfixedclkcentral),
      .tlappintback(tlappintback),
      .tlappintcack(tlappintcack),
      .tlappintdack(tlappintdack),
      //tlcfgctladd(tlcfgctladd),
      .flrsts(flrsts),
      .rxfreqlocked0(rxfreqlocked0),
      .rxfreqlocked1(rxfreqlocked1),
      .rxfreqlocked2(rxfreqlocked2),
      .rxfreqlocked3(rxfreqlocked3),
      .rxfreqlocked4(rxfreqlocked4),
      .rxfreqlocked5(rxfreqlocked5),
      .rxfreqlocked6(rxfreqlocked6),
      .rxfreqlocked7(rxfreqlocked7),
      .txswing0(txswing0),
      .txswing1(txswing1),
      .txswing2(txswing2),
      .txswing3(txswing3),
      .txswing4(txswing4),
      .txswing5(txswing5),
      .txswing6(txswing6),
      .txswing7(txswing7),
      .txcredfchipcons(txcredfchipcons), // TL to AL Indicates that HIP consumed one of PH PD(//), NPH(NPH), NPD(NPD), CH(CH), CD
      .txcredfcinfinite(txcredfcinfinite), // TL to AL Indicates if this is an infinite credit PH PD(//), NPH(NPH), NPD(NPD), CH(CH), CD
      .txcredhdrfcp(txcredhdrfcp),    // TL to AL Header credit of the received FC Posted.
      .txcreddatafcp(txcreddatafcp),   // TL to AL Signals the Data credit of the received FC Posted
      .txcredhdrfcnp(txcredhdrfcnp),   // TL to AL Header credit of the received FC Non Posted
      .txcreddatafcnp(txcreddatafcnp),  // TL to AL Signals the Data credit of the received FC Non Posted
      .txcredhdrfccp(txcredhdrfccp),   // TL to AL Header credit of the received FC completion.
      .txcreddatafccp(txcreddatafccp),  // TL to AL Signals the Data credit of the received FC completion
      // Debug signals
      .dbgpipex1rx(dbgpipex1rx),
      // Extra signals
      .hipextrain(hipextrain),
      .hipextraclkin(hipextraclkin),
      .r2cerrext(r2cerrext),
      .successfulspeednegotiationint(successfulspeednegotiationint),
      .hipextraout(hipextraout),
      .hipextraclkout(hipextraclkout),
      .pldcoreready(pldcoreready),
      .pldclkinuse(pldclkinuse)
   );

defparam arriav_hd_altpe2_hip_top_encrypted_i.func_mode = func_mode;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bonding_mode = bonding_mode;
defparam arriav_hd_altpe2_hip_top_encrypted_i.prot_mode = prot_mode;
defparam arriav_hd_altpe2_hip_top_encrypted_i.pcie_spec_1p0_compliance = pcie_spec_1p0_compliance;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc_enable = vc_enable;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_slot_register = enable_slot_register;
defparam arriav_hd_altpe2_hip_top_encrypted_i.pcie_mode = pcie_mode;
defparam arriav_hd_altpe2_hip_top_encrypted_i.multi_function = multi_function;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bypass_cdc = bypass_cdc;
defparam arriav_hd_altpe2_hip_top_encrypted_i.cdc_clk_relation = cdc_clk_relation;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_rx_reordering = enable_rx_reordering;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_rx_buffer_checking = enable_rx_buffer_checking;
defparam arriav_hd_altpe2_hip_top_encrypted_i.single_rx_detect_data = single_rx_detect_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.single_rx_detect = single_rx_detect;
defparam arriav_hd_altpe2_hip_top_encrypted_i.use_crc_forwarding = use_crc_forwarding;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bypass_tl = bypass_tl;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen12_lane_rate_mode = gen12_lane_rate_mode;
defparam arriav_hd_altpe2_hip_top_encrypted_i.lane_mask = lane_mask;
defparam arriav_hd_altpe2_hip_top_encrypted_i.disable_link_x2_support = disable_link_x2_support;
defparam arriav_hd_altpe2_hip_top_encrypted_i.national_inst_thru_enhance = national_inst_thru_enhance;
defparam arriav_hd_altpe2_hip_top_encrypted_i.disable_tag_check = disable_tag_check;
defparam arriav_hd_altpe2_hip_top_encrypted_i.port_link_number_data = port_link_number_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.port_link_number = port_link_number;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_number_data = device_number_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_number = device_number;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bypass_clk_switch = bypass_clk_switch;
defparam arriav_hd_altpe2_hip_top_encrypted_i.core_clk_out_sel = core_clk_out_sel;
defparam arriav_hd_altpe2_hip_top_encrypted_i.core_clk_divider = core_clk_divider;
defparam arriav_hd_altpe2_hip_top_encrypted_i.core_clk_source = core_clk_source;
defparam arriav_hd_altpe2_hip_top_encrypted_i.core_clk_sel = core_clk_sel;
defparam arriav_hd_altpe2_hip_top_encrypted_i.disable_clk_switch = disable_clk_switch;
defparam arriav_hd_altpe2_hip_top_encrypted_i.core_clk_disable_clk_switch = core_clk_disable_clk_switch;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slotclk_cfg = slotclk_cfg;
defparam arriav_hd_altpe2_hip_top_encrypted_i.tx_swing_data = tx_swing_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.tx_swing = tx_swing;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_ch0_pclk_out = enable_ch0_pclk_out;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_ch01_pclk_out = enable_ch01_pclk_out;
defparam arriav_hd_altpe2_hip_top_encrypted_i.pipex1_debug_sel = pipex1_debug_sel;
defparam arriav_hd_altpe2_hip_top_encrypted_i.pclk_out_sel = pclk_out_sel;

//Func 0 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_data_0 = vendor_id_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_0 = vendor_id_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_data_0 = device_id_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_0 = device_id_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_data_0 = revision_id_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_0 = revision_id_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_data_0 = class_code_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_0 = class_code_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_data_0 = subsystem_vendor_id_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_0 = subsystem_vendor_id_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_data_0 = subsystem_device_id_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_0 = subsystem_device_id_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_soft_reset_0 = no_soft_reset_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.intel_id_access_0 = intel_id_access_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_specific_init_0 = device_specific_init_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_data_0 = maximum_current_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_0 = maximum_current_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_support_0 = d1_support_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_support_0 = d2_support_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d0_pme_0 = d0_pme_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_pme_0 = d1_pme_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_pme_0 = d2_pme_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_hot_pme_0 = d3_hot_pme_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_cold_pme_0 = d3_cold_pme_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.use_aer_0 = use_aer_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.low_priority_vc_0 = low_priority_vc_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc_arbitration_0 = vc_arbitration_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.disable_snoop_packet_0 = disable_snoop_packet_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_payload_size_0 = max_payload_size_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.surprise_down_error_support_0 = surprise_down_error_support_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.dll_active_report_support_0 = dll_active_report_support_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extend_tag_field_0 = extend_tag_field_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_data_0 = endpoint_l0_latency_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_0 = endpoint_l0_latency_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_data_0 = endpoint_l1_latency_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_0 = endpoint_l1_latency_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_data_0 = indicator_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_0 = indicator_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.role_based_error_reporting_0 = role_based_error_reporting_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_data_0 = slot_power_scale_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_0 = slot_power_scale_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_link_width_0 = max_link_width_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l1_aspm_0 = enable_l1_aspm_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l0s_aspm_0 = enable_l0s_aspm_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_data_0 = l1_exit_latency_sameclock_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_0 = l1_exit_latency_sameclock_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_data_0 = l1_exit_latency_diffclock_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_0 = l1_exit_latency_diffclock_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_data_0 = hot_plug_support_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_0 = hot_plug_support_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_data_0 = slot_power_limit_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_0 = slot_power_limit_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_data_0 = slot_number_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_0 = slot_number_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_data_0 = diffclock_nfts_count_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_0 = diffclock_nfts_count_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_data_0 = sameclock_nfts_count_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_0 = sameclock_nfts_count_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.completion_timeout_0 = completion_timeout_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_completion_timeout_disable_0 = enable_completion_timeout_disable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extended_tag_reset_0 = extended_tag_reset_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_check_capable_0 = ecrc_check_capable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_gen_capable_0 = ecrc_gen_capable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_command_completed_0 = no_command_completed_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_multi_message_capable_0 = msi_multi_message_capable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_64bit_addressing_capable_0 = msi_64bit_addressing_capable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_masking_capable_0 = msi_masking_capable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_support_0 = msi_support_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.interrupt_pin_0 = interrupt_pin_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_function_msix_support_0 = enable_function_msix_support_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_data_0 = msix_table_size_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_0 = msix_table_size_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_data_0 = msix_table_bir_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_0 = msix_table_bir_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_data_0 = msix_table_offset_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_0 = msix_table_offset_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_data_0 = msix_pba_bir_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_0 = msix_pba_bir_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_data_0 = msix_pba_offset_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_0 = msix_pba_offset_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_vga_enable_0 = bridge_port_vga_enable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_ssid_support_0 = bridge_port_ssid_support_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_data_0 = ssvid_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_0 = ssvid_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_data_0 = ssid_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_0 = ssid_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_data_0 = eie_before_nfts_count_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_0 = eie_before_nfts_count_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_data_0 = gen2_diffclock_nfts_count_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_0 = gen2_diffclock_nfts_count_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_data_0 = gen2_sameclock_nfts_count_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_0 = gen2_sameclock_nfts_count_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.deemphasis_enable_0 = deemphasis_enable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.pcie_spec_version_0 = pcie_spec_version_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_data_0 = l0_exit_latency_sameclock_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_0 = l0_exit_latency_sameclock_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_data_0 = l0_exit_latency_diffclock_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_0 = l0_exit_latency_diffclock_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ei_l0s_0 = rx_ei_l0s_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l2_async_logic_0 = l2_async_logic_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.aspm_optionality_0 = aspm_optionality_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.flr_capability_0 = flr_capability_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_io_space_0 = bar0_io_space_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_64bit_mem_space_0 = bar0_64bit_mem_space_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_prefetchable_0 = bar0_prefetchable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_data_0 = bar0_size_mask_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_0 = bar0_size_mask_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_io_space_0 = bar1_io_space_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_64bit_mem_space_0 = bar1_64bit_mem_space_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_prefetchable_0 = bar1_prefetchable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_data_0 = bar1_size_mask_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_0 = bar1_size_mask_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_io_space_0 = bar2_io_space_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_64bit_mem_space_0 = bar2_64bit_mem_space_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_prefetchable_0 = bar2_prefetchable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_data_0 = bar2_size_mask_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_0 = bar2_size_mask_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_io_space_0 = bar3_io_space_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_64bit_mem_space_0 = bar3_64bit_mem_space_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_prefetchable_0 = bar3_prefetchable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_data_0 = bar3_size_mask_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_0 = bar3_size_mask_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_io_space_0 = bar4_io_space_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_64bit_mem_space_0 = bar4_64bit_mem_space_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_prefetchable_0 = bar4_prefetchable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_data_0 = bar4_size_mask_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_0 = bar4_size_mask_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_io_space_0 = bar5_io_space_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_64bit_mem_space_0 = bar5_64bit_mem_space_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_prefetchable_0 = bar5_prefetchable_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_data_0 = bar5_size_mask_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_0 = bar5_size_mask_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_data_0 = expansion_base_address_register_data_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_0 = expansion_base_address_register_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.io_window_addr_width_0 = io_window_addr_width_0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.prefetchable_mem_window_addr_width_0 = prefetchable_mem_window_addr_width_0;
//Func 0 - Config Register Settings END -------------

//Func 1 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_data_1 = vendor_id_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_1 = vendor_id_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_data_1 = device_id_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_1 = device_id_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_data_1 = revision_id_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_1 = revision_id_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_data_1 = class_code_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_1 = class_code_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_data_1 = subsystem_vendor_id_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_1 = subsystem_vendor_id_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_data_1 = subsystem_device_id_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_1 = subsystem_device_id_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_soft_reset_1 = no_soft_reset_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.intel_id_access_1 = intel_id_access_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_specific_init_1 = device_specific_init_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_data_1 = maximum_current_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_1 = maximum_current_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_support_1 = d1_support_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_support_1 = d2_support_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d0_pme_1 = d0_pme_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_pme_1 = d1_pme_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_pme_1 = d2_pme_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_hot_pme_1 = d3_hot_pme_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_cold_pme_1 = d3_cold_pme_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.use_aer_1 = use_aer_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.low_priority_vc_1 = low_priority_vc_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc_arbitration_1 = vc_arbitration_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.disable_snoop_packet_1 = disable_snoop_packet_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_payload_size_1 = max_payload_size_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.surprise_down_error_support_1 = surprise_down_error_support_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.dll_active_report_support_1 = dll_active_report_support_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extend_tag_field_1 = extend_tag_field_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_data_1 = endpoint_l0_latency_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_1 = endpoint_l0_latency_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_data_1 = endpoint_l1_latency_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_1 = endpoint_l1_latency_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_data_1 = indicator_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_1 = indicator_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.role_based_error_reporting_1 = role_based_error_reporting_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_data_1 = slot_power_scale_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_1 = slot_power_scale_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_link_width_1 = max_link_width_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l1_aspm_1 = enable_l1_aspm_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l0s_aspm_1 = enable_l0s_aspm_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_data_1 = l1_exit_latency_sameclock_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_1 = l1_exit_latency_sameclock_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_data_1 = l1_exit_latency_diffclock_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_1 = l1_exit_latency_diffclock_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_data_1 = hot_plug_support_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_1 = hot_plug_support_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_data_1 = slot_power_limit_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_1 = slot_power_limit_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_data_1 = slot_number_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_1 = slot_number_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_data_1 = diffclock_nfts_count_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_1 = diffclock_nfts_count_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_data_1 = sameclock_nfts_count_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_1 = sameclock_nfts_count_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.completion_timeout_1 = completion_timeout_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_completion_timeout_disable_1 = enable_completion_timeout_disable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extended_tag_reset_1 = extended_tag_reset_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_check_capable_1 = ecrc_check_capable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_gen_capable_1 = ecrc_gen_capable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_command_completed_1 = no_command_completed_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_multi_message_capable_1 = msi_multi_message_capable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_64bit_addressing_capable_1 = msi_64bit_addressing_capable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_masking_capable_1 = msi_masking_capable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_support_1 = msi_support_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.interrupt_pin_1 = interrupt_pin_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_function_msix_support_1 = enable_function_msix_support_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_data_1 = msix_table_size_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_1 = msix_table_size_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_data_1 = msix_table_bir_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_1 = msix_table_bir_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_data_1 = msix_table_offset_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_1 = msix_table_offset_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_data_1 = msix_pba_bir_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_1 = msix_pba_bir_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_data_1 = msix_pba_offset_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_1 = msix_pba_offset_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_vga_enable_1 = bridge_port_vga_enable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_ssid_support_1 = bridge_port_ssid_support_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_data_1 = ssvid_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_1 = ssvid_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_data_1 = ssid_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_1 = ssid_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_data_1 = eie_before_nfts_count_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_1 = eie_before_nfts_count_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_data_1 = gen2_diffclock_nfts_count_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_1 = gen2_diffclock_nfts_count_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_data_1 = gen2_sameclock_nfts_count_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_1 = gen2_sameclock_nfts_count_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.deemphasis_enable_1 = deemphasis_enable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.pcie_spec_version_1 = pcie_spec_version_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_data_1 = l0_exit_latency_sameclock_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_1 = l0_exit_latency_sameclock_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_data_1 = l0_exit_latency_diffclock_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_1 = l0_exit_latency_diffclock_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ei_l0s_1 = rx_ei_l0s_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l2_async_logic_1 = l2_async_logic_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.aspm_optionality_1 = aspm_optionality_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.flr_capability_1 = flr_capability_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_io_space_1 = bar0_io_space_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_64bit_mem_space_1 = bar0_64bit_mem_space_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_prefetchable_1 = bar0_prefetchable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_data_1 = bar0_size_mask_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_1 = bar0_size_mask_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_io_space_1 = bar1_io_space_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_64bit_mem_space_1 = bar1_64bit_mem_space_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_prefetchable_1 = bar1_prefetchable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_data_1 = bar1_size_mask_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_1 = bar1_size_mask_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_io_space_1 = bar2_io_space_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_64bit_mem_space_1 = bar2_64bit_mem_space_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_prefetchable_1 = bar2_prefetchable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_data_1 = bar2_size_mask_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_1 = bar2_size_mask_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_io_space_1 = bar3_io_space_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_64bit_mem_space_1 = bar3_64bit_mem_space_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_prefetchable_1 = bar3_prefetchable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_data_1 = bar3_size_mask_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_1 = bar3_size_mask_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_io_space_1 = bar4_io_space_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_64bit_mem_space_1 = bar4_64bit_mem_space_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_prefetchable_1 = bar4_prefetchable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_data_1 = bar4_size_mask_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_1 = bar4_size_mask_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_io_space_1 = bar5_io_space_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_64bit_mem_space_1 = bar5_64bit_mem_space_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_prefetchable_1 = bar5_prefetchable_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_data_1 = bar5_size_mask_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_1 = bar5_size_mask_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_data_1 = expansion_base_address_register_data_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_1 = expansion_base_address_register_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.io_window_addr_width_1 = io_window_addr_width_1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.prefetchable_mem_window_addr_width_1 = prefetchable_mem_window_addr_width_1;
//Func 1 - Config Register Settings END -------------

//Func 2 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_data_2 = vendor_id_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_2 = vendor_id_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_data_2 = device_id_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_2 = device_id_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_data_2 = revision_id_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_2 = revision_id_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_data_2 = class_code_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_2 = class_code_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_data_2 = subsystem_vendor_id_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_2 = subsystem_vendor_id_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_data_2 = subsystem_device_id_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_2 = subsystem_device_id_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_soft_reset_2 = no_soft_reset_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.intel_id_access_2 = intel_id_access_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_specific_init_2 = device_specific_init_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_data_2 = maximum_current_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_2 = maximum_current_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_support_2 = d1_support_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_support_2 = d2_support_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d0_pme_2 = d0_pme_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_pme_2 = d1_pme_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_pme_2 = d2_pme_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_hot_pme_2 = d3_hot_pme_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_cold_pme_2 = d3_cold_pme_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.use_aer_2 = use_aer_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.low_priority_vc_2 = low_priority_vc_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc_arbitration_2 = vc_arbitration_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.disable_snoop_packet_2 = disable_snoop_packet_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_payload_size_2 = max_payload_size_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.surprise_down_error_support_2 = surprise_down_error_support_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.dll_active_report_support_2 = dll_active_report_support_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extend_tag_field_2 = extend_tag_field_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_data_2 = endpoint_l0_latency_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_2 = endpoint_l0_latency_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_data_2 = endpoint_l1_latency_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_2 = endpoint_l1_latency_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_data_2 = indicator_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_2 = indicator_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.role_based_error_reporting_2 = role_based_error_reporting_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_data_2 = slot_power_scale_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_2 = slot_power_scale_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_link_width_2 = max_link_width_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l1_aspm_2 = enable_l1_aspm_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l0s_aspm_2 = enable_l0s_aspm_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_data_2 = l1_exit_latency_sameclock_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_2 = l1_exit_latency_sameclock_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_data_2 = l1_exit_latency_diffclock_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_2 = l1_exit_latency_diffclock_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_data_2 = hot_plug_support_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_2 = hot_plug_support_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_data_2 = slot_power_limit_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_2 = slot_power_limit_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_data_2 = slot_number_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_2 = slot_number_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_data_2 = diffclock_nfts_count_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_2 = diffclock_nfts_count_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_data_2 = sameclock_nfts_count_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_2 = sameclock_nfts_count_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.completion_timeout_2 = completion_timeout_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_completion_timeout_disable_2 = enable_completion_timeout_disable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extended_tag_reset_2 = extended_tag_reset_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_check_capable_2 = ecrc_check_capable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_gen_capable_2 = ecrc_gen_capable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_command_completed_2 = no_command_completed_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_multi_message_capable_2 = msi_multi_message_capable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_64bit_addressing_capable_2 = msi_64bit_addressing_capable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_masking_capable_2 = msi_masking_capable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_support_2 = msi_support_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.interrupt_pin_2 = interrupt_pin_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_function_msix_support_2 = enable_function_msix_support_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_data_2 = msix_table_size_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_2 = msix_table_size_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_data_2 = msix_table_bir_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_2 = msix_table_bir_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_data_2 = msix_table_offset_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_2 = msix_table_offset_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_data_2 = msix_pba_bir_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_2 = msix_pba_bir_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_data_2 = msix_pba_offset_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_2 = msix_pba_offset_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_vga_enable_2 = bridge_port_vga_enable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_ssid_support_2 = bridge_port_ssid_support_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_data_2 = ssvid_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_2 = ssvid_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_data_2 = ssid_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_2 = ssid_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_data_2 = eie_before_nfts_count_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_2 = eie_before_nfts_count_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_data_2 = gen2_diffclock_nfts_count_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_2 = gen2_diffclock_nfts_count_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_data_2 = gen2_sameclock_nfts_count_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_2 = gen2_sameclock_nfts_count_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.deemphasis_enable_2 = deemphasis_enable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.pcie_spec_version_2 = pcie_spec_version_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_data_2 = l0_exit_latency_sameclock_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_2 = l0_exit_latency_sameclock_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_data_2 = l0_exit_latency_diffclock_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_2 = l0_exit_latency_diffclock_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ei_l0s_2 = rx_ei_l0s_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l2_async_logic_2 = l2_async_logic_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.aspm_optionality_2 = aspm_optionality_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.flr_capability_2 = flr_capability_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_io_space_2 = bar0_io_space_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_64bit_mem_space_2 = bar0_64bit_mem_space_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_prefetchable_2 = bar0_prefetchable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_data_2 = bar0_size_mask_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_2 = bar0_size_mask_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_io_space_2 = bar1_io_space_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_64bit_mem_space_2 = bar1_64bit_mem_space_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_prefetchable_2 = bar1_prefetchable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_data_2 = bar1_size_mask_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_2 = bar1_size_mask_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_io_space_2 = bar2_io_space_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_64bit_mem_space_2 = bar2_64bit_mem_space_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_prefetchable_2 = bar2_prefetchable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_data_2 = bar2_size_mask_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_2 = bar2_size_mask_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_io_space_2 = bar3_io_space_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_64bit_mem_space_2 = bar3_64bit_mem_space_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_prefetchable_2 = bar3_prefetchable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_data_2 = bar3_size_mask_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_2 = bar3_size_mask_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_io_space_2 = bar4_io_space_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_64bit_mem_space_2 = bar4_64bit_mem_space_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_prefetchable_2 = bar4_prefetchable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_data_2 = bar4_size_mask_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_2 = bar4_size_mask_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_io_space_2 = bar5_io_space_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_64bit_mem_space_2 = bar5_64bit_mem_space_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_prefetchable_2 = bar5_prefetchable_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_data_2 = bar5_size_mask_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_2 = bar5_size_mask_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_data_2 = expansion_base_address_register_data_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_2 = expansion_base_address_register_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.io_window_addr_width_2 = io_window_addr_width_2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.prefetchable_mem_window_addr_width_2 = prefetchable_mem_window_addr_width_2;
//Func 2 - Config Register Settings END -------------

//Func 3 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_data_3 = vendor_id_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_3 = vendor_id_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_data_3 = device_id_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_3 = device_id_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_data_3 = revision_id_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_3 = revision_id_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_data_3 = class_code_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_3 = class_code_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_data_3 = subsystem_vendor_id_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_3 = subsystem_vendor_id_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_data_3 = subsystem_device_id_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_3 = subsystem_device_id_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_soft_reset_3 = no_soft_reset_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.intel_id_access_3 = intel_id_access_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_specific_init_3 = device_specific_init_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_data_3 = maximum_current_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_3 = maximum_current_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_support_3 = d1_support_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_support_3 = d2_support_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d0_pme_3 = d0_pme_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_pme_3 = d1_pme_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_pme_3 = d2_pme_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_hot_pme_3 = d3_hot_pme_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_cold_pme_3 = d3_cold_pme_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.use_aer_3 = use_aer_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.low_priority_vc_3 = low_priority_vc_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc_arbitration_3 = vc_arbitration_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.disable_snoop_packet_3 = disable_snoop_packet_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_payload_size_3 = max_payload_size_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.surprise_down_error_support_3 = surprise_down_error_support_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.dll_active_report_support_3 = dll_active_report_support_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extend_tag_field_3 = extend_tag_field_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_data_3 = endpoint_l0_latency_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_3 = endpoint_l0_latency_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_data_3 = endpoint_l1_latency_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_3 = endpoint_l1_latency_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_data_3 = indicator_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_3 = indicator_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.role_based_error_reporting_3 = role_based_error_reporting_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_data_3 = slot_power_scale_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_3 = slot_power_scale_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_link_width_3 = max_link_width_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l1_aspm_3 = enable_l1_aspm_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l0s_aspm_3 = enable_l0s_aspm_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_data_3 = l1_exit_latency_sameclock_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_3 = l1_exit_latency_sameclock_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_data_3 = l1_exit_latency_diffclock_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_3 = l1_exit_latency_diffclock_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_data_3 = hot_plug_support_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_3 = hot_plug_support_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_data_3 = slot_power_limit_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_3 = slot_power_limit_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_data_3 = slot_number_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_3 = slot_number_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_data_3 = diffclock_nfts_count_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_3 = diffclock_nfts_count_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_data_3 = sameclock_nfts_count_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_3 = sameclock_nfts_count_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.completion_timeout_3 = completion_timeout_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_completion_timeout_disable_3 = enable_completion_timeout_disable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extended_tag_reset_3 = extended_tag_reset_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_check_capable_3 = ecrc_check_capable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_gen_capable_3 = ecrc_gen_capable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_command_completed_3 = no_command_completed_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_multi_message_capable_3 = msi_multi_message_capable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_64bit_addressing_capable_3 = msi_64bit_addressing_capable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_masking_capable_3 = msi_masking_capable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_support_3 = msi_support_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.interrupt_pin_3 = interrupt_pin_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_function_msix_support_3 = enable_function_msix_support_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_data_3 = msix_table_size_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_3 = msix_table_size_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_data_3 = msix_table_bir_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_3 = msix_table_bir_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_data_3 = msix_table_offset_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_3 = msix_table_offset_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_data_3 = msix_pba_bir_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_3 = msix_pba_bir_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_data_3 = msix_pba_offset_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_3 = msix_pba_offset_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_vga_enable_3 = bridge_port_vga_enable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_ssid_support_3 = bridge_port_ssid_support_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_data_3 = ssvid_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_3 = ssvid_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_data_3 = ssid_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_3 = ssid_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_data_3 = eie_before_nfts_count_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_3 = eie_before_nfts_count_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_data_3 = gen2_diffclock_nfts_count_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_3 = gen2_diffclock_nfts_count_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_data_3 = gen2_sameclock_nfts_count_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_3 = gen2_sameclock_nfts_count_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.deemphasis_enable_3 = deemphasis_enable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.pcie_spec_version_3 = pcie_spec_version_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_data_3 = l0_exit_latency_sameclock_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_3 = l0_exit_latency_sameclock_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_data_3 = l0_exit_latency_diffclock_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_3 = l0_exit_latency_diffclock_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ei_l0s_3 = rx_ei_l0s_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l2_async_logic_3 = l2_async_logic_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.aspm_optionality_3 = aspm_optionality_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.flr_capability_3 = flr_capability_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_io_space_3 = bar0_io_space_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_64bit_mem_space_3 = bar0_64bit_mem_space_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_prefetchable_3 = bar0_prefetchable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_data_3 = bar0_size_mask_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_3 = bar0_size_mask_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_io_space_3 = bar1_io_space_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_64bit_mem_space_3 = bar1_64bit_mem_space_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_prefetchable_3 = bar1_prefetchable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_data_3 = bar1_size_mask_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_3 = bar1_size_mask_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_io_space_3 = bar2_io_space_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_64bit_mem_space_3 = bar2_64bit_mem_space_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_prefetchable_3 = bar2_prefetchable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_data_3 = bar2_size_mask_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_3 = bar2_size_mask_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_io_space_3 = bar3_io_space_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_64bit_mem_space_3 = bar3_64bit_mem_space_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_prefetchable_3 = bar3_prefetchable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_data_3 = bar3_size_mask_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_3 = bar3_size_mask_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_io_space_3 = bar4_io_space_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_64bit_mem_space_3 = bar4_64bit_mem_space_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_prefetchable_3 = bar4_prefetchable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_data_3 = bar4_size_mask_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_3 = bar4_size_mask_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_io_space_3 = bar5_io_space_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_64bit_mem_space_3 = bar5_64bit_mem_space_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_prefetchable_3 = bar5_prefetchable_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_data_3 = bar5_size_mask_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_3 = bar5_size_mask_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_data_3 = expansion_base_address_register_data_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_3 = expansion_base_address_register_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.io_window_addr_width_3 = io_window_addr_width_3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.prefetchable_mem_window_addr_width_3 = prefetchable_mem_window_addr_width_3;
//Func 3 - Config Register Settings END -------------

//Func 4 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_data_4 = vendor_id_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_4 = vendor_id_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_data_4 = device_id_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_4 = device_id_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_data_4 = revision_id_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_4 = revision_id_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_data_4 = class_code_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_4 = class_code_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_data_4 = subsystem_vendor_id_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_4 = subsystem_vendor_id_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_data_4 = subsystem_device_id_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_4 = subsystem_device_id_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_soft_reset_4 = no_soft_reset_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.intel_id_access_4 = intel_id_access_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_specific_init_4 = device_specific_init_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_data_4 = maximum_current_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_4 = maximum_current_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_support_4 = d1_support_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_support_4 = d2_support_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d0_pme_4 = d0_pme_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_pme_4 = d1_pme_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_pme_4 = d2_pme_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_hot_pme_4 = d3_hot_pme_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_cold_pme_4 = d3_cold_pme_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.use_aer_4 = use_aer_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.low_priority_vc_4 = low_priority_vc_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc_arbitration_4 = vc_arbitration_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.disable_snoop_packet_4 = disable_snoop_packet_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_payload_size_4 = max_payload_size_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.surprise_down_error_support_4 = surprise_down_error_support_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.dll_active_report_support_4 = dll_active_report_support_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extend_tag_field_4 = extend_tag_field_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_data_4 = endpoint_l0_latency_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_4 = endpoint_l0_latency_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_data_4 = endpoint_l1_latency_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_4 = endpoint_l1_latency_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_data_4 = indicator_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_4 = indicator_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.role_based_error_reporting_4 = role_based_error_reporting_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_data_4 = slot_power_scale_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_4 = slot_power_scale_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_link_width_4 = max_link_width_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l1_aspm_4 = enable_l1_aspm_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l0s_aspm_4 = enable_l0s_aspm_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_data_4 = l1_exit_latency_sameclock_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_4 = l1_exit_latency_sameclock_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_data_4 = l1_exit_latency_diffclock_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_4 = l1_exit_latency_diffclock_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_data_4 = hot_plug_support_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_4 = hot_plug_support_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_data_4 = slot_power_limit_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_4 = slot_power_limit_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_data_4 = slot_number_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_4 = slot_number_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_data_4 = diffclock_nfts_count_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_4 = diffclock_nfts_count_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_data_4 = sameclock_nfts_count_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_4 = sameclock_nfts_count_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.completion_timeout_4 = completion_timeout_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_completion_timeout_disable_4 = enable_completion_timeout_disable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extended_tag_reset_4 = extended_tag_reset_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_check_capable_4 = ecrc_check_capable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_gen_capable_4 = ecrc_gen_capable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_command_completed_4 = no_command_completed_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_multi_message_capable_4 = msi_multi_message_capable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_64bit_addressing_capable_4 = msi_64bit_addressing_capable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_masking_capable_4 = msi_masking_capable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_support_4 = msi_support_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.interrupt_pin_4 = interrupt_pin_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_function_msix_support_4 = enable_function_msix_support_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_data_4 = msix_table_size_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_4 = msix_table_size_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_data_4 = msix_table_bir_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_4 = msix_table_bir_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_data_4 = msix_table_offset_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_4 = msix_table_offset_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_data_4 = msix_pba_bir_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_4 = msix_pba_bir_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_data_4 = msix_pba_offset_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_4 = msix_pba_offset_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_vga_enable_4 = bridge_port_vga_enable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_ssid_support_4 = bridge_port_ssid_support_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_data_4 = ssvid_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_4 = ssvid_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_data_4 = ssid_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_4 = ssid_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_data_4 = eie_before_nfts_count_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_4 = eie_before_nfts_count_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_data_4 = gen2_diffclock_nfts_count_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_4 = gen2_diffclock_nfts_count_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_data_4 = gen2_sameclock_nfts_count_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_4 = gen2_sameclock_nfts_count_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.deemphasis_enable_4 = deemphasis_enable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.pcie_spec_version_4 = pcie_spec_version_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_data_4 = l0_exit_latency_sameclock_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_4 = l0_exit_latency_sameclock_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_data_4 = l0_exit_latency_diffclock_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_4 = l0_exit_latency_diffclock_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ei_l0s_4 = rx_ei_l0s_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l2_async_logic_4 = l2_async_logic_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.aspm_optionality_4 = aspm_optionality_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.flr_capability_4 = flr_capability_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_io_space_4 = bar0_io_space_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_64bit_mem_space_4 = bar0_64bit_mem_space_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_prefetchable_4 = bar0_prefetchable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_data_4 = bar0_size_mask_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_4 = bar0_size_mask_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_io_space_4 = bar1_io_space_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_64bit_mem_space_4 = bar1_64bit_mem_space_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_prefetchable_4 = bar1_prefetchable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_data_4 = bar1_size_mask_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_4 = bar1_size_mask_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_io_space_4 = bar2_io_space_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_64bit_mem_space_4 = bar2_64bit_mem_space_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_prefetchable_4 = bar2_prefetchable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_data_4 = bar2_size_mask_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_4 = bar2_size_mask_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_io_space_4 = bar3_io_space_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_64bit_mem_space_4 = bar3_64bit_mem_space_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_prefetchable_4 = bar3_prefetchable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_data_4 = bar3_size_mask_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_4 = bar3_size_mask_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_io_space_4 = bar4_io_space_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_64bit_mem_space_4 = bar4_64bit_mem_space_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_prefetchable_4 = bar4_prefetchable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_data_4 = bar4_size_mask_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_4 = bar4_size_mask_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_io_space_4 = bar5_io_space_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_64bit_mem_space_4 = bar5_64bit_mem_space_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_prefetchable_4 = bar5_prefetchable_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_data_4 = bar5_size_mask_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_4 = bar5_size_mask_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_data_4 = expansion_base_address_register_data_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_4 = expansion_base_address_register_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.io_window_addr_width_4 = io_window_addr_width_4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.prefetchable_mem_window_addr_width_4 = prefetchable_mem_window_addr_width_4;
//Func 4 - Config Register Settings END -------------

//Func 5 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_data_5 = vendor_id_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_5 = vendor_id_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_data_5 = device_id_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_5 = device_id_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_data_5 = revision_id_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_5 = revision_id_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_data_5 = class_code_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_5 = class_code_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_data_5 = subsystem_vendor_id_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_5 = subsystem_vendor_id_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_data_5 = subsystem_device_id_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_5 = subsystem_device_id_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_soft_reset_5 = no_soft_reset_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.intel_id_access_5 = intel_id_access_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_specific_init_5 = device_specific_init_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_data_5 = maximum_current_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_5 = maximum_current_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_support_5 = d1_support_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_support_5 = d2_support_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d0_pme_5 = d0_pme_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_pme_5 = d1_pme_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_pme_5 = d2_pme_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_hot_pme_5 = d3_hot_pme_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_cold_pme_5 = d3_cold_pme_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.use_aer_5 = use_aer_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.low_priority_vc_5 = low_priority_vc_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc_arbitration_5 = vc_arbitration_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.disable_snoop_packet_5 = disable_snoop_packet_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_payload_size_5 = max_payload_size_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.surprise_down_error_support_5 = surprise_down_error_support_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.dll_active_report_support_5 = dll_active_report_support_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extend_tag_field_5 = extend_tag_field_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_data_5 = endpoint_l0_latency_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_5 = endpoint_l0_latency_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_data_5 = endpoint_l1_latency_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_5 = endpoint_l1_latency_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_data_5 = indicator_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_5 = indicator_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.role_based_error_reporting_5 = role_based_error_reporting_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_data_5 = slot_power_scale_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_5 = slot_power_scale_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_link_width_5 = max_link_width_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l1_aspm_5 = enable_l1_aspm_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l0s_aspm_5 = enable_l0s_aspm_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_data_5 = l1_exit_latency_sameclock_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_5 = l1_exit_latency_sameclock_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_data_5 = l1_exit_latency_diffclock_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_5 = l1_exit_latency_diffclock_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_data_5 = hot_plug_support_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_5 = hot_plug_support_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_data_5 = slot_power_limit_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_5 = slot_power_limit_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_data_5 = slot_number_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_5 = slot_number_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_data_5 = diffclock_nfts_count_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_5 = diffclock_nfts_count_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_data_5 = sameclock_nfts_count_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_5 = sameclock_nfts_count_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.completion_timeout_5 = completion_timeout_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_completion_timeout_disable_5 = enable_completion_timeout_disable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extended_tag_reset_5 = extended_tag_reset_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_check_capable_5 = ecrc_check_capable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_gen_capable_5 = ecrc_gen_capable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_command_completed_5 = no_command_completed_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_multi_message_capable_5 = msi_multi_message_capable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_64bit_addressing_capable_5 = msi_64bit_addressing_capable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_masking_capable_5 = msi_masking_capable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_support_5 = msi_support_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.interrupt_pin_5 = interrupt_pin_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_function_msix_support_5 = enable_function_msix_support_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_data_5 = msix_table_size_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_5 = msix_table_size_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_data_5 = msix_table_bir_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_5 = msix_table_bir_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_data_5 = msix_table_offset_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_5 = msix_table_offset_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_data_5 = msix_pba_bir_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_5 = msix_pba_bir_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_data_5 = msix_pba_offset_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_5 = msix_pba_offset_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_vga_enable_5 = bridge_port_vga_enable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_ssid_support_5 = bridge_port_ssid_support_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_data_5 = ssvid_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_5 = ssvid_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_data_5 = ssid_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_5 = ssid_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_data_5 = eie_before_nfts_count_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_5 = eie_before_nfts_count_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_data_5 = gen2_diffclock_nfts_count_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_5 = gen2_diffclock_nfts_count_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_data_5 = gen2_sameclock_nfts_count_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_5 = gen2_sameclock_nfts_count_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.deemphasis_enable_5 = deemphasis_enable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.pcie_spec_version_5 = pcie_spec_version_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_data_5 = l0_exit_latency_sameclock_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_5 = l0_exit_latency_sameclock_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_data_5 = l0_exit_latency_diffclock_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_5 = l0_exit_latency_diffclock_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ei_l0s_5 = rx_ei_l0s_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l2_async_logic_5 = l2_async_logic_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.aspm_optionality_5 = aspm_optionality_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.flr_capability_5 = flr_capability_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_io_space_5 = bar0_io_space_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_64bit_mem_space_5 = bar0_64bit_mem_space_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_prefetchable_5 = bar0_prefetchable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_data_5 = bar0_size_mask_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_5 = bar0_size_mask_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_io_space_5 = bar1_io_space_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_64bit_mem_space_5 = bar1_64bit_mem_space_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_prefetchable_5 = bar1_prefetchable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_data_5 = bar1_size_mask_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_5 = bar1_size_mask_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_io_space_5 = bar2_io_space_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_64bit_mem_space_5 = bar2_64bit_mem_space_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_prefetchable_5 = bar2_prefetchable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_data_5 = bar2_size_mask_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_5 = bar2_size_mask_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_io_space_5 = bar3_io_space_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_64bit_mem_space_5 = bar3_64bit_mem_space_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_prefetchable_5 = bar3_prefetchable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_data_5 = bar3_size_mask_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_5 = bar3_size_mask_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_io_space_5 = bar4_io_space_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_64bit_mem_space_5 = bar4_64bit_mem_space_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_prefetchable_5 = bar4_prefetchable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_data_5 = bar4_size_mask_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_5 = bar4_size_mask_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_io_space_5 = bar5_io_space_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_64bit_mem_space_5 = bar5_64bit_mem_space_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_prefetchable_5 = bar5_prefetchable_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_data_5 = bar5_size_mask_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_5 = bar5_size_mask_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_data_5 = expansion_base_address_register_data_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_5 = expansion_base_address_register_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.io_window_addr_width_5 = io_window_addr_width_5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.prefetchable_mem_window_addr_width_5 = prefetchable_mem_window_addr_width_5;
//Func 5 - Config Register Settings END -------------

//Func 6 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_data_6 = vendor_id_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_6 = vendor_id_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_data_6 = device_id_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_6 = device_id_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_data_6 = revision_id_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_6 = revision_id_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_data_6 = class_code_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_6 = class_code_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_data_6 = subsystem_vendor_id_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_6 = subsystem_vendor_id_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_data_6 = subsystem_device_id_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_6 = subsystem_device_id_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_soft_reset_6 = no_soft_reset_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.intel_id_access_6 = intel_id_access_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_specific_init_6 = device_specific_init_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_data_6 = maximum_current_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_6 = maximum_current_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_support_6 = d1_support_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_support_6 = d2_support_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d0_pme_6 = d0_pme_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_pme_6 = d1_pme_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_pme_6 = d2_pme_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_hot_pme_6 = d3_hot_pme_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_cold_pme_6 = d3_cold_pme_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.use_aer_6 = use_aer_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.low_priority_vc_6 = low_priority_vc_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc_arbitration_6 = vc_arbitration_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.disable_snoop_packet_6 = disable_snoop_packet_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_payload_size_6 = max_payload_size_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.surprise_down_error_support_6 = surprise_down_error_support_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.dll_active_report_support_6 = dll_active_report_support_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extend_tag_field_6 = extend_tag_field_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_data_6 = endpoint_l0_latency_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_6 = endpoint_l0_latency_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_data_6 = endpoint_l1_latency_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_6 = endpoint_l1_latency_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_data_6 = indicator_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_6 = indicator_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.role_based_error_reporting_6 = role_based_error_reporting_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_data_6 = slot_power_scale_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_6 = slot_power_scale_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_link_width_6 = max_link_width_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l1_aspm_6 = enable_l1_aspm_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l0s_aspm_6 = enable_l0s_aspm_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_data_6 = l1_exit_latency_sameclock_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_6 = l1_exit_latency_sameclock_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_data_6 = l1_exit_latency_diffclock_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_6 = l1_exit_latency_diffclock_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_data_6 = hot_plug_support_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_6 = hot_plug_support_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_data_6 = slot_power_limit_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_6 = slot_power_limit_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_data_6 = slot_number_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_6 = slot_number_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_data_6 = diffclock_nfts_count_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_6 = diffclock_nfts_count_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_data_6 = sameclock_nfts_count_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_6 = sameclock_nfts_count_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.completion_timeout_6 = completion_timeout_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_completion_timeout_disable_6 = enable_completion_timeout_disable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extended_tag_reset_6 = extended_tag_reset_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_check_capable_6 = ecrc_check_capable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_gen_capable_6 = ecrc_gen_capable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_command_completed_6 = no_command_completed_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_multi_message_capable_6 = msi_multi_message_capable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_64bit_addressing_capable_6 = msi_64bit_addressing_capable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_masking_capable_6 = msi_masking_capable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_support_6 = msi_support_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.interrupt_pin_6 = interrupt_pin_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_function_msix_support_6 = enable_function_msix_support_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_data_6 = msix_table_size_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_6 = msix_table_size_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_data_6 = msix_table_bir_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_6 = msix_table_bir_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_data_6 = msix_table_offset_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_6 = msix_table_offset_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_data_6 = msix_pba_bir_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_6 = msix_pba_bir_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_data_6 = msix_pba_offset_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_6 = msix_pba_offset_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_vga_enable_6 = bridge_port_vga_enable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_ssid_support_6 = bridge_port_ssid_support_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_data_6 = ssvid_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_6 = ssvid_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_data_6 = ssid_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_6 = ssid_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_data_6 = eie_before_nfts_count_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_6 = eie_before_nfts_count_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_data_6 = gen2_diffclock_nfts_count_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_6 = gen2_diffclock_nfts_count_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_data_6 = gen2_sameclock_nfts_count_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_6 = gen2_sameclock_nfts_count_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.deemphasis_enable_6 = deemphasis_enable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.pcie_spec_version_6 = pcie_spec_version_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_data_6 = l0_exit_latency_sameclock_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_6 = l0_exit_latency_sameclock_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_data_6 = l0_exit_latency_diffclock_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_6 = l0_exit_latency_diffclock_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ei_l0s_6 = rx_ei_l0s_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l2_async_logic_6 = l2_async_logic_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.aspm_optionality_6 = aspm_optionality_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.flr_capability_6 = flr_capability_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_io_space_6 = bar0_io_space_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_64bit_mem_space_6 = bar0_64bit_mem_space_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_prefetchable_6 = bar0_prefetchable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_data_6 = bar0_size_mask_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_6 = bar0_size_mask_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_io_space_6 = bar1_io_space_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_64bit_mem_space_6 = bar1_64bit_mem_space_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_prefetchable_6 = bar1_prefetchable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_data_6 = bar1_size_mask_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_6 = bar1_size_mask_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_io_space_6 = bar2_io_space_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_64bit_mem_space_6 = bar2_64bit_mem_space_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_prefetchable_6 = bar2_prefetchable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_data_6 = bar2_size_mask_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_6 = bar2_size_mask_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_io_space_6 = bar3_io_space_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_64bit_mem_space_6 = bar3_64bit_mem_space_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_prefetchable_6 = bar3_prefetchable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_data_6 = bar3_size_mask_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_6 = bar3_size_mask_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_io_space_6 = bar4_io_space_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_64bit_mem_space_6 = bar4_64bit_mem_space_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_prefetchable_6 = bar4_prefetchable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_data_6 = bar4_size_mask_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_6 = bar4_size_mask_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_io_space_6 = bar5_io_space_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_64bit_mem_space_6 = bar5_64bit_mem_space_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_prefetchable_6 = bar5_prefetchable_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_data_6 = bar5_size_mask_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_6 = bar5_size_mask_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_data_6 = expansion_base_address_register_data_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_6 = expansion_base_address_register_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.io_window_addr_width_6 = io_window_addr_width_6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.prefetchable_mem_window_addr_width_6 = prefetchable_mem_window_addr_width_6;
//Func 6 - Config Register Settings END -------------

//Func 7 - Config Register Settings START -------------
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_data_7 = vendor_id_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vendor_id_7 = vendor_id_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_data_7 = device_id_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_id_7 = device_id_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_data_7 = revision_id_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.revision_id_7 = revision_id_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_data_7 = class_code_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.class_code_7 = class_code_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_data_7 = subsystem_vendor_id_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_vendor_id_7 = subsystem_vendor_id_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_data_7 = subsystem_device_id_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.subsystem_device_id_7 = subsystem_device_id_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_soft_reset_7 = no_soft_reset_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.intel_id_access_7 = intel_id_access_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.device_specific_init_7 = device_specific_init_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_data_7 = maximum_current_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.maximum_current_7 = maximum_current_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_support_7 = d1_support_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_support_7 = d2_support_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d0_pme_7 = d0_pme_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d1_pme_7 = d1_pme_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d2_pme_7 = d2_pme_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_hot_pme_7 = d3_hot_pme_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.d3_cold_pme_7 = d3_cold_pme_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.use_aer_7 = use_aer_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.low_priority_vc_7 = low_priority_vc_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc_arbitration_7 = vc_arbitration_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.disable_snoop_packet_7 = disable_snoop_packet_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_payload_size_7 = max_payload_size_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.surprise_down_error_support_7 = surprise_down_error_support_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.dll_active_report_support_7 = dll_active_report_support_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extend_tag_field_7 = extend_tag_field_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_data_7 = endpoint_l0_latency_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l0_latency_7 = endpoint_l0_latency_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_data_7 = endpoint_l1_latency_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.endpoint_l1_latency_7 = endpoint_l1_latency_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_data_7 = indicator_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.indicator_7 = indicator_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.role_based_error_reporting_7 = role_based_error_reporting_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_data_7 = slot_power_scale_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_scale_7 = slot_power_scale_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.max_link_width_7 = max_link_width_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l1_aspm_7 = enable_l1_aspm_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_l0s_aspm_7 = enable_l0s_aspm_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_data_7 = l1_exit_latency_sameclock_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_sameclock_7 = l1_exit_latency_sameclock_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_data_7 = l1_exit_latency_diffclock_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l1_exit_latency_diffclock_7 = l1_exit_latency_diffclock_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_data_7 = hot_plug_support_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hot_plug_support_7 = hot_plug_support_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_data_7 = slot_power_limit_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_power_limit_7 = slot_power_limit_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_data_7 = slot_number_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.slot_number_7 = slot_number_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_data_7 = diffclock_nfts_count_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.diffclock_nfts_count_7 = diffclock_nfts_count_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_data_7 = sameclock_nfts_count_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.sameclock_nfts_count_7 = sameclock_nfts_count_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.completion_timeout_7 = completion_timeout_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_completion_timeout_disable_7 = enable_completion_timeout_disable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.extended_tag_reset_7 = extended_tag_reset_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_check_capable_7 = ecrc_check_capable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ecrc_gen_capable_7 = ecrc_gen_capable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.no_command_completed_7 = no_command_completed_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_multi_message_capable_7 = msi_multi_message_capable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_64bit_addressing_capable_7 = msi_64bit_addressing_capable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_masking_capable_7 = msi_masking_capable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msi_support_7 = msi_support_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.interrupt_pin_7 = interrupt_pin_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_function_msix_support_7 = enable_function_msix_support_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_data_7 = msix_table_size_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_size_7 = msix_table_size_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_data_7 = msix_table_bir_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_bir_7 = msix_table_bir_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_data_7 = msix_table_offset_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_table_offset_7 = msix_table_offset_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_data_7 = msix_pba_bir_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_bir_7 = msix_pba_bir_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_data_7 = msix_pba_offset_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.msix_pba_offset_7 = msix_pba_offset_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_vga_enable_7 = bridge_port_vga_enable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_port_ssid_support_7 = bridge_port_ssid_support_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_data_7 = ssvid_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssvid_7 = ssvid_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_data_7 = ssid_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ssid_7 = ssid_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_data_7 = eie_before_nfts_count_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.eie_before_nfts_count_7 = eie_before_nfts_count_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_data_7 = gen2_diffclock_nfts_count_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_diffclock_nfts_count_7 = gen2_diffclock_nfts_count_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_data_7 = gen2_sameclock_nfts_count_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.gen2_sameclock_nfts_count_7 = gen2_sameclock_nfts_count_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.deemphasis_enable_7 = deemphasis_enable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.pcie_spec_version_7 = pcie_spec_version_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_data_7 = l0_exit_latency_sameclock_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_sameclock_7 = l0_exit_latency_sameclock_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_data_7 = l0_exit_latency_diffclock_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l0_exit_latency_diffclock_7 = l0_exit_latency_diffclock_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ei_l0s_7 = rx_ei_l0s_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l2_async_logic_7 = l2_async_logic_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.aspm_optionality_7 = aspm_optionality_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.flr_capability_7 = flr_capability_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_io_space_7 = bar0_io_space_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_64bit_mem_space_7 = bar0_64bit_mem_space_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_prefetchable_7 = bar0_prefetchable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_data_7 = bar0_size_mask_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar0_size_mask_7 = bar0_size_mask_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_io_space_7 = bar1_io_space_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_64bit_mem_space_7 = bar1_64bit_mem_space_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_prefetchable_7 = bar1_prefetchable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_data_7 = bar1_size_mask_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar1_size_mask_7 = bar1_size_mask_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_io_space_7 = bar2_io_space_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_64bit_mem_space_7 = bar2_64bit_mem_space_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_prefetchable_7 = bar2_prefetchable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_data_7 = bar2_size_mask_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar2_size_mask_7 = bar2_size_mask_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_io_space_7 = bar3_io_space_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_64bit_mem_space_7 = bar3_64bit_mem_space_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_prefetchable_7 = bar3_prefetchable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_data_7 = bar3_size_mask_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar3_size_mask_7 = bar3_size_mask_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_io_space_7 = bar4_io_space_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_64bit_mem_space_7 = bar4_64bit_mem_space_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_prefetchable_7 = bar4_prefetchable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_data_7 = bar4_size_mask_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar4_size_mask_7 = bar4_size_mask_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_io_space_7 = bar5_io_space_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_64bit_mem_space_7 = bar5_64bit_mem_space_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_prefetchable_7 = bar5_prefetchable_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_data_7 = bar5_size_mask_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bar5_size_mask_7 = bar5_size_mask_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_data_7 = expansion_base_address_register_data_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.expansion_base_address_register_7 = expansion_base_address_register_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.io_window_addr_width_7 = io_window_addr_width_7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.prefetchable_mem_window_addr_width_7 = prefetchable_mem_window_addr_width_7;
//Func 7 - Config Register Settings END -------------


defparam arriav_hd_altpe2_hip_top_encrypted_i.porttype_func0 = porttype_func0;
defparam arriav_hd_altpe2_hip_top_encrypted_i.porttype_func1 = porttype_func1;
defparam arriav_hd_altpe2_hip_top_encrypted_i.porttype_func2 = porttype_func2;
defparam arriav_hd_altpe2_hip_top_encrypted_i.porttype_func3 = porttype_func3;
defparam arriav_hd_altpe2_hip_top_encrypted_i.porttype_func4 = porttype_func4;
defparam arriav_hd_altpe2_hip_top_encrypted_i.porttype_func5 = porttype_func5;
defparam arriav_hd_altpe2_hip_top_encrypted_i.porttype_func6 = porttype_func6;
defparam arriav_hd_altpe2_hip_top_encrypted_i.porttype_func7 = porttype_func7;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rxfreqlk_cnt_data = rxfreqlk_cnt_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rxfreqlk_cnt = rxfreqlk_cnt;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rxfreqlk_cnt_en = rxfreqlk_cnt_en;
defparam arriav_hd_altpe2_hip_top_encrypted_i.testmode_control = testmode_control;
defparam arriav_hd_altpe2_hip_top_encrypted_i.skp_insertion_control = skp_insertion_control;
defparam arriav_hd_altpe2_hip_top_encrypted_i.tx_l0s_adjust = tx_l0s_adjust;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_cdc_almost_full_data = rx_cdc_almost_full_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_cdc_almost_full = rx_cdc_almost_full;
defparam arriav_hd_altpe2_hip_top_encrypted_i.tx_cdc_almost_full_data = tx_cdc_almost_full_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.tx_cdc_almost_full = tx_cdc_almost_full;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_l0s_count_idl_data = rx_l0s_count_idl_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_l0s_count_idl = rx_l0s_count_idl;
defparam arriav_hd_altpe2_hip_top_encrypted_i.cdc_dummy_insert_limit_data = cdc_dummy_insert_limit_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.cdc_dummy_insert_limit = cdc_dummy_insert_limit;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ei_delay_powerdown_count_data = ei_delay_powerdown_count_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.ei_delay_powerdown_count = ei_delay_powerdown_count;
defparam arriav_hd_altpe2_hip_top_encrypted_i.millisecond_cycle_count_data = millisecond_cycle_count_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.millisecond_cycle_count = millisecond_cycle_count;
defparam arriav_hd_altpe2_hip_top_encrypted_i.skp_os_schedule_count_data = skp_os_schedule_count_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.skp_os_schedule_count = skp_os_schedule_count;
defparam arriav_hd_altpe2_hip_top_encrypted_i.fc_init_timer_data = fc_init_timer_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.fc_init_timer = fc_init_timer;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l01_entry_latency_data = l01_entry_latency_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.l01_entry_latency = l01_entry_latency;
defparam arriav_hd_altpe2_hip_top_encrypted_i.flow_control_update_count_data = flow_control_update_count_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.flow_control_update_count = flow_control_update_count;
defparam arriav_hd_altpe2_hip_top_encrypted_i.flow_control_timeout_count_data = flow_control_timeout_count_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.flow_control_timeout_count = flow_control_timeout_count;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_flow_ctrl_posted_header_data = vc0_rx_flow_ctrl_posted_header_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_flow_ctrl_posted_header = vc0_rx_flow_ctrl_posted_header;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_flow_ctrl_posted_data_data = vc0_rx_flow_ctrl_posted_data_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_flow_ctrl_posted_data = vc0_rx_flow_ctrl_posted_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_flow_ctrl_nonposted_header_data = vc0_rx_flow_ctrl_nonposted_header_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_flow_ctrl_nonposted_header = vc0_rx_flow_ctrl_nonposted_header;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_flow_ctrl_nonposted_data_data = vc0_rx_flow_ctrl_nonposted_data_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_flow_ctrl_nonposted_data = vc0_rx_flow_ctrl_nonposted_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_flow_ctrl_compl_header_data = vc0_rx_flow_ctrl_compl_header_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_flow_ctrl_compl_header = vc0_rx_flow_ctrl_compl_header;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_flow_ctrl_compl_data_data = vc0_rx_flow_ctrl_compl_data_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_flow_ctrl_compl_data = vc0_rx_flow_ctrl_compl_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ptr0_posted_dpram_min_data = rx_ptr0_posted_dpram_min_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ptr0_posted_dpram_min = rx_ptr0_posted_dpram_min;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ptr0_posted_dpram_max_data = rx_ptr0_posted_dpram_max_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ptr0_posted_dpram_max = rx_ptr0_posted_dpram_max;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ptr0_nonposted_dpram_min_data = rx_ptr0_nonposted_dpram_min_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ptr0_nonposted_dpram_min = rx_ptr0_nonposted_dpram_min;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ptr0_nonposted_dpram_max_data = rx_ptr0_nonposted_dpram_max_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rx_ptr0_nonposted_dpram_max = rx_ptr0_nonposted_dpram_max;
defparam arriav_hd_altpe2_hip_top_encrypted_i.retry_buffer_last_active_address_data = retry_buffer_last_active_address_data;
//defparam arriav_hd_altpe2_hip_top_encrypted_i.retry_buffer_last_active_address = retry_buffer_last_active_address;
defparam arriav_hd_altpe2_hip_top_encrypted_i.retry_buffer_memory_settings_data           = retry_buffer_memory_settings_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.retry_buffer_memory_settings = retry_buffer_memory_settings;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_buffer_memory_settings_data          = vc0_rx_buffer_memory_settings_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_rx_buffer_memory_settings = vc0_rx_buffer_memory_settings;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bist_memory_settings_data = bist_memory_settings_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bist_memory_settings = bist_memory_settings;
defparam arriav_hd_altpe2_hip_top_encrypted_i.bridge_66mhzcap = bridge_66mhzcap;
defparam arriav_hd_altpe2_hip_top_encrypted_i.fastb2bcap = fastb2bcap;
defparam arriav_hd_altpe2_hip_top_encrypted_i.devseltim = devseltim;
defparam arriav_hd_altpe2_hip_top_encrypted_i.memwrinv = memwrinv;
defparam arriav_hd_altpe2_hip_top_encrypted_i.credit_buffer_allocation_aux = credit_buffer_allocation_aux;
defparam arriav_hd_altpe2_hip_top_encrypted_i.enable_adapter_half_rate_mode = enable_adapter_half_rate_mode;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc0_clk_enable = vc0_clk_enable;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vc1_clk_enable = vc1_clk_enable;
defparam arriav_hd_altpe2_hip_top_encrypted_i.register_pipe_signals = register_pipe_signals;
defparam arriav_hd_altpe2_hip_top_encrypted_i.iei_enable_settings = iei_enable_settings;
defparam arriav_hd_altpe2_hip_top_encrypted_i.lattim_ro_data = lattim_ro_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.lattim = lattim;
defparam arriav_hd_altpe2_hip_top_encrypted_i.br_rcb = br_rcb;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vsec_id_data = vsec_id_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vsec_id = vsec_id;
defparam arriav_hd_altpe2_hip_top_encrypted_i.cvp_enable = cvp_enable;
defparam arriav_hd_altpe2_hip_top_encrypted_i.cvp_rate_sel = cvp_rate_sel;
defparam arriav_hd_altpe2_hip_top_encrypted_i.hard_reset_bypass = hard_reset_bypass;
defparam arriav_hd_altpe2_hip_top_encrypted_i.cvp_data_compressed = cvp_data_compressed;
defparam arriav_hd_altpe2_hip_top_encrypted_i.cvp_data_encrypted = cvp_data_encrypted;
defparam arriav_hd_altpe2_hip_top_encrypted_i.cvp_mode_reset = cvp_mode_reset;
defparam arriav_hd_altpe2_hip_top_encrypted_i.cvp_clk_reset = cvp_clk_reset;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vsec_cap_data = vsec_cap_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.vsec_cap = vsec_cap;
defparam arriav_hd_altpe2_hip_top_encrypted_i.jtag_id_data = jtag_id_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.jtag_id = jtag_id;
defparam arriav_hd_altpe2_hip_top_encrypted_i.user_id_data = user_id_data;
defparam arriav_hd_altpe2_hip_top_encrypted_i.user_id = user_id;
defparam arriav_hd_altpe2_hip_top_encrypted_i.disable_auto_crs = disable_auto_crs;

// Hard reset controller section;

defparam arriav_hd_altpe2_hip_top_encrypted_i.hrdrstctrl_en                      = hrdrstctrl_en;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_pld_clr                    = rstctrl_pld_clr;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_debug_en                   = rstctrl_debug_en;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_force_inactive_rst         = rstctrl_force_inactive_rst;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_perst_enable               = rstctrl_perst_enable;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_hip_ep                     = rstctrl_hip_ep;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_hard_block_enable          = rstctrl_hard_block_enable;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_rx_pma_rstb_inv            = rstctrl_rx_pma_rstb_inv;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_tx_pma_rstb_inv            = rstctrl_tx_pma_rstb_inv;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_rx_pcs_rst_n_inv           = rstctrl_rx_pcs_rst_n_inv;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_tx_pcs_rst_n_inv           = rstctrl_tx_pcs_rst_n_inv;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_altpe2_crst_n_inv          = rstctrl_altpe2_crst_n_inv;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_altpe2_srst_n_inv          = rstctrl_altpe2_srst_n_inv;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_altpe2_rst_n_inv           = rstctrl_altpe2_rst_n_inv;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_tx_pma_syncp_inv           = rstctrl_tx_pma_syncp_inv;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_1us_count_fref_clk         = rstctrl_1us_count_fref_clk;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_1us_count_fref_clk_value   = rstctrl_1us_count_fref_clk_value;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_1ms_count_fref_clk         = rstctrl_1ms_count_fref_clk;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_1ms_count_fref_clk_value   = rstctrl_1ms_count_fref_clk_value;

defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_off_cal_done_select        = rstctrl_off_cal_done_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_rx_pma_rstb_cmu_select     = rstctrl_rx_pma_rstb_cmu_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_rx_pma_rstb_select         = rstctrl_rx_pma_rstb_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_rx_pll_freq_lock_select    = rstctrl_rx_pll_freq_lock_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_mask_tx_pll_lock_select    = rstctrl_mask_tx_pll_lock_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_rx_pll_lock_select         = rstctrl_rx_pll_lock_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_perstn_select              = rstctrl_perstn_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_tx_lc_pll_rstb_select      = rstctrl_tx_lc_pll_rstb_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_fref_clk_select            = rstctrl_fref_clk_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_off_cal_en_select          = rstctrl_off_cal_en_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_tx_pma_syncp_select        = rstctrl_tx_pma_syncp_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_rx_pcs_rst_n_select        = rstctrl_rx_pcs_rst_n_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_tx_cmu_pll_lock_select     = rstctrl_tx_cmu_pll_lock_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_tx_pcs_rst_n_select        = rstctrl_tx_pcs_rst_n_select;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_tx_lc_pll_lock_select      = rstctrl_tx_lc_pll_lock_select;

defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_a        = rstctrl_timer_a;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_a_type   = rstctrl_timer_a_type;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_a_value  = rstctrl_timer_a_value;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_b        = rstctrl_timer_b;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_b_type   = rstctrl_timer_b_type;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_b_value  = rstctrl_timer_b_value;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_c        = rstctrl_timer_c;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_c_type   = rstctrl_timer_c_type;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_c_value  = rstctrl_timer_c_value;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_d        = rstctrl_timer_d;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_d_type   = rstctrl_timer_d_type;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_d_value  = rstctrl_timer_d_value;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_e        = rstctrl_timer_e;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_e_type   = rstctrl_timer_e_type;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_e_value  = rstctrl_timer_e_value;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_f        = rstctrl_timer_f;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_f_type   = rstctrl_timer_f_type;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_f_value  = rstctrl_timer_f_value;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_g        = rstctrl_timer_g;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_g_type   = rstctrl_timer_g_type;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_g_value  = rstctrl_timer_g_value;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_h        = rstctrl_timer_h;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_h_type   = rstctrl_timer_h_type;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_h_value  = rstctrl_timer_h_value;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_i        = rstctrl_timer_i;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_i_type   = rstctrl_timer_i_type;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_i_value  = rstctrl_timer_i_value;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_j        = rstctrl_timer_j;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_j_type   = rstctrl_timer_j_type;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_timer_j_value  = rstctrl_timer_j_value;
defparam arriav_hd_altpe2_hip_top_encrypted_i.rstctrl_ltssm_disable  = rstctrl_ltssm_disable;
defparam arriav_hd_altpe2_hip_top_encrypted_i.cvp_isolation          = cvp_isolation;

endmodule //arriav_hssi_gen3_pcie_hip

