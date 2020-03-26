library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity universal_counter is Port ( 
clk : in STD_LOGIC;
rst : in STD_LOGIC; 
up_down : in STD_LOGIC; 
enable : in STD_LOGIC;
clockout : out std_logic;
result : out STD_LOGIC_VECTOR (31 downto 0));
end universal_counter;
architecture Behavioral of universal_counter is
signal count : unsigned (31 downto 0) := x"00000000";
signal c: std_logic := '0' ;
begin
process (clk, rst, enable, up_down, count, c)
begin
if (clk = '1' and clk'event) then
if (rst = '1') then
count <= (others => '0');
elsif (enable = '1') then
if (up_down = '1') then
count <= count + 1;
else
count <= count - 1;
end if;
end if;
if (count = 50000000) then 
c <= not c;
count <= (others => '0');
end if;
end if;


end process;
result <= std_logic_vector(count);
clockout <= std_logic(c);
end Behavioral;