----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2025 06:42:37 PM
-- Design Name: 
-- Module Name: practice1_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity practice1_tb is
    --Port ();
end practice1_tb;

architecture Behavioral of practice1_tb is
component practice1 is
port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           z : in STD_LOGIC;
           s : out STD_LOGIC;
           c : out STD_LOGIC);
end component;

signal x : STD_LOGIC;
signal y : STD_LOGIC;
signal z : STD_LOGIC;
signal s : STD_LOGIC;
signal c : STD_LOGIC;

begin
dut: practice1 port map(x => x,
                        y => y,
                        z => z,
                        s => s,
                        c => c);
process 
begin
x <= '0';
y <= '0';
z <= '0';
wait for 10 ns;

x <= '0';
y <= '1';
z <= '0';
wait for 10 ns;

x <= '1';
y <= '0';
z <= '1';
wait for 10 ns;

x <= '1';
y <= '1';
z <= '1';
wait for 10 ns;
wait;

end process;
end Behavioral;
