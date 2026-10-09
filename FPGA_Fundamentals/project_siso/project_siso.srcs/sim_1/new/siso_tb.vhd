library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity siso_tb is
    --Port ( );
end siso_tb;

architecture Behavioral of siso_tb is
component siso is
port( clk: in std_logic;
          reset: in std_logic;
          d: in std_logic;
          q: out std_logic
          );
end component;

signal clk: std_logic := '0';
signal reset: std_logic;
signal d: std_logic;
signal q: std_logic := '0' ;

begin
DUT: siso port map(
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
d <= '1';
wait for 10 ns;

reset <= '0';
d <= '0';
wait for 10 ns;

reset <= '0';
d <= '0';
wait for 10 ns;

reset <= '0';
d <= '1';
wait for 10 ns;

reset <= '0';
wait for 30 ns;


wait;
end process;

end Behavioral;
