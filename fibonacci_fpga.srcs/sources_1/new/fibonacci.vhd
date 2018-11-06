library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_bit.ALL;


entity fibonacci is
    Port ( n : in STD_LOGIC_VECTOR (7 downto 0);
           clk, reset : in BIT; cnt : out STD_LOGIC_vector(7 downto 0); e : out std_logic;
           fib : out STD_LOGIC_VECTOR (15 downto 0));
end fibonacci;

architecture Behavioral of fibonacci is
    component reg is
        Generic (size: integer);
        Port (v : in STD_LOGIC_VECTOR (size - 1 downto 0);
              clk, reset : in BIT;
              en : in STD_LOGIC;
              O : out STD_LOGIC_VECTOR (size - 1 downto 0));
    end component;
    
    component adder_CLA_16bit is
        Port ( a, b : in STD_LOGIC_VECTOR (15 downto 0);
               cin : in STD_LOGIC;
               cout : out STD_LOGIC;
               s : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    signal a, b, a_sync, b_sync, sum : STD_LOGIC_VECTOR (15 downto 0);
    signal n_old, nt_1, nt, count, count_inc : STD_LOGIC_VECTOR (7 downto 0);
    signal sel, en : STD_LOGIC;
begin
    fib <= (others => '0') when nt = "00000000" else
           ((15 downto 1 => '0') & '1') when nt = "00000001" else
           "0010011100001111" when nt > "00010100" else -- 9999 when nt > 20 (overflow)
           sum;

    reg1: reg GENERIC MAP (size => 8) PORT MAP (v => n, clk => clk, reset => reset, en => '1', O => n_old);
    reg2: reg GENERIC MAP (size => 8) PORT MAP (v => n_old, clk => clk, reset => reset, en => '1', O => nt_1);
    reg3: reg GENERIC MAP (size => 8) PORT MAP (v => n, clk => clk, reset => reset, en => '1', O => nt);
    
    -- define MUX selection signal
    sel <= '0' when nt = nt_1 else '1';
    
    -- MUX-es for a, b and counter
    with sel select a <= ((15 downto 1 => '0') & '1') when '1', sum when others;
    with sel select b <= (others => '0') when '1', a_sync when others;
    with sel select count <= "00000001" when '1', count_inc when others;
    
    reg_fib: reg GENERIC MAP (size => 32) 
                 PORT MAP (v(31 downto 16) => a, v(15 downto 0) => b,
                           clk => clk, reset => reset, en => en,
                           O(31 downto 16) => a_sync, O(15 downto 0) => b_sync);
    
    compute_next_nr: adder_CLA_16bit PORT MAP (a => a_sync, b => b_sync, cin => '0', s => sum);
    
    process(clk, reset, n, en, count)
    begin
        if (reset = '0') then
            count_inc <= (others => '0');
        elsif rising_edge(clk) and en = '1' then
            count_inc <= count + 1;
        end if;
    end process;
    
    en <= '0' when count_inc = nt or nt(7 downto 1) = "0000000" or nt > "00010100" else '1'; -- define enable
    
    cnt <= count_inc; e <= en;
end Behavioral;
