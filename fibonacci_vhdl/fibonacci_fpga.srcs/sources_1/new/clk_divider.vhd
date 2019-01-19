library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_bit.ALL;


entity clk_divider is
    Port ( clk100MHz : in BIT; -- high frequency clock
           clk : out BIT);     -- reduced frequency clock
end clk_divider;

architecture Behavioral of clk_divider is

    signal counter : unsigned(16 downto 0);
    signal cnt_tmp : bit_vector(16 downto 0);
    
begin
    process (clk100MHz, counter, cnt_tmp)
    begin
        if (rising_edge(clk100MHz)) then
            counter <= counter + 1;
        end if;
        
        cnt_tmp <= bit_vector(counter);
        clk <= cnt_tmp(16); -- 760Hz clock signal (100MHz / 2^17)
    end process;

end Behavioral;
