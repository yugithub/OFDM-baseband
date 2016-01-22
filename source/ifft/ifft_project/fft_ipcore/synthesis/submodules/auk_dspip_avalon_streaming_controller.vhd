-- (C) 2001-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License Subscription 
-- Agreement, Altera MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-------------------------------------------------------------------------
-------------------------------------------------------------------------
--
-- Revision Control Information
--
-- $RCSfile: auk_dspip_avalon_streaming_controller.vhd,v $
-- $Source: /cvs/uksw/dsp_cores/lib/fu/avalon_streaming/rtl/auk_dspip_avalon_streaming_controller.vhd,v $
--
-- $Revision: #1 $
-- $Date: 2015/02/08 $
-- Check in by     : $Author: swbranch $
-- Author   :  Suleyman Demirsoy
--
-- Project      :  Avalon Streaming Wrapper for DSPIP
--
-- Description : 
--
-- This file is the Interface controller for the Avalon Streaming Wrapper.
-- The control signals between sink, core, and source modules are communicated
-- via the controller. The stall output is used as the core enable signal in
-- the wrapper.
--
--
-- Revision 1.1.2.1  2006/09/18 13:39:16  sdemirso
-- clk_en behaviour corrected
--
-- Revision 1.1  2006/08/22 15:30:53  sdemirso
-- name change for the interface controller
--
-- Revision 1.1  2006/08/22 14:58:51  sdemirso
-- new versions of the atlantic II blocks
--
-- ALTERA Confidential and Proprietary
-- Copyright 2006 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity auk_dspip_avalon_streaming_controller is
  port(
    clk                 : in  std_logic;
    clk_en              : in  std_logic := '1';
    reset_n             : in  std_logic;
    ready               : in  std_logic;
    sink_packet_error   : in  std_logic_vector (1 downto 0);
    sink_stall          : in  std_logic;
    source_stall        : in  std_logic;
    valid               : in  std_logic;
    reset_design        : out std_logic;
    sink_ready_ctrl     : out std_logic;
    source_packet_error : out std_logic_vector (1 downto 0);
    source_valid_ctrl   : out std_logic;
    stall               : out std_logic
    );

-- Declarations

end auk_dspip_avalon_streaming_controller;

-- hds interface_end

architecture struct of auk_dspip_avalon_streaming_controller is

  signal stall_int        : std_logic;
--  signal res              : std_logic;
  signal sink_stall_reg   : std_logic;
  signal source_stall_reg : std_logic;
  signal stall_reg        : std_logic;

-- attributes for stall_reg to limit max fanout
  attribute maxfan              : integer;
  attribute maxfan of stall_reg : signal is 500;
  --attribute maxfan of res       : signal is 500;

-- attributes for res
  --attribute altera_attribute        : string;
  --attribute altera_attribute of res : signal is "-name ADV_NETLIST_OPT_ALLOWED ""ALWAYS ALLOW"" ";
  
begin

  reset_design <= not reset_n;
  
  stall_int <= sink_stall or source_stall;

  source_valid_ctrl <= valid and (not sink_stall_reg) and clk_en when source_stall_reg = '0' else
                       valid;
  sink_ready_ctrl <= ready and (not source_stall_reg) and clk_en when sink_stall_reg = '0' else
                     ready;
  stall <= stall_reg when clk_en = '1' else '1';

  other_reg : process (clk, reset_n)
  begin  -- process res_reg
    if reset_n = '0' then
      sink_stall_reg      <= '1';
      source_stall_reg    <= '1';
      stall_reg           <= '1';
      source_packet_error <= "00";
    elsif rising_edge(clk) then
      sink_stall_reg      <= sink_stall;
      source_stall_reg    <= source_stall;
      stall_reg           <= stall_int;
      source_packet_error <= sink_packet_error;
    end if;
  end process other_reg;
end struct;
