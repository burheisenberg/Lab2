--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:56:24 11/15/2020
-- Design Name:   
-- Module Name:   C:/Users/Burhan/Documents/Xilinx Projects/Lab2/Lab2Bench1.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lab2Module1
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
 
ENTITY Lab2Bench1 IS
END Lab2Bench1;
 
ARCHITECTURE behavior OF Lab2Bench1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab2Module1
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         E : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   
	--Outputs
	signal E : std_logic := '0';
	
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab2Module1 PORT MAP (
          A => A,
          B => B,
          E => E
        );

   -- Stimulus process
   stim_proc: process
	begin
		A <= "0000"; B <= "0000";
		wait for Clock_period;
		A <= "0000"; B <= "0001";
		wait for Clock_period;
		A <= "0001"; B <= "0001";
		wait for Clock_period;
		A <= "0010"; B <= "0001";
		wait for Clock_period;
		A <= "0011"; B <= "0001";
		wait for Clock_period;
		A <= "0010"; B <= "1000";
		wait for Clock_period;
		A <= "0000"; B <= "0000";
      wait;
   end process;

END;
