----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:35:53 10/20/2018 
-- Design Name: 
-- Module Name:    four_bit_subtract - Behavioral 
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

entity four_bit_subtract is
Port( a1 : in STD_LOGIC_VECTOR(3 downto 0);
a2 : in STD_LOGIC_VECTOR(3 downto 0);
out1 : out STD_LOGIC_VECTOR(3 downto 0));
end four_bit_subtract;

architecture Behavioral of four_bit_subtract is
component four_bit_adder is
    Port ( in1 : in  STD_LOGIC_VECTOR (3 downto 0);
           in2 : in  STD_LOGIC_VECTOR (3 downto 0);
           sout : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end component;
signal n1, n2, sonuc : std_logic_vector(3 downto 0);
signal carry, carry2 : std_logic ;


begin
n1 <= (not a2) ;

S1 : four_bit_adder port map (a1 (3 downto 0), n1 (3 downto 0), n2(3 downto 0), carry);
S2 : four_bit_adder port map (n2 (3 downto 0), "0001", out1, open );




end Behavioral;

