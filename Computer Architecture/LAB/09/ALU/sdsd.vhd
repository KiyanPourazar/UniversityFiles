library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AddSub is
    Port ( 
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
			  clk : in std_logic;
           Y : out  STD_LOGIC_VECTOR (7 downto 0);
           Cout : out  STD_LOGIC
);
end AddSub;

architecture Behavioral of AddSub is

component full_adder_8bit is
    Port (  
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
		  clk : in std_logic;
        Cin : in std_logic;
        Sum : out std_logic_vector(7 downto 0);
        Cout : out std_logic
    );
end component;

signal B_xor_Cin : std_logic_vector(7 downto 0);
signal output : std_logic_vector (7 downto 0);
signal C_temp : std_logic;
begin

B_xor_Cin <= (B(7) xor Cin) & (B(6) xor Cin) & (B(5) xor Cin) & (B(4) xor Cin) & 
             (B(3) xor Cin) & (B(2) xor Cin) & (B(1) xor Cin) & (B(0) xor Cin);

FA: full_adder_8bit 
    port map (
        A => A,
        B => B_xor_Cin,
		  clk => clk,
        Cin => Cin,
        Sum => output,
        Cout => C_temp
    );
	 
	 
process (clk , A , B)
	variable counter : integer range 0 to 8 := 0;
begin
	if rising_edge(clk)then
			counter:= counter +1;
			if counter = 8 then
				Y<= output;
				Cout <= C_temp;
				counter := 0;
			end if;
	end if;
end process;
end Behavioral;
