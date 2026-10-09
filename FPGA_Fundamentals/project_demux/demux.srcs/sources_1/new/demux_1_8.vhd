library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1_8 is
    Port ( i : in STD_LOGIC;
           s : in STD_LOGIC_VECTOR (2 downto 0);
           o : out STD_LOGIC_VECTOR (7 downto 0));
end demux_1_8;

architecture Behavioral of demux_1_8 is
begin

    process(s, i)
    begin
        o <= "00000000";
        case s is
            when "000" => o(0) <= i;
            when "001" => o(1) <= i;
            when "010" => o(2) <= i;
            when "011" => o(3) <= i;
            when "100" => o(4) <= i;
            when "101" => o(5) <= i;
            when "110" => o(6) <= i;
            when "111" => o(7) <= i;
            when others => o <= "00000000";
        end case;
    end process;

end Behavioral;
