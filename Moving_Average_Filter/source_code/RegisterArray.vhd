----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:12:04 11/26/2014 
-- Design Name: 
-- Module Name:    RegisterArray - Behavioral 
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

entity RegisterArray is
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
end RegisterArray;

architecture Behavioral of RegisterArray is

component Reg11b is
Port ( d : in  STD_LOGIC_VECTOR (10 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (10 downto 0));
end component;

signal sig0 : STD_LOGIC_VECTOR (10 downto 0);
signal sig1 : STD_LOGIC_VECTOR (10 downto 0);
signal sig2 : STD_LOGIC_VECTOR (10 downto 0);
signal sig3 : STD_LOGIC_VECTOR (10 downto 0);
signal sig4 : STD_LOGIC_VECTOR (10 downto 0);
signal sig5 : STD_LOGIC_VECTOR (10 downto 0);
signal sig6 : STD_LOGIC_VECTOR (10 downto 0);
signal sig7 : STD_LOGIC_VECTOR (10 downto 0);
signal sig8 : STD_LOGIC_VECTOR (10 downto 0);
signal sig9 : STD_LOGIC_VECTOR (10 downto 0);
signal sig10 : STD_LOGIC_VECTOR (10 downto 0);
signal sig11 : STD_LOGIC_VECTOR (10 downto 0);
signal sig12 : STD_LOGIC_VECTOR (10 downto 0);
signal sig13 : STD_LOGIC_VECTOR (10 downto 0);
signal sig14 : STD_LOGIC_VECTOR (10 downto 0);

begin

r1: Reg11b port map (clk=> clk, rst=> rst, d => Input, q=>sig0);
r2: Reg11b port map (clk=> clk, rst=> rst, d => sig0, q=>sig1);
r3: Reg11b port map (clk=> clk, rst=> rst, d => sig1, q=>sig2);
r4: Reg11b port map (clk=> clk, rst=> rst, d => sig2, q=>sig3);
r5: Reg11b port map (clk=> clk, rst=> rst, d => sig3, q=>sig4);
r6: Reg11b port map (clk=> clk, rst=> rst, d => sig4, q=>sig5);
r7: Reg11b port map (clk=> clk, rst=> rst, d => sig5, q=>sig6);
r8: Reg11b port map (clk=> clk, rst=> rst, d => sig6, q=>sig7);
r9: Reg11b port map (clk=> clk, rst=> rst, d => sig7, q=>sig8);
r10: Reg11b port map (clk=> clk, rst=> rst, d => sig8, q=>sig9);
r11: Reg11b port map (clk=> clk, rst=> rst, d => sig9, q=>sig10);
r12: Reg11b port map (clk=> clk, rst=> rst, d => sig10, q=>sig11);
r13: Reg11b port map (clk=> clk, rst=> rst, d => sig11, q=>sig12);
r14: Reg11b port map (clk=> clk, rst=> rst, d => sig12, q=>sig13);
r15: Reg11b port map (clk=> clk, rst=> rst, d => sig13, q=>sig14);
r16: Reg11b port map (clk=> clk, rst=> rst, d => sig14, q=>S15);

S0 <= sig0;
S1 <= sig1;
S2 <= sig2;
S3 <= sig3;
S4 <= sig4;
S5 <= sig5;
S6 <= sig6;
S7 <= sig7;
S8 <= sig8;
S9 <= sig9;
S10 <= sig10;
S11 <= sig11;
S12 <= sig12;
S13 <= sig13;
S14 <= sig14;


end Behavioral;

