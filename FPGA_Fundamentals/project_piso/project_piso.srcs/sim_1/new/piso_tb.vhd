library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity PISO_tb is
end PISO_tb;

architecture Behavioral of PISO_tb is
component PISO
    port( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           load: in STD_LOGIC;
           d : in STD_LOGIC_VECTOR(3 downto 0);
           q : out STD_LOGIC);
end component;

signal clk : STD_LOGIC:='0';
signal reset : STD_LOGIC;
signal load : STD_LOGIC;
signal d :STD_LOGIC_VECTOR(3 downto 0) :="0000";
signal q : STD_LOGIC;

begin
uut: PISO port map(
    clk=>clk,
    reset=>reset,
    load=>load,
    d=>d,
    q=>q);
stimulus:process
begin
    clk<= not clk;
    wait for 10 ns;
    end process;
process
begin
    reset<='1';
    wait for 20 ns;
    reset<='0';
    wait for 20 ns;
    
    load<='1';
    d<="1001";
    wait for 10 ns;
    load<='0';
    wait for 10 ns;
wait;
end process;
end Behavioral;