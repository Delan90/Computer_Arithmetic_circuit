----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:25 01/28/2015 
-- Design Name: 
-- Module Name:    FloatingPointMultiplier - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FloatingPointMultiplier is
    Port ( A : in  STD_LOGIC_VECTOR (22 downto 0);
           B : in  STD_LOGIC_VECTOR (22 downto 0);
           P : out  STD_LOGIC_VECTOR (22 downto 0);
			  zeroflag : out STD_LOGIC;
			  OFflag : out STD_LOGIC;
			  UFflag : out STD_LOGIC;
			  Signflag : out STD_LOGIC);
end FloatingPointMultiplier;

architecture Behavioral of FloatingPointMultiplier is

component Booth4Multiplier is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           S : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component CLAAdder is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
			  Cin : in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           Cout : out  STD_LOGIC;
			  OFflag : out STD_LOGIC);
end component;

component NormRound is
    Port ( resmult : in  STD_LOGIC_VECTOR (31 downto 0);
           c : out  STD_LOGIC;
           r : out  STD_LOGIC_VECTOR (14 downto 0));
end component;

component Unpack is
    Port ( A : in  STD_LOGIC_VECTOR (22 downto 0);
           B : in  STD_LOGIC_VECTOR (22 downto 0);
           signA : out  STD_LOGIC;
           signB : out  STD_LOGIC;
           ExponentA : out  STD_LOGIC_VECTOR (7 downto 0);
           ExponentB : out  STD_LOGIC_VECTOR (7 downto 0);
           SignificandA : out  STD_LOGIC_VECTOR (15 downto 0);
           SignificandB : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component Pack is
    Port ( signA : in  STD_LOGIC;
           signB : in  STD_LOGIC;
           resadd : in  STD_LOGIC_VECTOR (7 downto 0);
           resround : in  STD_LOGIC_VECTOR (14 downto 0);
           P : out  STD_LOGIC_VECTOR (22 downto 0));
end component;

component Zerocheck is
    Port ( A : in  STD_LOGIC_VECTOR (22 downto 0);
           B : in  STD_LOGIC_VECTOR (22 downto 0);
			  resP : in STD_LOGIC_VECTOR (22 downto 0); 
			  P : out STD_LOGIC_VECTOR (22 downto 0);
			  flag : out STD_LOGIC);
end component;

signal sA, sB, cnorm, sigca1, sigca2, sigOUF : STD_LOGIC;
signal eA, eB, saddres, sadd1 : STD_LOGIC_VECTOR(7 downto 0);
signal sroundres : STD_LOGIC_VECTOR(14 downto 0);
signal siA, siB : STD_LOGIC_VECTOR(15 downto 0);
signal sigP : STD_LOGIC_VECTOR(22 downto 0);
signal smultres : STD_LOGIC_VECTOR(31 downto 0);

begin

up : Unpack port map (A=>A, B=>B, signA=>sA, signB=>sB, ExponentA=>eA, ExponentB=>eB, SignificandA=>siA, SignificandB=>siB);

add1 : CLAAdder port map (A=>eA, B=>eB, Cin=>cnorm, S=>sadd1);

add2 : CLAAdder port map (A=>sadd1, B=>"10000001", Cin=>'0', S=>saddres);

mult : Booth4Multiplier port map (A=>siA, B=>siB, S=>smultres);

nr : NormRound port map (resmult=>smultres, c=>cnorm, r=>sroundres);

pa : Pack port map (signA=>sA, signB=>sB, resadd=>saddres, resround=>sroundres, P=>sigP);

zc : Zerocheck port map (A=>A, B=>B, resP=>sigP, P=>P, flag=>zeroflag);


process (saddres)
begin
	if (saddres(7)='1' and eA(7)='0' and eB(7)='0') then
		OFflag<='0';
		UFflag<='1';
	elsif (saddres(7)='0' and eA(7)='1' and eB(7)='1') then
		OFflag<='1';
		UFflag<='0';
	else
		OFflag<='0';
		UFflag<='0';
	end if;
end process;

signFlag <= sigP(22);
	
end Behavioral;

