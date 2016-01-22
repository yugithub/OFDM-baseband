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
-- $RCSfile: auk_dspip_r22sdf_source_control.vhd,v $
-- $Source: /cvs/uksw/dsp_cores/FFT/src/rtl/lib/r22sdf/auk_dspip_r22sdf_source_control.vhd,v $
--
-- $Revision: #1 $
-- $Date: 2015/02/08 $
-- Check in by     : $Author: swbranch $
-- Author   :  kmarks
--
-- Project      :  auk_dspip_r22sdf
--
-- Description : 
--
-- Avalon streaming source control
-- 
--
-- $Log: auk_dspip_r22sdf_source_control.vhd,v $
-- Revision 1.5  2006/12/05 10:54:44  kmarks
-- updated from the 6.1 branch
--
-- Revision 1.4.2.1  2006/09/28 16:47:30  kmarks
-- fmax improvements SPR 219316
--
-- Revision 1.4  2006/09/06 14:39:40  kmarks
-- added global clock enable and error ports to atlantic interfaces. Added checkbox on GUI for Global clock enable . Some bug fixed for the new architecture.
--
-- Revision 1.3  2006/08/24 12:49:28  kmarks
-- various bug fixes and added bit reversal.
--
-- Revision 1.2  2006/08/14 12:08:36  kmarks
-- *** empty log message ***
--
-- ALTERA Confidential and Proprietary
-- Copyright 2006 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.auk_dspip_math_pkg.all;

entity auk_dspip_avalon_streaming_block_source is
  generic (
    MAX_BLK_g : natural := 1024;
    DATAWIDTH_g  : natural := 18
    );
  port (
    clk          : in  std_logic;
    reset        : in  std_logic;
    in_blk    : in  std_logic_vector(log2_ceil(MAX_BLK_g) downto 0);
    in_valid     : in  std_logic;
    source_stall : out std_logic;
    in_data      : in  std_logic_vector(DATAWIDTH_g - 1 downto 0);
    source_valid : out std_logic;
    source_ready : in  std_logic;
    source_sop   : out std_logic;
    source_eop   : out std_logic;
    source_data  : out std_logic_vector(DATAWIDTH_g - 1 downto 0)
    );
end entity auk_dspip_avalon_streaming_block_source;



architecture rtl of auk_dspip_avalon_streaming_block_source is

  constant MAX_PWR_2_c : natural := log2_ceil(MAX_BLK_g) rem 2;

  type   state_t is (IDLE, OUT_1, OUT_2, OUT_3);
  signal state      : state_t;
  signal next_state : state_t;

  signal data_count    : natural range 0 to MAX_BLK_g;

  type shunt_registers_t is array (1 downto 0) of std_logic_vector(DATAWIDTH_g - 1 downto 0);
  
  signal in_data_shunt : shunt_registers_t;

  -- control signals
  signal source_valid_s : std_logic;
  signal source_stall_s : std_logic;

begin  -- architecture rtl


  -----------------------------------------------------------------------------
  -- assign ouotputs
  -----------------------------------------------------------------------------

  -- control signals
  source_valid <= source_valid_s;



 ------------------------------------------------------------------------------
 -- stall when there is no ready from the receiver, or while the shunt
 -- registers are full.
 ------------------------------------------------------------------------------
  stall_p : process (clk, reset)
  begin  -- process stall_p
    if reset = '1' then  
      source_stall_s <= '0';
    elsif rising_edge(clk) then 
      if (source_valid_s = '1' and source_ready = '0' ) or
        (source_valid_s = '1' and source_ready = '1' and state = OUT_3) then
        source_stall_s <= '1';
      else
        source_stall_s <= '0';
      end if;
    end if;
  end process stall_p;
  
  source_stall   <= source_stall_s;


  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  fsm_reg : process (clk, reset) is
  begin
    if reset = '1' then
      state <= IDLE;
    elsif rising_edge(clk) then
      state <= next_state;
    end if;
  end process fsm_reg;

  fsm_cmb : process(in_valid, source_ready, state) is
  begin
    case state is

      when IDLE =>
        next_state <= IDLE;
        if in_valid = '1' then
          next_state <= OUT_1;
        end if;

      when OUT_1 =>
        next_state <= OUT_1;
        if in_valid = '1' then
          if source_ready = '1' then
            next_state <= OUT_1;
          else
            next_state <= OUT_2;
          end if;
        elsif in_valid = '0' then
          if source_ready = '1' then
            next_state <= IDLE;
          end if;
        end if;
        
      when OUT_2 =>
        next_state <= OUT_2;
        if in_valid = '1' then
          if source_ready = '1' then
            next_state <= OUT_2;
          else
            next_state <= OUT_3;
          end if;
        elsif in_valid = '0' then
          if source_ready = '1'  then
            next_state <= OUT_1;
            else
              next_state <= OUT_2;
          end if;
        end if;
        
      when OUT_3 =>
        next_state <= OUT_3;
        if in_valid = '1' then
          -- in_valid should not be asserted (stalled previous to this state)
          assert in_valid = '1' report "in_valid asserted in state OUT_3" severity error;
        elsif in_valid = '0' then
          if source_ready = '1'  then
            next_state <= OUT_2;
            else
              next_state <= OUT_3;
          end if;
        end if;
        
      when others =>
        next_state <= IDLE;
        
    end case;
  end process fsm_cmb;

 
  -- outputs from fsm
  source_valid_s <= '1' when (state = OUT_1 or state = OUT_2 or state = OUT_3 ) else
                    '0';

  -----------------------------------------------------------------------------
  -- Data is shunted between registers.
  -----------------------------------------------------------------------------
  shunt_p : process (clk, reset)
  begin  -- process shunt_p
    if reset = '1' then  
      in_data_shunt <= (others => (others => '0'));
    elsif rising_edge(clk) then 
      -- first shunt register
      if (in_valid = '1' and source_ready = '0' and state = OUT_1) or
          (in_valid = '1' and source_ready = '1' and state = OUT_2) then
          in_data_shunt(0) <= in_data;
      elsif source_ready = '1' and state = OUT_3 then
          in_data_shunt(0) <= in_data_shunt(1);
      end if;
      -- second shunt register.
       if in_valid = '1' and source_ready = '0' and state = OUT_2 then
          in_data_shunt(1) <= in_data;
       end if;
    end if;
  end process shunt_p;

  -- output data register
  out_data_p : process (clk, reset)
  begin  -- process out_data_p
    if reset = '1' then  
      source_data <= (others => '0');
    elsif rising_edge(clk) then 
      if (in_valid = '1' and state = IDLE) or
      (in_valid = '1' and source_ready = '1' and state = OUT_1) then
        source_data <= in_data;
      elsif source_ready = '1' and (state = OUT_2 or state = OUT_3) then
        source_data <= in_data_shunt(0);
      end if;
    end if;
  end process out_data_p;
  

  source_sop <= '1' when data_count = 0 else
                '0';
  source_eop <= '1' when data_count = unsigned(in_blk) - 1 else
                '0';

  data_count_p : process (clk, reset) is
  begin
    if reset = '1' then
      data_count <= 0;
    elsif rising_edge(clk) then
      if source_valid_s = '1' and source_ready = '1' then
        if data_count = unsigned(in_blk) - 1 then
          data_count <= 0;
        else
          data_count <= data_count + 1;
        end if;
      end if;
    end if;

  end process data_count_p;



  

end architecture rtl;
