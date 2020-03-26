----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:59:51 11/28/2018 
-- Design Name: 
-- Module Name:    FSM_sequence_detector - Behavioral 
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

entity FSM_sequence_detector is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           input : in  STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (7 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (7 downto 0);
           seg_sel : out  STD_LOGIC_VECTOR (7 downto 0));
end FSM_sequence_detector;

architecture Behavioral of FSM_sequence_detector is

type fsm_states is (start, c1, c11, c110, c1101, c111, c1110);

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
clock_out : out STD_LOGIC);
end component;

component register1 is
    Port ( clk : in std_logic;
			  reset : in std_logic;
			  enable : in std_logic;
			  input : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal current_state, next_state : fsm_states;
signal out1,out2,out3,out4,out5,out6,out7, clk_out, w4 : std_logic;
signal count1 : unsigned (3 downto 0 ) := "0000";
signal count2 : unsigned (3 downto 0 ) := "0000";
signal in1, in2, in3 : std_logic_vector(3 downto 0);
signal seg_sel_4 : STD_LOGIC_VECTOR (3 downto 0);
signal w5 : STD_LOGIC_VECTOR (6 downto 0);

begin

process (clk_out, reset)
begin
if (reset = '1') then 
	current_state <= start;
	elsif (clk_out'event and clk_out = '1') then
		current_state <= next_state;
end if ;
end process;

process (current_state, input)
begin
	case current_state is
		when start =>
			if (input = '1') then
				next_state <= c1;
			else
				next_state <= start;
			end if;
		when c1 =>
			if (input = '1') then
				next_state <= c11;
			else
				next_state <= start;
			end if;
		when c11 =>
			if (input = '1') then
				next_state <= c111;
			else
				next_state <= c110;
			end if;
		when c110 =>
			if (input = '1') then
				next_state <= c1101;
			else
				next_state <= start;
			end if;
		when c1101 =>
			if (input = '1') then
				next_state <= c11;
			else
				next_state <= start;
			end if;
		when c111 =>
			if (input = '1') then
				next_state <= c111;
			else
				next_state <= c1110;
			end if;
		when c1110 =>
			if (input = '1') then
				next_state <= c1101;
			else
				next_state <= start;
			end if;
	end case;
end process;

process (current_state)
begin
out1 <= '0';
out2 <= '0';
out3 <= '0';
out4 <= '0';
out5 <= '0';
out6 <= '0';
out7 <= '0';
case current_state is 
	when start =>
		out1 <= '1';
	when c1 =>
		out2 <= '1';
	when c11 =>
		out3 <= '1';
	when c110 =>
		out4 <= '1';
	when c1101 =>
		out5 <= '1';
	when c111 =>
		out6 <= '1';
	when c1110 =>
		out7 <= '1';
end case;
end process;

process (clk_out, out5, out7, enable , reset)
begin 
if (reset = '1') then
count1 <= (others => '0');
count2 <= (others => '0');
	elsif (clk_out'event and clk_out = '1') then
		if (enable = '1') then
			if (out5 = '1') then
				count1 <= count1 + 1;
			end if;	
			if (out7 = '1') then
				count2 <= count2 + 1;
			end if;
		end if;
end if;
end process;

in1 <= std_logic_vector(count1);
in2 <= std_logic_vector(count2);

A1 : converter port map(clk, clk_out);
A2 : register1 port map(clk_out, reset, enable, input, leds);
A3 : seven_four port map(in1, in2, in3, "0000", clk, w4,seg_sel_4,w5 );

seg_out <= (w5 & w4);

seg_sel <= "1111" & seg_sel_4;

in3 <= "0001" when out1 = '1' else
		 "0010" when out2 = '1' else
		 "0011" when out3 = '1' else
		 "0100" when out4 = '1' else
		 "0101" when out5 = '1' else
		 "0110" when out6 = '1' else
		 "0111" when out7 = '1' else
		 "0000";


end Behavioral;

