--*********************************************************
--* FILENAME: irom.vhd
--* AUTHOR:   meier@msoe.edu <Dr. M>
--* DATE:     Spring Quarter 2016
--* PROVIDES: 
--* - a test program for the first single cycle processor
--* - calculates the sum of the first n integers
--*   where n is loaded into register R8
--* - sets memory[4] = 1 if sum >=32
--* - infinite loops reading memory[4]
--*********************************************************

--*********************************************************
--* INCLUDE LIBRARIES AND PACKAGES
--* - std_logic_1164: 9-valued logic
--*********************************************************
library ieee;
use ieee.std_logic_1164.all;

--*********************************************************
--* ENTITY DECLARATION
--* INPUT PORTS
--* - A: 32-bit memory address
--* 
--* OUTPUT PORTS
--* - RD: 32-bit memory data
--* 
--* DISCUSSION
--* - this instruction ROM is a read-only memory 
--* - it never writes and thus needs no sample clock
--* - it never writes and thus needs no reset
--* - ROM memories are simple truth tables
--*********************************************************

entity iromv4 is 
	port(
		A: in std_logic_vector(31 downto 0);
      RD: out std_logic_vector(31 downto 0)
	);
end entity iromv4;

architecture dataflow of iromv4 is

begin
 
	with A select RD <= 
		X"E3A0_000A" when X"00000000",
      X"EB00_0009" when X"00000004",  
      X"E3A0_A000" when X"00000008",
      X"E24A_A020" when X"0000000C",
      X"E000_A00A" when X"00000010", 
		X"E35A_0000" when X"00000014",
		X"0A00_0002" when X"00000018",
		X"E3A0_B001" when X"0000001C",
      X"E3A0_C004" when X"00000020",
		X"E58C_B000" when X"00000024",
		X"E59C_6000" when X"00000028",
		X"EAFF_FFFD" when X"0000002C",
		X"E350_0000" when X"00000030",
		X"0A00_0005" when X"00000034",
		X"E3A0_1000" when X"00000038",
		X"E081_1000" when X"0000003C",
		X"E240_0001" when X"00000040",
		X"E350_0000" when X"00000044",
		X"1AFF_FFFB" when X"00000048",
		X"E1A0_0001" when X"0000004C",
		X"E1A0_F00E" when others;
		  
end architecture dataflow;

