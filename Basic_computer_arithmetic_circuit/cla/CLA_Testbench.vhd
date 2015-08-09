--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:30:57 11/12/2014
-- Design Name:   
-- Module Name:   C:/Users/Xavier/Documents/Berlin/TUB/CA/CarryLookAhead/CLA_Testbench.vhd
-- Project Name:  CarryLookAhead
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CLAAdder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CLA_Testbench IS
END CLA_Testbench;
 
ARCHITECTURE behavior OF CLA_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CLAAdder
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Cin : IN  std_logic;
         S : OUT  std_logic_vector(7 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(7 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CLAAdder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			Cin<='0';
			A<="00011010";
			B<="11100101";
		wait for 100 ns;	
			Cin<='0';
			A<="00011010";
			B<="11111111";
		wait for 100 ns;	
			Cin<='0';
			A<="00000001";
			B<="11111110";
		wait for 100 ns;	
			Cin<='1';
			A<="00000001";
			B<="11111110";
      wait;
   end process;

END;
