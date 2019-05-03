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

entity irom is 
	port(
		A : in std_logic_vector(31 downto 0);
		
		RD: out std_logic_vector(31 downto 0)
	);
end entity irom;

architecture dataflow of irom is
begin
 
	with A select RD <= 
		X"E3A0_800A" when X"00000000",
      X"E288_9001" when X"00000004",  
      X"E009_0998" when X"00000008",
      X"E3A0_A000" when X"0000000C",
      X"E24A_A020" when X"00000010", 
		X"E019_A00A" when X"00000014",
		X"0A00_0002" when X"00000018",
		X"E3A0_B001" when X"0000001C",
      X"E3A0_C004" when X"00000020",
		X"E58C_B000" when X"00000024",
		X"E59C_6000" when X"00000028",
		X"EAFF_FFFD" when others;
		  
end architecture dataflow;

