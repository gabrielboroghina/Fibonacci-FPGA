library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_bit.ALL;


entity display_7seg is
    Port ( n : in STD_LOGIC_VECTOR (15 downto 0);  -- the 16-bit number to display
           clk, reset : in BIT;
           AN : out STD_LOGIC_VECTOR (7 downto 0); -- anodes
           seg : out STD_LOGIC_VECTOR (0 to 6));   -- cathodes
end display_7seg;

architecture Behavioral of display_7seg is
    component bin_to_bcd_16 is -- convert number from binary to BCD
        Port ( b : in STD_LOGIC_VECTOR (15 downto 0);
               bcd : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component bcd_to_cathodes is -- print to display an alphanumeric character
        Port ( x : in STD_LOGIC_VECTOR (4 downto 0); -- identifier for alphanumeric character
               seg : out STD_LOGIC_VECTOR (0 to 6)); -- cathodes for 7-segment display
    end component;
    
    signal groups : STD_LOGIC_VECTOR (15 downto 0); -- 4 groups corresponding to 4 BCDs
    signal bcd : STD_LOGIC_VECTOR (4 downto 0);     -- current digit

    signal LED_activating_counter : std_logic_vector(2 downto 0);
    -- 3 bits for selecting one of the 8 LEDs
    -- count         0   ->  1  ->  2  ->  3  ->  4  ->  5  ->  6  ->  7
    -- activates    LED7    LED6   LED5   LED4   LED3   LED2   LED1   LED0
    
begin
    convert_int_to_bcd: bin_to_bcd_16 PORT MAP (b => n, bcd => groups);
    display: bcd_to_cathodes PORT MAP (x => bcd, seg => seg);
    
    process (clk, reset)
    begin
        if (reset = '0') then
            LED_activating_counter <= (others => '0');
        elsif (rising_edge(clk)) then
            LED_activating_counter <= LED_activating_counter + 1;
        end if;
    end process;
    
    -- 8-to-1 MUX to generate anode activating signals for 8 LEDs 
    process (LED_activating_counter, groups)
    begin
        case LED_activating_counter is
        ---------------------------------------- print number => bcd(4) <= '0'
        when "100" =>
            -- activate LED3 and deactivate others
            AN <= "11110111"; 
            bcd(3 downto 0) <= groups(15 downto 12); -- the first digit of the number
            bcd(4) <= '0';
            
        when "101" =>
            -- activate LED2 and deactivate others
            AN <= "11111011"; 
            bcd(3 downto 0) <= groups(11 downto 8); -- the second digit of the number
            bcd(4) <= '0';
            
        when "110" =>
            -- activate LED1 and deactivate others
            AN <= "11111101"; 
            bcd(3 downto 0) <= groups(7 downto 4);  -- the third digit of the number
            bcd(4) <= '0';
           
        when "111" =>
            -- activate LED0 and deactivate others
            AN <= "11111110"; 
            bcd(3 downto 0) <= groups(3 downto 0); -- the fourth digit of the number 
            bcd(4) <= '0';
        
        when others =>
            AN <= "11111111";
            bcd <= "00000";
        end case;
    end process;

end Behavioral;
