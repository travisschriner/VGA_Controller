----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:27 01/31/2014 
-- Design Name: 
-- Module Name:    v_sync_gen - Behavioral 
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

entity v_sync_gen is
    port ( clk         : in  std_logic;
           reset       : in std_logic;
           h_blank     : in std_logic;
           h_completed : in std_logic;
           v_sync      : out std_logic;
           blank       : out std_logic;
           completed   : out std_logic;
           row         : out unsigned(10 downto 0)
     );
end v_sync_gen;

architecture Behavioral of v_sync_gen is


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
	process(h_completed, reset)
	begin
		if (reset = '1') then
			count_reg <= (others => '0');
		elsif( rising_edge(h_completed)) then
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
			if (count_reg < 2) then
				state_next <= sync;
				donezoes <= '0';
			else 
				state_next <= backPorch;
				donezoes <= '0';
			end if;
		
		when frontPorch =>
			if(count_reg < 10) then
				state_next <= frontPorch;
				donezoes <= '0';
			else 
				state_next <= sync;
				donezoes <= '0';
			end if;

		
		when activeVid =>
			if(count_reg <480) then
				state_next <= activeVid;
				donezoes <= '0';
			else 
				state_next <= frontPorch;
				donezoes <= '0';
			end if;
			
	   end case;
		
	end process;
	
	--output logic
		v_sync <= '0' when state_reg = sync else
					 '1';
		blank <= '0' when state_reg = activeVid else
					'1';
		completed <= donezoes;
		
		row <=  count_reg when state_reg = activeVid else
					(others => '0');
	

end Behavioral;

