library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity full_adder_1bit is
    Port (    
        A : in std_logic;
        B : in std_logic;
        clk: in std_logic;
        Cin : in std_logic;
        Sum : out std_logic;
        Cout : out std_logic
    );
end full_adder_1bit;

architecture Behavioral of full_adder_1bit is
    signal internal_sum : std_logic := '0';

begin
    internal_sum <= A xor B xor Cin;
    process(clk)
    begin
        if rising_edge(clk) then
            Sum <= internal_sum;
        end if;
    end process;

    Cout <= (A and B) or (A and Cin) or (B and Cin);
end Behavioral;
