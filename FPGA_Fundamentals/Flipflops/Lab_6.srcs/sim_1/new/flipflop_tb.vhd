library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflop_tb is
  
end flipflop_tb;

architecture Behavioral of flipflop_tb is
component t_flipflop is   
Port ( T : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Qf : out STD_LOGIC);
end component;  
signal T : STD_LOGIC;
signal clk : STD_LOGIC := '0';
signal reset : STD_LOGIC;
signal Qf : STD_LOGIC;
begin
dut: t_flipflop port map(T=>T, clk=>clk,reset=>reset,Qf=>Qf);
process 
begin
clk<= not clk;
wait for 10 ns;
end process;
process
begin
T<='0';
wait for 10ns;
T<='1';
reset<='1';
wait for 10ns;
reset<='0';
wait for 10ns;
T<='0';
wait;
end process;
end Behavioral;
