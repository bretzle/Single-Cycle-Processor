library ieee;
use ieee.std_logic_1164.all;

entity seg7decode is
	port(
		INP  : in std_logic_vector(31 downto 0);
		LD   : in std_logic;
		RST  : in std_logic;
		CLK  : in std_logic;
		
		SEG5 : out std_logic_vector( 7 downto 0);
		SEG4 : out std_logic_vector( 7 downto 0);
		SEG3 : out std_logic_vector( 7 downto 0);
		SEG2 : out std_logic_vector( 7 downto 0);
		SEG1 : out std_logic_vector( 7 downto 0);
		SEG0 : out std_logic_vector( 7 downto 0)
	);
end entity seg7decode;

architecture dataflow of seg7decode is

	constant zero      : std_logic_vector(7 downto 0) := B"11000000"; 
	constant one       : std_logic_vector(7 downto 0) := B"11111001"; 
	constant two       : std_logic_vector(7 downto 0) := B"10100100";
	constant three     : std_logic_vector(7 downto 0) := B"10110000";
	constant four      : std_logic_vector(7 downto 0) := B"10011001"; 
	constant five      : std_logic_vector(7 downto 0) := B"10010010"; 
	constant six       : std_logic_vector(7 downto 0) := B"10000010"; 
	constant seven     : std_logic_vector(7 downto 0) := B"11011000"; 
	constant eight     : std_logic_vector(7 downto 0) := B"10000000"; 
	constant nine      : std_logic_vector(7 downto 0) := B"10011000"; 
	constant A         : std_logic_vector(7 downto 0) := B"10001000"; 
	constant B         : std_logic_vector(7 downto 0) := B"10000011"; 
	constant C         : std_logic_vector(7 downto 0) := B"10100111"; 
	constant D         : std_logic_vector(7 downto 0) := B"10100001"; 
	constant E         : std_logic_vector(7 downto 0) := B"10000110"; 
	constant F         : std_logic_vector(7 downto 0) := B"10001110"; 
	
	signal SL : std_logic_vector(31 downto 0);

begin

	process(RST,CLK,LD)
	begin
		if RST='0' then SL <=x"00000000";
		elsif rising_edge(CLK) then
			if LD='1' then SL <= INP;
			end if;
		end if;
	end process;

	with SL(23 downto 20) select SEG5 <= 
		zero  when x"0",
		one   when x"1",
		two   when x"2",
		three when x"3",
		four  when x"4",
		five  when x"5",
		six   when x"6",
		seven when x"7",
		eight when x"8",
		nine  when x"9",
		A     when x"A",
		B     when x"B",
		C     when x"C",
		D     when x"D",
		F     when others;
		
	with SL(19 downto 16) select SEG4 <= 
		zero  when x"0",
		one   when x"1",
		two   when x"2",
		three when x"3",
		four  when x"4",
		five  when x"5",
		six   when x"6",
		seven when x"7",
		eight when x"8",
		nine  when x"9",
		A     when x"A",
		B     when x"B",
		C     when x"C",
		D     when x"D",
		F     when others;
	
	with SL(15 downto 12) select SEG3 <= 
		zero  when x"0",
		one   when x"1",
		two   when x"2",
		three when x"3",
		four  when x"4",
		five  when x"5",
		six   when x"6",
		seven when x"7",
		eight when x"8",
		nine  when x"9",
		A     when x"A",
		B     when x"B",
		C     when x"C",
		D     when x"D",
		F     when others;
	
	with SL(11 downto  8) select SEG2 <= 
		zero  when x"0",
		one   when x"1",
		two   when x"2",
		three when x"3",
		four  when x"4",
		five  when x"5",
		six   when x"6",
		seven when x"7",
		eight when x"8",
		nine  when x"9",
		A     when x"A",
		B     when x"B",
		C     when x"C",
		D     when x"D",
		F     when others;
	
	with SL( 7 downto  4) select SEG1 <= 
		zero  when x"0",
		one   when x"1",
		two   when x"2",
		three when x"3",
		four  when x"4",
		five  when x"5",
		six   when x"6",
		seven when x"7",
		eight when x"8",
		nine  when x"9",
		A     when x"A",
		B     when x"B",
		C     when x"C",
		D     when x"D",
		F     when others;
	
	with SL( 3 downto  0) select SEG0 <= 
		zero  when x"0",
		one   when x"1",
		two   when x"2",
		three when x"3",
		four  when x"4",
		five  when x"5",
		six   when x"6",
		seven when x"7",
		eight when x"8",
		nine  when x"9",
		A     when x"A",
		B     when x"B",
		C     when x"C",
		D     when x"D",
		F     when others;

end architecture dataflow;
	