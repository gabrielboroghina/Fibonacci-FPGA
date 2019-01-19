library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity adder_CLA_8bit is
    Port ( a, b : in STD_LOGIC_VECTOR (7 downto 0);
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           s : out STD_LOGIC_VECTOR (7 downto 0));
end adder_CLA_8bit;

architecture Behavioral of adder_CLA_8bit is
    component CLA_4 is
        Port ( a, b : in STD_LOGIC_VECTOR (3 downto 0);
               cin : in STD_LOGIC;
               s : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal Pg, Gg, C: STD_LOGIC_VECTOR (7 downto 0);
    signal p, g : STD_LOGIC_VECTOR (7 downto 0);
begin
    p <= a or b;
    g <= a and b;
    
    Pg(0) <= p(3) and p(2) and p(1) and p(0);
    Pg(1) <= p(7) and p(6) and p(5) and p(4);
    
    Gg(0) <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0));
    Gg(1) <= g(7) or (p(7) and g(6)) or (p(7) and p(6) and g(5)) or (p(7) and p(6) and p(5) and g(4));

    C(0) <= Gg(0) or (Pg(0) and Gg(0));
    C(1) <= Gg(1) or (Gg(0) and Pg(1)) or (cin and Pg(0) and Pg(1));
   
    -- use the 4bit CLAs
    sum1: CLA_4 PORT MAP (a => a(3 downto 0), b => b(3 downto 0), cin => cin, s => s(3 downto 0));
    sum2: CLA_4 PORT MAP (a => a(7 downto 4), b => b(7 downto 4), cin => C(0), s => s(7 downto 4));
    
    cout <= C(1);

end Behavioral;
