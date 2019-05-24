library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity addressdecoder is
	port(
		ADDR  : in std_logic_vector(31 downto 0);
		MEMRD : in std_logic;
		MEMWR : in std_logic;
		
		LD2   : out std_logic;
		LD1   : out std_logic;
		LD0   : out std_logic;
		DATAS : out std_logic
	);
end entity addressdecoder;

architecture dataflow of addressdecoder is

begin

	process(ADDR,MEMRD,MEMWR)
	begin
	
		if ADDR(31 downto 5)=0 and MEMRD='0' and MEMWR='1' then
			LD2   <= '1';
			LD1   <= '0';
			LD0   <= '0';
			DATAS <= '0';
		elsif ADDR(31 downto 5)=0 and MEMRD='1' and MEMWR='0' then 
			LD2   <= '0';
			LD1   <= '0';
			LD0   <= '0';
			DATAS <= '1';
		elsif ADDR=x"000000F4" and MEMRD='1' and MEMWR='0' then 
			LD2   <= '0';
			LD1   <= '0';
			LD0   <= '0';
			DATAS <= '0';
		elsif ADDR=x"000000F8" and MEMRD='0' and MEMWR='1' then 
			LD2   <= '0';
			LD1   <= '1';
			LD0   <= '0';
			DATAS <= '0';
		elsif ADDR=x"000000FC" and MEMRD='0' and MEMWR='1' then 
			LD2   <= '0';
			LD1   <= '0';
			LD0   <= '1';
			DATAS <= '0';
		else
			LD2   <= '0';
			LD1   <= '0';
			LD0   <= '0';
			DATAS <= '0';
		end if;
	
	end process;

end architecture dataflow;