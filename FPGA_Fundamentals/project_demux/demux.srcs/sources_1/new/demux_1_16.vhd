library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1_16 is
    Port ( i : in STD_LOGIC;
           s : in STD_LOGIC_VECTOR (3 downto 0);
           o : out STD_LOGIC_VECTOR (15 downto 0));
end demux_1_16;

architecture Behavioral of demux_1_16 is
begin

    process(s, i)
    begin
        o <= "0000000000000000";
        case s is
            when "0000" => o(0) <= i;
            when "0001" => o(1) <= i;
            when "0010" => o(2) <= i;
            when "0011" => o(3) <= i;
            when "0100" => o(4) <= i;
            when "0101" => o(5) <= i;
            when "0110" => o(6) <= i;
            when "0111" => o(7) <= i;
            when "1000" => o(8) <= i;
            when "1001" => o(9) <= i;
            when "1010" => o(10) <= i;
            when "1011" => o(11) <= i;
            when "1100" => o(12) <= i;
            when "1101" => o(13) <= i;
            when "1110" => o(14) <= i;
            when "1111" => o(15) <= i;
            when others => o <= "0000000000000000";
        end case;
    end process;

end Behavioral;
