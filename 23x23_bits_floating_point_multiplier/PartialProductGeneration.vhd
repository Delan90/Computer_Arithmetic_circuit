----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:31:46 01/07/2015 
-- Design Name: 
-- Module Name:    PartialProductGeneration - Behavioral 
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

entity PartialProductGeneration is
    Port ( a0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           a2 : in  STD_LOGIC;
			  b : in STD_LOGIC_VECTOR (15 downto 0);
			  S : out STD_LOGIC;
           pp : out  STD_LOGIC_VECTOR (16 downto 0));
end PartialProductGeneration;

architecture Behavioral of PartialProductGeneration is

signal Sel1 : STD_LOGIC;
signal Sel2 : STD_LOGIC;

begin

Sel1 <= a0 xor a1;
Sel2 <= (a0 and a1 and not a2 ) or (not a0 and not a1 and a2);
S <= a2; 

pp(0) <= a2 xor ( Sel1 and b(0));
pp(1) <= a2 xor ( (b(1) and Sel1) or (b(0) and Sel2) );
pp(2) <= a2 xor ( (b(2) and Sel1) or (b(1) and Sel2) );
pp(3) <= a2 xor ( (b(3) and Sel1) or (b(2) and Sel2) );
pp(4) <= a2 xor ( (b(4) and Sel1) or (b(3) and Sel2) );
pp(5) <= a2 xor ( (b(5) and Sel1) or (b(4) and Sel2) );
pp(6) <= a2 xor ( (b(6) and Sel1) or (b(5) and Sel2) );
pp(7) <= a2 xor ( (b(7) and Sel1) or (b(6) and Sel2) );
pp(8) <= a2 xor ( (b(8) and Sel1) or (b(7) and Sel2) );
pp(9) <= a2 xor ( (b(9) and Sel1) or (b(8) and Sel2) );
pp(10) <= a2 xor ( (b(10) and Sel1) or (b(9) and Sel2) );
pp(11) <= a2 xor ( (b(11) and Sel1) or (b(10) and Sel2) );
pp(12) <= a2 xor ( (b(12) and Sel1) or (b(11) and Sel2) );
pp(13) <= a2 xor ( (b(13) and Sel1) or (b(12) and Sel2) );
pp(14) <= a2 xor ( (b(14) and Sel1) or (b(13) and Sel2) );
pp(15) <= a2 xor ( (b(15) and Sel1) or (b(14) and Sel2) );
pp(16) <= a2 xor (b(15) and Sel2);

end Behavioral;

