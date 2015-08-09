----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:35:45 01/18/2015 
-- Design Name: 
-- Module Name:    Booth4Multiplier - Behavioral 
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

entity Booth4Multiplier is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           S : out  STD_LOGIC_VECTOR (31 downto 0));
end Booth4Multiplier;

architecture Behavioral of Booth4Multiplier is

component PartialProductGeneration is
Port ( a0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           a2 : in  STD_LOGIC;
			  b : in STD_LOGIC_VECTOR (15 downto 0);
			  S : out STD_LOGIC;
           pp : out  STD_LOGIC_VECTOR (16 downto 0));
end component;

component PartialProductReduction is
Port ( pp0 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp1 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp2 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp3 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp4 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp5 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp6 : in  STD_LOGIC_VECTOR (16 downto 0);
           pp7 : in  STD_LOGIC_VECTOR (16 downto 0);
			  T : in  STD_LOGIC_VECTOR (7 downto 0);
           P : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal sigT : STD_LOGIC_VECTOR(7 downto 0);
signal sigPP0 : STD_LOGIC_VECTOR (16 downto 0);
signal sigPP1 : STD_LOGIC_VECTOR (16 downto 0);
signal sigPP2 : STD_LOGIC_VECTOR (16 downto 0);
signal sigPP3 : STD_LOGIC_VECTOR (16 downto 0);
signal sigPP4 : STD_LOGIC_VECTOR (16 downto 0);
signal sigPP5 : STD_LOGIC_VECTOR (16 downto 0);
signal sigPP6 : STD_LOGIC_VECTOR (16 downto 0);
signal sigPP7 : STD_LOGIC_VECTOR (16 downto 0);


begin

-- Partial product generation
ppg1 : PartialProductGeneration port map (a0 => '0', a1 => A(0), a2 => A(1), b => B, S => sigT(0), pp => sigPP0);
ppg2 : PartialProductGeneration port map (a0 => A(1), a1 => A(2), a2 => A(3), b => B, S => sigT(1), pp => sigPP1);
ppg3 : PartialProductGeneration port map (a0 => A(3), a1 => A(4), a2 => A(5), b => B, S => sigT(2), pp => sigPP2);
ppg4 : PartialProductGeneration port map (a0 => A(5), a1 => A(6), a2 => A(7), b => B, S => sigT(3), pp => sigPP3);
ppg5 : PartialProductGeneration port map (a0 => A(7), a1 => A(8), a2 => A(9), b => B, S => sigT(4), pp => sigPP4);
ppg6 : PartialProductGeneration port map (a0 => A(9), a1 => A(10), a2 => A(11), b => B, S => sigT(5), pp => sigPP5);
ppg7 : PartialProductGeneration port map (a0 => A(11), a1 => A(12), a2 => A(13), b => B, S => sigT(6), pp => sigPP6);
ppg8 : PartialProductGeneration port map (a0 => A(13), a1 => A(14), a2 => A(15), b => B, S => sigT(7), pp => sigPP7);

-- connecting to Reduction
ppr : PartialProductReduction port map (pp0 => sigPP0, pp1 => sigPP1, pp2 => sigPP2, pp3 => sigPP3, pp4 => sigPP4, pp5 => sigPP5, pp6 => sigPP6, pp7 => sigPP7, T => sigT, P => S);


end Behavioral;

