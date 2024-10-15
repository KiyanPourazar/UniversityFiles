library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity OR_8bit is
    Port ( clk : in std_logic;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0));
end OR_8bit;

architecture Structural of OR_8bit is
begin
    process (clk,A,B)
        variable output_temp : std_logic_vector(7 downto 0) ;
    begin
		if rising_edge(clk)  then
         for i in 0 to 7 loop
            output_temp(i) := A(i) OR B(i);
         end loop;
            Y <= output_temp;
		 end if;
    end process;
end Structural;
