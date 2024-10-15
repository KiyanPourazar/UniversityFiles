--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:30:08 05/19/2024
-- Design Name:   
-- Module Name:   C:/Users/vboxuser/Desktop/ise/ALU/OR_tb.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: OR_8bit
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
 
ENTITY OR_tb IS
END OR_tb;
 
ARCHITECTURE behavior OF OR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OR_8bit
    PORT(
         clk : IN  std_logic;
         start : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Y : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OR_8bit PORT MAP (
          clk => clk,
          start => start,
          A => A,
          B => B,
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
 		A<= "11111110";
		B<= "01111111";
		start <= '1';
      wait for clk_period*4;
		
		A<= "11011111";
		B<= "01011111";
		start <= '1';
      wait for clk_period*4;
		
		A<= "10111110";
		B<= "01111111";
		start <= '0';
      wait for clk_period*4;

      -- insert stimulus here 

      wait;

   end process;

END;
