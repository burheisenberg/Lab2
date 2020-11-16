----------------------------------------------------------------------------------
-- Company:  		 Koç University
-- Engineer: 		 Burhan Karahasan
-- 
-- Create Date:    22:33:53 11/14/2020 
-- Design Name: 	
-- Module Name:    Lab2Module - Behavioral 
-- Project Name: 	 Binary Comparator
-- Target Devices: Prometheus
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab2Module3 is
		Port (	C		:	in STD_LOGIC_VECTOR (3 downto 0);
					D		:	in STD_LOGIC_VECTOR (3 downto 0);
					E		:	out STD_LOGIC;			-- output	1 when C=D
					GCD	:	out STD_LOGIC;			-- output	1 when C>D
					GDC	:	out STD_LOGIC);		-- output	1 when C<D
end Lab2Module3;

architecture Behavioral of Lab2Module3 is
--SIGNAL IN1	:	STD_LOGIC_VECTOR (3 downto 0) := (OTHERS => '0');
--SIGNAL IN2	:	STD_LOGIC_VECTOR (3 downto 0) := (OTHERS => '0');
SIGNAL 	SHIFT :	STD_LOGIC_VECTOR (3 downto 0) := (others => '0');	--comparison results bitwise and affected by the previous bit comparisons

begin

	--E <= (C(3) XNOR D(3)) AND (C(2) XNOR D(2)) AND (C(1) XNOR D(1)) AND (C(0) XNOR D(0));	--checking all the bits whether they are equal
	
	
	SHIFT(3) <=  C(3) XNOR D(3);
	SHIFT(2) <= (C(2) XNOR D(2)) AND SHIFT(3);
	SHIFT(1) <= (C(1) XNOR D(1)) AND SHIFT(2);
	SHIFT(0)	<= (C(0) XNOR D(0)) AND SHIFT(1);
	
	E <= SHIFT(0);
	GCD <= ((D(3) XOR C(3)) AND D(3))		OR 	((C(2) XOR D(2)) AND C(2) AND SHIFT(3)) 	OR 	 ((C(1) XOR D(1)) AND C(1) AND SHIFT(2))		OR 		((C(0) XOR D(0)) AND C(0) AND SHIFT(1));

	GDC <= ((C(3) XOR D(3)) AND C(3))		OR 	((D(2) XOR C(2)) AND D(2) AND SHIFT(3)) 	OR 	 ((D(1) XOR C(1)) AND D(1) AND SHIFT(2))		OR 		((D(0) XOR C(0)) AND D(0) AND SHIFT(1));


end Behavioral;

