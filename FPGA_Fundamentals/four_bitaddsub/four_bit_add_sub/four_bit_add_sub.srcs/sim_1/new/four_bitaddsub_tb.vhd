library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bitaddsub_tb is
end four_bitaddsub_tb;

architecture Behavioral of four_bitaddsub_tb is
    component four_bitaddsub is
        port(
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Control : in STD_LOGIC;
            Result : out STD_LOGIC_VECTOR (3 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

    signal A : STD_LOGIC_VECTOR (3 downto 0);
    signal B : STD_LOGIC_VECTOR (3 downto 0);
    signal Control : STD_LOGIC;
    signal Result : STD_LOGIC_VECTOR (3 downto 0);
    signal Cout : STD_LOGIC;

begin
    DUT: four_bitaddsub port map(
        A => A,
        B => B,
        Control => Control,
        Result => Result,
        Cout => Cout
    );

    process
    begin
        A <= "0111";
        B <= "0010";
        Control <= '0';
        wait;
        A <= "0111";
        B <= "0010";
        Control <= '0';
        wait;
    end process;

end Behavioral;
