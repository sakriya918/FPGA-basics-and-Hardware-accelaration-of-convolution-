library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- design of full adder

entity fulladder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end fulladder;

architecture Behavioral of fulladder is

begin
Sum <= A xor B xor Cin;
Cout<= (A and B) or (B and Cin) or (Cin and A);
end Behavioral;
