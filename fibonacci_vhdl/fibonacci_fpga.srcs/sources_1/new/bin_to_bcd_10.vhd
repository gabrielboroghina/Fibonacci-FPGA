library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- convert number from binary to BCD
entity bin_to_bcd_16 is
    Port ( b : in STD_LOGIC_VECTOR (15 downto 0);     -- 16-bit integer
           bcd : out STD_LOGIC_VECTOR (15 downto 0)); -- binary-coded decimal (BCD)
end bin_to_bcd_16;

architecture Behavioral of bin_to_bcd_16 is
    function correct(signal b : std_logic_vector (3 downto 0)) return std_logic_vector is
    begin
        if (b(3) or (b(2) and (b(1) or b(0)))) = '1' then  -- if b >= 5
            return std_logic_vector(unsigned(b) + "0011"); -- add 3 to b
        else
            return b;
        end if;
    end function;
    
    type array34 is array (1 to 34) of STD_LOGIC_VECTOR(3 downto 0);
    signal X, Y : array34;
    
begin
    -- async parallel BINARY - parallel BCD conversion
    -- convert the 16-bit number using 34 elementary conversion cells
    
    X(1) <= '0' & b(15 downto 13);
    layer1: for i in 2 to 13 generate
        X(i) <= Y(i - 1)(2 downto 0) & b(14 - i);
    end generate;
    
    X(14) <= '0' & Y(1)(3) & Y(2)(3) & Y(3)(3);
    layer2: for i in 15 to 23 generate
        X(i) <= Y(i - 1)(2 downto 0) & Y(i - 11)(3);
    end generate;
    
    X(24) <= '0' & Y(14)(3) & Y(15)(3) & Y(16)(3);
    layer3: for i in 25 to 30 generate
        X(i) <= Y(i - 1)(2 downto 0) & Y(i - 8)(3);
    end generate;
    
    X(31) <= '0' & Y(24)(3) & Y(25)(3) & Y(26)(3);
    layer4: for i in 32 to 34 generate
        X(i) <= Y(i - 1)(2 downto 0) & Y(i - 5)(3);
    end generate;   
    
    -- correct the values greater than 4 (so that left-shifting to be done correctly)
    elem_cell: for i in 1 to 34 generate
        Y(i) <= correct(X(i)); -- conversion from X to Y
    end generate;
    
    bcd <= Y(34)(2 downto 0) & Y(30) & Y(23) & Y(13) & b(0); -- extract the least semnificative 4 BCDs
end Behavioral;
