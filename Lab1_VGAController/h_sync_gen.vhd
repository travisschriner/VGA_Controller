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
	type states is (activeVid, frontPorch, sync, backPorch, Complete);
	signal state_reg, state_next : states;
	signal count_reg, count_next : unsigned (11 downto 0);
	
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
			count_reg <= count_next;
		end if;
	end process;
	
	count_next <= (others => '0') when state_reg /= state_next else
						count_reg +1;
	
	

	
			
			
	--C2C Jason Mossing gave me the idea to use a case statement with nested if statements to decide when to choose states
	process(state_reg, count_reg)
	begin
		state_next <= state_reg;
		
		case state_reg is
		
		--active vid logic
		when activeVid =>
			if(count_reg =639) then
				state_next <= frontPorch;
			end if;
			
		--frontPorch logic	
		when frontPorch =>
			if(count_reg = 15) then
				state_next <= sync;
			end if;
			
		--sync logic	
		when sync =>
			if (count_reg = 95) then
				state_next <= backPorch;
			end if;
			
		--backporch logich	
		when backPorch =>
			if (count_reg = 31) then
				state_next <= Complete;
			end if;
			
		--completed logich	
		when Complete =>
			if (count_reg = 0) then
				state_next <= activeVid;
			end if;
		
		end case;
		
	end process;
	
	--output logic
		h_sync    <= '0' when state_reg = sync else
					    '1';
		blank     <= '0' when state_reg = activeVid else
					    '1';
		completed <= '1' when state_reg = complete else
						 '0';
		
		column    <=  count_reg when state_reg = activeVid else
					    (others => '0');
	

end Behavioral;

