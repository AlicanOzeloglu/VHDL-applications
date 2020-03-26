----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:17 11/28/2018 
-- Design Name: 
-- Module Name:    register - Behavioral 
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

entity register1 is
    Port ( clk : in std_logic;
			  reset : in std_logic;
			  enable : in std_logic;
			  input : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end register1;

architecture Behavioral of register1 is

signal soutput : std_logic_vector(7 downto 0) := "00000000";


begin
process (clk, reset, enable)
begin

if (reset = '1') then
soutput <= (others => '0');
	elsif(clk'event and clk = '1') then
		if (enable = '1') then
			soutput(7 downto 1) <= soutput (6 downto 0);
			soutput (0) <= input;
		end if;
end if;

end process;

output <= soutput ;

end Behavioral;

