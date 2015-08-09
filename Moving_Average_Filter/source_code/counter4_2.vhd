----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:14:53 11/26/2014 
-- Design Name: 
-- Module Name:    counter4_2 - Behavioral 
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

entity counter4_2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           tin : in  STD_LOGIC;
           tout : out  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end counter4_2;

architecture Behavioral of counter4_2 is

component FullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC;
           co : out  STD_LOGIC);
end component;

signal sig : std_logic;

begin

s1 : FullAdder port map (c=>A,a=>B,b=>C,s=>sig,co=>tout);
s2 : FullAdder port map (c=>tin,a=>sig,b=>D,s=>S,co=>Cout);

end Behavioral;

