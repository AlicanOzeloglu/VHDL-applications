library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_top is
Port( clk : in STD_LOGIC;
in1 : in STD_LOGIC_VECTOR (3 downto 0); --Firstoperand
in2 : in STD_LOGIC_VECTOR (3 downto 0); --Secondoperand
op_sel : in STD_LOGIC_VECTOR (3 downto 0); --Operationsellect
seg_out : out STD_LOGIC_VECTOR(7 downto 0);
seg_sel : out STD_LOGIC_VECTOR(7 downto 0));
end ALU_top;

architecture Behavioral of ALU_top is
component Logic is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
component aritmetic is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
			  B : in STD_LOGIC_VECTOR (3 downto 0);
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
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

signal arout, logout, final_out1, final_out2 : std_logic_vector(3 downto 0);
signal seg_out_7, seg_sel_4: std_logic_vector(3 downto 0);
signal dp : std_logic;
--signal seg_sel : std_logic_vector(4 downto 0);


--Signaldeclarationsbeforebeginblockofarchitecture

begin
A1: aritmetic port map(in1, in2 , op_sel(0), op_sel(1), arout );
A2: Logic port map(in1, in2, op_sel(0), op_sel(1), logout);
final_out1 <= arout when op_sel(2) = '0' else
				logout;
				
final_out2 <= "0000" when op_sel(3) = '0' else
	logout ;

A8 : seven_four port map (final_out1, "0000", final_out2, "0000", clk, dp,seg_sel_4,seg_out_7);
-- Seven segment related part
seg_out <= (seg_out_7 & dp);
seg_sel <= "1111" &seg_sel_4;
-- Finding the flag_out output





end Behavioral;