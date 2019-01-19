library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is
    Port ( number : in STD_LOGIC_VECTOR (7 downto 0);
           clk_100MHz, reset : in BIT;
           AN : out STD_LOGIC_VECTOR (7 downto 0); -- anodes
           seg : out STD_LOGIC_VECTOR (0 to 6)    -- cathodes
           );
end top;

architecture Behavioral of top is
    component clk_divider is
        Port ( clk100MHz : in BIT; -- high frequency clock
               clk : out BIT);     -- reduced frequency clock
    end component;

    component bcd2_to_bin is
        Port ( bcd : in STD_LOGIC_VECTOR (7 downto 0);
               bin : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component fibonacci is
        Port ( n : in STD_LOGIC_VECTOR (7 downto 0);
               clk, reset : in BIT; cnt : out STD_LOGIC_vector(7 downto 0); e : out std_logic;
               fib : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    component display_7seg is
        Port ( n : in STD_LOGIC_VECTOR (15 downto 0);  -- the 16-bit number to display
               clk, reset : in BIT;
               AN : out STD_LOGIC_VECTOR (7 downto 0); -- anodes
               seg : out STD_LOGIC_VECTOR (0 to 6));   -- cathodes
    end component;

    signal bin_nr : STD_LOGIC_VECTOR(7 downto 0);
    signal fib : STD_LOGIC_VECTOR(15 downto 0);
    signal clk : BIT;
begin
    clk_div: clk_divider PORT MAP (clk100MHz => clk_100MHz, clk => clk); -- reduce clock frequency
    
    bcd_to_bin: bcd2_to_bin PORT MAP (bcd => number, bin => bin_nr);
    compute_fib: fibonacci PORT MAP (n => bin_nr, clk => clk, reset => reset, fib => fib);

    -- display the fibonacci number
    display_nr_7seg: display_7seg PORT MAP (n => fib, clk => clk, reset => reset, AN => AN, seg => seg);
end Behavioral;
