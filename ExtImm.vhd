library ieee;
use ieee.std_logic_1164.all;

entity ExtImm is
	port(
		IMM   : in  std_logic_vector(23 downto 0);
		EXTS  : in  std_logic_vector( 1 downto 0);
		IMM32 : out std_logic_vector(31 downto 0)
	);
end entity ExtImm;

architecture dataflow of ExtImm is

signal sign : std_logic := IMM(23);

begin

	with EXTS select IMM32 <=
		x"000000"&IMM(7 downto 0) 					 when b"00",
		x"00000"&IMM(11 downto 0) 					 when b"01",
		sign&sign&sign&sign&sign&sign&IMM(23 downto 0)&b"00" when others;

end architecture dataflow;