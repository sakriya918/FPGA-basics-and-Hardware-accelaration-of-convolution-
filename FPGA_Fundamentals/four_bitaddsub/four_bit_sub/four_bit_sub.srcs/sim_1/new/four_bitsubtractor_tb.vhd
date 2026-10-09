library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bitsubtractor_tb is
end four_bitsubtractor_tb;

architecture Behavioral of four_bitsubtractor_tb is
    component four_bitsubtractor is
        port(
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Diff : out STD_LOGIC_VECTOR (3 downto 0);
            Borrow : out STD_LOGIC
        );
    end component;

 
    signal A : STD_LOGIC_VECTOR (3 downto 0);
    signal B : STD_LOGIC_VECTOR (3 downto 0);
    signal Diff : STD_LOGIC_VECTOR (3 downto 0);
    signal Borrow : STD_LOGIC;

begin
   
    DUT: four_bitsubtractor port map(
        A => A,
        B => B,
        Diff => Diff,
        Borrow => Borrow
    );

    process
    begin
      
        A <= "1111";  
        B <= "1000";  
        wait for 10 ns;
   
   
        wait;
    end process;

end Behavioral;
