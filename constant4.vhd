library ieee;
use ieee.std_logic_1164.all;

entity constant4 is
	port(
		Y: out std_logic_vector(31 downto 0)
	);
end entity constant4;

architecture dataflow of constant4 is

begin

	Y <= x"00000004";

end architecture dataflow;