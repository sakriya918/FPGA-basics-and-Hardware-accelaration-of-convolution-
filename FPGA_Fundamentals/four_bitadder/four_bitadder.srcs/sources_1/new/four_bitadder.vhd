library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- design of four bit subtractor
entity four_bitsubtractor is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);  -- Minuend
           B : in STD_LOGIC_VECTOR (3 downto 0);  -- Subtrahend
           Diff : out STD_LOGIC_VECTOR (3 downto 0);  -- Difference
           Borrow : out STD_LOGIC);  -- Borrow out
end four_bitsubtractor;

architecture Behavioral of four_bitsubtractor is
    signal C0, C1, C2: STD_LOGIC;  -- Internal carry signals
    signal B_inverted : STD_LOGIC_VECTOR (3 downto 0);  -- Inverted version of B (subtrahend)
    
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
    -- Invert B for subtraction
    B_inverted <= not B;  -- This inverts all bits of B (subtrahend)

    -- Instantiate four full adders for subtraction
    FA0: fulladder port map(
        A => A(0),
        B => B_inverted(0),
        Cin => '1',  -- Initial carry-in is 1 for 2's complement subtraction
        Sum => Diff(0),
        Cout => C0 );
        
    FA1: fulladder port map(
        A => A(1),
        B => B_inverted(1),
        Cin => C0,
        Sum => Diff(1),
        Cout => C1 );
        
    FA2: fulladder port map(
        A => A(2),
        B => B_inverted(2),
        Cin => C1,
        Sum => Diff(2),
        Cout => C2 );
        
    FA3: fulladder port map(
        A => A(3),
        B => B_inverted(3),
        Cin => C2,
        Sum => Diff(3),
        Cout => Borrow );
        
end Behavioral;
