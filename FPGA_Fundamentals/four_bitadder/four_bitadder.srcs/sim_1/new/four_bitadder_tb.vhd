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

    -- Signals for inputs and outputs
    signal A : STD_LOGIC_VECTOR (3 downto 0);
    signal B : STD_LOGIC_VECTOR (3 downto 0);
    signal Diff : STD_LOGIC_VECTOR (3 downto 0);
    signal Borrow : STD_LOGIC;

begin
    -- Instantiate the 4-bit subtractor
    DUT: four_bitsubtractor port map(
        A => A,
        B => B,
        Diff => Diff,
        Borrow => Borrow
    );

    -- Test process
    process
    begin
        -- Test case 1: 7 - 8
        A <= "0111";  -- 7 in binary
        B <= "1000";  -- 8 in binary
        wait for 10 ns;
        
        -- Test case 2: 9 - 7
        A <= "1001";  -- 9 in binary
        B <= "0111";  -- 7 in binary
        wait for 10 ns;

        -- Additional test cases can be added here
        wait;
    end process;

end Behavioral;
