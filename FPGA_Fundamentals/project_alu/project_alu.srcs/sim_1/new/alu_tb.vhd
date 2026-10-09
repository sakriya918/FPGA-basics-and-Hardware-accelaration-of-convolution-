library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity alu_tb is
    --Port ();
end alu_tb;

architecture Behavioral of alu_tb is
component alu is
Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           alu_sel : in STD_LOGIC_VECTOR (3 downto 0);
           alu_out : out STD_LOGIC_VECTOR (7 downto 0);
           carry_out : out STD_LOGIC);
end component;

           signal a : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
           signal b : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
           signal alu_sel : STD_LOGIC_VECTOR (3 downto 0) := "0000";
           signal alu_out : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
           signal carry_out : STD_LOGIC := '0';
           
begin
uut: alu port map(a => a, b => b, alu_sel => alu_sel, alu_out => alu_out, carry_out => carry_out);

process
begin

for i in 0 to 32 loop
a <= "00000011";
b <= "00000001";
alu_sel <= alu_sel + "0001";
wait for 10ns;
end loop;

end process;

end Behavioral;
