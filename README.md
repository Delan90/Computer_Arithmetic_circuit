# Computer_Arithmetic_circuit

Several Computer Arithmetic circuits design by [VHDL](https://en.wikipedia.org/wiki/VHDL) in [Xilinx ISE](https://en.wikipedia.org/wiki/Xilinx_ISE),this wiki will give a guide how to build circuit by VHDL in Xilinx ISE.

##[Basic computer arithmetic circuit](https://github.com/Delan90/Computer_Arithmetic_circuit/tree/master/Basic_computer_arithmetic_circuit)

###[Carry Ripple Adder](https://github.com/Delan90/Computer_Arithmetic_circuit/tree/master/Basic_computer_arithmetic_circuit/cra)

Step 1:Get start the ISE:

- Create a new project for Spartan3E XC3S500E-FG320-5 as shown as bellow;

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/pic1.png)

- Add a new VHDL Module to the project for the full adder. The code is shown as bellow;

        library IEEE;
        use IEEE.STD_LOGIC_1164.ALL;
        entity FullAdder is
          Port ( a : in STD_LOGIC;
          b : in STD_LOGIC;
          c : in STD_LOGIC;
          s : out STD_LOGIC;
          co : out STD_LOGIC);
        end FullAdder;
        architecture Behavioral of FullAdder is
          begin
          s <= a xor b xor c;
          co <= (a and b) or ((a xor b) and c);
        end Behavioral;

- Use this module to build the ripple adder. Create another VHDL file and (Adder8bit for example) and use instances of the FullAdder module to build. Sample code for 2-bits ripple adder is shown as bellow:

        library IEEE;
        use IEEE.STD_LOGIC_1164.ALL;
        entity Adder2Bits is
            Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
                b : in STD_LOGIC_VECTOR (1 downto 0);
                c : in STD_LOGIC;
                s : out STD_LOGIC_VECTOR (1 downto 0);
                co : out STD_LOGIC);
            end Adder2Bits;
        architecture Behavioral of Adder2Bits is
        
        component FullAdder is
                Port ( a : in STD_LOGIC;
                b : in STD_LOGIC;
                c : in STD_LOGIC;
                s : out STD_LOGIC;
                co : out STD_LOGIC);
        end component;

        signal ci : std_logic;
        begin
        
        u1 : FullAdder port map (a=>a(0),b=>b(0),c=>c,s=>s(0),co=>ci);
        u2 : FullAdder port map (a=>a(1),b=>b(1),c=>ci,s=>s(1),co=>co);
        
        end Behavioral;

This code shows you how to use modular design approach to build large circuits. Expand this circuit to build 8-bit ripple adder as shown as bellow:

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/pic2.png)

Step 2:Simulate the Ripple Adder:

- Create a VHDL test-bench for your adder. **Right click in you project window-> Select AddSource-> Select VHDL test-bench.**
- Modify the test bench code to look like :

        LIBRARY ieee;
        USE ieee.std_logic_1164.ALL;

        ENTITY Adder2Bits_tb IS
        END Adder2Bits_tb;
        ARCHITECTURE behavior OF Adder2Bits_tb IS
            COMPONENT Adder2Bits
            PORT(
                a : IN std_logic_vector(1 downto 0);
                b : IN std_logic_vector(1 downto 0);
                c : IN std_logic;
                s : OUT std_logic_vector(1 downto 0);
                co : OUT std_logic
             );
            END COMPONENT;

        signal a : std_logic_vector(1 downto 0) := (others => '0');
        signal b : std_logic_vector(1 downto 0) := (others => '0');
        signal c : std_logic := '0';
        signal s : std_logic_vector(1 downto 0);
        signal co : std_logic;
        
        BEGIN
            uut: Adder2Bits PORT MAP (
             a => a, b => b, c => c,
            s => s, co => co
            );
        stim_proc: process
         begin
            wait for 100 ns;
                c <= '0';
                a <="01";
                b <="10";
             wait for 10us;
                c <= '1';
                a <="11";
                b <="11";
            wait;
        end process;
        END;

- The test-bench code allows you to control the simulation process. In the project window select **“Simulation”** then select the test-bench module. Of course you need to modify the test-bench code to match you design.

-  In the process window click **“Behavioral Simulation”** which will start the simulation and run all the steps in the test-bench simulation process as shown as bellow:

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/pic3.png)

Step 3: Synthesis The Ripple Adder:

- Switch back to **“Implementation”** view and click **“Synthesis”** in the process view and then click **“Implement Design”**.

- When the synthesis complete, check the **“Design Summary”** and record the number of LUT required to build the 8-bit ripple adder.

- In the **“Design Summary”** look at the static timing option and find the critical path delay.

- Then we can the table as bellow:

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/pic4.png)

Step 4: Post-Route simulation

Repeat item 4 of step 1, after selecting **“Post-Route”** in the simulation window. “Post-Route” simulation takes into account all timing parameters of each component into account during the simulation. This gives you the close to real behavior of the circuit when deployed to the FPGA. 

The simulation result are shown as bellow:

Behavioral simulation:

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/pic5.png)

Timing simulation:

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/pic6.png)

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/pic7.png)

By zooming in the timing simulation, we can see the delay in the generation of the result, here approximatively 6 ns. This delay doesn’t reach the critical delay because it’s caused by a modification of “a”, and the critical path is between “c” and “co”. In the test simulation of the carry Lookahead (see below), we used a test bench designed to get the critical path.


###[Conditional Sum Adder](https://github.com/Delan90/Computer_Arithmetic_circuit/tree/master/Basic_computer_arithmetic_circuit/csa)

Repeat the same steps of Part1 for the conditional sum adder. Build an 8 bit version of the adder and simulate it and show the simulation result.  A block diagram of the circuit is shown as bellow. Use the same modular approach in Part 1 to build this architecture.

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/pic8.png)

Results for the Conditional Sum Adder:

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/simulation2%263/csa1.png)

Behavioral Simulation:

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/simulation2%263/csa2.png)

Timing Simulation:

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/simulation2%263/csa3.png)
![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/simulation2%263/csa4.png)

Just like before, we can see a delay in the generation of the result. We can also remark that the value of the vector “s” evolves during this delay, and is not generated at once.

###[Carry-Lookahead Adder](https://github.com/Delan90/Computer_Arithmetic_circuit/tree/master/Basic_computer_arithmetic_circuit/cla)

Repeat the same steps of Part1 for the carry-lookahead adder. Build an 8 bit version of the adder and simulate it. After simulation implement the design and show the simulation results. Use the same modular approach in Part 1 to build this architecture. For the carry lookadder with larger number of input, the design will be large. Try to use logic reuse. 

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/pic9.png)

Results for the Conditional Sum Adder:

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/simulation2%263/cla1.png)

Behavioral Simulation:

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/simulation2%263/cla2.png)

Timing Simulation:

![MyUnicorn](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/pic/simulation2%263/cla3.png)

We can see this time that we have a delay of approximatively 12 ns, which corresponds to the critical path delay. Indeed, we obtained it by modifying the value of the incoming carry (“cin”) so that we also get a carry as an output. That’s in accord with the predictions of the ISE software.


##[Moving Average Filter](https://github.com/Delan90/Computer_Arithmetic_circuit/tree/master/Moving_Average_Filter)

[Requirment](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/Moving_Average_Filter/Document/Requirment_Tutorial.pdf) here.

[Report](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/Moving_Average_Filter/Document/Report.pdf) here.


##[Floating Point Multiplier](https://github.com/Delan90/Computer_Arithmetic_circuit/tree/master/23x23_bits_floating_point_multiplier)

[Requirment](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/23x23_bits_floating_point_multiplier/Document/Requirment.pdf) here.

[Report](https://github.com/Delan90/Computer_Arithmetic_circuit/blob/master/23x23_bits_floating_point_multiplier/Document/Report.pdf) here.

