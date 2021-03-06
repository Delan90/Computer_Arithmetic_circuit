----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:08 10/29/2014 
-- Design Name: 
-- Module Name:    RAdder8b - Behavioral 
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

entity RAdder8b is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           c : in  STD_LOGIC;
           co : out  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (7 downto 0));
end RAdder8b;

architecture Behavioral of RAdder8b is

component FullAdder is
	 Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC;
           co : out  STD_LOGIC);
end component;

signal cint: std_logic_vector(6 downto 0);

begin

r0 : FullAdder port map (a=>a(0),b=>b(0),c=>c,s=>s(0),co=>cint(0));
r1 : FullAdder port map (a=>a(1),b=>b(1),c=>cint(0),s=>s(1),co=>cint(1));
r2 : FullAdder port map (a=>a(2),b=>b(2),c=>cint(1),s=>s(2),co=>cint(2));
r3 : FullAdder port map (a=>a(3),b=>b(3),c=>cint(2),s=>s(3),co=>cint(3));
r4 : FullAdder port map (a=>a(4),b=>b(4),c=>cint(3),s=>s(4),co=>cint(4));
r5 : FullAdder port map (a=>a(5),b=>b(5),c=>cint(4),s=>s(5),co=>cint(5));
r6 : FullAdder port map (a=>a(6),b=>b(6),c=>cint(5),s=>s(6),co=>cint(6));
r7 : FullAdder port map (a=>a(7),b=>b(7),c=>cint(6),s=>s(7),co=>co);

end Behavioral;

