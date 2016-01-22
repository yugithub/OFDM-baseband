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
-- $RCSfile: auk_dspip_avalon_streaming_source.vhd,v $
-- $Source: /cvs/uksw/dsp_cores/lib/fu/avalon_streaming/rtl/auk_dspip_avalon_streaming_source.vhd,v $
--
-- $Revision: #1 $
-- $Date: 2015/02/08 $
-- Check in by     : $Author: swbranch $
-- Author   :  Suleyman S. Demirsoy
--
-- Project      :  Avalon_streaming II Source Interface with ready_latency=0
--
-- Description : 
--
-- This interface is capable of handling single or multi channel streams as
-- well as blocks of data. The at_source_sop and at_source_eop are generated as
-- described in the Avalon_streaming II specification. The at_source_error output is a 2-
-- bit signal that complies with the PFC error format (by Kent Orthner). 
-- 
-- 00: no error
-- 01: missing sop
-- 10: missing eop
-- 11: unexpected eop
-- other types of errors also marked as 11. Any error signal is accompanied
-- by at_sink_eop flagged high. 
--
-- When packet_size is greater than one, this interface expects the main design
-- to supply the count of data starting from 1 to the packet_size. When it
-- receives the valid flag together with the data_count=1, it starts pumping
-- out data by flagging the at_source_sop and at_source_valid both high.
--
-- When the data_count=packet_size, the at_source_eop is flagged high together
-- with at_source_valid.  THERE IS NO ERROR CHECKING FOR THE data_count signal.
--
-- If the receiver is not ready to accept any data, the interface flags the source_
-- stall signal high to tell the design to stall. It is the designers
-- responsibility to use this signal properly. In some design, the stall signal
-- needs to stall all of the design so that no new data can be accepted (as in
-- FIR), in other cases (i.e. a FIFO built on a dual port RAM),the input can
-- still accept new data although it cannot send any output.
-- 
-- ALTERA Confidential and Proprietary
-- Copyright 2006 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library work;
use work.auk_dspip_math_pkg.all;

entity auk_dspip_avalon_streaming_source is
  generic(
    WIDTH_g         : integer := 16;
    PACKET_SIZE_g   : natural := 4;
    HAVE_COUNTER_g  : string := "false";
    COUNTER_LIMIT_g : natural := 4;
    MULTI_CHANNEL_g : string := "true"
    );
  port(
    clk               : in  std_logic;
    reset_n           : in  std_logic;
    ----------------- DESIGN SIDE SIGNALS
    data              : in  std_logic_vector (WIDTH_g-1 downto 0);
    data_count        : in  std_logic_vector (log2_ceil_one(PACKET_SIZE_g)-1 downto 0) := (others => '0');
    source_valid_ctrl : in  std_logic;
    design_stall      : in  std_logic;
    source_stall      : out std_logic;
    packet_error      : in  std_logic_vector (1 downto 0);
    ----------------- AVALON_STREAMING SIDE SIGNALS
    at_source_ready   : in  std_logic;
    at_source_valid   : out std_logic;
    at_source_data    : out std_logic_vector (WIDTH_g-1 downto 0);
    at_source_channel : out std_logic_vector (log2_ceil_one(PACKET_SIZE_g)-1 downto 0);
    at_source_error   : out std_logic_vector (1 downto 0);
    at_source_sop     : out std_logic;
    at_source_eop     : out std_logic
    );

-- Declarations

end auk_dspip_avalon_streaming_source;

-- hds interface_end
architecture rtl of auk_dspip_avalon_streaming_source is

  constant LOG2PACKET_SIZE_c : natural := log2_ceil_one(PACKET_SIZE_g);
  type STATE_TYPE_t is (start, sop, run1, st_err, end1);  --wait1, stall,
  signal source_next_state   : STATE_TYPE_t;
  signal data_wr_enb0        : std_logic;
  signal data_wr_enb1        : std_logic;
  signal data_wr_enb         : std_logic;
  signal packet_error0       : std_logic;
  signal at_source_error_int : std_logic_vector(1 downto 0);

  signal at_source_sop_int   : std_logic;
  signal at_source_sop_s     : std_logic;
  signal at_source_eop_int   : std_logic;
  signal at_source_eop_s     : std_logic;
  signal at_source_valid_int : std_logic;
  signal at_source_valid_s   : std_logic;
  signal source_stall_int    : std_logic;
  signal source_stall_int_d  : std_logic;
  signal source_stall_s      : std_logic;
  signal was_stalled         : std_logic;

  signal data_int                : std_logic_vector(WIDTH_g-1 downto 0);
  signal data_int1               : std_logic_vector(WIDTH_g-1 downto 0);
  signal data_select             : std_logic;
  signal data_select_next        : std_logic;
  signal first_data              : std_logic;
  signal data_int_selected       : std_logic_vector(WIDTH_g-1 downto 0);
  signal valid_ctrl_int          : std_logic;
  signal valid_ctrl_int1         : std_logic;
  signal valid_ctrl_inter        : std_logic;
  signal valid_ctrl_inter1       : std_logic;
  signal data_count_int          : std_logic_vector(LOG2PACKET_SIZE_c-1 downto 0);
  signal data_count_int1         : std_logic_vector(LOG2PACKET_SIZE_c-1 downto 0);
  signal data_count_int_selected : std_logic_vector(LOG2PACKET_SIZE_c-1 downto 0);
  signal count_will_finish       : boolean;
  signal stall_ctrl_state        : std_logic_vector(1 downto 0);
  signal allow_transfer          : std_logic;
  

begin

  
  single_channel : if PACKET_SIZE_g = 1 generate

    at_source_sop_int      <= '0';
    at_source_eop_int      <= '0';
    packet_error0          <= packet_error(0);
    at_source_error_int(1) <= '0';
    at_source_error_int(0) <= packet_error0;

    source_next_state <= st_err when packet_error0 = '1' else
                         start;
    allow_transfer <= '1';
  end generate single_channel;

  packet_multi : if PACKET_SIZE_g > 1 generate
      signal source_state        : STATE_TYPE_t;
      signal valid_ctrl_int_selected : std_logic;
      signal count_finished          : boolean;
      signal count_started           : boolean;
   begin
    counter_no : if HAVE_COUNTER_g = "false" generate
      signal data_counter : unsigned(LOG2PACKET_SIZE_c-1 downto 0);
    begin
      count_finished <= true when data_counter = to_unsigned(PACKET_SIZE_g-1, LOG2PACKET_SIZE_c) and 
                                  ((data_select='0' and valid_ctrl_int='1') or (data_select='1' and valid_ctrl_int1='1')) else
                        false;
      data_counter  <= unsigned(data_count_int_selected);
      count_started <= true when data_counter = 0 and 
                                ((data_select='0' and valid_ctrl_int='1') or (data_select='1' and valid_ctrl_int1='1')) else
                       false;
    end generate counter_no;

    counter_yes : if HAVE_COUNTER_g = "true" generate


      signal data_counter : unsigned(log2_ceil(COUNTER_LIMIT_g)-1 downto 0);
    begin
      count_finished <= true when data_counter = to_unsigned(COUNTER_LIMIT_g-1, log2_ceil(COUNTER_LIMIT_g)) else
                        false;
      count_started <= true when data_counter = 0 else
                       false;
      packet_counter : process (clk, reset_n)
      begin  -- process packet_counter
        if reset_n = '0' then
          data_counter <= (others => '0');
        elsif rising_edge(clk) then
          if source_state = start and source_next_state = sop then
            data_counter <= (others => '0');  --data_counter +1;
          elsif at_source_valid_s = '1' and at_source_ready = '1' and (data_counter < COUNTER_LIMIT_g-1) then
            data_counter <= data_counter +1;
          elsif count_finished = true then
            data_counter <= (others => '0');
          end if;
        end if;
      end process packet_counter;
    end generate counter_yes;
    packet_error0 <= packet_error(1) or packet_error(0);

    allow_transfer <= '1' when source_next_state=sop or source_next_state=run1 or source_next_state=end1 else
                      '0';
    valid_ctrl_int_selected <= valid_ctrl_int when data_select='0' else
                             valid_ctrl_int1;                     
    source_comb_update_2 : process (at_source_ready, at_source_sop_s,
                                    count_finished, count_started, data_count_int,
                                    packet_error, packet_error0, source_state,
                                    valid_ctrl_int, valid_ctrl_int1,
                                    at_source_valid_s, valid_ctrl_int_selected)
    begin  -- process source_comb_update_2
      
      case source_state is
        when start =>
          
          if packet_error0 = '1' then
            source_next_state   <= st_err;
            at_source_error_int <= packet_error;
            at_source_sop_int   <= '0';
            at_source_eop_int   <= '1';
          else
            at_source_eop_int   <= '0';
            at_source_error_int <= "00";
            if valid_ctrl_int_selected = '1' and count_started = true then  --and at_source_ready='1' then
              source_next_state <= sop;
              at_source_sop_int <= '1';
            else
              source_next_state <= start;
              at_source_sop_int <= '0';
            end if;
          end if;
          
        when sop =>
          
          if packet_error0 = '1' then
            source_next_state   <= st_err;
            at_source_error_int <= packet_error;
            at_source_sop_int   <= '0';
            at_source_eop_int   <= '1';
          else
            at_source_error_int <= "00";
            at_source_eop_int   <= '0';
            if at_source_valid_s = '1' and at_source_ready = '1' and count_finished = false then
              if PACKET_SIZE_g > 2 then
                source_next_state <= run1;
              else
                source_next_state <= end1;
              end if;
              at_source_sop_int <= '0';
            elsif (at_source_ready = '1' and at_source_valid_s = '1' and count_finished = true) or
              (at_source_valid_s = '0' and count_finished = true) then  --valid_ctrl_int = '1' and
              source_next_state   <= end1;
              at_source_error_int <= "00";
              at_source_eop_int   <= '1';
              at_source_sop_int   <= '0';
            else
              source_next_state <= sop;
              at_source_sop_int <= '1';
            end if;
          end if;

        when run1 =>
          at_source_sop_int <= '0';

          if packet_error0 = '1' then
            source_next_state   <= st_err;
            at_source_error_int <= packet_error;
            at_source_eop_int   <= '1';
          else
            if (at_source_ready = '1' and at_source_valid_s = '1' and count_finished = true) or
              (at_source_valid_s = '0' and count_finished = true) then  --valid_ctrl_int = '1' and
              source_next_state   <= end1;
              at_source_error_int <= "00";
              at_source_eop_int   <= '1';
            else
              source_next_state   <= run1;
              at_source_error_int <= "00";
              at_source_eop_int   <= '0';
            end if;
          end if;
          
        when end1 =>

          if packet_error0 = '1' then
            source_next_state   <= st_err;
            at_source_error_int <= packet_error;
            at_source_sop_int   <= '0';
            at_source_eop_int   <= '1';
          else
            at_source_error_int <= "00";
            if at_source_valid_s = '1' and count_started = true and at_source_ready = '1' then
              source_next_state <= sop;
              at_source_sop_int <= '1';
              at_source_eop_int <= '0';
            elsif at_source_valid_s = '1' and at_source_ready = '1' then
              source_next_state <= start;
              at_source_sop_int <= '0';
              at_source_eop_int <= '0';
            else
              source_next_state <= end1;
              at_source_sop_int <= '0';
              at_source_eop_int <= '1';
            end if;
          end if;
          
        when st_err =>
          at_source_sop_int <= '0';
          at_source_eop_int <= '0';
          if packet_error0 = '1' then
            source_next_state   <= st_err;
            at_source_error_int <= packet_error;
          else
            source_next_state   <= start;
            at_source_error_int <= "00";
          end if;
        when others =>
          source_next_state   <= st_err;
          at_source_sop_int   <= '0';
          at_source_eop_int   <= '1';
          at_source_error_int <= "11";
          
      end case;
    end process source_comb_update_2;

    data_count_int_gen : process (clk, reset_n)
    begin  -- process res_reg
      if reset_n = '0' then
        data_count_int <= (others => '0');
      elsif rising_edge(clk) then
        if data_wr_enb0 = '1' then
          data_count_int <= data_count;
        end if;
      end if;
    end process data_count_int_gen;
    data_count_int1_gen : process (clk, reset_n)
    begin  -- process res_reg
      if reset_n = '0' then
        data_count_int1 <= (others => '0');
      elsif rising_edge(clk) then
        if data_wr_enb1 = '1' then
          data_count_int1 <= data_count;
        end if;
      end if;
    end process data_count_int1_gen;
    data_count_int_selected <= data_count_int when data_select = '0' else
                               data_count_int1;

  source_update : process (clk, reset_n)
  begin  -- process
    if reset_n = '0' then
      source_state <= start;
    elsif clk'event and clk = '1' then
      source_state <= source_next_state;
    end if;

  end process source_update;


  end generate packet_multi;








  output_registers : process (clk, reset_n)
  begin  -- process
    if reset_n = '0' then
      at_source_data <= (others => '0');
    elsif clk'event and clk = '1' then
      if data_wr_enb = '1' then
        at_source_data <= data_int_selected;
      end if;
    end if;
  end process output_registers;


  valid_register : process (clk, reset_n)
  begin
    if reset_n = '0' then
      at_source_valid_s <= '0';
      valid_ctrl_int    <= '0';
      valid_ctrl_int1   <= '0';
      --first_data        <= '0';
    elsif clk'event and clk = '1' then
      at_source_valid_s <= at_source_valid_int;
      valid_ctrl_int    <= valid_ctrl_inter;
      valid_ctrl_int1   <= valid_ctrl_inter1;
      --first_data        <= data_select_next;
    end if;
  end process;
  at_source_valid <= at_source_valid_s;

  sop_reg : process (clk, reset_n)
  begin
    if reset_n = '0' then
      at_source_sop_s <= '0';
    elsif clk'event and clk = '1' then
      at_source_sop_s <= at_source_sop_int;
    end if;
  end process;
  eop_reg : process (clk, reset_n)
  begin
    if reset_n = '0' then
      at_source_eop_s <= '0';
    elsif clk'event and clk = '1' then
      at_source_eop_s <= at_source_eop_int;
    end if;
  end process;

  at_source_sop <= at_source_sop_s;
  at_source_eop <= at_source_eop_s;

  other_register : process (clk, reset_n)
  begin
    if reset_n = '0' then
      at_source_error <= "00";
    elsif clk'event and clk = '1' then
      at_source_error <= at_source_error_int;
    end if;
  end process;

  channel_info_exists : if MULTI_CHANNEL_g = "true" generate
    channel_register : process (clk, reset_n)
    begin  -- process channel_register
      if reset_n = '0' then
        at_source_channel <= (others => '0');
      elsif clk'event and clk = '1' then
        if data_wr_enb = '1' then
          at_source_channel <= data_count_int_selected;
        end if;
      end if;
    end process channel_register;
  end generate channel_info_exists;

  no_channel_info : if MULTI_CHANNEL_g = "false" generate
    at_source_channel <= (others => '0');
  end generate no_channel_info;

  data_int_gen : process (clk, reset_n)
  begin  -- process res_reg
    if reset_n = '0' then
      data_int <= (others => '0');
    elsif rising_edge(clk) then
      if data_wr_enb0 = '1' then
        data_int <= data;
      end if;
    end if;
  end process data_int_gen;
  data_int1_gen : process (clk, reset_n)
  begin  -- process res_reg
    if reset_n = '0' then
      data_int1 <= (others => '0');
    elsif rising_edge(clk) then
      if data_wr_enb1 = '1' then
        data_int1 <= data;
      end if;
    end if;
  end process data_int1_gen;

  data_int_selected <= data_int when data_select = '0' else
                       data_int1;

  stall_ctrl_state <= (valid_ctrl_int or valid_ctrl_int1) & at_source_valid_s;
  
  stall_controller_comb : process (valid_ctrl_int, valid_ctrl_int1, at_source_valid_s,
                                   stall_ctrl_state, at_source_ready, data_select,
                                   source_valid_ctrl, source_stall_s,
                                   source_stall_int_d, was_stalled, first_data)
  begin
    case stall_ctrl_state is
      when "00" =>                      --no data no stall
        source_stall_int <= '0';
        data_wr_enb      <= '0';        --no valid data to write
        if source_valid_ctrl = '1' and was_stalled = '0' then
          data_wr_enb0 <= '1';          --write data to first reg
        else
          data_wr_enb0 <= '0';
        end if;
        data_wr_enb1 <= '0';
      when "10" =>                      --data at the input stage
--          if source_valid_ctrl='0' then  --
--            source_stall_int <= '0';   
--          else 
--            source_stall_int <= '1';  
--          end if;
        source_stall_int <= '0';        --trust the shunt buffer
        if (source_valid_ctrl = '1' and was_stalled = '0') then
          data_wr_enb0 <= '1';          --write data to first reg
        else
          data_wr_enb0 <= '0';
        end if;
        data_wr_enb <= '1';  --we have to pass the intermediate data to the output
        data_wr_enb1 <= '0';
      when "01" =>                      --data at the output stage
        if at_source_ready = '1' then
          data_wr_enb <= '1';
        else
          data_wr_enb <= '0';
        end if;
        if source_valid_ctrl = '1' and was_stalled = '0' then
          data_wr_enb0 <= '1';          --write data to first reg
          if at_source_valid_s = '1' and at_source_ready = '1' then
            source_stall_int <= '0';
          else
            source_stall_int <= '1';
          end if;
        else
          data_wr_enb0     <= '0';
          source_stall_int <= '0';
        end if;
        data_wr_enb1 <= '0';
      when "11" =>                      --data at both stages 
        if at_source_ready = '1' then
          if valid_ctrl_int1 = '1' then  --this means the stall is already high.
            if data_select='0' then
           	  source_stall_int <= '1';
           	  data_wr_enb0 <= '0';
              data_wr_enb1 <= '0';
           	else
              source_stall_int <= '0';
              data_wr_enb1 <= '0';
              if (source_valid_ctrl = '1' and was_stalled = '0') then
                data_wr_enb0 <= '1';
              else
                data_wr_enb0 <= '0';
              end if;
            end if;
            
          else --shunt buffer is empty
            source_stall_int <= '0';
            data_wr_enb1 <= '0';
            if (source_valid_ctrl = '1' and was_stalled = '0') then
              data_wr_enb0 <= '1';
            else
              data_wr_enb0 <= '0';
            end if;
          end if;
          data_wr_enb <= '1';
        else
          source_stall_int <= '1';
          if valid_ctrl_int1 = '1' then 
            data_wr_enb1 <= '0';
          else
          if source_valid_ctrl = '1' and was_stalled = '0' then
            data_wr_enb1 <= '1';
          else
            data_wr_enb1 <= '0';
          end if;
          end if;
          data_wr_enb  <= '0';
          data_wr_enb0 <= '0';
        end if;
      when others =>
        source_stall_int <= '0';
        data_wr_enb      <= '0';
        data_wr_enb0     <= '0';
        data_wr_enb1     <= '0';
    end case;
  end process stall_controller_comb;

  --shunt reg control
  data_select_next <= not first_data when stall_ctrl_state = "11" and valid_ctrl_int1='1' else --and at_source_ready = '1' 
                      '0';
  data_select <= first_data when stall_ctrl_state = "11" and valid_ctrl_int1='1' else --and at_source_ready = '1' 
                 '0';
  
  first_register : process (clk, reset_n)
  begin
    if reset_n = '0' then
      first_data        <= '0';
    elsif clk'event and clk = '1' then
      if (at_source_valid_s = '1' and at_source_ready='1')  then --or (valid_ctrl_int='0' and valid_ctrl_int1='1' and at_source_valid_s='1')
      first_data        <= data_select_next;
      end if;
    end if;
  end process;
  stall_register : process (clk, reset_n)
  begin
    if reset_n = '0' then
      source_stall_int_d <= '0';
      was_stalled        <= '0';
    elsif clk'event and clk = '1' then
      source_stall_int_d <= source_stall_int;
      if source_stall_s = '1' and (data_wr_enb0 = '1' or data_wr_enb1='1') then
        was_stalled <= '1';
      elsif source_stall_s = '0' then
        was_stalled <= '0';             --source_stall_s;
      end if;
    end if;
  end process;
  source_stall_s <= design_stall or source_stall_int_d;
  source_stall   <= source_stall_int;

  valid_ctrl_inter <= '1' when (data_wr_enb0 = '1' and was_stalled = '0' and source_stall_s = '0') or
                      (data_wr_enb0 = '1' and was_stalled = '1' and source_stall_s = '1') or
                      (data_wr_enb0 = '1' and was_stalled = '0' and source_stall_s = '1') else
                      '0' when (data_wr_enb = '1' and data_select='0') or --valid_ctrl_int1='0'  --
                               (data_wr_enb0 = '1' and was_stalled = '1' and source_stall_s = '0' ) or --and valid_ctrl_int1='0'
                               source_next_state = st_err else
                      valid_ctrl_int;
  valid_ctrl_inter1 <= '1' when (data_wr_enb1 = '1' and was_stalled = '0' and source_stall_s = '0') or
                       (data_wr_enb1 = '1' and was_stalled = '1' and source_stall_s = '1') or
                       (data_wr_enb1 = '1' and was_stalled = '0' and source_stall_s = '1') else  --and source_stall_s='0'
                       '0' when (data_wr_enb = '1' and data_select='1') or (data_wr_enb1 = '1' and was_stalled = '1' and source_stall_s = '0') else
                       valid_ctrl_int1;
  at_source_valid_int <= '0' when (at_source_valid_s = '1' and at_source_ready = '1' and ((valid_ctrl_int = '0' and data_select='0') or (valid_ctrl_int1 = '0' and data_select='1'))) or source_next_state = st_err else
                         '1' when ((valid_ctrl_int = '1' and data_select='0') or (valid_ctrl_int1 = '1' and data_select='1')) and allow_transfer = '1' else
                         at_source_valid_s;

end rtl;

