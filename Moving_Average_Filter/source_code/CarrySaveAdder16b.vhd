----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:19 11/26/2014 
-- Design Name: 
-- Module Name:    CarrySaveAdder16b - Behavioral 
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

entity CarrySaveAdder16b is
    Port ( I0 : in  STD_LOGIC_VECTOR (10 downto 0);
			  I1 : in  STD_LOGIC_VECTOR (10 downto 0);
           I2 : in  STD_LOGIC_VECTOR (10 downto 0);
           I3 : in  STD_LOGIC_VECTOR (10 downto 0);
           I4 : in  STD_LOGIC_VECTOR (10 downto 0);
           I5 : in  STD_LOGIC_VECTOR (10 downto 0);
           I6 : in  STD_LOGIC_VECTOR (10 downto 0);
           I7 : in  STD_LOGIC_VECTOR (10 downto 0);
           I8 : in  STD_LOGIC_VECTOR (10 downto 0);
           I9 : in  STD_LOGIC_VECTOR (10 downto 0);
           I10 : in  STD_LOGIC_VECTOR (10 downto 0);
           I11 : in  STD_LOGIC_VECTOR (10 downto 0);
           I12 : in  STD_LOGIC_VECTOR (10 downto 0);
           I13 : in  STD_LOGIC_VECTOR (10 downto 0);
           I14 : in  STD_LOGIC_VECTOR (10 downto 0);
           I15 : in  STD_LOGIC_VECTOR (10 downto 0);
           F : out  STD_LOGIC_VECTOR (14 downto 0));
end CarrySaveAdder16b;

architecture Behavioral of CarrySaveAdder16b is

component CSANEW15_15 is
    Port ( a : in  STD_LOGIC_VECTOR(14 downto 0);
           b : in  STD_LOGIC_VECTOR(14 downto 0);
           c : in  STD_LOGIC_VECTOR(14 downto 0);
           d : in  STD_LOGIC_VECTOR(14 downto 0);
			  --min : in STD_LOGIC;
           Cout : out  STD_LOGIC_VECTOR(14 downto 0);
           s : out  STD_LOGIC_VECTOR(14 downto 0) );
			  --mout : out STD_LOGIC
end component;

component csa11_15 is
    Port ( a : in  STD_LOGIC_VECTOR(10 downto 0);
           b : in  STD_LOGIC_VECTOR(10 downto 0);
           c : in  STD_LOGIC_VECTOR(10 downto 0);
           d : in  STD_LOGIC_VECTOR(10 downto 0);
			  --min : in STD_LOGIC;
           Cout : out  STD_LOGIC_VECTOR(14 downto 0);
           s : out  STD_LOGIC_VECTOR(14 downto 0) );
			  --mout : out STD_LOGIC
end component;

component CLAAdder is
    Port ( s : in STD_LOGIC_VECTOR( 14 downto 0);
	        c : in STD_LOGIC_VECTOR( 14 downto 0);
			  Cin : in STD_LOGIC;
           f : out STD_LOGIC_VECTOR( 14 downto 0);
			  Cout : out STD_LOGIC);
end component;

signal sig0 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig1 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig2 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig3 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig4 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig5 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig6 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig7 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig8 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig9 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig10 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig11 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig12 : STD_LOGIC_VECTOR ( 14 downto 0 );
signal sig13 : STD_LOGIC_VECTOR ( 14 downto 0 );

begin

cou1 : csa11_15 port map (a => I0, b => I1, c => I2, d => I3, Cout => sig0 , s => sig1);
cou2 : csa11_15 port map (a => I4, b => I5, c => I6, d => I7, Cout => sig2 , s => sig3); 
cou3 : csa11_15 port map (a => I8, b => I9, c => I10, d => I11, Cout => sig4 , s => sig5);
cou4 : csa11_15 port map (a => I12, b => I13, c => I14, d => I15, Cout => sig6 , s => sig7);

cou5 : CSANEW15_15 port map (a => sig1, b => sig0, c => sig3, d => sig2, Cout => sig8 , s => sig9);
cou6 : CSANEW15_15 port map (a => sig5, b => sig4, c => sig7, d => sig6, Cout => sig10 , s => sig11);
cou7 : CSANEW15_15 port map (a => sig9, b => sig8, c => sig11, d => sig10, Cout => sig12 , s => sig13);

add : CLAAdder port map (s => sig13, c => sig12, f=>F, Cin => '0');

end Behavioral;

