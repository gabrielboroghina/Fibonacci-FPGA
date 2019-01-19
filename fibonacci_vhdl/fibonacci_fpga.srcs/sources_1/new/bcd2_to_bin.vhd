library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bcd2_to_bin is
    Port ( bcd : in STD_LOGIC_VECTOR (7 downto 0);
           bin : out STD_LOGIC_VECTOR (7 downto 0));
end bcd2_to_bin;

architecture Behavioral of bcd2_to_bin is
    component adder_CLA_8bit is
        Port ( a, b : in STD_LOGIC_VECTOR (7 downto 0);
               cin : in STD_LOGIC;
               cout : out STD_LOGIC;
               s : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal bcd2_mul_10 : STD_LOGIC_VECTOR(7 downto 0);
begin
    mul10: adder_CLA_8bit PORT MAP (a(7) => '0', a(6 downto 3) => bcd(7 downto 4), a(2 downto 0) => "000",
                                    b(7 downto 5) => "000", b(4 downto 1) => bcd(7 downto 4), b(0) => '0',
                                    cin => '0', cout => open, s => bcd2_mul_10);
    
    add_bcd1: adder_CLA_8bit PORT MAP (a => bcd2_mul_10, b(7 downto 4) => "0000", b(3 downto 0) => bcd(3 downto 0), 
                                       cin => '0', cout => open, s => bin);
end Behavioral;
