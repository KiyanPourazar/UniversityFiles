--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:56:11 05/20/2024
-- Design Name:   
-- Module Name:   Z:/A09/tb.vhd
-- Project Name:  A09
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
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
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          a => a,
          b => b,
          sel => sel,
          o => o
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		sel <= "000";
		a <= "00100010";
		b <= "00001010";
      wait for 100 ns;
		sel <= "001";
		a <= "00100010";
		b <= "00001010";
      wait for 100 ns;	
		sel <= "011";
		a <= "00100010";
		b <= "00001010";
      wait for 100 ns;	
		sel <= "101";
		a <= "00000110";
		b <= "00001010";
      wait for 100 ns;	
		sel <= "110";
		a <= "01000010";
		b <= "00000110";
      wait for 100 ns;		


      -- insert stimulus here 

      wait;
   end process;

END;
