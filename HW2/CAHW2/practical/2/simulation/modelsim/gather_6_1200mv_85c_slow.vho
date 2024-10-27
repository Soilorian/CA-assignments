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

-- DATE "03/06/2024 17:23:58"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	register_2bit IS
    PORT (
	o : OUT std_logic_vector(0 TO 1);
	CLR : IN std_logic;
	CLK : IN std_logic;
	i : IN std_logic_vector(0 TO 1);
	PRI : IN std_logic
	);
END register_2bit;

-- Design Ports Information
-- o[0]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o[1]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PRI	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLR	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i[0]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i[1]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF register_2bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_o : std_logic_vector(0 TO 1);
SIGNAL ww_CLR : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_i : std_logic_vector(0 TO 1);
SIGNAL ww_PRI : std_logic;
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \o[0]~output_o\ : std_logic;
SIGNAL \o[1]~output_o\ : std_logic;
SIGNAL \CLR~input_o\ : std_logic;
SIGNAL \PRI~input_o\ : std_logic;
SIGNAL \inst~1_combout\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \i[0]~input_o\ : std_logic;
SIGNAL \inst~3_combout\ : std_logic;
SIGNAL \inst~0_combout\ : std_logic;
SIGNAL \inst~0clkctrl_outclk\ : std_logic;
SIGNAL \inst~_emulated_q\ : std_logic;
SIGNAL \inst~2_combout\ : std_logic;
SIGNAL \i[1]~input_o\ : std_logic;
SIGNAL \inst1~1_combout\ : std_logic;
SIGNAL \inst1~_emulated_q\ : std_logic;
SIGNAL \inst1~0_combout\ : std_logic;
SIGNAL \ALT_INV_inst~0clkctrl_outclk\ : std_logic;

BEGIN

o <= ww_o;
ww_CLR <= CLR;
ww_CLK <= CLK;
ww_i <= i;
ww_PRI <= PRI;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);

\inst~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst~0_combout\);
\ALT_INV_inst~0clkctrl_outclk\ <= NOT \inst~0clkctrl_outclk\;

-- Location: IOOBUF_X12_Y0_N2
\o[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst~2_combout\,
	devoe => ww_devoe,
	o => \o[0]~output_o\);

-- Location: IOOBUF_X8_Y0_N9
\o[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1~0_combout\,
	devoe => ww_devoe,
	o => \o[1]~output_o\);

-- Location: IOIBUF_X20_Y0_N1
\CLR~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLR,
	o => \CLR~input_o\);

-- Location: IOIBUF_X22_Y31_N8
\PRI~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PRI,
	o => \PRI~input_o\);

-- Location: LCCOMB_X21_Y5_N2
\inst~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst~1_combout\ = (\CLR~input_o\ & ((\inst~1_combout\) # (!\PRI~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CLR~input_o\,
	datac => \PRI~input_o\,
	datad => \inst~1_combout\,
	combout => \inst~1_combout\);

-- Location: IOIBUF_X16_Y0_N15
\CLK~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G17
\CLK~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X8_Y0_N1
\i[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i(0),
	o => \i[0]~input_o\);

-- Location: LCCOMB_X21_Y5_N0
\inst~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst~3_combout\ = \i[0]~input_o\ $ (\inst~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i[0]~input_o\,
	datad => \inst~1_combout\,
	combout => \inst~3_combout\);

-- Location: LCCOMB_X21_Y5_N16
\inst~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst~0_combout\ = (!\CLR~input_o\) # (!\PRI~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \PRI~input_o\,
	datad => \CLR~input_o\,
	combout => \inst~0_combout\);

-- Location: CLKCTRL_G18
\inst~0clkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst~0clkctrl_outclk\);

-- Location: FF_X21_Y5_N1
\inst~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inst~3_combout\,
	clrn => \ALT_INV_inst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst~_emulated_q\);

-- Location: LCCOMB_X21_Y5_N18
\inst~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst~2_combout\ = (\CLR~input_o\ & ((\inst~1_combout\ $ (\inst~_emulated_q\)) # (!\PRI~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CLR~input_o\,
	datab => \inst~1_combout\,
	datac => \PRI~input_o\,
	datad => \inst~_emulated_q\,
	combout => \inst~2_combout\);

-- Location: IOIBUF_X10_Y0_N8
\i[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i(1),
	o => \i[1]~input_o\);

-- Location: LCCOMB_X21_Y5_N12
\inst1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1~1_combout\ = \inst~1_combout\ $ (\i[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst~1_combout\,
	datad => \i[1]~input_o\,
	combout => \inst1~1_combout\);

-- Location: FF_X21_Y5_N13
\inst1~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inst1~1_combout\,
	clrn => \ALT_INV_inst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1~_emulated_q\);

-- Location: LCCOMB_X21_Y5_N6
\inst1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1~0_combout\ = (\CLR~input_o\ & ((\inst~1_combout\ $ (\inst1~_emulated_q\)) # (!\PRI~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CLR~input_o\,
	datab => \inst~1_combout\,
	datac => \PRI~input_o\,
	datad => \inst1~_emulated_q\,
	combout => \inst1~0_combout\);

ww_o(0) <= \o[0]~output_o\;

ww_o(1) <= \o[1]~output_o\;
END structure;


