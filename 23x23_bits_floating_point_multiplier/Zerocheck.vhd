----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:31:54 01/28/2015 
-- Design Name: 
-- Module Name:    Zerocheck - Behavioral 
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

entity Zerocheck is
    Port ( A : in  STD_LOGIC_VECTOR (22 downto 0);
           B : in  STD_LOGIC_VECTOR (22 downto 0);
			  resP : in STD_LOGIC_VECTOR (22 downto 0); 
			  P : out STD_LOGIC_VECTOR (22 downto 0);
			  flag : out STD_LOGIC);
end Zerocheck;

architecture Behavioral of Zerocheck is

begin

process(A,B,resP)
begin
if (A="00000000000000000000000" or B="00000000000000000000000") then
	P<="00000000000000000000000";
	flag<='1';
else
	P<=resP;
	flag<='0';
end if;
end process;
end Behavioral;

