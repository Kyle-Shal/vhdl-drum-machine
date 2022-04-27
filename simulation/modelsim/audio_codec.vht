-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/01/2022 03:35:46"
                                                            
-- Vhdl Test Bench template for design  :  audio_codec
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY audio_codec_vhd_tst IS
END audio_codec_vhd_tst;
ARCHITECTURE audio_codec_arch OF audio_codec_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL AUD_ADCDAT : STD_LOGIC;
SIGNAL AUD_ADCLRCK : STD_LOGIC;
SIGNAL AUD_BCLK : STD_LOGIC;
SIGNAL AUD_DACDAT : STD_LOGIC;
SIGNAL AUD_DACLRCK : STD_LOGIC;
SIGNAL AUD_XCK : STD_LOGIC;
SIGNAL clock_50 : STD_LOGIC;
SIGNAL FPGA_I2C_SCLK : STD_LOGIC;
SIGNAL FPGA_I2C_SDAT : STD_LOGIC;
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL key : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ledr : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL sw : STD_LOGIC_VECTOR(9 DOWNTO 0);
COMPONENT audio_codec
	PORT (
	AUD_ADCDAT : IN STD_LOGIC;
	AUD_ADCLRCK : OUT STD_LOGIC;
	AUD_BCLK : OUT STD_LOGIC;
	AUD_DACDAT : OUT STD_LOGIC;
	AUD_DACLRCK : OUT STD_LOGIC;
	AUD_XCK : OUT STD_LOGIC;
	clock_50 : IN STD_LOGIC;
	FPGA_I2C_SCLK : OUT STD_LOGIC;
	FPGA_I2C_SDAT : INOUT STD_LOGIC;
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	key : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ledr : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	sw : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : audio_codec
	PORT MAP (
-- list connections between master ports and signals
	AUD_ADCDAT => AUD_ADCDAT,
	AUD_ADCLRCK => AUD_ADCLRCK,
	AUD_BCLK => AUD_BCLK,
	AUD_DACDAT => AUD_DACDAT,
	AUD_DACLRCK => AUD_DACLRCK,
	AUD_XCK => AUD_XCK,
	clock_50 => clock_50,
	FPGA_I2C_SCLK => FPGA_I2C_SCLK,
	FPGA_I2C_SDAT => FPGA_I2C_SDAT,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	key => key,
	ledr => ledr,
	sw => sw
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END audio_codec_arch;
