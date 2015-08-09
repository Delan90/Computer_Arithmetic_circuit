--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:09:02 02/04/2015
-- Design Name:   
-- Module Name:   C:/Users/Xavier/Documents/Berlin/TUB/CA/LabAssignment4/testbench.vhd
-- Project Name:  LabAssignment4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FloatingPointMultiplier
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
 
ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FloatingPointMultiplier
    PORT(
         A : IN  std_logic_vector(22 downto 0);
         B : IN  std_logic_vector(22 downto 0);
         P : OUT  std_logic_vector(22 downto 0);
         zeroflag : OUT  std_logic;
         OFflag : OUT  std_logic;
         UFflag : OUT  std_logic;
			Signflag : out STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(22 downto 0) := (others => '0');
   signal B : std_logic_vector(22 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(22 downto 0);
   signal zeroflag : std_logic;
   signal OFflag : std_logic;
   signal UFflag : std_logic;
	signal Signflag : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FloatingPointMultiplier PORT MAP (
          A => A,
          B => B,
          P => P,
          zeroflag => zeroflag,
          OFflag => OFflag,
          UFflag => UFflag,
			 Signflag => Signflag
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		A<="01000000110111110000000";
		B<="00111110101011110000000";
     
	   wait for 100 ns;
	   A<="01111111110111110000000";
		B<="01111110101011110000000";
		
	   wait for 100 ns;
	   A<="00000000000000000000001";
		B<="10000000000000000000001";		
	  
	   wait for 100 ns;
	   A<="01111111110111110000000";
		B<="00000000000000000000000";
		
      wait;
   end process;

END;
