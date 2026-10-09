--mux 4_1
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4_1 is
    Port ( i : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           o : out STD_LOGIC);
end mux_4_1;

architecture Behavioral of mux_4_1 is
begin

    process(s, i)
    begin
        if (s = "00") then
            o <= i(0);
        elsif (s = "01") then
            o <= i(1);
        elsif (s = "10") then
            o <= i(2);
        elsif(s = "11") then
            o <= i(3);
        else
            o <= '0';
        end if;
    end process;

end Behavioral;
