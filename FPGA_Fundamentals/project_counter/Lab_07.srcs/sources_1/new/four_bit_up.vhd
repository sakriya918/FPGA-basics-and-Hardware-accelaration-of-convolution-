
library IEEE;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;


entity four_bit_up is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0);
           load : in STD_LOGIC);
end four_bit_up;

architecture Behavioral of four_bit_up is

begin
process(clk,reset, load)
variable temp:std_logic_vector(3 downto 0):="0000";
begin
if (reset='1')then
temp:="0000";
elsif (rising_edge(clk))then
if (load ='1') then
temp:=temp+1;
end if;
end if;
count<= temp;
end process;
end Behavioral;
