library ieee;
use ieee.std_logic_1164.all;

entity controller is
	port(
		COND  : in std_logic_vector(3 downto 0);
		OP    : in std_logic_vector(1 downto 0);
		FUNCT : in std_logic_vector(5 downto 0);
		ROT   : in std_logic_vector(3 downto 0);
		C     : in std_logic;
		V     : in std_logic;
		N     : in std_logic;
		Z     : in std_logic;
		
		PCSRC   : out std_logic;
		PCWR    : out std_logic;
		REGDST  : out std_logic;
		REGWR   : out std_logic;
		EXTS    : out std_logic_vector(1 downto 0);
		ALUSRCB : out std_logic;
		ALUS    : out std_logic_vector(2 downto 0);
		CPSRWR  : out std_logic;
		MEMWR   : out std_logic;
		REGSRC  : out std_logic;
		ROTATE  : out std_logic_vector(3 downto 0)
	);
end entity controller;

architecture dataflow of controller is

signal I   : std_logic;
signal S   : std_logic;
signal BL  : std_logic;
signal L   : std_logic;
signal CMD : std_logic_vector(3 downto 0);

begin

	I <= FUNCT(5);
	BL <= FUNCT(4);
	S <= FUNCT(0);
	L <= FUNCT(0);
	CMD <= FUNCT(4 downto 1);
				
	PCSRC <= '0' when COND=x"E" and OP="10"			  else
				'0' when COND=x"0" and OP="10" and Z='1' else
				'0' when COND=x"1" and OP="10" and Z='0' else
				'1';
		
	PCWR <= '1';
	
	-- 1 = Rd
	-- 0 = Rm
	REGDST <= '1' when COND&OP&I="1110010" else 
				 '0';
	
	REGWR <= '0' when COND=x"E" and OP="10" and L='0' else
				'0' when OP="10" and BL='0' else
				'1';
				
	EXTS <= OP;
	
	ROTATE <= ROT when OP="00" else "0000";
	
	ALUSRCB <= '0' when OP="00" and I='1' else                   -- immediate data processing
				  '0' when OP="10"    		  else						 -- branch
				  '0' when OP="01"	        else						 -- load/store
				  '1';
				  
	ALUS <= "000" when CMD=x"4" or OP="01" 					  else -- ADD    when ADD/LDR/STR
           "001" when CMD=x"2" or CMD=x"A" 					  else -- SUB    when SUB/CMP
           "010" when CMD=x"0" 									  else -- AND    when AND
           "011" when CMD=x"C" 									  else -- OR     when OR 
           "100" when CMD=x"1"									  else -- EOR    when EOR
           "110" when CMD=x"D" 									  else -- Pass B when MOV
           "110" when OP="10" and COND = x"E" and BL = '1' else -- Pass B when BL
			  "111"; 
			  
	CPSRWR <= '1' when S='1' and CMD=x"A" and OP="00" else -- cmp
				 '0';
				 
	MEMWR <= '1' when OP="01" and L='0' else			--str
				'0';
				
	REGSRC <= '0' when OP="01" and L='1' else		-- ldr
				 '1';

end architecture dataflow;