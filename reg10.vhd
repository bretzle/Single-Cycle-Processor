library ieee;
use ieee.std_logic_1164.all;

entity reg10 is
	port(
		D   : in std_logic_vector(9 downto 0);
		LD  : in std_logic;
		RST : in std_logic;
		CLK : in std_logic;
		
		Q   : out std_logic_vector(31 downto 0)
	);
end entity reg10;

architecture behav of reg10 is

begin

	process(RST,CLK,LD)
	begin
		if RST='0' then Q <=x"00000000";
		elsif rising_edge(CLK) then
			if LD='1' then Q <= "0000000000000000000000"&D;
			end if;
		end if;
	end process;

end architecture behav;
	