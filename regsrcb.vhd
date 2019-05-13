library ieee;
use ieee.std_logic_1164.all;

entity regsrcb is
	port(
		D0,D1 : in std_logic_vector(3 downto 0);
		S     : in std_logic;
	   Y     : out std_logic_vector(3 downto 0)
	);
end entity regsrcb;

--circuit description
architecture BEHAVIORAL of regsrcb is

begin
	with S select Y <= 
		D0 when '0',
	   D1 when others;
	
end architecture BEHAVIORAL;