----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2024 02:46:04 PM
-- Design Name: 
-- Module Name: d_flipflop - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity d_flipflop is
    Port ( 
    D : in STD_LOGIC;
    clk: in STD_LOGIC;
    reset: in STD_LOGIC;
    Qf: out STD_LOGIC
    );
    
end d_flipflop;

architecture Behavioral of d_flipflop is

begin
process(D,clk,reset)
variable temp: std_logic :='0';
begin
if (reset='1')then 
temp:='0';
elsif(rising_edge(clk))then
temp := D;
end if;
Qf <= temp;
end process;

end Behavioral;
