----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:46:49 11/12/2018 
-- Design Name: 
-- Module Name:    sec10 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity min10 is
    Port ( clk : in  STD_LOGIC;
			  input : in std_logic;
           enable : in  STD_LOGIC;
			  up_down : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (3 downto 0));
end min10;

architecture Behavioral of min10 is

signal count : unsigned (3 downto 0) := (others => '0');

begin

process (clk, rst, enable, input, up_down)

begin

if (rst = '1') then
count <= (others => '0');
elsif (input = '1') then

if (clk = '1' and clk'event) then
	if (enable = '1') then
		if (up_down = '1') then
			if (count = 5) then
				count <= (others => '0');
			else
				count <= count + 1;	
			end if;	
		else
			if (count = 0) then
				count <= "0101";	
			else
				count <= count - 1;	
			end if;		
		end if;		
	end if ;
end if ;
end if;
end process;
result <= std_logic_vector(count);


end Behavioral;

