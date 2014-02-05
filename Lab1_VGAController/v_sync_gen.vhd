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
	type states is (activeVid, frontPorch, sync, backPorch, complete);
	signal state_reg, state_next : states;
	signal count_reg, count_next : unsigned (10 downto 0);
	signal v_sync_reg, blank_reg, completed_reg,
	       v_sync_next, blank_next, completed_next : std_logic;
	signal row_next, row_reg: unsigned (10 downto 0);
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
		elsif (rising_edge(clk)) then
				count_reg <= count_next;
		end if;
	end process;
	
	count_next <= (others => '0') when (h_completed = '1') and state_reg /= state_next else
						count_reg +1;
	
	

	--output buffer
	process(clk)
	begin
		if rising_edge(clk) then
			v_sync_reg <= v_sync_next;
			blank_reg <= blank_next;
			row_reg <= row_next;
			completed_reg <= completed_next;
		end if;
	end process;
	
	
	
	process(state_reg, count_reg, state_next)
	begin
	
		state_reg <= state_next;
		
		case state_reg is
		
		
		when complete =>
				state_next <= activeVid;
				
		when backPorch =>
			if (count_reg = 31) then
				state_next <= complete;
			end if;
		
		when sync =>
			if (count_reg = 1) then
				state_next <= backPorch;
			end if;
		
		when frontPorch =>
			if(count_reg = 9) then
				state_next <= sync;
			end if;

		
		when activeVid =>
			if(count_reg =479) then
				state_next <= frontPorch;
			end if;
			
	   end case;
		
	end process;
	
	--output logic
	process(state_next, count_next)
	begin
		case state_next is
			when sync =>
				v_sync_next <= '0';
				blank_next <= '1';
				row_next <= (others => '0');
				completed_next <= '0';
			when backPorch =>
				v_sync_next <= '1';
				blank_next <= '1';
				row_next <= (others => '0');
				completed_next <= '0';
			when complete =>
				v_sync_next <= '1';
				blank_next <= '1';
				row_next <= (others => '0');
				completed_next <= '1';
			when activeVid =>
				v_sync_next <= '1';
				blank_next <= '0';
				row_next <= count_next;
				completed_next <= '0';
			when frontPorch =>
				v_sync_next <= '1';
				blank_next <= '1';
				row_next <= (others => '0');
				completed_next <= '0';
		end case;
	end process;
	--output	
	v_sync <= v_sync_reg;
	blank <= blank_reg;
	row <= row_reg;
	completed <= completed_reg;
	

end Behavioral;

