library ieee;
use ieee.std_logic_1164.all;

entity blregmux is
	port(
		D0 : in std_logic_vector(3 downto 0);
		S  : in std_logic;
		
		Y  : out std_logic_vector(3 downto 0)
	);
end entity blregmux;

architecture dataflow of blregmux is

begin

	with S select Y <=
		D0     when '0',
		"1110" when others;

end architecture dataflow;