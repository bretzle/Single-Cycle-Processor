library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
	port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		ALUS : in std_logic_vector(3 downto 0);
		
		F : inout std_logic_vector(31 downto 0);
		
		C : out std_logic;
		V : out std_logic;
		N : out std_logic;
		Z : out std_logic
	);
end entity alu;

architecture dataflow of alu is

	constant one : std_logic_vector(32 downto 0) := "000000000000000000000000000000001";
	signal INTA, INTB, INTF: std_logic_vector(32 downto 0);
	signal MULT: std_logic_vector(65 downto 0);

begin

	INTA <= '0'&A;
	INTB <= '0'&B;
	MULT <= INTA*INTB;
	
	F <= INTF(31 downto 0);

	with ALUS select INTF <=
		INTA  +  INTB   	when "0000",
		INTA  -  INTB   	when "0001",
		INTA and INTB 		when "0010",
		INTA or  INTB  	when "0011",
		INTA xor INTB 		when "0100",
		INTA       			when "0101",
		INTB       			when "0110",
		one               when "0111",
		MULT(32 downto 0) when others;
		
	C <= INTF(32);
	N <= F(31);
	
	with ALUS select V <= 
		(A(31) and B(31) and not F(31)) or (not A(31) and not B(31) and F(31)) when "0000",
		(A(31) and not B(31) and not F(31)) or (not A(31) and B(31) and F(31)) when "0001",
		'0' when others;
		
	Z <= '1' when F = X"00000000" else '0';

end architecture dataflow;