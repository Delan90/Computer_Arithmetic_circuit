----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:40:13 01/28/2015 
-- Design Name: 
-- Module Name:    NormRound - Behavioral 
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

entity NormRound is
    Port ( resmult : in  STD_LOGIC_VECTOR (31 downto 0);
           c : out  STD_LOGIC;
           r : out  STD_LOGIC_VECTOR (14 downto 0));
end NormRound;

architecture Behavioral of NormRound is

begin

process (resmult)
begin
if (resmult(29)='1') then
r<=resmult(29 downto 15);
c<='1';
else
r<=resmult(28 downto 14);
c<='0';
end if;
end process;

end Behavioral;

