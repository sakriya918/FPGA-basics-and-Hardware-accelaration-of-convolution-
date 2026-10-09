library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipo is
    port( clk: in std_logic;
          reset: in std_logic;
          d: in std_logic_vector(3 downto 0);
          q: out std_logic_vector(3 downto 0)
          );
end pipo;

architecture Behavioral of pipo is

begin

process(clk, reset, d)
begin
if(reset = '1') then 
q <= "0000";
elsif(rising_edge(clk)) then
q(3 downto 0) <= d(3 downto 0);
end if;
end process;
end Behavioral;
