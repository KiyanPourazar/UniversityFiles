----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:13:18 05/20/2024 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           o : out  STD_LOGIC_VECTOR (7 downto 0));
end alu;

architecture Behavioral of alu is


component division is
    port (
        A        : in std_logic_vector(7 downto 0);
        B        : in std_logic_vector(3 downto 0);
        Q        : out std_logic_vector(3 downto 0);
        R        : out std_logic_vector(3 downto 0);
        OverFlow : out std_logic
    );
end component division;

component and8bit is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           c : out  STD_LOGIC_VECTOR (7 downto 0));
end component and8bit;

component or8bit is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           c : out  STD_LOGIC_VECTOR (7 downto 0));
end component or8bit;

component xor123 is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           c : out  STD_LOGIC_VECTOR (7 downto 0));
end component xor123;

component adder_sub is
    port (
        A, B : in  std_logic_vector(7 downto 0);
        Cin  : in  std_logic;
        sum    : out std_logic_vector(7 downto 0);
        Cout : out std_logic
    );
end component adder_sub;

component multiplier is
 port ( 
	A: in STD_LOGIC_VECTOR (3 downto 0);
	B: in STD_LOGIC_VECTOR (3 downto 0);
	P: out STD_LOGIC_VECTOR (7 downto 0));
end component multiplier;

signal out0: std_logic_vector (7 downto 0) := "00000000";
signal out1: std_logic_vector (7 downto 0) := "00000000";
signal out2: std_logic_vector (7 downto 0) := "00000000";
signal out3: std_logic_vector (7 downto 0) := "00000000";
signal out4: std_logic_vector (7 downto 0) := "00000000";
signal out5: std_logic_vector (7 downto 0) := "00000000";
signal out6: std_logic_vector (7 downto 0) := "00000000";
signal out_out: std_logic_vector (7 downto 0) := "00000000";
signal overflow: std_logic := '0';
begin
	and1 : and8bit port map(a => a, b => b, c => out0);
	or12 : or8bit port map(a => a, b => b, c => out1);
	xor12 : xor123 port map(a => a, b => b, c => out2);
	adder1 : adder_sub port map(A => a, B => b, sum => out3, Cin => '0', Cout => overflow);
	adder2 : adder_sub port map(A => a, B => (not b), sum => out4, Cin => '1', Cout => overflow);
	multiplier1 : multiplier port map(A => a(3 downto 0), B => b(3 downto 0), P => out5);
	div : division port map(A => a, B => b(3 downto 0), Q => out6(7 downto 4), R => out6(3 downto 0), OverFlow => overflow);
	process (out0,out1,out2,out3,out4,out5,out6, sel)
	begin
		case sel is
		when "000" => out_out <= out0;
		when "001" => out_out <= out1;
		when "010" => out_out <= out2;
		when "011" => out_out <= out3;
		when "100" => out_out <= out4;
		when "101" => out_out <= out5;
		when "110" => out_out <= out6;
		when "111" => out_out <= "00000000";
		when others => out_out <= "00000000";
		end case;
	
   end process;
	o <= out_out;

end Behavioral;

