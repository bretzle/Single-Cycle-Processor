library ieee;
use ieee.std_logic_1164.all;

entity reg4 is
	port(
		D3  : in std_logic;
		D2  : in std_logic;
		D1  : in std_logic;
		D0  : in std_logic;
		LD  : in std_logic;
		RST : in std_logic;
		CLK : in std_logic;
		
		Q3  : out std_logic;
		Q2  : out std_logic;
		Q1  : out std_logic;
		Q0  : out std_logic
	);
end entity reg4;

architecture dataflow of reg4 is

signal S3 : std_logic := '0';
signal S2 : std_logic := '0';
signal S1 : std_logic := '0';
signal S0 : std_logic := '0';

begin

	Q3 <= S3;
	Q2 <= S2;
	Q1 <= S1;
	Q0 <= S0;

	process(LD,RST,CLK)
	begin
		if RST='0' then
			S3 <= '0';
			S2 <= '0';
			S1 <= '0';
			S0 <= '0';
		elsif rising_edge(CLK) then
			if LD='1' then
				S3 <= D3;
				S2 <= D2;
				S1 <= D1;
				S0 <= D0;
			end if;
		end if;
	end process;

end architecture dataflow;