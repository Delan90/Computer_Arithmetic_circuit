----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:42 01/14/2015 
-- Design Name: 
-- Module Name:    PartialProductReduction - Behavioral 
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
use IEEE.STD_LOGIC_signed.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PartialProductReduction is
    Port ( pp0 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp1 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp2 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp3 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp4 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp5 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp6 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp7 : in  STD_LOGIC_VECTOR (16 downto 0);
			  T : in  STD_LOGIC_VECTOR (7 downto 0);
           P : out  STD_LOGIC_VECTOR (31 downto 0));
end PartialProductReduction;

architecture Behavioral of PartialProductReduction is

component HalfAdder is
	Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c : out  STD_LOGIC);
end component;

component FullAdder is
	Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC;
           co : out  STD_LOGIC);
end component;

component counter4_2 is
	Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           tin : in  STD_LOGIC;
           tout : out  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

--signals
--sign extended signals
signal se0  : std_logic_vector(23 downto 0);
signal se1  : std_logic_vector(23 downto 0);
signal se2  : std_logic_vector(23 downto 0);
signal se3  : std_logic_vector(23 downto 0);
signal se4  : std_logic_vector(23 downto 0);
signal se5  : std_logic_vector(23 downto 0);
signal se6  : std_logic_vector(23 downto 0);
signal se7  : std_logic_vector(23 downto 0);


--intermediary results
signal s0 : STD_LOGIC_VECTOR(23 downto 0);
signal c0 : STD_LOGIC_VECTOR(23 downto 0);

signal s1 : STD_LOGIC_VECTOR(23 downto 0);
signal c1 : STD_LOGIC_VECTOR(23 downto 0);

signal s2 : STD_LOGIC_VECTOR(31 downto 0);
signal c2 : STD_LOGIC_VECTOR(31 downto 0);

signal s : STD_LOGIC_VECTOR(31 downto 0);
signal c : STD_LOGIC_VECTOR(31 downto 0);

signal final_sum : STD_LOGIC_VECTOR(32 downto 0);

signal sig : STD_LOGIC_VECTOR(49 downto 0);
begin
--sign extension and 0-padding
se0 <= "0000" & (not pp0(16)) & pp0(16) & pp0(16) & pp0;
se1 <= "0001" & (not pp1(16)) & pp1 & "00";
se2 <= "01" & (not pp2(16)) & pp2 & "0000";
se3 <= not(pp3(16)) & pp3 & "000000";

se4 <= "000001" & (not pp4(16)) & pp4;
se5 <= "0001" & (not pp5(16)) & pp5 & "00";
se6 <= "01" & (not pp6(16)) & pp6 & "0000";
se7 <= not(pp7(16)) & pp7 & "000000";

--first serie of adders
s0(1) <= se0(1);
s0(23) <= se3(23);
c0(1) <= '0';
c0(23) <= '1';
s1(1) <= se4(1);	
s1(23) <= se7(23);
c1(1) <= '0';
c1(23) <= '1';
 
ha1 : HalfAdder port map (a=>se0(0), b=> T(0), s=>s0(0), c=>c0(0));
ha2 : HalfAdder port map (a=>se0(3), b=> se1(3), s=>s0(3), c=>c0(3));
ha3 : HalfAdder port map (a=>se2(22), b=> se3(22), s=>s0(22), c=>c0(22));
ha4 : HalfAdder port map (a=>se4(0), b=> T(4), s=>s1(0), c=>c1(0));
ha5 : HalfAdder port map (a=>se4(3), b=> se5(3), s=>s1(3), c=>c1(3));
ha6 : HalfAdder port map (a=>se6(22), b=> se7(22), s=>s1(22), c=>c1(22));

fa1 : FullAdder port map (a=>se0(2), b=>se1(2), c=> T(1),  s=>s0(2), co=>c0(2));
fa2 : FullAdder port map (a=>sig(16), b=>se2(21), c=> se3(21), s=>s0(21), co=>c0(21));
fa3 : FullAdder port map (a=>se4(2), b=>se5(2), c=> T(5),  s=>s1(2), co=>c1(2));
fa4 : FullAdder port map (a=>sig(49), b=>se6(21), c=> se7(21), s=>s1(21), co=>c1(21));

c42_1 : counter4_2 port map (A=>se0(4), B=>se1(4), C=>se2(4), D=>T(2), tin=>'0', S=>s0(4), Cout=>c0(4), tout=>sig(0)); 
c42_2 : counter4_2 port map (A=>se0(5), B=>se1(5), C=>se2(5), D=>se3(5), tin=>sig(0), S=>s0(5), Cout=>c0(5), tout=>sig(1)); 
c42_3 : counter4_2 port map (A=>se0(6), B=>se1(6), C=>se2(6), D=>se3(6), tin=>sig(1), S=>s0(6), Cout=>c0(6), tout=>sig(2)); 
c42_4 : counter4_2 port map (A=>se0(7), B=>se1(7), C=>se2(7), D=>se3(7), tin=>sig(2), S=>s0(7), Cout=>c0(7), tout=>sig(3)); 
c42_5 : counter4_2 port map (A=>se0(8), B=>se1(8), C=>se2(8), D=>se3(8), tin=>sig(3), S=>s0(8), Cout=>c0(8), tout=>sig(4)); 
c42_6 : counter4_2 port map (A=>se0(9), B=>se1(9), C=>se2(9), D=>se3(9), tin=>sig(4), S=>s0(9), Cout=>c0(9), tout=>sig(5)); 
c42_7 : counter4_2 port map (A=>se0(10), B=>se1(10), C=>se2(10), D=>se3(10), tin=>sig(5), S=>s0(10), Cout=>c0(10), tout=>sig(6)); 
c42_8 : counter4_2 port map (A=>se0(11), B=>se1(11), C=>se2(11), D=>se3(11), tin=>sig(6), S=>s0(11), Cout=>c0(11), tout=>sig(7)); 
c42_9 : counter4_2 port map (A=>se0(12), B=>se1(12), C=>se2(12), D=>se3(12), tin=>sig(7), S=>s0(12), Cout=>c0(12), tout=>sig(8)); 
c42_10 : counter4_2 port map (A=>se0(13), B=>se1(13), C=>se2(13), D=>se3(13), tin=>sig(8), S=>s0(13), Cout=>c0(13), tout=>sig(9)); 
c42_11 : counter4_2 port map (A=>se0(14), B=>se1(14), C=>se2(14), D=>se3(14), tin=>sig(9), S=>s0(14), Cout=>c0(14), tout=>sig(10)); 
c42_12 : counter4_2 port map (A=>se0(15), B=>se1(15), C=>se2(15), D=>se3(15), tin=>sig(10), S=>s0(15), Cout=>c0(15), tout=>sig(11)); 
c42_13 : counter4_2 port map (A=>se0(16), B=>se1(16), C=>se2(16), D=>se3(16), tin=>sig(11), S=>s0(16), Cout=>c0(16), tout=>sig(12)); 
c42_14 : counter4_2 port map (A=>se0(17), B=>se1(17), C=>se2(17), D=>se3(17), tin=>sig(12), S=>s0(17), Cout=>c0(17), tout=>sig(13)); 
c42_15 : counter4_2 port map (A=>se0(18), B=>se1(18), C=>se2(18), D=>se3(18), tin=>sig(13), S=>s0(18), Cout=>c0(18), tout=>sig(14)); 
c42_16 : counter4_2 port map (A=>se0(19), B=>se1(19), C=>se2(19), D=>se3(19), tin=>sig(14), S=>s0(19), Cout=>c0(19), tout=>sig(15)); 
c42_17 : counter4_2 port map (A=>'0', B=>se1(20), C=>se2(20), D=>se3(20), tin=>sig(15), S=>s0(20), Cout=>c0(20), tout=>sig(16)); 
c42_18 : counter4_2 port map (A=>se4(4), B=>se5(4), C=>se6(4), D=>T(6), tin=>'0', S=>s1(4), Cout=>c1(4), tout=>sig(17)); 
c42_19 : counter4_2 port map (A=>se4(5), B=>se5(5), C=>se6(5), D=>se7(5), tin=>sig(17), S=>s1(5), Cout=>c1(5), tout=>sig(18)); 
c42_20 : counter4_2 port map (A=>se4(6), B=>se5(6), C=>se6(6), D=>se7(6), tin=>sig(18), S=>s1(6), Cout=>c1(6), tout=>sig(19)); 
c42_21 : counter4_2 port map (A=>se4(7), B=>se5(7), C=>se6(7), D=>se7(7), tin=>sig(19), S=>s1(7), Cout=>c1(7), tout=>sig(20)); 
c42_22 : counter4_2 port map (A=>se4(8), B=>se5(8), C=>se6(8), D=>se7(8), tin=>sig(20), S=>s1(8), Cout=>c1(8), tout=>sig(21)); 
c42_23 : counter4_2 port map (A=>se4(9), B=>se5(9), C=>se6(9), D=>se7(9), tin=>sig(21), S=>s1(9), Cout=>c1(9), tout=>sig(22)); 
c42_24 : counter4_2 port map (A=>se4(10), B=>se5(10), C=>se6(10), D=>se7(10), tin=>sig(22), S=>s1(10), Cout=>c1(10), tout=>sig(23)); 
c42_25 : counter4_2 port map (A=>se4(11), B=>se5(11), C=>se6(11), D=>se7(11), tin=>sig(23), S=>s1(11), Cout=>c1(11), tout=>sig(24)); 
c42_26 : counter4_2 port map (A=>se4(12), B=>se5(12), C=>se6(12), D=>se7(12), tin=>sig(24), S=>s1(12), Cout=>c1(12), tout=>sig(25)); 
c42_27 : counter4_2 port map (A=>se4(13), B=>se5(13), C=>se6(13), D=>se7(13), tin=>sig(25), S=>s1(13), Cout=>c1(13), tout=>sig(26)); 
c42_28 : counter4_2 port map (A=>se4(14), B=>se5(14), C=>se6(14), D=>se7(14), tin=>sig(26), S=>s1(14), Cout=>c1(14), tout=>sig(27)); 
c42_29 : counter4_2 port map (A=>se4(15), B=>se5(15), C=>se6(15), D=>se7(15), tin=>sig(27), S=>s1(15), Cout=>c1(15), tout=>sig(28)); 
c42_30 : counter4_2 port map (A=>se4(16), B=>se5(16), C=>se6(16), D=>se7(16), tin=>sig(28), S=>s1(16), Cout=>c1(16), tout=>sig(29)); 
c42_31 : counter4_2 port map (A=>se4(17), B=>se5(17), C=>se6(17), D=>se7(17), tin=>sig(29), S=>s1(17), Cout=>c1(17), tout=>sig(30)); 
c42_32 : counter4_2 port map (A=>se4(18), B=>se5(18), C=>se6(18), D=>se7(18), tin=>sig(30), S=>s1(18), Cout=>c1(18), tout=>sig(31)); 
c42_33 : counter4_2 port map (A=>'0', B=>se5(19), C=>se6(19), D=>se7(19), tin=>sig(31), S=>s1(19), Cout=>c1(19), tout=>sig(32)); 
c42_34 : counter4_2 port map (A=>'0', B=>se5(20), C=>se6(20), D=>se7(20), tin=>sig(32), S=>s1(20), Cout=>c1(20), tout=>sig(49)); 


--second serie of adders
s2(0) <= s0(0);
s2(2) <= s0(2);
c2(0) <= '0';
c2(1) <= '0';
c2(3) <= '0';

ha7 : HalfAdder port map (a=>s0(1), b=> c0(0), s=>s2(1), c=>c2(2));
ha8 : HalfAdder port map (a=>s0(3), b=> c0(2), s=>s2(3), c=>c2(4));
ha9 : HalfAdder port map (a=>s0(4), b=> c0(3), s=>s2(4), c=>c2(5));
ha10 : HalfAdder port map (a=>s0(5), b=> c0(4), s=>s2(5), c=>c2(6));
ha11 : HalfAdder port map (a=>s0(7), b=> c0(6), s=>s2(7), c=>c2(8));
ha13 : HalfAdder port map (a=>s1(18), b=> c1(17), s=>s2(26), c=>c2(27));
ha14 : HalfAdder port map (a=>s1(19), b=> c1(18), s=>s2(27), c=>c2(28));
ha15 : HalfAdder port map (a=>s1(20), b=> c1(19), s=>s2(28), c=>c2(29));
ha16 : HalfAdder port map (a=>s1(21), b=> c1(20), s=>s2(29), c=>c2(30));
ha17 : HalfAdder port map (a=>s1(22), b=> c1(21), s=>s2(30), c=>c2(31));
ha18 : HalfAdder port map (a=>s1(23), b=> c1(22), s=>s2(31));	-- no value attached to c, inexistant c2(32)



fa5 : FullAdder port map (a=>s0(6), b=>c0(5), c=> T(3),  s=>s2(6), co=>c2(7));
fa6 : FullAdder port map (a=>s0(8), b=>c0(7), c=> s1(0),  s=>s2(8), co=>c2(9));
fa8 : FullAdder port map (a=>sig(48), b=>s1(17), c=> c1(16),  s=>s2(25), co=>c2(26));


c42_36 : counter4_2 port map (A=>s0(9), B=>c0(8), C=>s1(1), D=>c1(0), tin=>'0', S=>s2(9), Cout=>c2(10), tout=>sig(33));
c42_37 : counter4_2 port map (A=>s0(10), B=>c0(9), C=>s1(2), D=>c1(1), tin=>sig(33), S=>s2(10), Cout=>c2(11), tout=>sig(34));
c42_38 : counter4_2 port map (A=>s0(11), B=>c0(10), C=>s1(3), D=>c1(2), tin=>sig(34), S=>s2(11), Cout=>c2(12), tout=>sig(35));
c42_39 : counter4_2 port map (A=>s0(12), B=>c0(11), C=>s1(4), D=>c1(3), tin=>sig(35), S=>s2(12), Cout=>c2(13), tout=>sig(36));
c42_40 : counter4_2 port map (A=>s0(13), B=>c0(12), C=>s1(5), D=>c1(4), tin=>sig(36), S=>s2(13), Cout=>c2(14), tout=>sig(37));
c42_41 : counter4_2 port map (A=>s0(14), B=>c0(13), C=>s1(6), D=>c1(5), tin=>sig(37), S=>s2(14), Cout=>c2(15), tout=>sig(38));
c42_42 : counter4_2 port map (A=>s0(15), B=>c0(14), C=>s1(7), D=>c1(6), tin=>sig(38), S=>s2(15), Cout=>c2(16), tout=>sig(39));
c42_43 : counter4_2 port map (A=>s0(16), B=>c0(15), C=>s1(8), D=>c1(7), tin=>sig(39), S=>s2(16), Cout=>c2(17), tout=>sig(40));
c42_44 : counter4_2 port map (A=>s0(17), B=>c0(16), C=>s1(9), D=>c1(8), tin=>sig(40), S=>s2(17), Cout=>c2(18), tout=>sig(41));
c42_45 : counter4_2 port map (A=>s0(18), B=>c0(17), C=>s1(10), D=>c1(9), tin=>sig(41), S=>s2(18), Cout=>c2(19), tout=>sig(42));
c42_46 : counter4_2 port map (A=>s0(19), B=>c0(18), C=>s1(11), D=>c1(10), tin=>sig(42), S=>s2(19), Cout=>c2(20), tout=>sig(43));
c42_47 : counter4_2 port map (A=>s0(20), B=>c0(19), C=>s1(12), D=>c1(11), tin=>sig(43), S=>s2(20), Cout=>c2(21), tout=>sig(44));
c42_48 : counter4_2 port map (A=>s0(21), B=>c0(20), C=>s1(13), D=>c1(12), tin=>sig(44), S=>s2(21), Cout=>c2(22), tout=>sig(45));
c42_49 : counter4_2 port map (A=>s0(22), B=>c0(21), C=>s1(14), D=>c1(13), tin=>sig(45), S=>s2(22), Cout=>c2(23), tout=>sig(46));
c42_50 : counter4_2 port map (A=>s0(23), B=>c0(22), C=>s1(15), D=>c1(14), tin=>sig(46), S=>s2(23), Cout=>c2(24), tout=>sig(47));
c42_51 : counter4_2 port map (A=>'0', B=>c0(23), C=>s1(16), D=>c1(15), tin=>sig(47), S=>s2(24), Cout=>c2(25), tout=>sig(48));

-- third row of adders
s(0)<=s2(0);
s(1)<=s2(1);
s(3)<=s2(3);
s(4)<=s2(4);
s(5)<=s2(5);
s(6)<=s2(6);
s(7)<=s2(7);
s(8)<=s2(8);
s(9)<=s2(9);
s(10)<=s2(10);
s(11)<=s2(11);
s(12)<=s2(12);
s(13)<=s2(13);

c(0)<='0';
c(1)<='0';
c(2)<='0';
c(4)<=c2(4);
c(5)<=c2(5);
c(6)<=c2(6);
c(7)<=c2(7);
c(8)<=c2(8);
c(9)<=c2(9);
c(10)<=c2(10);
c(11)<=c2(11);
c(12)<=c2(12);
c(13)<=c2(13);
c(14)<='0';


ha36 : HalfAdder port map (a=>s2(2), b=> c2(2), s=>s(2), c=>c(3));
ha19 : HalfAdder port map (a=>s2(15), b=> c2(15), s=>s(15), c=>c(16));
ha20 : HalfAdder port map (a=>s2(16), b=> c2(16), s=>s(16), c=>c(17));
ha21 : HalfAdder port map (a=>s2(17), b=> c2(17), s=>s(17), c=>c(18));
ha22 : HalfAdder port map (a=>s2(18), b=> c2(18), s=>s(18), c=>c(19));
ha23 : HalfAdder port map (a=>s2(19), b=> c2(19), s=>s(19), c=>c(20));
ha24 : HalfAdder port map (a=>s2(20), b=> c2(20), s=>s(20), c=>c(21));
ha25 : HalfAdder port map (a=>s2(21), b=> c2(21), s=>s(21), c=>c(22));
ha26 : HalfAdder port map (a=>s2(22), b=> c2(22), s=>s(22), c=>c(23));
ha27 : HalfAdder port map (a=>s2(23), b=> c2(23), s=>s(23), c=>c(24));
ha28 : HalfAdder port map (a=>s2(24), b=> c2(24), s=>s(24), c=>c(25));
ha29 : HalfAdder port map (a=>s2(25), b=> c2(25), s=>s(25), c=>c(26));
ha30 : HalfAdder port map (a=>s2(26), b=> c2(26), s=>s(26), c=>c(27));
ha31 : HalfAdder port map (a=>s2(27), b=> c2(27), s=>s(27), c=>c(28));
ha32 : HalfAdder port map (a=>s2(28), b=> c2(28), s=>s(28), c=>c(29));
ha33 : HalfAdder port map (a=>s2(29), b=> c2(29), s=>s(29), c=>c(30));
ha34 : HalfAdder port map (a=>s2(30), b=> c2(30), s=>s(30), c=>c(31));
ha35 : HalfAdder port map (a=>s2(31), b=> c2(31), s=>s(31)); -- no c(32)

fa7 : FullAdder port map (a=>s2(14), b=>c2(14), c=> T(7),  s=>s(14), co=>c(15));
-- Final Adder Circuit
 
final_sum <= (s(31)&s) + (c(31)&c); 
P <= final_sum (31 downto 0);

end Behavioral;

