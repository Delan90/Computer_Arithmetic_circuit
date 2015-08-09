----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:39:09 11/05/2014 
-- Design Name: 
-- Module Name:    Selector_8_6 - Behavioral 
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

entity Selector_8_6 is
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
end Selector_8_6;

architecture Behavioral of Selector_8_6 is

component Selector_2_1 is
	Port ( s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC);
end component;

begin

se1 : Selector_2_1 port map (s0=>S60, s1=>S61, c=>Cin0, s=>Sout60);
se2 : Selector_2_1 port map (s0=>S70, s1=>S71, c=>Cin0, s=>Sout70);
se3 : Selector_2_1 port map (s0=>C0, s1=>C1, c=>Cin0, s=>Cout0);
se4 : Selector_2_1 port map (s0=>S60, s1=>S61, c=>Cin1, s=>Sout61);
se5 : Selector_2_1 port map (s0=>S70, s1=>S71, c=>Cin1, s=>Sout71);
se6 : Selector_2_1 port map (s0=>C0, s1=>C1, c=>Cin1, s=>Cout1);

end Behavioral;

