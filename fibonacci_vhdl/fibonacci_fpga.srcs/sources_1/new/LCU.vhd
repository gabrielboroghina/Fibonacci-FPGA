library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_CLA_16bit is
    Port ( a, b : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           s : out STD_LOGIC_VECTOR (15 downto 0));
end adder_CLA_16bit;

architecture Behavioral of adder_CLA_16bit is
    component CLA_4 is
        Port ( a, b : in STD_LOGIC_VECTOR (3 downto 0);
               cin : in STD_LOGIC;
               s : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal Pg, Gg, C: STD_LOGIC_VECTOR (15 downto 0);
    signal p, g : STD_LOGIC_VECTOR (15 downto 0);
begin
    p <= a or b;
    g <= a and b;
    
    Pg(0) <= p(3) and p(2) and p(1) and p(0);
    Pg(1) <= p(7) and p(6) and p(5) and p(4);
    Pg(2) <= p(11) and p(10) and p(9) and p(8);
    Pg(3) <= p(15) and p(14) and p(13) and p(12);
    
    Gg(0) <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0));
    Gg(1) <= g(7) or (p(7) and g(6)) or (p(7) and p(6) and g(5)) or (p(7) and p(6) and p(5) and g(4));
    Gg(2) <= g(11) or (p(11) and g(10)) or (p(11) and p(10) and g(9)) or (p(11) and p(10) and p(9) and g(8));
    Gg(3) <= g(15) or (p(15) and g(14)) or (p(15) and p(14) and g(13)) or (p(15) and p(14) and p(13) and g(12));

    C(0) <= Gg(0) or (Pg(0) and Gg(0));
    C(1) <= Gg(1) or (Gg(0) and Pg(1)) or (cin and Pg(0) and Pg(1));
    C(2) <= Gg(2) or (Gg(1) and Pg(2)) or (Gg(0) and Pg(1) and Pg(2)) or (cin and Pg(0) and Pg(1) and Pg(2));
    C(3) <= Gg(3) or (Gg(2) and Pg(3)) or (Gg(1) and Pg(2) and Pg(3)) or (Gg(0) and Pg(1) and Pg(2) and Pg(3)) or (cin and Pg(0) and Pg(1) and Pg(2) and Pg(3));

    -- use the CLAs
    sum1: CLA_4 PORT MAP (a => a(3 downto 0), b => b(3 downto 0), cin => cin, s => s(3 downto 0));
    sum2: CLA_4 PORT MAP (a => a(7 downto 4), b => b(7 downto 4), cin => C(0), s => s(7 downto 4));
    sum3: CLA_4 PORT MAP (a => a(11 downto 8), b => b(11 downto 8), cin => C(1), s => s(11 downto 8));
    sum4: CLA_4 PORT MAP (a => a(15 downto 12), b => b(15 downto 12), cin => C(2), s => s(15 downto 12));
    
    cout <= C(3);

end Behavioral;
