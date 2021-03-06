library ieee;
use ieee.std_logic_1164.all;

entity busmux2to1 is
	port(
		D1 : in std_logic_vector(31 downto 0);
		D0 : in std_logic_vector(31 downto 0);
		S  : in std_logic;
		
		Y  : out std_logic_vector(31 downto 0)
	);
end entity busmux2to1;

architecture dataflow of busmux2to1 is

begin

	with S select Y <=
		D0 when '0',
		D1 when others;

end architecture dataflow;