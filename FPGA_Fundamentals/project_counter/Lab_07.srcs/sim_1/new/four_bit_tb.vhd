library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity four_bit_tb is
--  Port ( );
end four_bit_tb;

architecture Behavioral of four_bit_tb is
component four_bit_up is
port(
clk:in STD_logic;
reset: in std_logic;
load: in std_logic;
count: out std_logic_vector(3 downto 0));
end component;
signal clk: std_logic:='0';
signal reset: std_logic;
signal load: std_logic;
signal count: std_logic_vector(3 downto 0);
begin
dut: four_bit_up port map(clk=>clk, reset=>reset,load=>load, count=>count);
process 
begin
clk<= not clk;
wait for 10ns;
end process;
process
begin
reset<='0';
load<='0';
wait for 10ns;
reset<='0';
load<='1';
wait for 10ns;
reset<='0';
load<='1';
wait for 10ns;
end process;
end Behavioral;

