----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:22:39 11/05/2014 
-- Design Name: 
-- Module Name:    Selector_7_3 - Behavioral 
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

entity Selector_7_3 is
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
end Selector_7_3;

architecture Behavioral of Selector_7_3 is

component Selector_2_1 is
	Port ( s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC);
end component;

begin

se1 : Selector_2_1 port map (s0=>S20, s1=>S21, c=>Cin, s=>S2);
se2 : Selector_2_1 port map (s0=>S30, s1=>S31, c=>Cin, s=>S3);
se3 : Selector_2_1 port map (s0=>C0, s1=>C1, c=>Cin, s=>Cout);

end Behavioral;

