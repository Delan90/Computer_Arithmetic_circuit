----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:52:33 11/12/2014 
-- Design Name: 
-- Module Name:    CLAAdder - Behavioral 
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

entity CLAAdder is
    Port ( s : in STD_LOGIC_VECTOR( 14 downto 0);
	        c : in STD_LOGIC_VECTOR( 14 downto 0);
			  Cin : in STD_LOGIC;
           f : out STD_LOGIC_VECTOR( 14 downto 0);
			  Cout : out STD_LOGIC);
end CLAAdder;

architecture Behavioral of CLAAdder is

component CGS is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           P : out  STD_LOGIC;
           G : out  STD_LOGIC);
end component;
			  
component CLAModule is
	 Port ( G : in  STD_LOGIC;
           P : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

component SumStage is
    Port ( P : in  STD_LOGIC;
           C : in  STD_LOGIC;
           S : out  STD_LOGIC);
end component;

signal sig : STD_LOGIC_VECTOR (43 downto 0);

begin

cgs0: CGS port map(A=>s(0),B=>'0',P=>sig(0),G=>sig(1));
cgs1: CGS port map(A=>s(1),B=>c(0),P=>sig(2),G=>sig(3));
cgs2: CGS port map(A=>s(2),B=>c(1),P=>sig(4),G=>sig(5));
cgs3: CGS port map(A=>s(3),B=>c(2),P=>sig(6),G=>sig(7));
cgs4: CGS port map(A=>s(4),B=>c(3),P=>sig(8),G=>sig(9));
cgs5: CGS port map(A=>s(5),B=>c(4),P=>sig(10),G=>sig(11));
cgs6: CGS port map(A=>s(6),B=>c(5),P=>sig(12),G=>sig(13));
cgs7: CGS port map(A=>s(7),B=>c(6),P=>sig(14),G=>sig(15));
cgs8: CGS port map(A=>s(8),B=>c(7),P=>sig(16),G=>sig(17));
cgs9: CGS port map(A=>s(9),B=>c(8),P=>sig(18),G=>sig(19));
cgs10: CGS port map(A=>s(10),B=>c(9),P=>sig(20),G=>sig(21));
cgs11: CGS port map(A=>s(11),B=>c(10),P=>sig(22),G=>sig(23));
cgs12: CGS port map(A=>s(12),B=>c(11),P=>sig(24),G=>sig(25));
cgs13: CGS port map(A=>s(13),B=>c(12),P=>sig(26),G=>sig(27));
cgs14: CGS port map(A=>s(14),B=>c(13),P=>sig(28),G=>sig(29));

cla0: CLAModule port map (G=>sig(1), P=>sig(0),Cin=>Cin,Cout=>sig(30));
cla1: CLAModule port map (G=>sig(3), P=>sig(2),Cin=>sig(30),Cout=>sig(31));
cla2: CLAModule port map (G=>sig(5), P=>sig(4),Cin=>sig(31),Cout=>sig(32));
cla3: CLAModule port map (G=>sig(7), P=>sig(6),Cin=>sig(32),Cout=>sig(33));
cla4: CLAModule port map (G=>sig(9), P=>sig(8),Cin=>sig(33),Cout=>sig(34));
cla5: CLAModule port map (G=>sig(11), P=>sig(10),Cin=>sig(34),Cout=>sig(35));
cla6: CLAModule port map (G=>sig(13), P=>sig(12),Cin=>sig(35),Cout=>sig(36));
cla7: CLAModule port map (G=>sig(15), P=>sig(14),Cin=>sig(36),Cout=>sig(37));
cla8: CLAModule port map (G=>sig(17), P=>sig(16),Cin=>sig(37),Cout=>sig(38));
cla9: CLAModule port map (G=>sig(19), P=>sig(18),Cin=>sig(38),Cout=>sig(39));
cla10: CLAModule port map (G=>sig(21), P=>sig(20),Cin=>sig(39),Cout=>sig(40));
cla11: CLAModule port map (G=>sig(23), P=>sig(22),Cin=>sig(40),Cout=>sig(41));
cla12: CLAModule port map (G=>sig(25), P=>sig(24),Cin=>sig(41),Cout=>sig(42));
cla13: CLAModule port map (G=>sig(27), P=>sig(26),Cin=>sig(42),Cout=>sig(43));
cla14: CLAModule port map (G=>sig(29), P=>sig(28),Cin=>sig(43),Cout=>Cout);

sum0: SumStage port map (P=>sig(0), C=>Cin, S=>f(0));
sum1: SumStage port map (P=>sig(2), C=>sig(30), S=>f(1));
sum2: SumStage port map (P=>sig(4), C=>sig(31), S=>f(2));
sum3: SumStage port map (P=>sig(6), C=>sig(32), S=>f(3));
sum4: SumStage port map (P=>sig(8), C=>sig(33), S=>f(4));
sum5: SumStage port map (P=>sig(10), C=>sig(34), S=>f(5));
sum6: SumStage port map (P=>sig(12), C=>sig(35), S=>f(6));
sum7: SumStage port map (P=>sig(14), C=>sig(36), S=>f(7));
sum8: SumStage port map (P=>sig(16), C=>sig(37), S=>f(8));
sum9: SumStage port map (P=>sig(18), C=>sig(38), S=>f(9));
sum10: SumStage port map (P=>sig(20), C=>sig(39), S=>f(10));
sum11: SumStage port map (P=>sig(22), C=>sig(40), S=>f(11));
sum12: SumStage port map (P=>sig(24), C=>sig(41), S=>f(12));
sum13: SumStage port map (P=>sig(26), C=>sig(42), S=>f(13));
sum14: SumStage port map (P=>sig(28), C=>sig(43), S=>f(14));

end Behavioral;

