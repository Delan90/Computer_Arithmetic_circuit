# Computer_Arithmetic_circuit

Several Computer Arithmetic circuits design by [VHDL](https://en.wikipedia.org/wiki/VHDL) in [Xilinx ISE](https://en.wikipedia.org/wiki/Xilinx_ISE),this work can be seen as a simple tutorial for the VHDL.

##[Basic computer arithmetic circuit](https://github.com/Delan90/Computer_Arithmetic_circuit/tree/master/Basic_computer_arithmetic_circuit)

###Carry Ripple Adder

Get start the ISE:

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

