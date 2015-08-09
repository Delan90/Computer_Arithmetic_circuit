----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:08:50 01/28/2015 
-- Design Name: 
-- Module Name:    Unpack - Behavioral 
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

entity Unpack is
    Port ( A : in  STD_LOGIC_VECTOR (22 downto 0);
           B : in  STD_LOGIC_VECTOR (22 downto 0);
           signA : out  STD_LOGIC;
           signB : out  STD_LOGIC;
           ExponentA : out  STD_LOGIC_VECTOR (7 downto 0);
           ExponentB : out  STD_LOGIC_VECTOR (7 downto 0);
           SignificandA : out  STD_LOGIC_VECTOR (15 downto 0);
           SignificandB : out  STD_LOGIC_VECTOR (15 downto 0));
end Unpack;

architecture Behavioral of Unpack is

begin

signA <= A(22);
signB <= B(22);
ExponentA <= A(21 downto 14);
ExponentB <= B(21 downto 14);
SignificandA <= "01" & A(13 downto 0);
SignificandB <= "01" & B(13 downto 0);

end Behavioral;

