library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- design of four bit adder

entity four_bitadder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           --Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end four_bitadder;

architecture Behavioral of four_bitadder is
signal C0, C1, C2: std_logic;
component fulladder is port(
A : in std_logic;
B : in std_logic;
Cin: in std_logic;
Sum: out std_logic;
Cout: out std_logic);
end component;

begin
FA0: fulladder port map(
A => A(0),
B => B(0),
Cin => '0',
Sum => Sum(0),
Cout => C0 );

FA1: fulladder port map(
A => A(1),
B => B(1),
Cin => C0,
Sum => Sum(1),
Cout => C1 );

FA2: fulladder port map(
A => A(2),
B => B(2),
Cin => C1,
Sum => Sum(2),
Cout => C2 );

FA3: fulladder port map(
A => A(3),
B => B(3),
Cin => C2,
Sum => Sum(3),
Cout => Cout );
end Behavioral;
