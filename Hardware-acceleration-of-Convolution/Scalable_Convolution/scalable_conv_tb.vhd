library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Convolution_TB is
end Convolution_TB;

architecture Behavioral of Convolution_TB is
    constant DATA_WIDTH : integer := 8; 
    constant N          : integer := 8;  
    constant M          : integer := 3;  

    signal clk   : std_logic := '0';
    signal reset : std_logic := '0';
    signal x     : std_logic_vector((N * DATA_WIDTH) - 1 downto 0); 
    signal h     : std_logic_vector((M * DATA_WIDTH) - 1 downto 0); 
    signal y     : std_logic_vector(DATA_WIDTH - 1 downto 0);       

begin
    
    clk <= not clk after 10 ns;

    
    DUT: entity work.Convolution
        generic map (
            DATA_WIDTH => DATA_WIDTH,
            N          => N,
            M          => M
        )
        port map (
            clk   => clk,
            reset => reset,
            x     => x,
            h     => h,
            y     => y
        );

    -- Stimulus process
    process
        variable x_values : signed((N * DATA_WIDTH) - 1 downto 0) := (others => '0');
        variable h_values : signed((M * DATA_WIDTH) - 1 downto 0) := (others => '0');
    begin
        
        for i in 0 to N - 1 loop
            x_values((i + 1) * DATA_WIDTH - 1 downto i * DATA_WIDTH) := to_signed(i + 1, DATA_WIDTH); -- Example: Incrementing values
        end loop;

        for i in 0 to M - 1 loop
            h_values((i + 1) * DATA_WIDTH - 1 downto i * DATA_WIDTH) := to_signed(i + 2, DATA_WIDTH); -- Example: Incrementing filter coefficients
        end loop;

        x <= std_logic_vector(x_values); 
        h <= std_logic_vector(h_values); 
        reset <= '1';
        wait for 20ns;
         reset <= '0';
        wait for 20ns;
        
        wait;

        
    end process;

end Behavioral;