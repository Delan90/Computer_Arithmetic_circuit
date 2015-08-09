----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:02:02 11/05/2014 
-- Design Name: 
-- Module Name:    ConditionSumAdder - Behavioral 
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

entity ConditionSumAdder is
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           s : out  STD_LOGIC_VECTOR(7 downto 0);
           c : out  STD_LOGIC);
end ConditionSumAdder;

architecture Behavioral of ConditionSumAdder is

component HalfAdder is
Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c : out  STD_LOGIC);
end component;

component ResultGenCircuit is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c0 : out  STD_LOGIC;
           c1 : out  STD_LOGIC;
           s0 : out  STD_LOGIC;
           s1 : out  STD_LOGIC);
end component;

component Selector_11_5 is
    Port ( Cin : in  STD_LOGIC;
           S40 : in  STD_LOGIC;
           S41 : in  STD_LOGIC;
           S50 : in  STD_LOGIC;
           S51 : in  STD_LOGIC;
           S60 : in  STD_LOGIC;
           S61 : in  STD_LOGIC;
           S70 : in  STD_LOGIC;
           S71 : in  STD_LOGIC;
           C0 : in  STD_LOGIC;
           C1 : in  STD_LOGIC;
           S4 : out  STD_LOGIC;
           S5 : out  STD_LOGIC;
           S6 : out  STD_LOGIC;
           S7 : out  STD_LOGIC;
           C : out  STD_LOGIC);
end component;

component Selector_5_2 is
    Port ( Cin : in  STD_LOGIC;
           S10 : in  STD_LOGIC;
           S11 : in  STD_LOGIC;
           C0 : in  STD_LOGIC;
           C1 : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S1 : out  STD_LOGIC);
end component;

component Selector_6_4 is
    Port ( Cin0 : in  STD_LOGIC;
           Cin1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           C0 : in  STD_LOGIC;
           C1 : in  STD_LOGIC;
           Sout0 : out  STD_LOGIC;
           Sout1 : out  STD_LOGIC;
           Cout0 : out  STD_LOGIC;
           Cout1 : out  STD_LOGIC);
end component;

component Selector_7_3 is
    Port ( Cin : in  STD_LOGIC;
           S20 : in  STD_LOGIC;
           S21 : in  STD_LOGIC;
           S30 : in  STD_LOGIC;
           S31 : in  STD_LOGIC;
           C0 : in  STD_LOGIC;
           C1 : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S2 : out  STD_LOGIC;
           S3 : out  STD_LOGIC);
end component;

component Selector_8_6 is
    Port ( Cin0 : in  STD_LOGIC;
           Cin1 : in  STD_LOGIC;
           C1 : in  STD_LOGIC;
           C0 : in  STD_LOGIC;
           S60 : in  STD_LOGIC;
           S61 : in  STD_LOGIC;
           S70 : in  STD_LOGIC;
           S71 : in  STD_LOGIC;
           Cout0 : out  STD_LOGIC;
           Cout1 : out  STD_LOGIC;
           Sout60 : out  STD_LOGIC;
           Sout61 : out  STD_LOGIC;
           Sout70 : out  STD_LOGIC;
           Sout71 : out  STD_LOGIC);
end component;

signal sig : std_logic_vector(48 downto 0);

begin

ha : HalfAdder port map(a=>a(0), b=>b(0), s=>s(0), c=>sig(0));
rg1 : ResultGenCircuit port map(a=>a(1), b=>b(1), c0=>sig(1), c1=>sig(2), s0=>sig(3), s1=>sig(4));
rg2 : ResultGenCircuit port map(a=>a(2), b=>b(2), c0=>sig(5), c1=>sig(6), s0=>sig(7), s1=>sig(8));
rg3 : ResultGenCircuit port map(a=>a(3), b=>b(3), c0=>sig(9), c1=>sig(10), s0=>sig(11), s1=>sig(12));
rg4 : ResultGenCircuit port map(a=>a(4), b=>b(4), c0=>sig(13), c1=>sig(14), s0=>sig(15), s1=>sig(16));
rg5 : ResultGenCircuit port map(a=>a(5), b=>b(5), c0=>sig(17), c1=>sig(18), s0=>sig(19), s1=>sig(20));
rg6 : ResultGenCircuit port map(a=>a(6), b=>b(6), c0=>sig(21), c1=>sig(22), s0=>sig(23), s1=>sig(24));
rg7 : ResultGenCircuit port map(a=>a(7), b=>b(7), c0=>sig(25), c1=>sig(26), s0=>sig(27), s1=>sig(28));
se52 : selector_5_2 port map( Cin=>sig(0),
           S10 => sig(3),
           S11 => sig(4),
           C0 => sig(1),
           C1 => sig(2),
           Cout => sig(29),
           S1 => s(1));
se641 : Selector_6_4 port map(Cin0 => sig(5),
           Cin1 => sig(6),
           S0 => sig(11),
           S1 => sig(12),
           C0 => sig(9),
           C1 => sig(10),
           Sout0 => sig(30),
           Sout1 => sig(31),
           Cout0 => sig(32),
           Cout1 => sig(33));
se642 : Selector_6_4 port map(Cin0 => sig(13),
           Cin1 => sig(14),
           S0 => sig(19),
           S1 => sig(20),
           C0 => sig(17),
           C1 => sig(18),
           Sout0 => sig(34),
           Sout1 => sig(35),
           Cout0 => sig(36),
           Cout1 => sig(37)); 
se643 : Selector_6_4 port map(Cin0 => sig(21),
           Cin1 => sig(22),
           S0 => sig(27),
           S1 => sig(28),
           C0 => sig(25),
           C1 => sig(26),
           Sout0 => sig(38),
           Sout1 => sig(39),
           Cout0 => sig(40),
           Cout1 => sig(41)); 
se73 : Selector_7_3 port map(Cin => sig(29),
           S20 => sig(7),
           S21 => sig(8),
           S30 => sig (30),
           S31 => sig(31),
           C0 => sig(32),
           C1 => sig(33),
           Cout => sig(42),
           S2 => s(2),
           S3 => s(3));	
se86 : Selector_8_6 port map(Cin0 => sig(36),
           Cin1 => sig(37),
           C1 => sig(41),
           C0 => sig(40),
           S60 => sig(23),
           S61 => sig(24),
           S70 => sig(38),
           S71 => sig(39),
           Cout0 => sig(43),
           Cout1 => sig(44),
           Sout60 => sig(45),
           Sout61 =>sig(46),
           Sout70 => sig(47),
           Sout71 => sig(48));
se115 : Selector_11_5 port map(Cin => sig(42),
           S40=> sig(15),
           S41 => sig(16),
           S50 => sig(34),
           S51 => sig(35),
           S60 => sig(45),
           S61 => sig(46),
           S70 => sig(47),
           S71 => sig(48),
           C0 => sig(43),
           C1 => sig(44),
           S4 => s(4),
           S5 => s(5),
           S6 => s(6),
           S7 => s(7),
           C => c);			  

end Behavioral;

