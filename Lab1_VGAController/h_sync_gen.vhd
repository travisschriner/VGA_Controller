----------------------------------------------------------------------------------
-- Company: USAFA DFEC
-- Engineer: C2C Travis Schriner
-- 
-- Create Date:    12:04:08 01/31/2014 
-- Design Name: 
-- Module Name:    h_sync_gen - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

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
	signal donezoes : std_logic;
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
	process( state_reg, state_next, count_reg)
	begin 
	
		if (state_next = state_reg) then 
			count_next <= count_reg +1;
		else 
			count_next <= (others => '0');
		end if;
	end process;
	
	
	--C2C Jason Mossing gave me the idea to use a case statement with nested if statements to decide when to choose states
	process(state_reg)
	begin
		case state_reg is
		
		when backPorch =>
			if (count_reg < 33) then
				state_next <= backPorch;
				donezoes <= '0';
			else 
				state_next <= activeVid;
				donezoes <= '1';
			end if;
		
		when sync =>
			if (count_reg < 96) then
				state_next <= sync;
				donezoes <= '0';
			else 
				state_next <= backPorch;
				donezoes <= '0';
			end if;
		
		when frontPorch =>
			if(count_reg < 16) then
				state_next <= frontPorch;
				donezoes <= '0';
			else 
				state_next <= sync;
				donezoes <= '0';
			end if;

		
		when activeVid =>
			if(count_reg <640) then
				state_next <= activeVid;
				donezoes <= '0';
			else 
				state_next <= frontPorch;
				donezoes <= '0';
			end if;
			
	   end case;
		
	end process;
	
	--output logic
		h_sync <= '0' when state_reg = sync else
					 '1';
		blank <= '0' when state_reg = activeVid else
					'1';
		completed <= donezoes;
		
		column <=  count_reg when state_reg = activeVid else
					(others => '0');
	

end Behavioral;

