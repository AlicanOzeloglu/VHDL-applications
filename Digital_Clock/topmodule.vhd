----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:02 11/13/2018 
-- Design Name: 
-- Module Name:    topmodule - Behavioral 
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

entity topmodule is
    Port ( clk : in  STD_LOGIC;
           up_down : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           upper_limit : in  STD_LOGIC_VECTOR (3 downto 0);
           enable_out : out  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (3 downto 0));
end topmodule;

architecture Behavioral of topmodule is

component seven_four is
    Port ( in1 : in  STD_LOGIC_VECTOR (3 downto 0);
           in2 : in  STD_LOGIC_VECTOR (3 downto 0);
           in3 : in  STD_LOGIC_VECTOR (3 downto 0);
           in4 : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
			  dp  : out  STD_LOGIC;
           sel : out  STD_LOGIC_VECTOR (3 downto 0);
           segment : out  STD_LOGIC_VECTOR (6 downto 0)
			);
end component;

component converter is
Port ( clk : in STD_LOGIC;
enable : in STD_LOGIC;
clock_out : out STD_LOGIC);
end component;

component sec1 is Port ( 
clk : in STD_LOGIC;
rst : in STD_LOGIC; 
enable : in STD_LOGIC;
up_down : in STD_LOGIC;
output : out std_logic;
result : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component sec10 is
    Port ( clk : in  STD_LOGIC;
			  input : in std_logic;
           enable : in  STD_LOGIC;
			  up_down : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC);
end component;

component min1 is Port ( clk : in STD_LOGIC;
								rst : in STD_LOGIC; 
								enable : in STD_LOGIC;
								up_down : in STD_LOGIC;
								input : in std_logic;
								output : out std_logic;
								result : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component min10 is
    Port ( clk : in  STD_LOGIC;
			  input : in std_logic;
           enable : in  STD_LOGIC;
			  up_down : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC);
end component;



begin


end Behavioral;

