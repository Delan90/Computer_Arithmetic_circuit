--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:03 10/29/2014
-- Design Name:   
-- Module Name:   /afs/tu-berlin.de/home/h/hespercao90/irb-ubuntu/CA_Projects/Assignement1/CRA/RA8Test.vhd
-- Project Name:  CRA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAdder8b
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
 
ENTITY RA8Test IS
END RA8Test;
 
ARCHITECTURE behavior OF RA8Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAdder8b
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         c : IN  std_logic;
         co : OUT  std_logic;
         s : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal c : std_logic := '0';

 	--Outputs
   signal co : std_logic;
   signal s : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAdder8b PORT MAP (
          a => a,
          b => b,
          c => c,
          co => co,
          s => s
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
			c<='0';
			a<="00000001";
			b<="00000010";
		wait for 100 ns;
			c<='1';
			a<="01110000";
			b<="00010010";
		wait for 100 ns;
			c<='1';
			a<="11110000";
			b<="00010010";

      wait;
   end process;

END;
