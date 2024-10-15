library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier_8bit is
    Port (
        A : in  STD_LOGIC_VECTOR (7 downto 0);
        B : in  STD_LOGIC_VECTOR (7 downto 0);
		  clk : in std_logic;
        Y : out STD_LOGIC_VECTOR (15 downto 0)
    );
end Multiplier_8bit;

architecture Behavioral of Multiplier_8bit is

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

signal sum_temp : std_logic_vector(47 downto 0);
signal C_temp : std_logic_vector(5 downto 0);
signal Y_temp : std_logic_vector(15 downto 0);

signal A_B_1 : std_logic_vector (7 downto 0);
signal A_B_2 : std_logic_vector (7 downto 0);
signal A_B_3 : std_logic_vector (7 downto 0);
signal A_B_4 : std_logic_vector (7 downto 0);
signal A_B_5 : std_logic_vector (7 downto 0);
signal A_B_6 : std_logic_vector (7 downto 0);
signal A_B_7 : std_logic_vector (7 downto 0);
signal A_B_8 : std_logic_vector (7 downto 0);
signal A_B_9 : std_logic_vector (7 downto 0);
signal A_B_10 : std_logic_vector (7 downto 0);
signal A_B_11: std_logic_vector (7 downto 0);
signal A_B_12: std_logic_vector (7 downto 0);
signal A_B_13: std_logic_vector (7 downto 0);
signal A_B_14: std_logic_vector (7 downto 0);

begin

    Y_temp(0) <= A(0) and B(0);
	 
	A_B_1 <= '0' & (A(7) and B(0)) & (A(6) and B(0)) & (A(5) and B(0)) & (A(4) and B(0)) & (A(3) and B(0)) & (A(2) and B(0)) & (A(1) and B(0));
	A_B_2 <= (A(7) and B(1)) & (A(6) and B(1)) & (A(5) and B(1)) & (A(4) and B(1)) & (A(3) and B(1)) & (A(2) and B(1)) & (A(1) and B(1)) & (A(0) and B(1));
	
    FA1: full_adder_8bit port map (
        A_B_1,
        A_B_2,
			clk,
        '0',
         sum_temp(7 downto 0),
         C_temp(0)
    );
	
	A_B_3 <= C_temp(0) & sum_temp(7 downto 1);
	A_B_4 <=(A(7) and B(2)) & (A(6) and B(2)) & (A(5) and B(2)) & (A(4) and B(2)) & (A(3) and B(2)) & (A(2) and B(2)) & (A(1) and B(2)) & (A(0) and B(2));
	
    FA2: full_adder_8bit port map (
        A_B_3,
        A_B_4,
		   clk,
         '0',
        sum_temp(15 downto 8),
         C_temp(1)
    );
		
		
	A_B_5 <=C_temp(1) & sum_temp(15 downto 9);
   A_B_6 <=	(A(7) and B(3)) & (A(6) and B(3)) & (A(5) and B(3)) & (A(4) and B(3)) & (A(3) and B(3)) & (A(2) and B(3)) & (A(1) and B(3)) & (A(0) and B(3));
    FA3: full_adder_8bit port map (
        A_B_5,
        A_B_6,
         clk,
		   '0',
         sum_temp(23 downto 16),
         C_temp(2)
    );
	 
	 A_B_7<= C_temp(2) & sum_temp(23 downto 17);
	 A_B_8<=(A(7) and B(4)) & (A(6) and B(4)) & (A(5) and B(4)) & (A(4) and B(4)) & (A(3) and B(4)) & (A(2) and B(4)) & (A(1) and B(4)) & (A(0) and B(4));
	 

    FA4: full_adder_8bit port map (
        A_B_7,
        A_B_8,
        clk,
		  '0',
       sum_temp(31 downto 24),
        C_temp(3)
    );
		
		
		A_B_9<=C_temp(3) & sum_temp(31 downto 25);
		A_B_10<=(A(7) and B(5)) & (A(6) and B(5)) & (A(5) and B(5)) & (A(4) and B(5)) & (A(3) and B(5)) & (A(2) and B(5)) & (A(1) and B(5)) & (A(0) and B(5));

    FA5: full_adder_8bit port map (
        A_B_9,
        A_B_10,
        clk,
		 '0',
       sum_temp(39 downto 32),
        C_temp(4)
    );


		A_B_11<=C_temp(4) & sum_temp(39 downto 33);
		A_B_12<=(A(7) and B(6)) & (A(6) and B(6)) & (A(5) and B(6)) & (A(4) and B(6)) & (A(3) and B(6)) & (A(2) and B(6)) & (A(1) and B(6)) & (A(0) and B(6));
		
    FA6: full_adder_8bit port map (
        A_B_11,
        A_B_12,
       clk,
		  '0',
        sum_temp(47 downto 40),
         C_temp(5)
    );
	 
	 A_B_13<=C_temp(5) & sum_temp(47 downto 41);
	 A_B_14<=(A(7) and B(7)) & (A(6) and B(7)) & (A(5) and B(7)) & (A(4) and B(7)) & (A(3) and B(7)) & (A(2) and B(7)) & (A(1) and B(7)) & (A(0) and B(7));

    FA7: full_adder_8bit port map (
       A_B_13,
       A_B_14,
       clk,
		  '0',
        Y_temp(14 downto 7),
        Y_temp(15)
    );
    Y_temp(1) <= sum_temp(0);
    Y_temp(2) <= sum_temp(8);
    Y_temp(3) <= sum_temp(16);
    Y_temp(4) <= sum_temp(24);
    Y_temp(5) <= sum_temp(32);
    Y_temp(6) <= sum_temp(40);

	process(clk ) 
	variable counter : integer range 0 to 19 := 0;
	begin
	if rising_edge(clk) then
			if counter = 19 then
				Y <= Y_temp;
				counter := 0;
			else
			counter := counter+1;
			end if;

	end if;
	end process;

end Behavioral;
