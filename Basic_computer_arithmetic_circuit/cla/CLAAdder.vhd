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
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
			  Cin : in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           Cout : out  STD_LOGIC);
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

signal sig : STD_LOGIC_VECTOR (22 downto 0);

begin

cgs0: CGS port map(A=>A(0),B=>B(0),P=>sig(0),G=>sig(1));
cgs1: CGS port map(A=>A(1),B=>B(1),P=>sig(2),G=>sig(3));
cgs2: CGS port map(A=>A(2),B=>B(2),P=>sig(4),G=>sig(5));
cgs3: CGS port map(A=>A(3),B=>B(3),P=>sig(6),G=>sig(7));
cgs4: CGS port map(A=>A(4),B=>B(4),P=>sig(8),G=>sig(9));
cgs5: CGS port map(A=>A(5),B=>B(5),P=>sig(10),G=>sig(11));
cgs6: CGS port map(A=>A(6),B=>B(6),P=>sig(12),G=>sig(13));
cgs7: CGS port map(A=>A(7),B=>B(7),P=>sig(14),G=>sig(15));

cla0: CLAModule port map (G=>sig(1), P=>sig(0),Cin=>Cin,Cout=>sig(16));
cla1: CLAModule port map (G=>sig(3), P=>sig(2),Cin=>sig(16),Cout=>sig(17));
cla2: CLAModule port map (G=>sig(5), P=>sig(4),Cin=>sig(17),Cout=>sig(18));
cla3: CLAModule port map (G=>sig(7), P=>sig(6),Cin=>sig(18),Cout=>sig(19));
cla4: CLAModule port map (G=>sig(9), P=>sig(8),Cin=>sig(19),Cout=>sig(20));
cla5: CLAModule port map (G=>sig(11), P=>sig(10),Cin=>sig(20),Cout=>sig(21));
cla6: CLAModule port map (G=>sig(13), P=>sig(12),Cin=>sig(21),Cout=>sig(22));
cla7: CLAModule port map (G=>sig(15), P=>sig(14),Cin=>sig(22),Cout=>Cout);

sum0: SumStage port map (P=>sig(0), C=>Cin, S=>S(0));
sum1: SumStage port map (P=>sig(2), C=>sig(16), S=>S(1));
sum2: SumStage port map (P=>sig(4), C=>sig(17), S=>S(2));
sum3: SumStage port map (P=>sig(6), C=>sig(18), S=>S(3));
sum4: SumStage port map (P=>sig(8), C=>sig(19), S=>S(4));
sum5: SumStage port map (P=>sig(10), C=>sig(20), S=>S(5));
sum6: SumStage port map (P=>sig(12), C=>sig(21), S=>S(6));
sum7: SumStage port map (P=>sig(14), C=>sig(22), S=>S(7));

end Behavioral;

