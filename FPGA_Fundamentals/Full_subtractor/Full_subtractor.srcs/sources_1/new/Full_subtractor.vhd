library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Full Subtactor

entity Full_subtractor is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           z : in STD_LOGIC;
           d : out STD_LOGIC;
           b : out STD_LOGIC);
end Full_subtractor;

architecture Behavioral of Full_subtractor is

begin
d <= x xor y xor z;
b <= ((not x) and z) or ((not x) and y) or (y and z);
end Behavioral;
