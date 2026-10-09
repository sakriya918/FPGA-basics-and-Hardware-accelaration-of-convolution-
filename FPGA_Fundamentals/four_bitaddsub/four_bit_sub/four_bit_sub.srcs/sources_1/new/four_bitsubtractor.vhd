library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- design of four bit subtractor
entity four_bitsubtractor is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);  
           B : in STD_LOGIC_VECTOR (3 downto 0);  
           Diff : out STD_LOGIC_VECTOR (3 downto 0);  
           Borrow : out STD_LOGIC);  
end four_bitsubtractor;

architecture Behavioral of four_bitsubtractor is
    signal C0, C1, C2: STD_LOGIC; 
    signal B_inverted : STD_LOGIC_VECTOR (3 downto 0);  
    
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
    B_inverted <= not B;  

   
    FA0: fulladder port map(
        A => A(0),
        B => B_inverted(0),
        Cin => '1',  
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
