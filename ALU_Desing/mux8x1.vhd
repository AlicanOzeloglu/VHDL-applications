----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:11:36 10/21/2018 
-- Design Name: 
-- Module Name:    mux8x1 - Behavioral 
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

entity mux8x1 is
    Port ( I0 : in  STD_LOGIC_VECTOR (3 downto 0);
           I1 : in  STD_LOGIC_VECTOR (3 downto 0);
           I2 : in  STD_LOGIC_VECTOR (3 downto 0);
           I3 : in  STD_LOGIC_VECTOR (3 downto 0);
           I4 : in  STD_LOGIC_VECTOR (3 downto 0);
           I5 : in  STD_LOGIC_VECTOR (3 downto 0);
           I6 : in  STD_LOGIC_VECTOR (3 downto 0);
           I7 : in  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC_VECTOR (2 downto 0);
           o : out  STD_LOGIC_VECTOR (3 downto 0));
end mux8x1;

architecture Behavioral of mux8x1 is

begin
with s select
o <= I0 when "000",
	I1 when "001",
	I2 when "010",
	I3 when "011",
	I4 when "100",
	I5 when "101",
	I6 when "110",
	I7 when others;


end Behavioral;

