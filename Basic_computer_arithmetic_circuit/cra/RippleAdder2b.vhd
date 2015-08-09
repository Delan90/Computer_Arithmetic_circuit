----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:19:05 10/29/2014 
-- Design Name: 
-- Module Name:    RippleAdder2b - Behavioral 
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

entity RippleAdder2b is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (1 downto 0);
           co : out  STD_LOGIC);
end RippleAdder2b;

architecture Behavioral of RippleAdder2b is


component FullAdder is
	 Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC;
           co : out  STD_LOGIC);
end component;

signal ci : std_logic;

begin

u1 : FullAdder port map (a=>a(0), b=>b(0), c=>c, s=>s(0),co=>ci);
u2 : FullAdder port map (a=>a(1), b=>b(1), c=>ci, s=>s(1),co=>co);


end Behavioral;

