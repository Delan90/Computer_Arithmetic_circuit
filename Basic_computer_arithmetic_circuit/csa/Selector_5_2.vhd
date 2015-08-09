----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:14:59 11/05/2014 
-- Design Name: 
-- Module Name:    Selector_5_2 - Behavioral 
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

entity Selector_5_2 is
    Port ( Cin : in  STD_LOGIC;
           S10 : in  STD_LOGIC;
           S11 : in  STD_LOGIC;
           C0 : in  STD_LOGIC;
           C1 : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S1 : out  STD_LOGIC);
end Selector_5_2;

architecture Behavioral of Selector_5_2 is

component Selector_2_1 is
	Port ( s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC);
end component;

begin

se1 : Selector_2_1 port map (s0=>S10, s1=>S11, c=>Cin, s=>S1);
se2 : Selector_2_1 port map (s0=>C0, s1=>C1, c=>Cin, s=>Cout);

end Behavioral;

