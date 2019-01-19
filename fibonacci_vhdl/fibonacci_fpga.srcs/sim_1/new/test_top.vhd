----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2018 10:39:46 AM
-- Design Name: 
-- Module Name: test_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity test_top is
--  Port ( );
end test_top;

architecture Behavioral of test_top is
    component top is
    Port ( number : in STD_LOGIC_VECTOR (7 downto 0);
           clk_100MHz, reset : in BIT;
           AN : out STD_LOGIC_VECTOR (7 downto 0); -- anodes
           seg : out STD_LOGIC_VECTOR (0 to 6)   -- cathodes
           );
    end component;
    
    signal nr, AN: STD_LOGIC_VECTOR (7 downto 0);
    signal clk : BIT := '0';
    signal seg : STD_LOGIC_VECTOR (0 to 6);
    signal f : STD_LOGIC_VECTOR (15 downto 0);
begin
    uut: top PORT MAP (number => nr, clk_100MHz => clk, reset => '1', AN => AN, seg => seg);
    
    clk <= not clk after 2ns;
    process
    begin
        wait for 100ns;
        nr <= "00000100";
        wait for 100ns;
        nr <= "00010111";
    end process;

end Behavioral;
