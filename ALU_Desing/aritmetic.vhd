----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:22:08 10/26/2018 
-- Design Name: 
-- Module Name:    aritmetic - Behavioral 
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

entity aritmetic is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
			  B : in STD_LOGIC_VECTOR (3 downto 0);
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end aritmetic;

architecture Behavioral of aritmetic is
component four_bit_adder is
    Port ( in1 : in  STD_LOGIC_VECTOR (3 downto 0);
           in2 : in  STD_LOGIC_VECTOR (3 downto 0);
           sout : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end component;
component four_bit_subtract
Port( a1 : in STD_LOGIC_VECTOR(3 downto 0);
a2 : in STD_LOGIC_VECTOR(3 downto 0);
out1 : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component increment
Port( a1 : in STD_LOGIC_VECTOR(3 downto 0);
carry: out STD_LOGIC;
out1 : out STD_LOGIC_VECTOR(3 downto 0));
end component;
component decrement
Port( a1 : in STD_LOGIC_VECTOR(3 downto 0);
out1 : out STD_LOGIC_VECTOR(3 downto 0));
end component;
signal addout, subout, decout, incout : std_logic_vector (3 downto 0);

begin
A1: four_bit_adder port map(A , B , addout, open);
A2: four_bit_subtract port map(A, B, subout);
A3: increment port map(A, open, incout);
A4: decrement port map (A, decout);

Output <= addout when S0='0' and S1='0' else
			subout when S0='0' and S1='1' else
			incout when S0='1' and S1='0' else
			decout ;


end Behavioral;

