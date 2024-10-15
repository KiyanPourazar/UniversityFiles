
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ADD_SUB_tb IS
END ADD_SUB_tb;
 
ARCHITECTURE behavior OF ADD_SUB_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AddSub
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Cin : IN  std_logic;
         clk : IN  std_logic;
         start : IN  std_logic;
         Y : OUT  std_logic_vector(7 downto 0);
         Cout : OUT  std_logic;
         Ready : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal clk : std_logic := '0';
   signal start : std_logic := '0';

 	--Outputs
   signal Y : std_logic_vector(7 downto 0);
   signal Cout : std_logic;
   signal Ready : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AddSub PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          clk => clk,
          start => start,
          Y => Y,
          Cout => Cout,
          Ready => Ready
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
		A<= "00000001";
		B<= "00000011";
		start<= '1';
		Cin <= '0';
      wait for clk_period*10;
		
		A<= "00110001";
		B<= "00000011";
		start<= '1';
		Cin <= '1';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
