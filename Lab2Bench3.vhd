--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:12:39 10/24/2020
-- Design Name:   
-- Module Name:   C:/Users/Burhan/Documents/Xilinx Projects/Lab1/Lab1Sim.vhd
-- Project Name:  Lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lab1Code
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
 
ENTITY Lab2Bench3 IS
END Lab2Bench3;
 
ARCHITECTURE behavior OF Lab2Bench3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab2Module3
    Port (		C		:	in STD_LOGIC_VECTOR (3 downto 0);
					D		:	in STD_LOGIC_VECTOR (3 downto 0);
					E		:	out STD_LOGIC;			-- output	1 when C=D
					GCD	:	out STD_LOGIC;			-- output	1 when C>D
					GDC	:	out STD_LOGIC);		--	output   1 when C<D
    END COMPONENT;
    

   --Inputs
   signal C : std_logic_vector (3 downto 0) := (others => '0');
   signal D : std_logic_vector (3 downto 0) := (others => '0');

 	--Outputs
   signal E : std_logic;
	signal GCD : std_logic;
	signal GDC : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab2Module3 PORT MAP (
         C => C,
			D => D,
			E => E,
			GCD => GCD,
			GDC => GDC
        );
	stim_proc: process
	begin
		C <= "0000"; D <= "0000";
		wait for Clock_period;
		C <= "0100"; D <= "1011";
		wait for Clock_period;
		C <= "1011"; D <= "0100";
		wait for Clock_period;
		C <= "0010"; D <= "0001";
		wait for Clock_period;
		C <= "0011"; D <= "0001";
		wait for Clock_period;
		C <= "0010"; D <= "1000";
		wait for Clock_period;
		C <= "0000"; D <= "0000";
      wait;
   end process;

END;
