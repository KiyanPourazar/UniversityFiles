--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:02:17 05/20/2024
-- Design Name:   
-- Module Name:   C:/Users/vboxuser/Desktop/ise/ALU/ALU_lab9_tb.vhd
-- Project Name:  ALU

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_lab9_tb IS
END ALU_lab9_tb;
 
ARCHITECTURE behavior OF ALU_lab9_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         S : IN  std_logic_vector(2 downto 0);
         Cin : IN  std_logic;
         clk : IN  std_logic;
         Y : OUT  std_logic_vector(7 downto 0);
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal S : std_logic_vector(2 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Y : std_logic_vector(7 downto 0);
   signal C : std_logic;

   -- Clock period definitions
   constant clk_period : time := 30 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          S => S,
          Cin => Cin,
          clk => clk,
          Y => Y,
          C => C
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		A <= "00001010";
		B<= "0011";
		Cin <= '0';
		S<= "000";
      wait for clk_period*20;
		S<= "001";
      wait for clk_period*20;
		S<= "010";
      wait for clk_period*20;
		S<= "011";
      wait for clk_period*20;
		S<= "011";
		Cin <= '1';
      wait for clk_period*20;
		S<= "100";
      wait for clk_period*20;
		S<= "101";
      wait for clk_period*20;

      wait;
   end process;

END;
