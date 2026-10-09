library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Convolution is
    generic (
        DATA_WIDTH : integer := 8;   -- Width of data 
        N          : integer := 8;    -- Length of input signal
        M          : integer := 3     -- Number of filter coefficients
    );
    port (
        clk         : in  std_logic;
        reset       : in  std_logic := '0' ;
        x           : in  std_logic_vector((N*DATA_WIDTH)-1 downto 0); -- Input signal
        h           : in  std_logic_vector((M*DATA_WIDTH)-1 downto 0); -- Implulse response coefficeints
        y           : out std_logic_vector((DATA_WIDTH)-1 downto 0)    -- Output result
    );
end Convolution;

architecture Behavioral of Convolution is
    type data_array is array (0 to N-1) of signed(DATA_WIDTH-1 downto 0); -- array of array for simplicity while performing convolution
    type coeff_array is array (0 to M-1) of signed(DATA_WIDTH-1 downto 0); -- same things as above

    signal x_array : data_array;
    signal h_array : coeff_array;
    signal result  : signed(DATA_WIDTH-1 downto 0) := (others => '0');
    signal temp_n : integer := 0;
begin

    -- Unpack input and coefficient vectors into arrays
    process(x, h)
    begin
        for i in 0 to N-1 loop
            x_array(i) <= signed(x((i+1)*DATA_WIDTH-1 downto i*DATA_WIDTH));
        end loop;

        for i in 0 to M-1 loop
            h_array(i) <= signed(h((i+1)*DATA_WIDTH-1 downto i*DATA_WIDTH));
        end loop;
    end process;

    -- Perform convolution
 process(clk)
    variable temp_result : signed(2*DATA_WIDTH-1 downto 0);
begin
    if rising_edge(clk) then
        if reset = '1' then
            result <= (others => '0');
            temp_n <= 0;  
        else
            temp_result := (others => '0');

            for i in 0 to M-1 loop
                if temp_n -i>=0  and temp_n -i < 8 then
                    temp_result := temp_result + (x_array(temp_n - i) * h_array(i));
                end if;
            end loop;

            
           if temp_n = (N + M - 2) then  -- because value starts from 0
                temp_n <= 0;
           else
                temp_n <= temp_n + 1;
           end if;

            
            result <= resize(temp_result(DATA_WIDTH-1 downto 0), DATA_WIDTH);
        end if;
    end if;
end process;


    -- Output the result
    y <= std_logic_vector(result);

end Behavioral;