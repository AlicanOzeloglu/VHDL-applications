--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:26:36 10/21/2018
-- Design Name:   
-- Module Name:   D:/ise projects/lab4/subtest.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: four_bit_subtract
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
 
ENTITY subtest IS
END subtest;
 
ARCHITECTURE behavior OF subtest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT four_bit_subtract
    PORT(
         a1 : IN  std_logic_vector(3 downto 0);
         a2 : IN  std_logic_vector(3 downto 0);
         out1 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a1 : std_logic_vector(3 downto 0) := (others => '0');
   signal a2 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal out1 : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: four_bit_subtract PORT MAP (
          a1 => a1,
          a2 => a2,
          out1 => out1
        );

   -- Clock process definitions
  -- <clock>_process :process
  -- begin
	--	<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
a1 <= "0101";
a2 <= "0010";		

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
