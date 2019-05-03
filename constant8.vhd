library ieee;
use ieee.std_logic_1164.all;

entity constant8 is
	port(
		Y: out std_logic_vector(31 downto 0)
	);
end entity constant8;

architecture dataflow of constant8 is

begin

	Y <= x"00000008";

end architecture dataflow;