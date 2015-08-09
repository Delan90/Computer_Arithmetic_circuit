----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:44:07 11/05/2014 
-- Design Name: 
-- Module Name:    Selector_11_5 - Behavioral 
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

entity Selector_11_5 is
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
end Selector_11_5;

architecture Behavioral of Selector_11_5 is

component Selector_2_1 is
	Port ( s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC);
end component;

begin

se1 : Selector_2_1 port map (s0=>S40, s1=>S41, c=>Cin, s=>S4);
se2 : Selector_2_1 port map (s0=>S50, s1=>S51, c=>Cin, s=>S5);
se3 : Selector_2_1 port map (s0=>S60, s1=>S61, c=>Cin, s=>S6);
se4 : Selector_2_1 port map (s0=>S70, s1=>S71, c=>Cin, s=>S7);
se5 : Selector_2_1 port map (s0=>C0, s1=>C1, c=>Cin, s=>C);

end Behavioral;

