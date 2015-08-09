----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:49:21 11/05/2014 
-- Design Name: 
-- Module Name:    Selector_2_1 - Behavioral 
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

entity Selector_2_1 is
    Port ( s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC);
end Selector_2_1;

architecture Behavioral of Selector_2_1 is

begin

     s <= ((not c) and (not s1) and s0) or ((not c) and s1 and s0) or (c and s1 and (not s0)) or (c and s1 and s0);

end Behavioral;

