library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_16_1 is
    Port ( i : in STD_LOGIC_VECTOR (15 downto 0);
           s : in STD_LOGIC_VECTOR (3 downto 0);
           o : out STD_LOGIC);
end mux_16_1;

architecture Behavioral of mux_16_1 is
begin

    process(s, i)
    begin
        if (s = "0000") then
            o <= i(0);
        elsif (s = "0001") then
            o <= i(1);
        elsif (s = "0010") then
            o <= i(2);
        elsif(s = "0011") then
            o <= i(3);
        elsif (s = "0100") then
            o <= i(4);
        elsif (s = "0101") then
            o <= i(5);
        elsif (s = "0110") then
            o <= i(6);
        elsif(s = "0111") then
            o <= i(7);
            
         elsif (s = "1000") then
            o <= i(8);
        elsif (s = "1001") then
            o <= i(9);
        elsif (s = "1010") then
            o <= i(10);
        elsif(s = "1011") then
            o <= i(11);
        elsif (s = "1100") then
            o <= i(12);
        elsif (s = "1101") then
            o <= i(13);
        elsif (s = "1110") then
            o <= i(14);
        elsif(s = "1111") then
            o <= i(15);
        else
            o <= '0';
        end if;
    end process;

end Behavioral;
