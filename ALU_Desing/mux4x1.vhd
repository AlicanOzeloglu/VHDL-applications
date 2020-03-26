----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:37:29 10/26/2018 
-- Design Name: 
-- Module Name:    mux4x1 - Behavioral 
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

entity mux4x1 is
    Port ( I0 : in  STD_LOGIC_VECTOR (3 downto 0);
	 I1 : in  STD_LOGIC_VECTOR (3 downto 0);
	 I2 : in  STD_LOGIC_VECTOR (3 downto 0);
	 I3 : in  STD_LOGIC_VECTOR (3 downto 0);
           S0 : in  STD_LOGIC;
			  S1 : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (3 DOWNTO 0));
end mux4x1;

architecture Behavioral of mux4x1 is

begin

Output <= I0 when S0 = '0' and S1 = '0' else
			I1 when S0 = '0' and S1 = '1' else
			I2 when S0 = '1' and S1 = '0' else
			I3 ;
			


end Behavioral;

