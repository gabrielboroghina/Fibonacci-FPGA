library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_to_cathodes is
    Port ( x : in STD_LOGIC_VECTOR (4 downto 0); -- identifier for alphanumeric character
           seg : out STD_LOGIC_VECTOR (0 to 6)); -- cathodes for 7-segment display
end bcd_to_cathodes;

architecture Behavioral of bcd_to_cathodes is
begin
-- select cathodes by identifier
with x select
         -- digits
  seg <= "0000001" when "00000", -- 0
         "1001111" when "00001", -- 1
         "0010010" when "00010", -- 2
         "0000110" when "00011", -- 3
         "1001100" when "00100", -- 4
         "0100100" when "00101", -- 5
         "0100000" when "00110", -- 6
         "0001111" when "00111", -- 7
         "0000000" when "01000", -- 8
         "0000100" when "01001", -- 9
         -- letters
         "1001111" when "10000", -- I
         "1100000" when "10001", -- b
         "0100100" when "10010", -- S
         "0110001" when "10011", -- C
         "1111010" when "10100", -- r
         "1000010" when "10101", -- d
         "1001000" when "10110", -- H
         "0110000" when "10111", -- E
         "1101010" when "11000", -- n
         "1111111" when others;  -- ''
end Behavioral;
