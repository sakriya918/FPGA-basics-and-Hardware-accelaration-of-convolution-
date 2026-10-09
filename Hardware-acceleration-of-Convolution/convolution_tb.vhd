library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
--use IEEE.std_logic_signed.ALL;

entity Convolution_TB is
end Convolution_TB;

architecture Behavioral of Convolution_TB is
    component convolution is
      Port (
           x3 : in signed(3 downto 0);
           x2 : in signed(3 downto 0);
           x1 : in signed(3 downto 0);
           x0 : in signed(3 downto 0);
           
           h3 : in signed(3 downto 0);
           h2 : in signed(3 downto 0);
           h1 : in signed(3 downto 0);
           h0 : in signed(3 downto 0);
            
           y6 : out signed(7 downto 0);
           y5 : out signed(7 downto 0);
           y4 : out signed(7 downto 0);
           y3 : out signed(7 downto 0);
           y2 : out signed(7 downto 0);
           y1 : out signed(7 downto 0);
           y0 : out signed(7 downto 0)
           );
    end component;

    signal x3, x2, x1, x0 : signed(3 downto 0);
    signal h3, h2, h1, h0 : signed(3 downto 0);
    signal y6, y5, y4, y3, y2, y1, y0 : signed(7 downto 0);

begin
    dut: convolution port map (
        x3 => x3, x2 => x2, x1 => x1, x0 => x0,
        h3 => h3, h2 => h2, h1 => h1, h0 => h0,
        y6 => y6, y5 => y5, y4 => y4, y3 => y3, y2 => y2, y1 => y1, y0 => y0
    );

    process
    begin
        -- Test case 1
        x3 <= "0001"; x2 <= "0010"; x1 <= "0011"; x0 <= "0000";
        h3 <= "0001"; h2 <= "0010"; h1 <= "0001"; h0 <= "0100";
        wait for 10 ns;

        -- Test case 2
        x3 <= "0001"; x2 <= "0010"; x1 <= "0001"; x0 <= "0100";
        h3 <= "0001"; h2 <= "0010"; h1 <= "0011"; h0 <= "0000";
        wait for 10 ns;
        
        -- Test case 3
        x3 <= "1111"; x2 <= "0010"; x1 <= "0000"; x0 <= "0001"; --1111 is -1 in signed integer
        h3 <= "0011"; h2 <= "0001"; h1 <= "0000"; h0 <= "1111";

        wait;
    end process;
end Behavioral;