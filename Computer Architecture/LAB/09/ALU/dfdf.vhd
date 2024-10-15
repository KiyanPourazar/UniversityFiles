library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity full_adder_8bit is
    Port (  
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
		  clk : in std_logic;
        Cin : in std_logic;
        Sum : out std_logic_vector(7 downto 0);
        Cout : out std_logic
    );
end full_adder_8bit;

architecture Structural of full_adder_8bit is
    component full_adder_1bit is
        Port (   
            A : in std_logic;
            B : in std_logic;
				clk : in std_logic;
            Cin : in std_logic;
            Sum : out std_logic;
            Cout : out std_logic
        );
    end component;
    signal c_temp : std_logic_vector(6 downto 0);
begin
    F0: full_adder_1bit port map ( A(0), B(0), clk,Cin, Sum(0), c_temp(0));
    F1: full_adder_1bit port map ( A(1), B(1), clk,c_temp(0), Sum(1), c_temp(1));
    F2: full_adder_1bit port map ( A(2), B(2), clk,c_temp(1), Sum(2), c_temp(2));
    F3: full_adder_1bit port map ( A(3), B(3), clk,c_temp(2), Sum(3), c_temp(3));
    F4: full_adder_1bit port map ( A(4), B(4), clk,c_temp(3), Sum(4), c_temp(4));
    F5: full_adder_1bit port map ( A(5), B(5), clk,c_temp(4), Sum(5), c_temp(5));
    F6: full_adder_1bit port map ( A(6), B(6), clk,c_temp(5), Sum(6), c_temp(6));
    F7: full_adder_1bit port map ( A(7), B(7), clk,c_temp(6), Sum(7), Cout);

end Structural;
