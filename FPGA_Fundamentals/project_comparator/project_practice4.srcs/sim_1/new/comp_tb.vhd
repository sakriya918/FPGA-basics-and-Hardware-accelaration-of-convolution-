library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_tb is
    --Port ( a : in STD_LOGIC);
end comp_tb;

architecture Behavioral of comp_tb is
component comp is 
Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           agb : out STD_LOGIC;
           alb : out STD_LOGIC;
           aeb : out STD_LOGIC);
end component;

signal a : STD_LOGIC_VECTOR (3 downto 0);
signal b : STD_LOGIC_VECTOR (3 downto 0);
signal agb : STD_LOGIC;
signal alb : STD_LOGIC;
signal aeb : STD_LOGIC;

begin
dut: comp port map(a => a,
                   b => b,
                   agb => agb,
                   alb => alb,
                   aeb => aeb);
process
begin

a <= "0000";
b <= "1111";
wait for 10 ns;

a <= "1111";
b <= "1111";
wait for 10 ns;

a <= "1111";
b <= "0000";
wait for 10 ns;
wait;

end process;

end Behavioral;
