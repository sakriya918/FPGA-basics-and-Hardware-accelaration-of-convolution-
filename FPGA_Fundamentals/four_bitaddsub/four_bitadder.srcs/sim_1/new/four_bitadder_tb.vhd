
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bitadder_tb is
--  Port ( );
end four_bitadder_tb;

architecture Behavioral of four_bitadder_tb is
component four_bitadder is port(
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           --Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end component;
signal   A : STD_LOGIC_VECTOR (3 downto 0);
signal   B : STD_LOGIC_VECTOR (3 downto 0);
signal  Sum : std_logic_vector (3 downto 0);
signal   Cout : std_logic;
         
begin
DUT: four_bitadder port map(
A => A,
B => B,
Sum => Sum,
Cout => Cout);

process 
begin
A <= "0111";
B <= "1000";
wait;
A <= "0111";
B <= "1001";
end process;

end Behavioral;
