----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:47:53 11/15/2020 
-- Design Name: 
-- Module Name:    Lab2Module1 - Behavioral 
-- Project Name: 
-- Target Devices: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab2Module1 is
		Port	(	A	:	in		STD_LOGIC_VECTOR	(3 downto 0);
					B	:	in		STD_LOGIC_VECTOR	(3 downto 0);
					E  :  out	STD_LOGIC);				-- output 1 when A=B
end Lab2Module1;

architecture Behavioral of Lab2Module1 is

begin
	
	E <= (A(3) XNOR B(3)) AND (A(2) XNOR B(2)) AND (A(1) XNOR B(1)) AND (A(0) XNOR B(0));		--checking whether all the bits are the same

end Behavioral;

