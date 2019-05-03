--*********************************************************
--* FILENAME: irom.vhd
--* AUTHOR:   meier@msoe.edu <Dr. M>
--* DATE:     Spring Quarter 2019
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
port(A: in std_logic_vector(31 downto 0);
     RD: out std_logic_vector(31 downto 0));
end entity irom;

architecture dataflow of irom is
begin
 
	with A select RD <= 
		X"E3A0_800A" when X"00000000",  -- MOV 
      X"E3A0_9000" when X"00000004",  -- MOV
      X"E358_0000" when X"00000008",  -- CMP
      X"0A00_000B" when X"0000000C",  -- BEQ
      X"E089_9008" when X"00000010",  -- ADD
      X"E248_8001" when X"00000014",  -- SUB
		X"E358_0000" when X"00000018",  -- CMP
		X"1AFF_FFF9" when X"0000001C",  -- BNE
		X"E3A0_A000" when X"00000020",  -- MOV
		X"E24A_A020" when X"00000024",  -- SUB
      X"E009_A00A" when X"00000028",  -- AND
      X"E35A_0000" when X"0000002C",  -- CMP
		X"0A00_0002" when X"00000030",  -- BEQ
		X"E3A0_B001" when X"00000034",  -- MOV
		X"E3A0_C004" when X"00000038",  -- MOV
      X"E58C_B000" when X"0000003C",  -- STR
		X"E59C_6000" when X"00000040",  -- LDR
		X"EAFF_FFFD" when others;		  -- END
		  
end architecture dataflow;
