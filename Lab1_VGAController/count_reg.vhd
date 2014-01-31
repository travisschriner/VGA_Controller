----------------------------------------------------------------------------------
-- Company: USAFA DFEC
-- Engineer: C2C Travis Schriner
-- 
-- Create Date:    12:13:52 01/31/2014 
-- Design Name: 
-- Module Name:    count_reg - Behavioral 
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

library UNISIM;
use UNISIM.VComponents.all;

entity count_reg is
    Port ( clk : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  state_reg : in  STD_LOGIC;
           state_next : in  STD_LOGIC;
           count_reg_in : in  unsigned (10 downto 0);
           count_reg : out  unsigned (10 downto 0));
end count_reg;

architecture Behavioral of count_reg is

signal count_next : unsigned (10 downto 0);

begin

	
process( reset, state_reg, state_next, count_reg_in, clk)
begin 
	
	if( reset = '1') then
		count_next <= (others => '0');
	end if;
	
	if (state_next = state_reg) then 
		count_next <= count_reg_in +1;
	else 
		count_next <= (others => '0');
	end if;
	
	--D flip-flop
	if (reset = '1') then
		count_reg <= (others => '0');
	elsif( rising_edge(clk)) then
		count_reg <= count_next;
	end if;
	--end D flip-flop
end process;

end Behavioral;

