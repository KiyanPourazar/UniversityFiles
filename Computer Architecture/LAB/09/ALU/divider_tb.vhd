--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:46:04 05/19/2024
-- Design Name:   
-- Module Name:   C:/Users/vboxuser/Desktop/ise/ALU/divider_tb.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Divider
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY divider_tb IS
END divider_tb;
 
ARCHITECTURE behavior OF divider_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Divider
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         start : IN  std_logic;
         Y : OUT  std_logic_vector(7 downto 0);
         Q : OUT  std_logic_vector(7 downto 0);
         Cout : OUT  std_logic;
			Ready : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal start : std_logic := '0';

 	--Outputs
   signal Y : std_logic_vector(7 downto 0);
   signal Q : std_logic_vector(7 downto 0);
   signal Cout : std_logic;
	signal Ready : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Divider PORT MAP (
          A => A,
          B => B,
          clk => clk,
          start => start,
          Y => Y,
          Q => Q,
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
		A<= "11111111";
		B<= "11111111";
		start<= '1';
      wait for clk_period*10;
		
		A<= "00111111";
		B<= "00110000";
		start<= '1';
      wait for clk_period*10;
		
		A<= "11111111";
		B<= "11111111";
		start<= '0';
      wait for clk_period*10;

      wait;
   end process;

END;
