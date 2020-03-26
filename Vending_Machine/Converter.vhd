

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity converter is
Port ( clk : in STD_LOGIC;
clock_out : out STD_LOGIC);
end converter;

architecture Behavioral of converter is

signal count : unsigned (31 downto 0):= x"00000000";
signal sclock_out : std_logic := '0';
 
begin

process (clk)

begin

if (clk = '1' and clk'event) then
		if(count=49999999) then
			sclock_out <= not sclock_out;
			count <= count + 1;
		elsif (count = 99999999) then
			sclock_out <= not sclock_out;
			count <= x"00000000";
		else
		   count <= count + 1;
	end if;
end if ;


end process;

clock_out <= sclock_out;

end Behavioral;