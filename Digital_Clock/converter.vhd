library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity converter is
Port ( clk : in STD_LOGIC;
enable : in STD_LOGIC;
clock_out : out STD_LOGIC);
end converter;

architecture Behavioral of converter is

 signal count : unsigned (31 downto 0):= x"00000000";
 
begin

process ( clk, enable)

begin

if (clk = '1' and clk'event) then
 
	if (enable = '1') then
 
		if(count=100000000) then
		
			count <= x"00000000";
		else
		   count <= count + 1;
      end if;

	end if;
 end if ;


end process;

clock_out <= '0' when (count<50000000) else 
            '1' ;

end Behavioral;