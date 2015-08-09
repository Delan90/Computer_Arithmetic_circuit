----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:27:34 12/03/2014 
-- Design Name: 
-- Module Name:    movingaverage - Behavioral 
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

entity movingaverage is
    Port ( sin : in  STD_LOGIC_VECTOR ( 10 downto 0);
           clk : in  STD_LOGIC;
           sout : out  STD_LOGIC_VECTOR ( 10 downto 0);
           rst : in  STD_LOGIC);
end movingaverage;

architecture Behavioral of movingaverage is

component RegisterArray is
    Port ( Input : in  STD_LOGIC_VECTOR (10 downto 0);
			  clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  S0 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S1 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S2 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S3 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S4 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S5 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S6 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S7 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S8 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S9 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S10 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S11 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S12 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S13 : out  STD_LOGIC_VECTOR (10 downto 0);
			  S14 : out  STD_LOGIC_VECTOR (10 downto 0);
           S15 : out  STD_LOGIC_VECTOR (10 downto 0));
end component;

component CarrySaveAdder16b is
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
end component;


signal sig0 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig1 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig2 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig3 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig4 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig5 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig6 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig7 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig8 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig9 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig10 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig11 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig12 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig13 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig14 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig15 : STD_LOGIC_VECTOR ( 10 downto 0 );
signal sig16 : STD_LOGIC_VECTOR ( 14 downto 0 );


begin

regist : RegisterArray port map( input => sin, clk => clk, rst => rst, S0 => sig0,S1 => sig1,S2 => sig2,S3 => sig3,S4 => sig4,S5 => sig5,S6 => sig6,S7 => sig7,S8 => sig8,S9 => sig9,S10 => sig10,S11 => sig11,S12 => sig12,S13 => sig13,S14 => sig14,S15 => sig15);

cla : CarrySaveAdder16b port map( I0 => sig0,I1 => sig1,I2 => sig2,I3 => sig3,I4 => sig4,I5 => sig5,I6 => sig6,I7 => sig7,I8 => sig8,I9 => sig9,I10 => sig10,I11 => sig11,I12 => sig12,I13 => sig13,I14 => sig14,I15 => sig15, F => sig16);

sout <= sig16(14 downto 4);

end Behavioral;

