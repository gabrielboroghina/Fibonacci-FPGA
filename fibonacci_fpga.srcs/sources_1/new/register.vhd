library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_bit.ALL;


entity reg is
    Generic (size: integer);
    Port (v : in STD_LOGIC_VECTOR (size - 1 downto 0);
          clk, reset : in BIT;
          en : in STD_LOGIC;
          O : out STD_LOGIC_VECTOR (size - 1 downto 0));
end reg;

architecture Behavioral of reg is

begin
    process (clk, reset, en)
    begin
        if (reset = '0') then
            O <= (others => '0');
        elsif rising_edge(clk) and en = '1' then
            O <= v;
        end if;
    end process;
end Behavioral;
