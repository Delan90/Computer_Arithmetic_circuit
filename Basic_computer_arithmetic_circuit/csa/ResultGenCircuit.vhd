----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:43:06 11/05/2014 
-- Design Name: 
-- Module Name:    ResultGenCircuit - Behavioral 
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

entity ResultGenCircuit is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c0 : out  STD_LOGIC;
           c1 : out  STD_LOGIC;
           s0 : out  STD_LOGIC;
           s1 : out  STD_LOGIC);
end ResultGenCircuit;

architecture Behavioral of ResultGenCircuit is

begin
     s0 <= a xor b;
	  s1 <= a xnor b;
	  c0 <= a and b;
	  c1<= a or b;

end Behavioral;

