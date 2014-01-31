----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:04:08 01/31/2014 
-- Design Name: 
-- Module Name:    h_sync_gen - Behavioral 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity h_sync_gen is
    port ( clk       : in  std_logic;
           reset     : in  std_logic;
           h_sync    : out std_logic;
           blank     : out std_logic;
           completed : out std_logic;
           column    : out unsigned(10 downto 0)
     );
end h_sync_gen;

architecture Behavioral of h_sync_gen is

	--had to make my own type...
	type states is (activeVid, frontPorch, sync, backPorch);
	signal state_reg, state_next : states;
	signal count_reg, count_next : unsigned (10 downto 0);
begin


   --state reg
	process(clk, reset)
	begin
		if(reset ='1') then
			state_reg <= activeVid;
		elsif( rising_edge(clk)) then
			state_reg <= state_next;
		end if;
	end process;
	
	
	
	--count reg
	process(clk, reset)
	begin
		if (reset = '1') then
			count_reg <= (others => '0');
		elsif( rising_edge(clk)) then
			if(state_reg = state_next) then
				count_reg <= count_next;
			else 
				count_reg <= (others => '0');
			end if;
		end if;
	end process;
	
	
	
	--next count logic
	process( state_reg, state_next, count_reg, clk)
	begin 
	
		if (state_next = state_reg) then 
			count_next <= count_reg +1;
		else 
			count_next <= (others => '0');
		end if;
	end process;
	

end Behavioral;

