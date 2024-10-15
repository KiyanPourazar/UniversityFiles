
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY multi_tb IS
END multi_tb;
 
ARCHITECTURE behavior OF multi_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplier_8bit
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         start : IN  std_logic;
         Y : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal start : std_logic := '0';

 	--Outputs
   signal Y : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplier_8bit PORT MAP (
          A => A,
          B => B,
          clk => clk,
          start => start,
          Y => Y
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
		A<= "11111111";
		B<= "11111111";
		start<= '1';
      wait for clk_period*20;
		
		A<= "00111111";
		B<= "01110011";
		start<= '1';
      wait for clk_period*20;
		
		A<= "11111111";
		B<= "11111111";
		start<= '0';
      wait for clk_period*15;

      wait;
   end process;

END;
