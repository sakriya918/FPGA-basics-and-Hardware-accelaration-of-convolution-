library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bitaddsub is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Control : in STD_LOGIC;
           Result : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end four_bitaddsub;

architecture Behavioral of four_bitaddsub is
    signal C0, C1, C2: STD_LOGIC;
    signal B_xor_control : STD_LOGIC_VECTOR (3 downto 0);
    
    component fulladder is
        port(
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Cin: in STD_LOGIC;
            Sum: out STD_LOGIC;
            Cout: out STD_LOGIC
        );
    end component;

begin
    B_xor_control <= B xor (Control & Control & Control & Control);

    FA0: fulladder port map(
        A => A(0),
        B => B_xor_control(0),
        Cin => Control,
        Sum => Result(0),
        Cout => C0 );
        
    FA1: fulladder port map(
        A => A(1),
        B => B_xor_control(1),
        Cin => C0,
        Sum => Result(1),
        Cout => C1 );
        
    FA2: fulladder port map(
        A => A(2),
        B => B_xor_control(2),
        Cin => C1,
        Sum => Result(2),
        Cout => C2 );
        
    FA3: fulladder port map(
        A => A(3),
        B => B_xor_control(3),
        Cin => C2,
        Sum => Result(3),
        Cout => Cout );

end Behavioral;
