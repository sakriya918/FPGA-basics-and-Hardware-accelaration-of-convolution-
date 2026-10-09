library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sipo is
    port( clk: in std_logic;
          reset: in std_logic;
          d: in std_logic;
          q: out std_logic_vector(3 downto 0)
          );
end sipo;

architecture Behavioral of sipo is
signal temp: std_logic_vector(3 downto 0);
begin

process(clk, reset, d)
begin
if(reset = '1') then 
q <= "0000";
elsif(rising_edge(clk)) then
temp(3) <= d;
temp(2 downto 0) <= temp(3 downto 1);
end if;

q(3 downto 0) <= temp(3 downto 0);
end process;
end Behavioral;
