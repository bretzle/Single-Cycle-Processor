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

entity iromv2 is 
	port(
		A  : in std_logic_vector(31 downto 0);
		
		RD : out std_logic_vector(31 downto 0)
	);
end entity iromv2;

architecture dataflow of iromv2 is
begin
 
	with A select RD <= 
		X"E3A0_9000" when X"00000000", -- mov
      X"E3B0_800A" when X"00000004", -- movs
      X"0A00_0009" when X"00000008", -- beq
      X"E089_9008" when X"0000000C", -- add
      X"E258_8001" when X"00000010", -- subs
		X"1AFF_FFFC" when X"00000014", -- bne
		X"E3A0_A000" when X"00000018", -- mov
		X"E24A_A020" when X"0000001C", -- sub
      X"E019_A00A" when X"00000020", -- ands
		X"0A00_0002" when X"00000024", -- beq
		X"E3A0_B001" when X"00000028", -- mov
		X"E3A0_C004" when X"0000002C", -- mov
      X"E58C_B000" when X"00000030", -- str
		X"E59C_6000" when X"00000034", -- ldr
		X"EAFF_FFFD" when others;      -- b
		  
end architecture dataflow;

