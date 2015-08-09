----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:45 11/26/2014 
-- Design Name: 
-- Module Name:    csa11_15 - Behavioral 
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

entity csa11_15 is
    Port ( a : in  STD_LOGIC_VECTOR(10 downto 0);
           b : in  STD_LOGIC_VECTOR(10 downto 0);
           c : in  STD_LOGIC_VECTOR(10 downto 0);
           d : in  STD_LOGIC_VECTOR(10 downto 0);
			  --min : in STD_LOGIC;
           Cout : out  STD_LOGIC_VECTOR(14 downto 0);
           s : out  STD_LOGIC_VECTOR(14 downto 0) );
			  --mout : out STD_LOGIC
			  
end csa11_15;

architecture Behavioral of csa11_15 is

component  counter4_2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           tin : in  STD_LOGIC;
           tout : out  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

signal sig : std_logic_vector(13 downto 0);

begin

s0 : counter4_2 port map (A=>a(0),B=>b(0),C=>c(0),D=>d(0),tin=>'0',tout=>sig(0),S=>s(0),Cout=>Cout(0));
s1 : counter4_2 port map (A=>a(1),B=>b(1),C=>c(1),D=>d(1),tin=>sig(0),tout=>sig(1),S=>s(1),Cout=>Cout(1));
s2 : counter4_2 port map (A=>a(2),B=>b(2),C=>c(2),D=>d(2),tin=>sig(1),tout=>sig(2),S=>s(2),Cout=>Cout(2));
s3 : counter4_2 port map (A=>a(3),B=>b(3),C=>c(3),D=>d(3),tin=>sig(2),tout=>sig(3),S=>s(3),Cout=>Cout(3));
s4 : counter4_2 port map (A=>a(4),B=>b(4),C=>c(4),D=>d(4),tin=>sig(3),tout=>sig(4),S=>s(4),Cout=>Cout(4));
s5 : counter4_2 port map (A=>a(5),B=>b(5),C=>c(5),D=>d(5),tin=>sig(4),tout=>sig(5),S=>s(5),Cout=>Cout(5));
s6 : counter4_2 port map (A=>a(6),B=>b(6),C=>c(6),D=>d(6),tin=>sig(5),tout=>sig(6),S=>s(6),Cout=>Cout(6));
s7 : counter4_2 port map (A=>a(7),B=>b(7),C=>c(7),D=>d(7),tin=>sig(6),tout=>sig(7),S=>s(7),Cout=>Cout(7));
s8 : counter4_2 port map (A=>a(8),B=>b(8),C=>c(8),D=>d(8),tin=>sig(7),tout=>sig(8),S=>s(8),Cout=>Cout(8));
s9 : counter4_2 port map (A=>a(9),B=>b(9),C=>c(9),D=>d(9),tin=>sig(8),tout=>sig(9),S=>s(9),Cout=>Cout(9));
s10 : counter4_2 port map (A=>a(10),B=>b(10),C=>c(10),D=>d(10),tin=>sig(9),tout=>sig(10),S=>s(10),Cout=>Cout(10));
s11 : counter4_2 port map (A=>a(10),B=>b(10),C=>c(10),D=>d(10),tin=>sig(10),tout=>sig(11),S=>s(11),Cout=>Cout(11));
s12 : counter4_2 port map (A=>a(10),B=>b(10),C=>c(10),D=>d(10),tin=>sig(11),tout=>sig(12),S=>s(12),Cout=>Cout(12));
s13 : counter4_2 port map (A=>a(10),B=>b(10),C=>c(10),D=>d(10),tin=>sig(12),tout=>sig(13),S=>s(13),Cout=>Cout(13));
s14 : counter4_2 port map (A=>a(10),B=>b(10),C=>c(10),D=>d(10),tin=>sig(13),S=>s(14),Cout=>Cout(14));


end Behavioral;

