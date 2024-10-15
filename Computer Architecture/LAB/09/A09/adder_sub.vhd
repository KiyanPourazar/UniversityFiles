library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder_sub is
    port (
        A, B : in  std_logic_vector(7 downto 0);
        Cin  : in  std_logic;
        sum    : out std_logic_vector(7 downto 0);
        Cout : out std_logic
    );
end entity adder_sub;

architecture rtl of adder_sub is
    signal result : std_logic_vector(8 downto 0);
begin
    result <= ('0' & A) + ('0' & B) + Cin;
    sum      <= result(7 downto 0);
    Cout   <= result(8);
end architecture rtl;