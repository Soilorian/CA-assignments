-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "03/04/2024 22:47:54"

-- 
-- Device: Altera 5M40ZM64C4 Package MBGA64
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	full_adder_1_bit IS
    PORT (
	s : OUT std_logic;
	a : IN std_logic;
	b : IN std_logic;
	c_in : IN std_logic;
	c_out : OUT std_logic
	);
END full_adder_1_bit;

-- Design Ports Information
-- s	=>  Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- c_out	=>  Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- a	=>  Location: PIN_G8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- b	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- c_in	=>  Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF full_adder_1_bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_s : std_logic;
SIGNAL ww_a : std_logic;
SIGNAL ww_b : std_logic;
SIGNAL ww_c_in : std_logic;
SIGNAL ww_c_out : std_logic;
SIGNAL \a~combout\ : std_logic;
SIGNAL \c_in~combout\ : std_logic;
SIGNAL \b~combout\ : std_logic;
SIGNAL \inst3~0_combout\ : std_logic;
SIGNAL \inst2~0_combout\ : std_logic;

BEGIN

s <= ww_s;
ww_a <= a;
ww_b <= b;
ww_c_in <= c_in;
c_out <= ww_c_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_G8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a,
	combout => \a~combout\);

-- Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\c_in~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_c_in,
	combout => \c_in~combout\);

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b,
	combout => \b~combout\);

-- Location: LC_X3_Y3_N4
\inst3~0\ : maxv_lcell
-- Equation(s):
-- \inst3~0_combout\ = (\a~combout\ $ (\c_in~combout\ $ (\b~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c33c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \a~combout\,
	datac => \c_in~combout\,
	datad => \b~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \inst3~0_combout\);

-- Location: LC_X3_Y3_N6
\inst2~0\ : maxv_lcell
-- Equation(s):
-- \inst2~0_combout\ = ((\a~combout\ & ((\c_in~combout\) # (\b~combout\))) # (!\a~combout\ & (\c_in~combout\ & \b~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fcc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \a~combout\,
	datac => \c_in~combout\,
	datad => \b~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \inst2~0_combout\);

-- Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\s~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst3~0_combout\,
	oe => VCC,
	padio => ww_s);

-- Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\c_out~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst2~0_combout\,
	oe => VCC,
	padio => ww_c_out);
END structure;


