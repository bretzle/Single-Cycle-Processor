library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
	port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		ALUS : in std_logic_vector(2 downto 0);
		
		F : inout std_logic_vector(31 downto 0);
		
		C : out std_logic;
		V : out std_logic;
		N : out std_logic;
		Z : out std_logic
	);
end entity alu;

architecture dataflow of alu is

	constant one : std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
	signal inter : std_logic_vector(32 downto 0);

begin

	inter <= ('0'&A) + ('0'&B);

	with ALUS select F <=
		A + B   when "000",
		A - B   when "001",
		A and B when "010",
		A or B  when "011",
		A xor B when "100",
		A       when "101",
		B       when "110",
		one     when others;
		
	C <= inter(32);
	
	with ALUS select V <= 
		(A(31) and B(31) and not F(31)) or (not A(31) and not B(31) and F(31)) when "000",
		(A(31) and not B(31) and not F(31)) or (not A(31) and B(31) and F(31)) when "001",
		'0' when others;
	N <= F(31);
	Z <= '1' when F = X"0" else '0';

end architecture dataflow;