library ieee;
use ieee.std_logic_1164.all;

entity BarrelShifter is
	port(
		IN_SRC  : in  std_logic_vector(31 downto 0);
		ROTATE  : in  std_logic_vector( 3 downto 0);
		OUT_SRC : out std_logic_vector(31 downto 0)
	);
end entity BarrelShifter;

architecture dataflow of BarrelShifter is

begin

	with ROTATE select OUT_SRC <=
		IN_SRC                                     when "0000",
		IN_SRC( 1 downto 0) & IN_SRC(31 downto  2) when "0001",
		IN_SRC( 3 downto 0) & IN_SRC(31 downto  4) when "0010",
		IN_SRC( 5 downto 0) & IN_SRC(31 downto  6) when "0011",
		IN_SRC( 7 downto 0) & IN_SRC(31 downto  8) when "0100",
		IN_SRC( 9 downto 0) & IN_SRC(31 downto 10) when "0101",
		IN_SRC(11 downto 0) & IN_SRC(31 downto 12) when "0110",
		IN_SRC(13 downto 0) & IN_SRC(31 downto 14) when "0111",
		IN_SRC(15 downto 0) & IN_SRC(31 downto 16) when "1000",
		IN_SRC(17 downto 0) & IN_SRC(31 downto 18) when "1001",
		IN_SRC(19 downto 0) & IN_SRC(31 downto 20) when "1010",
		IN_SRC(21 downto 0) & IN_SRC(31 downto 22) when "1011",
		IN_SRC(23 downto 0) & IN_SRC(31 downto 24) when "1100",
		IN_SRC(25 downto 0) & IN_SRC(31 downto 26) when "1101",
		IN_SRC(27 downto 0) & IN_SRC(31 downto 28) when "1110",
		IN_SRC(29 downto 0) & IN_SRC(31 downto 30) when others;

end architecture dataflow;