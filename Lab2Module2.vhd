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

entity Lab2Module2 is
		Port (	A		:	in STD_LOGIC_VECTOR (3 downto 0);
					B		:	in STD_LOGIC_VECTOR (3 downto 0);
					E		:	out STD_LOGIC;			-- output	1 when A=B
					GAB	:	out STD_LOGIC;			-- output	1 when A>B
					GBA	:	out STD_LOGIC);		-- output	1 when A<B
end Lab2Module2;

architecture Behavioral of Lab2Module2 is
--SIGNAL IN1	:	STD_LOGIC_VECTOR (3 downto 0) := (OTHERS => '0');
--SIGNAL IN2	:	STD_LOGIC_VECTOR (3 downto 0) := (OTHERS => '0');
SIGNAL 	SHIFT :	STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

begin

	E <= (A(3) XNOR B(3)) AND (A(2) XNOR B(2)) AND (A(1) XNOR B(1)) AND (A(0) XNOR B(0));	--checking all the bits whether they are equal
	
	GAB <= ((A(3) XOR B(3)) AND A(3))     OR     ((A(3) XNOR B(3)) AND (A(2) XOR B(2)) AND A(2))     OR     ((A(2) XNOR B(2)) AND (A(1) XOR B(1)) AND A(1) AND (A(3) XNOR B(3)))     OR     ((A(1) XNOR B(1)) AND (A(0) XOR B(0)) AND A(0) AND (A(3) XNOR B(3)) AND (A(2) XNOR B(2)));
	
	
	SHIFT(3) <=  B(3) XNOR A(3);
	SHIFT(2) <= (B(2) XNOR A(2)) AND SHIFT(3);
	SHIFT(1) <= (B(1) XNOR A(1)) AND SHIFT(2);
	SHIFT(0)	<= (B(0) XNOR A(0)) AND SHIFT(1);
	GBA <= ((B(3) XOR A(3)) AND B(3))		OR 	((B(2) XOR A(2)) AND B(2) AND SHIFT(3)) 	OR 	 ((B(1) XOR A(1)) AND B(1) AND SHIFT(2))		OR 		((B(0) XOR A(0)) AND B(0) AND SHIFT(1));


end Behavioral;

