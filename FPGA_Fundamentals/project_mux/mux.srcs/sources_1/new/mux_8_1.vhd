--mux 8_1
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_8_1 is
    Port ( i : in STD_LOGIC_VECTOR (7 downto 0);
           s : in STD_LOGIC_VECTOR (2 downto 0);
           o : out STD_LOGIC);
end mux_8_1;

architecture Behavioral of mux_8_1 is
begin

    process(s, i)
    begin
        if (s = "000") then
            o <= i(0);
        elsif (s = "001") then
            o <= i(1);
        elsif (s = "010") then
            o <= i(2);
        elsif(s = "011") then
            o <= i(3);
        elsif (s = "100") then
            o <= i(4);
        elsif (s = "101") then
            o <= i(5);
        elsif (s = "110") then
            o <= i(6);
        elsif(s = "111") then
            o <= i(7);
        else
            o <= '0';
        end if;
    end process;

end Behavioral;
