
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (2 downto 0);
			  Cin : in std_logic;
           clk : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (7 downto 0);
           C : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

component AND_8bit is
    Port ( clk : in std_logic;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0)
);
end component;

component XOR_8bit is
    Port ( clk : in std_logic;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0));
end component; 



component OR_8bit is
    Port ( clk : in std_logic;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component AddSub is
    Port ( 
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
			  clk : in std_logic;
           Y : out  STD_LOGIC_VECTOR (7 downto 0);
           Cout : out  STD_LOGIC
);
end component;

component Multiplier_8bit is
    Port (
        A : in  STD_LOGIC_VECTOR (7 downto 0);
        B : in  STD_LOGIC_VECTOR (7 downto 0);
		  clk : in std_logic;
        Y : out STD_LOGIC_VECTOR (15 downto 0)
    );
end component;


component division is
    port (
        A        : in std_logic_vector(7 downto 0);
        B        : in std_logic_vector(7 downto 0);
        clk      : in std_logic;
        Y        : out std_logic_vector(7 downto 0);
        OverFlow : out std_logic
    );
end component;

signal XoRR : std_logic_vector(7 downto 0);
signal oRR : std_logic_vector(7 downto 0);
signal ANDD : std_logic_vector(7 downto 0);
signal Add_Subb : std_logic_vector(7 downto 0);
signal Mult : std_logic_vector(15 downto 0);
signal divi	 : std_logic_vector(7 downto 0);
signal C_temp : std_logic_vector(1 downto 0);

signal B_temp : std_logic_vector(7 downto 0);

begin
B_temp <= "0000" & B;
F1 : AND_8bit port map(clk ,A,B_temp,ANDD);
F2 : OR_8bit port map(clk ,A,B_temp,oRR);
F3 : XOR_8bit port map(clk ,A,B_temp,XoRR);
F4 : AddSub port map(A,B_temp,Cin ,clk,Add_Subb,C_temp(0));
F5 : Multiplier_8bit port map(A,B_temp,clk,mult);
F6 : division port map(A,B_temp,clk,divi,C_temp(1));



	process( clk , A, B , S) begin
		if rising_edge(clk)then
			case S is
				when "000" =>
					Y<=  ANDD;
					C<= '0';
				when "001" =>
					Y<=  oRR;
					C <= '0';
				when "010" =>
					Y<=  XoRR;
					C<= '0';
				when "011" =>
					Y<=  Add_Subb;
					C <= C_temp(0);
				when "100" =>
					Y<= Mult(7 downto 0); 
					C<= '0';
				when "101" =>
					Y<=  divi;
					C<= C_temp(1);
				when others =>
					Y <="00000000";
					C <= '0';
				end case;	
		end if;
	end process;

end Behavioral;

