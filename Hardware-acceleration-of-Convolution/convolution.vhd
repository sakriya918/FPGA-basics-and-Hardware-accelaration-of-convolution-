library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
--use IEEE.std_logic_unsigned.ALL;

entity Convolution is
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
end Convolution;

architecture Behavioral of Convolution is
begin
    y6 <= (x3 * h3) + "0000"    + "0000"    + "0000"   ;
    y5 <= (x3 * h2) + (x2 * h3) + "0000"    + "0000"   ;
    y4 <= (x3 * h1) + (x2 * h2) + (x1 * h3) + "0000"   ;
    y3 <= (x3 * h0) + (x2 * h1) + (x1 * h2) + (x0 * h3);
    y2 <= "0000"    + (x2 * h0) + (x1 * h1) + (x0 * h2);
    y1 <= "0000"    + "0000"    + (x1 * h0) + (x0 * h1);
    y0 <= "0000"    + "0000"    + "0000"    + (x0 * h0);
end Behavioral;