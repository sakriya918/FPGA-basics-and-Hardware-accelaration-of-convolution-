library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity alu is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           alu_sel : in STD_LOGIC_VECTOR (3 downto 0);
           alu_out : out STD_LOGIC_VECTOR (7 downto 0);
           carry_out : out STD_LOGIC);
end alu;

architecture Behavioral of alu is
signal temp1: std_logic_vector(8 downto 0);
begin

process(a,b,alu_sel)
begin
case alu_sel is 
when "0000" => alu_out <= a;
when "0001" => 
temp1 <= ('0' & a) + ('0' & b);
alu_out <= temp1(7 downto 0);
carry_out <= temp1(8);
when "0010" => alu_out <= a-b;
when "0011" => alu_out <= a and b;
when "0100" => alu_out <= a or b;
when "0101" => alu_out <= a xor b;
when "0110" => alu_out <= a nand b;
when "0111" => alu_out <= a xnor b;
when "1000" => alu_out <= a(6 downto 0) & '0'; --shift left
when "1001" => alu_out <= '0' & a(6 downto 0); --shift right
when "1010" => alu_out <= a(6 downto 0) & a(7); --rotate left
when "1011" => alu_out <= a(7) & a(6 downto 0); --rotate right

when "1100" => --equal comparision
if(a = b) then
alu_out <=x"01";
else
alu_out <= x"00";
end if;

when "1101" => --greater than comparision
if(a > b) then
alu_out <=x"01";
else
alu_out <= x"00";
end if;

when "1110" => alu_out <= not a;
when "1111" => alu_out <= not a + '1';

when others => alu_out <= not a;


end case;
end process;

end Behavioral;
