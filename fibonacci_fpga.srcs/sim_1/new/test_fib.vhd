----------------------------------------------------------------------------------
-- Company: 
-- Students: Gabriel Boroghina & Mihaela Catrina
-- 
-- Create Date: 11/04/2018 09:32:33 AM
-- Design Name: 
-- Module Name: test_fib - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity test_fib is
--  Port ( );
end test_fib;

architecture Behavioral of test_fib is
    component fibonacci is
        Port ( n : in STD_LOGIC_VECTOR (7 downto 0);
               clk, reset : in BIT; cnt : out STD_LOGIC_vector(7 downto 0); e : out std_logic;
               fib : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    signal nr : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal res : STD_LOGIC_VECTOR (15 downto 0);
    signal clk : BIT := '0';
    signal e : STD_LOGIC := '0';
    signal cnt : STD_LOGIC_vector(7 downto 0);
begin
    clk <= not clk after 2ns;
    
    uut: fibonacci PORT MAP (n => nr, clk => clk, reset => '1', fib => res, cnt => cnt, e => e);
    
    process
    begin
        wait for 100ns;
        nr <= "00010001";
        wait for 100ns;
        nr <= "00000001";
        wait for 100ns;
        nr <= "00001001";
    end process;

end Behavioral;
