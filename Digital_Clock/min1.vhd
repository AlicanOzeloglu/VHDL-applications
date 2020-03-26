library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity min1 is Port ( 
clk : in STD_LOGIC;
rst : in STD_LOGIC; 
enable : in STD_LOGIC;
up_down : in STD_LOGIC;
input : in std_logic;
output : out std_logic;
result : out STD_LOGIC_VECTOR (3 downto 0));
end min1;

architecture Behavioral of min1 is

signal count : unsigned (3 downto 0) := (others => '0');
signal soutput : std_logic := '0';


begin

process (clk, rst, enable, input, up_down)

begin

if (rst = '1') then
count <= (others => '0');
elsif (input = '1') then

if (clk = '1' and clk'event) then
	if (enable = '1') then
		if (up_down = '1') then
			if (count = 9) then
				count <= (others => '0');
				soutput <= '1';
			else
				count <= count + 1;	
				soutput <= '0';
			end if;	
		else
			if (count = 0) then
				count <= "1001";	
				soutput <= '1';
			else
				count <= count - 1;	
				soutput <= '0';
			end if;
		end if;
	end if ;
end if ;
end if;
end process;

result <= std_logic_vector(count);
output <= soutput;

end Behavioral;