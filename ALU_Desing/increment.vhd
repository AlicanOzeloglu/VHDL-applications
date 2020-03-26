----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:38:24 10/20/2018 
-- Design Name: 
-- Module Name:    increment - Behavioral 
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

entity increment is
Port( a1 : in STD_LOGIC_VECTOR(3 downto 0);
carry: out STD_LOGIC;
out1 : out STD_LOGIC_VECTOR(3 downto 0));
end increment;

architecture Behavioral of increment is
component four_bit_adder is
    Port ( in1 : in  STD_LOGIC_VECTOR (3 downto 0);
           in2 : in  STD_LOGIC_VECTOR (3 downto 0);
           sout : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end component;

begin
I1 : four_bit_adder port map (a1 (3 downto 0), "0001", out1 (3 downto 0), carry);


end Behavioral;

