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
-- $RCSfile: auk_dspip_avalon_streaming_sink.vhd,v $
-- $Source: /cvs/uksw/dsp_cores/lib/fu/avalon_streaming/rtl/auk_dspip_avalon_streaming_sink.vhd,v $
--
-- $Revision: #1 $
-- $Date: 2015/02/08 $
-- Check in by     : $Author: swbranch $
-- Author   :  Suleyman S. Demirsoy
--
-- Project      :  Atlantic II Sink Interface with ready_latency=0
--
-- Description : 
--
-- This interface is capable of handling single or multi channel streams as
-- well as blocks of data. The at_sink_sop and at_sink_eop must be fed as
-- described in the Atlantic II specification. The at_sink_error input is a 2-
-- bit signal that complies with the PFC error format (by Kent Orthner). The
-- error checking is extensively done, however the resulting information is
-- still mapped on the available 3 error states as shown below.
-- 00: no error
-- 01: missing sop
-- 10: missing eop
-- 11: unexpected eop
-- other types of errors also marked as 11. 
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
use work.auk_dspip_lib_pkg.all;
use work.auk_dspip_math_pkg.all;
library altera_mf;
use altera_mf.altera_mf_components.all;

entity auk_dspip_avalon_streaming_sink is

  generic(
    WIDTH_g          : integer := 16;
    PACKET_SIZE_g    : natural := 4;
    FIFO_DEPTH_g     : natural := 5;    --if PFC mode is selected, this generic
                                        --is used for passing the poly_factor.
    MIN_DATA_COUNT_g : natural := 2;
    PFC_MODE_g       : string := "false";
    SOP_EOP_CALC_g : string := "false";  -- calculate sop and eop rather than
                                        -- reading value from fifo
    FAMILY_g         : string  := "Stratix II";
    MEM_TYPE_g       : string  := "Auto"
    );
  port(
    clk             : in  std_logic;
    reset_n         : in  std_logic;
    ----------------- DESIGN SIDE SIGNALS
    data            : out std_logic_vector(WIDTH_g-1 downto 0);
    sink_ready_ctrl : in  std_logic;    --the controller will tell
                                        --the interface whether
                                        --new input can be accepted.
    sink_stall      : out std_logic;    --needs to stall the design
                                        --if no new data is coming
    packet_error    : out std_logic_vector (1 downto 0);  --this is for SOP and EOP check only.
                                        --when any of these doesn't behave as
                                        --expected, the error is flagged.
    send_sop        : out std_logic;    -- transmit SOP signal to the design.
                                        -- It only transmits the legal SOP.
    send_eop        : out std_logic;    -- transmit EOP signal to the design.
                                        -- It only transmits the legal EOP.    
    ----------------- ATLANTIC SIDE SIGNALS
    at_sink_ready   : out std_logic;    --it will be '1' whenever the
                                        --sink_ready_ctrl signal is high.
    at_sink_valid   : in  std_logic;
    at_sink_data    : in  std_logic_vector(WIDTH_g-1 downto 0);
    at_sink_sop     : in  std_logic := '0';
    at_sink_eop     : in  std_logic := '0';
    at_sink_error   : in  std_logic_vector(1 downto 0)  := "00" --it indicates
                                        --that there is an error in the packet.

    );

end auk_dspip_avalon_streaming_sink;

-- hds interface_end
architecture rtl of auk_dspip_avalon_streaming_sink is

  type STATE_TYPE_t is (start, stall, run1, st_err, end1);  -- stall,run_once,wait1,
  type OUT_STATE_TYPE_t is (normal, empty_and_not_ready, empty_and_ready);
  constant LOG2PACKET_SIZE_c : natural := log2_ceil_one(PACKET_SIZE_g);
  constant FIFO_HINT_c       : string  := "RAM_BLOCK_TYPE="& MEM_TYPE_g;
  
  constant C2_FIFO_MAX_SIZE_c : natural := 128; -- max FIFO size for LE implementation in Cyclone II
  constant C3_FIFO_MAX_SIZE_c : natural := 128; -- max FIFO size for LE implementation in Cyclone III
  constant FIFO_SIZE_c : natural := FIFO_DEPTH_g * WIDTH_G; -- actual memory required for FIFO
  
  signal sink_state        : STATE_TYPE_t;
  signal sink_next_state   : STATE_TYPE_t;
  signal data_take         : std_logic;
  --signal data_available_s   : std_logic;
  --signal data_available_int : std_logic;
  signal reset_count       : std_logic;
  signal count_enable      : std_logic;
  signal count             : unsigned(LOG2PACKET_SIZE_c -1 downto 0);
  signal count_finished    : boolean;
  signal at_sink_error_int : std_logic;
  signal packet_error_int  : std_logic_vector (1 downto 0);
  signal packet_error_s    : std_logic_vector(1 downto 0);
  --signal send_sop_int       : std_logic;
  signal at_sink_sop_int   : std_logic;
  signal at_sink_eop_int   : std_logic;
  --signal send_eop_int       : std_logic;
  --signal res_reg            : std_logic;
signal out_cnt : natural range 0 to PACKET_SIZE_g - 1;
  signal clear_fifo        : std_logic;
  signal fifo_rdreq        : std_logic;
  signal fifo_rdreq_d        : std_logic;
  --signal fifo_rdreq_sel    : std_logic;
  signal fifo_wrreq        : std_logic;
  --signal fifo_wrreq_int    : std_logic;
  --signal fifo_full         : std_logic;
  signal old_send_sop  : std_logic;
  signal old_send_eop  : std_logic;
--  signal diff_send_sop  : std_logic;
--  signal diff_send_eop  : std_logic;
   signal send_sop_s  : std_logic;
  signal send_eop_s  : std_logic;
 
  signal fifo_empty        : std_logic;
  signal fifo_alm_full     : std_logic;
  signal fifo_count      : std_logic_vector(log2_ceil(FIFO_DEPTH_g * PACKET_SIZE_g)+1 downto 0);
  --signal fifo_alm_empty    : std_logic;
  --signal datai_int         : std_logic_vector(WIDTH_g-1 downto 0);
  signal at_sink_data_int  : std_logic_vector(WIDTH_g-1 downto 0);
  signal at_sink_ready_int : std_logic;
  signal at_sink_ready_s   : std_logic;
  signal sink_stall_int    : std_logic;
  signal sink_stall_s      : std_logic;
  signal fifo_datain       : std_logic_vector(WIDTH_g+1 downto 0);
  signal fifo_dataout      : std_logic_vector(WIDTH_g+1 downto 0);
  signal reset             : std_logic;

  signal sink_out_state      : OUT_STATE_TYPE_t;
  signal sink_out_next_state : OUT_STATE_TYPE_t;

  signal sink_start : std_logic;
  signal min_data_count_reached : std_logic;
  --signal start_condition : std_logic;
  signal max_reached : boolean;  -- flag to show counter has reached max value

begin

  at_sink_ready_int <= '0' when (fifo_alm_full = '1') else
                       '1';
  sink_stall_int <= '1' when (fifo_empty = '1' or sink_start = '0') else
                    '0';

  valid_generate_single : if PACKET_SIZE_g = 1 generate
    signal packet_error0 : std_logic;
  begin
    at_sink_error_int <= at_sink_error(0) and at_sink_valid and at_sink_ready_s;
    packet_error_int  <= '0' & packet_error0;

    packet_error0 <= '0' when at_sink_error_int = '0' and sink_next_state /= st_err else
                     '1';

    data_take <= '1' when (sink_next_state = run1 or sink_state = run1) else
                 '0';

    sink_comb_update_1 : process (sink_state, sink_ready_ctrl,
                                  at_sink_valid, at_sink_error_int, at_sink_ready_s)
    begin  -- process sink_comb_update_1
    sink_next_state <= sink_state;
   case sink_state is
        when start =>
          fifo_wrreq <= '0';
          if at_sink_error_int = '1' then
            sink_next_state <= st_err;
          else
            if at_sink_ready_s = '0' and at_sink_valid = '0' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '0' and at_sink_valid = '1' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '1' and at_sink_valid = '0' then
              sink_next_state <= stall;
            elsif at_sink_ready_s = '1' and at_sink_valid = '1' then
              sink_next_state <= run1;
            end if;
          end if;
        when stall =>
          fifo_wrreq <= '0';
          if at_sink_error_int = '1' then
            sink_next_state <= st_err;
          else
            if at_sink_ready_s = '0' and at_sink_valid = '0' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '0' and at_sink_valid = '1' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '1' and at_sink_valid = '0' then
              sink_next_state <= stall;
            elsif at_sink_ready_s = '1' and at_sink_valid = '1' then
              sink_next_state <= run1;
            end if;
          end if;

        when run1 =>
          fifo_wrreq <= '1';
          if at_sink_error_int = '1' then
            sink_next_state <= st_err;
          else
            if at_sink_ready_s = '0' and at_sink_valid = '0' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '0' and at_sink_valid = '1' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '1' and at_sink_valid = '0' then
              sink_next_state <= stall;
            elsif at_sink_ready_s = '1' and at_sink_valid = '1' then
              sink_next_state <= run1;
            end if;
          end if;

        when st_err =>
          fifo_wrreq <= '0';
          if at_sink_error_int = '1' then
            sink_next_state <= st_err;
          else
            if at_sink_ready_s = '0' and at_sink_valid = '0' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '0' and at_sink_valid = '1' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '1' and at_sink_valid = '0' then
              sink_next_state <= stall;
            elsif at_sink_ready_s = '1' and at_sink_valid = '1' then
              sink_next_state <= run1;
            end if;
          end if;

        when others =>
          sink_next_state <= st_err;
          fifo_wrreq      <= '0';
      end case;
    end process sink_comb_update_1;

  end generate valid_generate_single;

  valid_generate_mult : if PACKET_SIZE_g > 1 generate

    at_sink_error_int <= (at_sink_error(1) or at_sink_error(0)) and at_sink_valid and at_sink_ready_s;

    count_enable <= '1' when (sink_next_state = run1 or sink_next_state = end1) else  --
                    --or sink_next_state = run_once) else
                    '0';
    reset_count <= '1' when sink_next_state = st_err else
                   '0';
    data_take <= '1' when sink_next_state = run1 or sink_next_state = end1 or
                 (sink_state = run1 or sink_state = end1) else
                 '0';
    
    sink_comb_update_2 : process (sink_state, at_sink_ready_s, at_sink_ready_int, at_sink_valid,
                                  at_sink_error, at_sink_error_int, at_sink_sop,
                                  at_sink_eop, count, count_finished)
    begin  -- process sink_comb_update_2
    sink_next_state <= sink_state;
   packet_error_int <= "00";
      case sink_state is
        when start =>

          fifo_wrreq <= '0';

          if at_sink_error_int = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= at_sink_error;
          else
            if at_sink_ready_s = '1' and at_sink_valid = '1' and at_sink_sop = '1' then
              sink_next_state  <= run1;
              packet_error_int <= "00";
            elsif (at_sink_ready_s = '1' and at_sink_valid = '1' and at_sink_sop = '0') then
              sink_next_state  <= st_err;
              packet_error_int <= "01";
            else
              sink_next_state  <= start;
              packet_error_int <= "00";
            end if;
          end if;
          
        when run1 =>
          -- sink_stall <= '0';
          fifo_wrreq <= '1';

          if at_sink_error_int = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= at_sink_error;
          elsif at_sink_sop = '1' and at_sink_valid = '1' and at_sink_ready_s = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= "01";
          elsif (count_finished = false and at_sink_eop = '1' and at_sink_valid = '1' and at_sink_ready_s = '1') then
            sink_next_state  <= st_err;
            packet_error_int <= "11";
          elsif at_sink_eop = '0' and count_finished = false and at_sink_valid = '1' and at_sink_ready_s = '1' then
              sink_next_state  <= run1;
              packet_error_int <= "00";
          elsif at_sink_eop = '1' and count_finished = true and at_sink_valid = '1' and at_sink_ready_s = '1' then
            sink_next_state  <= end1;
            packet_error_int <= "00";
          elsif (at_sink_valid = '0' or at_sink_ready_s = '0') then
            sink_next_state  <= stall;
            packet_error_int <= "00";
          elsif (count_finished = true and at_sink_eop = '0' and at_sink_valid = '1' and at_sink_ready_s = '1') then
            sink_next_state  <= st_err;
            packet_error_int <= "10";
          end if;
        when stall =>
          -- sink_stall <= '1';
          fifo_wrreq <= '0';
          if at_sink_error_int = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= at_sink_error;
          elsif at_sink_sop = '1' and at_sink_valid = '1' and at_sink_ready_s = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= "01";
          elsif (count_finished = false and at_sink_eop = '1' and at_sink_valid = '1' and at_sink_ready_s = '1') then
            sink_next_state  <= st_err;
            packet_error_int <= "11";
          elsif at_sink_eop = '0' and count_finished = false and at_sink_valid = '1' and at_sink_ready_s = '1' then  --and at_sink_ready_int = '1' then
            sink_next_state  <= run1;
            packet_error_int <= "00";
          elsif at_sink_eop = '1' and count_finished = true and at_sink_valid = '1' and at_sink_ready_s = '1' then
            sink_next_state  <= end1;
            packet_error_int <= "00";
          elsif (at_sink_valid = '0') then
            sink_next_state  <= stall;
            packet_error_int <= "00";
          elsif (count_finished = true and at_sink_eop = '0' and at_sink_valid = '1' and at_sink_ready_s = '1') then
            sink_next_state  <= st_err;
            packet_error_int <= "10";
        end if;

        when end1 =>
          fifo_wrreq <= '1';
          if at_sink_error_int = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= at_sink_error;
          else
            if at_sink_ready_s = '1' and at_sink_valid = '1' and at_sink_sop = '1' then
              sink_next_state  <= run1;
              packet_error_int <= "00";
            elsif (at_sink_valid = '1' and at_sink_ready_s = '1' and at_sink_sop = '0') then
              sink_next_state  <= st_err;
              packet_error_int <= "01";
            else
              sink_next_state  <= start;
              packet_error_int <= "00";
            end if;
          end if;
        when st_err =>
          fifo_wrreq <= '0';
          if at_sink_error_int = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= at_sink_error;
          else
            if at_sink_ready_s = '1' and at_sink_valid = '1' and at_sink_sop = '1' then
              sink_next_state  <= run1;
              packet_error_int <= "00";
            elsif (at_sink_ready_s = '1' and at_sink_valid = '1' and at_sink_sop = '0') then
              sink_next_state  <= st_err;
              packet_error_int <= "01";
            else
              sink_next_state  <= start;
              packet_error_int <= "00";
            end if;
          end if;
        when others => null;
      end case;
    end process sink_comb_update_2;
    

    counter : process (clk, reset_n)
    begin  -- process counter
      if reset_n = '0' then
        count <= (others => '0');
         max_reached <= false;
      elsif clk'event and clk = '1' then  -- rising clock edge
        if reset_count = '1' then
          count <= (others => '0');
        else
          if count_enable = '1' then
         --   if count < (PACKET_SIZE_g-1) then
       if count = PACKET_SIZE_g-2 then
         max_reached <= true; 
        else
         max_reached <= false;
        end if;
        if max_reached = false then
             count <= count + 1;
           else
              count <= (others => '0');
            end if;
            
          end if;
        end if;
      end if;
    end process counter;

    count_finished <= max_reached;

  end generate valid_generate_mult;

  sink_input_update : process (clk, reset_n)
  begin  -- process
    if reset_n = '0' then
      sink_state <= start;
    elsif clk'event and clk = '1' then
      sink_state <= sink_next_state;
    end if;
  end process sink_input_update;

  sink_output_update : process (clk, reset_n)
  begin  -- process
    if reset_n = '0' then
      sink_out_state <= normal;
    elsif clk'event and clk = '1' then
      sink_out_state <= sink_out_next_state;
    end if;
  end process sink_output_update;

  error_register : process (clk, reset_n)
  begin  -- process
    if reset_n = '0' then
      packet_error_s <= "00";
    elsif clk'event and clk = '1' then
      packet_error_s <= packet_error_int;
    end if;
  end process;
  packet_error <= packet_error_s;

  output_registers : process (clk, reset_n)
  begin  -- process res_reg
    if reset_n = '0' then
--      res_reg         <= '0';
      at_sink_ready_s <= '0';
      sink_stall_s    <= '0';
      at_sink_sop_int <= '0';
      at_sink_eop_int <= '0';
    elsif rising_edge(clk) then
--      res_reg         <= '1';
      at_sink_ready_s <= at_sink_ready_int;
      sink_stall_s    <= sink_stall_int;
      at_sink_sop_int <= at_sink_sop;
      at_sink_eop_int <= at_sink_eop;
    end if;
  end process output_registers;

  sink_data_int_reg : process (clk, reset)
  begin  -- process sink_data_int_reg
    if reset = '1' then
      at_sink_data_int <= (others => '0');
    elsif rising_edge(clk) then
      if data_take = '1' then
        at_sink_data_int <= at_sink_data;
      end if;
    end if;
  end process sink_data_int_reg;
  at_sink_ready <= at_sink_ready_s;
  sink_stall    <= sink_stall_int;
  fifo_datain   <= at_sink_eop_int & at_sink_sop_int & at_sink_data_int;



  send_sop <= send_sop_s;
  send_eop <= send_eop_s;

  -----------------------------------------------------------------------------
  -- This was included because the vho simulations of fifo produce 'X' in
  -- reset whcih means that for the FFT, alll outputs go to X when sop = X
  -----------------------------------------------------------------------------
 gen_calc_sop: if SOP_EOP_CALC_g = "true" generate

   -- generate sop and eop separate
  out_cnt_p : process (clk, reset)
  begin  -- process out_cnt_p
    if reset = '1' then  
      out_cnt <= 0;
    elsif rising_edge(clk) then
      if fifo_rdreq = '1' then  
        if out_cnt < PACKET_SIZE_g - 1  then
          out_cnt <= out_cnt + 1;
          else
            out_cnt <= 0;
        end if;
      end if;
    end if;
  end process out_cnt_p;
   
   send_sop_eop_p : process (clk, reset)
   begin  -- process send_sop_eop_p
     if reset = '1' then  
       send_sop_s <= '0';
       send_eop_s <= '0';
     elsif rising_edge(clk) then 
       if fifo_rdreq = '1' and sink_ready_ctrl = '1' then
         send_sop_s <= '0';
         send_eop_s <= '0';
         if out_cnt = 0 then
           send_sop_s <= '1';
         end if;
         if out_cnt = PACKET_SIZE_g - 1 then
           send_eop_s <= '1';
         end if;
       end if;
     end if;
   end process send_sop_eop_p;
    
  end generate gen_calc_sop;

  gen_sop_fifo: if SOP_EOP_CALC_g = "false" generate
  send_sop_s <= fifo_dataout(WIDTH_g);
  send_eop_s <= fifo_dataout(WIDTH_g+1);
   
  end generate gen_sop_fifo;
                               
--   diff_send_eop <= fifo_dataout(WIDTH_g +1) xor send_eop_s;
--  diff_send_sop <= fifo_dataout(WIDTH_g ) xor send_sop_s;
  data          <= fifo_dataout(WIDTH_g-1 downto 0);

  --clear_fifo <= packet_error_s(0) or packet_error_s(1);
  --This mechanism synchronously resets the sc_fifo and the fifo_pfc, but not
  -- the core themselves.  Since the user has to reset the core as well via
  -- async reset, this mechanism is redundant.  Setting clear_fifo to constant
  -- '1' instead.
  clear_fifo <= '0';

  sink_out_comb : process (sink_stall_int, sink_ready_ctrl, sink_state, sink_stall_s, sink_out_state)
  begin  -- process sink_comb_update_1
    case sink_out_state is
      when normal =>
        fifo_rdreq <= sink_ready_ctrl and (not sink_stall_int);
        if sink_stall_int = '1' and sink_ready_ctrl = '0' and sink_stall_s = '0' then
          sink_out_next_state <= empty_and_not_ready;
        elsif sink_stall_int = '1' and sink_ready_ctrl = '1' and sink_stall_s = '0' then
          sink_out_next_state <= empty_and_ready;
        elsif sink_stall_int = '1' and sink_ready_ctrl = '0' and sink_stall_s = '1' then
          sink_out_next_state <= empty_and_ready;
        else
          sink_out_next_state <= normal;
        end if;
      when empty_and_not_ready =>
        fifo_rdreq <= '0';
        if sink_stall_int = '0' then
          sink_out_next_state <= normal;
        else
          sink_out_next_state <= empty_and_not_ready;
        end if;
      when empty_and_ready =>
        if sink_stall_int = '0' then
          sink_out_next_state <= normal;
          fifo_rdreq          <= '1';
        else
          sink_out_next_state <= empty_and_ready;
          fifo_rdreq          <= '0';
        end if;
      when others => null;
    end case;
  end process sink_out_comb;




  
  normal_fifo : if PFC_MODE_g = "false" generate
  begin
   fifo_eab_off : if (((FAMILY_g = "Cyclone II" or FAMILY_g = "Cyclone")
                      and FIFO_SIZE_c < C2_FIFO_MAX_SIZE_c) or
                      (FAMILY_g = "Cyclone III" and FIFO_SIZE_c < C3_FIFO_MAX_SIZE_c)) generate
   begin
    in_fifo : scfifo
      generic map (
        add_ram_output_register => "ON",
        almost_empty_value      => 1,
        almost_full_value       => FIFO_DEPTH_g - 2,
        intended_device_family  => FAMILY_g,
        lpm_hint                => FIFO_HINT_c,  --shouldn't exist when use_eab is
                                                 -- "OFF"
        lpm_numwords            => FIFO_DEPTH_g,
        lpm_showahead           => "OFF",
        lpm_type                => "scfifo",
        lpm_width               => WIDTH_g + 2,  -- for sop and eop
        lpm_widthu              => log2_ceil(FIFO_DEPTH_g),
        overflow_checking       => "OFF",
        underflow_checking      => "OFF",
        use_eab                 => "OFF"          --"OFF" for LE implementation
       )
      port map (
        rdreq       => fifo_rdreq,
        aclr        => reset,
        sclr        => clear_fifo,
        clock       => clk,
        wrreq       => fifo_wrreq,
        data        => fifo_datain,
        almost_full => fifo_alm_full,
        usedw       => fifo_count(log2_ceil(FIFO_DEPTH_g)-1 downto 0),
        empty       => fifo_empty,
--      almost_empty => fifo_alm_empty,
        q           => fifo_dataout
--      full         => fifo_full
        );
     min_data_count_reached <= '1' when fifo_count(log2_ceil_one(MIN_DATA_COUNT_g)-1)='1' else
                               '0';   
   end generate fifo_eab_off;
                               
   fifo_eab_on : if not(((FAMILY_g = "Cyclone II" or FAMILY_g = "Cyclone")
                      and FIFO_SIZE_c < C2_FIFO_MAX_SIZE_c) or
                      (FAMILY_g = "Cyclone III" and FIFO_SIZE_c < C3_FIFO_MAX_SIZE_c)) generate
                            
   begin
    in_fifo : scfifo
      generic map (
        add_ram_output_register => "ON",
        almost_empty_value      => 1,
        almost_full_value       => FIFO_DEPTH_g - 2,
        intended_device_family  => FAMILY_g,
        lpm_hint                => FIFO_HINT_c,  --shouldn't exist when use_eab is
                                                 -- "OFF"
        lpm_numwords            => FIFO_DEPTH_g,
        lpm_showahead           => "OFF",
        lpm_type                => "scfifo",
        lpm_width               => WIDTH_g + 2,  -- for sop and eop
        lpm_widthu              => log2_ceil(FIFO_DEPTH_g),
        overflow_checking       => "OFF",
        underflow_checking      => "OFF",
        use_eab                 => "ON"          --"OFF" for LE implementation
       )
      port map (
        rdreq       => fifo_rdreq,
        aclr        => reset,
        sclr        => clear_fifo,
        clock       => clk,
        wrreq       => fifo_wrreq,
        data        => fifo_datain,
        almost_full => fifo_alm_full,
        usedw       => fifo_count(log2_ceil(FIFO_DEPTH_g)-1 downto 0),
        empty       => fifo_empty,
--      almost_empty => fifo_alm_empty,
        q           => fifo_dataout
--      full         => fifo_full
        );
     min_data_count_reached <= '1' when fifo_count(log2_ceil_one(MIN_DATA_COUNT_g)-1)='1' else
                               '0';   
   end generate fifo_eab_on;                                
  end generate normal_fifo;
  pfc_fifo : if PFC_MODE_g = "true" generate
    constant POLY_FACTOR_c : natural := FIFO_DEPTH_g;  -- in PFC mode FIFO_DEPTH_g will be used as the poly factor.
  begin
    in_fifo_pfc : auk_dspip_fifo_pfc
      generic map (
        NUM_CHANNELS_g      => PACKET_SIZE_g,
        POLY_FACTOR_g       => POLY_FACTOR_c,
        DATA_WIDTH_g        => WIDTH_g + 2,
        ALMOST_FULL_VALUE_g => 2,
        RAM_TYPE_g          => MEM_TYPE_g)
      port map (

        datai       => fifo_datain,
        datao       => fifo_dataout,
        channel_out => open,
        used_w      => fifo_count,

        wrreq       => fifo_wrreq,
        rdreq       => fifo_rdreq,
        almost_full => fifo_alm_full,
        empty       => fifo_empty,
        sclr        => clear_fifo,
        clk         => clk,
        reset       => reset,
        enable      => '1');
     min_data_count_reached <= '1' when unsigned(fifo_count) >= to_unsigned(MIN_DATA_COUNT_g,log2_ceil(FIFO_DEPTH_g * PACKET_SIZE_g)+2) else
                               '0';   
  end generate pfc_fifo;

  reset <= not reset_n;

  start_sink : process (clk, reset_n)
  begin  -- process start_fir
    if reset_n = '0' then
      sink_start <= '0';
    elsif rising_edge(clk) then
      sink_start <= sink_start or min_data_count_reached;
    end if;
  end process start_sink;
end rtl;

