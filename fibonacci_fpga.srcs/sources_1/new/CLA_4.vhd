----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2018 12:01:10 PM
-- Design Name: 
-- Module Name: CLA_4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLA_4 is
    Port ( a, b : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0));
end CLA_4;

architecture Behavioral of CLA_4 is
    signal p, g : STD_LOGIC_VECTOR (3 downto 0);
    signal c : STD_LOGIC_VECTOR (4 downto 0);
begin
    p <= a xor b;
    g <= a and b;
    c(0) <= cin;
    
    c(1) <= g(0) or (p(0) and cin);
    c(2) <= g(1) or (g(0) and p(1)) or (cin and p(0) and p(1));
    c(3) <= g(2) or (g(1) and p(2)) or (g(0) and p(1) and p(2)) or (cin and p(0) and p(1) and p(2)); 
    c(4) <= g(3) or (g(2) and p(3)) or (g(1) and p(2) and p(3)) or (g(0) and p(1) and p(2) and p(3))
            or (cin and p(0) and p(1) and p(2) and p(3));
            
    s <= p xor c(3 downto 0);
end Behavioral;
