library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_1 is
    Port ( i : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC;
           o : out STD_LOGIC);
end mux_2_1;

architecture Behavioral of mux_2_1 is
begin

    process(s, i)
    begin
        if s = '0' then
            o <= i(0);
        elsif s = '1' then
            o <= i(1);
        else
            o <= '0';
        end if;
    end process;

end Behavioral;
