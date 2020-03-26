----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:22:28 12/12/2018 
-- Design Name: 
-- Module Name:    vending_machine - Behavioral 
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

entity vending_machine is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           item_select : in  STD_LOGIC_VECTOR (1 downto 0);
           request : in  STD_LOGIC;
           one_tl : in  STD_LOGIC;
           take_item : in  STD_LOGIC;
           ready : out  STD_LOGIC;
           seg_out : out  STD_LOGIC_VECTOR (7 downto 0);
           seg_sel : out  STD_LOGIC_VECTOR (7 downto 0));
end vending_machine;

architecture Behavioral of vending_machine is

component converter is
Port ( clk : in STD_LOGIC;
clock_out : out STD_LOGIC);
end component;


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

type fsm_states is (itemselect,water0,water1,chocolate0,chocolate1,chocolate2,coke0,coke1,coke2,coke3,cookies0,cookies1,cookies2,cookies3,cookies4);
signal current_state, next_state : fsm_states;
signal State : std_logic_vector (3 downto 0);
signal seg_sel_4 : STD_LOGIC_VECTOR (3 downto 0);
signal w5 : STD_LOGIC_VECTOR (6 downto 0);
signal w4, hz1 : std_logic;

begin
process (hz1, reset)
begin
	if (reset = '1') then
	current_state <= itemselect;
		elsif(hz1'event and hz1 = '1') then
			current_state <= next_state;
	end if;
end process;

process (item_select, one_tl, request, take_item, current_state)
begin
ready <= '0';
	case current_state is 
		when itemselect =>
			if (request = '0') then
				next_state <= itemselect;
				elsif (item_select = "00") then
					next_state <= water0;
				elsif (item_select = "01") then
					next_state <= chocolate0;
				elsif (item_select = "10") then
					next_state <= coke0;
				elsif (item_select = "11") then
					next_state <= cookies0;
			end if;
		when water0 =>
			if (one_tl = '1') then
				next_state <= water1;
			else
				next_state <= water0;
			end if;
		when water1 =>
		ready <= '1';
			if (take_item = '1') then
				next_state <= itemselect;
			else
				next_state <= water1;
			end if;
		when chocolate0 =>
			if (one_tl = '1') then 
				next_state <= chocolate1;
			else
				next_state <= chocolate0;
			end if;
		when chocolate1 =>
			if (one_tl = '1') then 
				next_state <= chocolate2;
			else
				next_state <= chocolate1;
			end if;
		when chocolate2 =>
		ready <= '1';
			if (take_item = '1') then 
				next_state <= itemselect;
			else
				next_state <= chocolate2;
			end if;
		when coke0 =>
			if (one_tl = '1') then 
				next_state <= coke1;
			else
				next_state <= coke0;
			end if;
		when coke1 =>
			if (one_tl = '1') then 
				next_state <= coke2;
			else
				next_state <= coke1;
			end if;
		when coke2 =>
			if (one_tl = '1') then 
				next_state <= coke3;
			else
				next_state <= coke2;
			end if;
		when coke3 =>
		ready <= '1';
			if (take_item= '1') then 
				next_state <= itemselect;
			else
				next_state <= coke3;
			end if;
		when cookies0 =>
			if (one_tl = '1') then
				next_state <= cookies1;
			else
				next_state <= cookies0;
			end if;
		when cookies1 =>
			if (one_tl = '1') then
				next_state <= cookies2;
			else
				next_state <= cookies1;
			end if;
		when cookies2 =>
			if (one_tl = '1') then
				next_state <= cookies3;
			else
				next_state <= cookies2;
			end if;
		when cookies3 =>
			if (one_tl = '1') then
				next_state <= cookies4;
			else
				next_state <= cookies3;
			end if;
		when cookies4 =>
		ready <= '1';
			if (take_item = '1') then
				next_state <= itemselect;
			else
				next_state <= cookies4;
			end if;
	end case;
end process;
				
A1: converter port map (clk , hz1);		
A2: seven_four port map (State, "0000", "0000", "0000",  clk, w4,seg_sel_4,w5 );

seg_out <= (w5 & w4);

seg_sel <= "1111" & seg_sel_4;
	
with current_state select
State <= "0000" when itemselect,
			"0001" when water0,
			"0010" when water1,
			"0011" when chocolate0,
			"0100" when chocolate1,
			"0101" when chocolate2,
			"0110" when coke0,
			"0111" when coke1,
			"1000" when coke2,
			"1001" when coke3,
			"1010" when cookies0,
			"1011" when cookies1,
			"1100" when cookies2,
			"1101" when cookies3,
			"1110" when others;


end Behavioral;

