----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:36 01/28/2015 
-- Design Name: 
-- Module Name:    Pack - Behavioral 
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

entity Pack is
    Port ( signA : in  STD_LOGIC;
           signB : in  STD_LOGIC;
           resadd : in  STD_LOGIC_VECTOR (7 downto 0);
           resround : in  STD_LOGIC_VECTOR (14 downto 0);
           P : out  STD_LOGIC_VECTOR (22 downto 0));
end Pack;

architecture Behavioral of Pack is

signal sign : STD_LOGIC;
signal sigexpn: STD_LOGIC_VECTOR (7 downto 0);
signal sigsignif: STD_LOGIC_VECTOR (13 downto 0);

begin

sign <= signA xor signB;
sigexpn <= resadd(7 downto 0);
sigsignif <= resround(13 downto 0);

P <= sign & sigexpn & sigsignif;

end Behavioral;

