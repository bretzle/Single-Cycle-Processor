library ieee;
use ieee.std_logic_1164.all;

entity pc is
	port(
		D   : in std_logic_vector(31 downto 0);
		LD  : in std_logic;
		RST : in std_logic;
		CLK : in std_logic;
		
		Q   : out std_logic_vector(31 downto 0)
	);
end entity pc;

architecture dataflow of pc is

begin

	process(CLK)
	begin
		if rising_edge(CLK) then
			if RST='1' then
				Q <= x"00000000";
			elsif LD='1' then
				Q <= D;
			end if;
		end if;
	end process;

end architecture dataflow;