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
 
ENTITY Lab2Bench2 IS
END Lab2Bench2;
 
ARCHITECTURE behavior OF Lab2Bench2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab2Module2
    Port (		A		:	in STD_LOGIC_VECTOR (3 downto 0);
					B		:	in STD_LOGIC_VECTOR (3 downto 0);
					E		:	out STD_LOGIC;			-- output	1 when A=B
					GAB	:	out STD_LOGIC;			-- output	1 when A>B
					GBA	:	out STD_LOGIC);		--	output   1 when A<B
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector (3 downto 0) := (others => '0');
   signal B : std_logic_vector (3 downto 0) := (others => '0');

 	--Outputs
   signal E : std_logic;
	signal GAB : std_logic;
	signal GBA : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab2Module2 PORT MAP (
         A => A,
			B => B,
			E => E,
			GAB => GAB,
			GBA => GBA
        );
	stim_proc: process
	begin
		A <= "0000"; B <= "0000";
		wait for Clock_period;
		A <= "0101"; B <= "0010";
		wait for Clock_period;
		A <= "0010"; B <= "0101";
		wait for Clock_period;
		A <= "0010"; B <= "0001";
		wait for Clock_period;
		A <= "0100"; B <= "1011";
		wait for Clock_period;
		A <= "1011"; B <= "0100";
		wait for Clock_period;
		A <= "0000"; B <= "0000";
      wait;
   end process;

END;
