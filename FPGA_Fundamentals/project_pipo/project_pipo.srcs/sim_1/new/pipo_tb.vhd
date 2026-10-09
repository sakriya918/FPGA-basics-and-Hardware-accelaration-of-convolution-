library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipo_tb is
    --Port ( );
end pipo_tb;

architecture Behavioral of pipo_tb is
component pipo is
port( clk: in std_logic;
          reset: in std_logic;
          d: in std_logic_vector(3 downto 0);
          q: out std_logic_vector(3 downto 0)
          );
end component;

signal clk: std_logic := '0';
signal reset: std_logic;
signal d: std_logic_vector(3 downto 0);
signal q: std_logic_vector(3 downto 0);

begin
DUT: pipo port map(
clk => clk,
reset => reset,
d => d,
q => q
);

clk_process: process
begin
clk <= not clk;
wait for 5 ns;
end process;

process
begin
reset <= '0';
d <= "1000";
wait for 10 ns;

reset <= '0';
d <= "0001";
wait for 10 ns;

reset <= '1';
d <= "1111";
wait;
end process;

end Behavioral;
