----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:49:43 05/20/2024 
-- Design Name: 
-- Module Name:    Adder4bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder4bit is
	Port (
        A, B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        Sum : out std_logic_vector(3 downto 0);
        Cout : out std_logic
	);
end Adder4bit;

architecture Behavioral of Adder4bit is
    signal result : std_logic_vector(4 downto 0);
begin
	 result <= ('0' & A) + ('0' & B) + Cin;
    sum      <= result(3 downto 0);
    Cout   <= result(4);

end Behavioral;

