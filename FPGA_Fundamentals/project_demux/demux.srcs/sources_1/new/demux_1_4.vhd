library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1_4 is
    Port ( i : in STD_LOGIC;
           s : in STD_LOGIC_VECTOR (1 downto 0);
           o : out STD_LOGIC_VECTOR (3 downto 0));
end demux_1_4;

architecture Behavioral of demux_1_4 is
begin

    process(s, i)
    begin
        o <= "0000";
        case s is
            when "00" => o(0) <= i;
            when "01" => o(1) <= i;
            when "10" => o(2) <= i;
            when "11" => o(3) <= i;
            when others => o <= "0000";  
        end case;
    end process;

end Behavioral;
