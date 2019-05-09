library ieee;
use ieee.std_logic_1164.all;

entity mux4 is
	port(
		D0 : in std_logic_vector(31 downto 0);
		D1 : in std_logic_vector(31 downto 0);
		D2 : in std_logic_vector(31 downto 0);
		D3 : in std_logic_vector(31 downto 0);
		S  : in std_logic_vector( 1 downto 0);
		
		Y  : out std_logic_vector(31 downto 0)
	);
end entity mux4;

architecture dataflow of mux4 is

begin

	with S select Y <=
		D0 when "00",
		D1 when "01",
		D2 when "10",
		D3 when others;

end architecture dataflow;