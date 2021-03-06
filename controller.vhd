library ieee;
use ieee.std_logic_1164.all;

entity controller is
	port(
		COND      : in std_logic_vector(3 downto 0);
		OP        : in std_logic_vector(1 downto 0);
		FUNCT     : in std_logic_vector(5 downto 0);
		ROT       : in std_logic_vector(3 downto 0);
		BIT4      : in std_logic;
		C         : in std_logic;
		V     	 : in std_logic;
		N     	 : in std_logic;
		Z         : in std_logic;
		REG15     : in std_logic_vector(3 downto 0);
		
		PCSRC     : out std_logic;
		PCWR      : out std_logic;
		REGDST    : out std_logic;
		REGWR     : out std_logic;
		EXTS      : out std_logic_vector(1 downto 0);
		ALUSRCB 	 : out std_logic;
		ALUS      : out std_logic_vector(3 downto 0);
		ALUFLAGWR : out std_logic;
		MEMRD     : out std_logic;
		MEMWR     : out std_logic;
		REGSRC    : out std_logic_vector(1 downto 0);
		ROTATE    : out std_logic_vector(3 downto 0);
		MULTIPLY  : inout std_logic;
		RDORBL    : out std_logic;
		PCLRBR    : out std_logic
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
				
	PCSRC <= '0' when COND=x"E" and OP="10"			        else
				'0' when COND=x"0" and OP="10" and Z='1' 		  else
				'0' when COND=x"1" and OP="10" and Z='0'       else
				'0' when OP="00" and CMD=x"D" and REG15="1111" else
				'1';
		
	PCWR <= '1';
	
	REGDST <= '1' when OP="01" else --when STR/LDR
				 '0';
					
	REGWR <= '0' when CMD=X"A"			    else -- cmp
				'0' when OP="01" and L='0'  else -- str
				'0' when OP="10" and BL='0' else -- b/beq/bne
				'1';
				
	EXTS <= OP;
	
	ROTATE <= "0000";
	
	ALUSRCB <= '1' when I='0' and OP="00" else -- register mode data processing
              '0'; 
				  
	ALUS <= "0000" when CMD=x"4" or OP="01" 					   else -- ADD    when ADD/LDR/STR
           "0001" when CMD=x"2" or CMD=x"A" 					   else -- SUB    when SUB/CMP
           "0010" when CMD=x"0" and OP="00" and BIT4='0'	   else -- AND    when AND
           "0011" when CMD=x"C" and OP="00"					   else -- OR     when OR 
           "0100" when CMD=x"1" and OP="00"					   else -- EOR    when EOR
           "0110" when CMD=x"D" and OP="00"					   else -- Pass B when MOV
           "0110" when OP="10" and COND = x"E" and BL = '1' else -- Pass B when BL
			  "1000" when MULTIPLY='1'                         else -- MUL    when MUL
			  "0111"; 
			  
	ALUFLAGWR <= S when OP="00" else '0';        -- s
	
	MEMRD <= '1' when OP="01" and L='1'else 
				'0';
				 
	MEMWR <= '1' when OP="01" and L='0' else		--str
				'0';
				
	REGSRC <= "00" when OP="01" and L='1' 					  else -- ldr
				 "10" when OP="10" and COND=x"E" and BL='1' else -- bl
				 "01";
				 
	MULTIPLY <= '1' when OP="00" and BIT4='1' and I='0' else
					'0';
					
	RDORBL <= '1' when OP="10" and COND=x"E" and BL='1' else
	          '0';
				 
	PCLRBR <= '1' when OP="00" and CMD=x"D" and REG15="1111" else
				 '0';

end architecture dataflow;