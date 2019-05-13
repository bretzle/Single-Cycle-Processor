library ieee;
use ieee.std_logic_1164.all;

entity constantE is
	port(
		Y: out std_logic_vector(3 downto 0)
	);
end entity constantE;

architecture dataflow of constantE is

begin

	Y <= x"E";

end architecture dataflow;