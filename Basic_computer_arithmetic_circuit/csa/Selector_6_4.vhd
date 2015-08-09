----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:31:09 11/05/2014 
-- Design Name: 
-- Module Name:    Selector_6_4 - Behavioral 
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

entity Selector_6_4 is
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
end Selector_6_4;

architecture Behavioral of Selector_6_4 is

component Selector_2_1 is
	Port ( s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC);
end component;

begin

se1 : Selector_2_1 port map (s0=>S0, s1=>S1, c=>Cin0, s=>Sout0);
se2 : Selector_2_1 port map (s0=>C0, s1=>C1, c=>Cin0, s=>Cout0);
se3 : Selector_2_1 port map (s0=>S0, s1=>S1, c=>Cin1, s=>Sout1);
se4 : Selector_2_1 port map (s0=>C0, s1=>C1, c=>Cin1, s=>Cout1);

end Behavioral;

