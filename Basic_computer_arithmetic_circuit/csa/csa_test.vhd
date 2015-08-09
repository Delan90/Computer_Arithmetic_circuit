--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:27:28 11/12/2014
-- Design Name:   
-- Module Name:   /afs/tu-berlin.de/home/h/hespercao90/irb-ubuntu/CA_Projects/CSA/csa_test.vhd
-- Project Name:  CSA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ConditionSumAdder
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
 
ENTITY csa_test IS
END csa_test;
 
ARCHITECTURE behavior OF csa_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ConditionSumAdder
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         s : OUT  std_logic_vector(7 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic_vector(7 downto 0);
   signal c : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ConditionSumAdder PORT MAP (
          a => a,
          b => b,
          s => s,
          c => c
        );

   -- Clock process definition

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
              a<= "00000001";
              b<= "00000010";
      wait for 200 ns;	
              a<= "11100000";
              b<= "00011111";
      wait for 300 ns;	
              a<= "11111111";
              b<= "00000001";
      wait for 400 ns;	
              a<= "10101010";
              b<= "00010010";
      wait;

      -- insert stimulus here 

      wait;
   end process;

END;
