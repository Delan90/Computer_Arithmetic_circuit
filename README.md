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
