VGA_Controller
==============

Prelab
--------------
see prelab document in directory

Introduction
--------------
This lab is designed to create a VGA interface between our FPGA board through the HDMI out into a VGA monitor. For this lab, we used finite state machines to manipulate and send signals. These signals sync up with the monitor and allow us to transmit images to a display. 

Our problem was to inteface to a monitor over an HDMI to DVI cable using a VGA machine and some adaption code to change from VGA to HDMI. We had to come up with the H_SYNC, V_SYNC, VGA_SYNC, and PIXEL_GEN signals. Code was given to us in the top level but we had to interface all our components. 

Implementation
---------------

My top level component instantiation is a s follows:
![Sweet Schematic Bra!](schematic.JPG)

This module basically consisted of wiring up the different components I previously created. 

The basis of the entire program was the H_SYNC_GEN signal. 
![Sweet H_SYNC_GEN Bra!](h_sync_gen.jpg)

This component is based off the clock and times the pixel in the horizontal plain.

it uses flip-flops and a look-ahead buffer to do stuff.
```library IEEE;
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
	signal count_reg, count_next : unsigned (10 downto 0);
	signal h_sync_reg, blank_reg, completed_reg,
	       h_sync_next, blank_next, completed_next : std_logic;
	signal column_next, column_reg: unsigned (10 downto 0);
	
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
	
	--output buf
	
	process(clk)
	begin
		if(rising_edge(clk)) then
			h_sync_reg <= h_sync_next;
			blank_reg <= blank_next;
			column_reg <= column_next;
			completed_reg <= completed_next;
		end if;
	end process;

	
			
			
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
			if (count_reg = 46) then
				state_next <= Complete;
			end if;
			
		--completed logich	
		when Complete =>
				state_next <= activeVid;
		end case;
		
		
	end process;
	
	--output logic C2C Good explained I needed to add an output buffer
		process(state_next, count_next)
	begin
		case state_next is
			when sync =>
				h_sync_next <= '0';
				blank_next <= '1';
				column_next <= (others => '0');
				completed_next <= '0';
			when backPorch =>
				h_sync_next <= '1';
				blank_next <= '1';
				column_next <= (others => '0');
				completed_next <= '0';
			when complete =>
				h_sync_next <= '1';
				blank_next <= '1';
				column_next <= (others => '0');
				completed_next <= '1';
			when activeVid =>
				h_sync_next <= '1';
				blank_next <= '0';
				column_next <= count_next;
				completed_next <= '0';
			when frontPorch =>
				h_sync_next <= '1';
				blank_next <= '1';
				column_next <= (others => '0');
				completed_next <= '0';
		end case;
	end process;
	
	
	h_sync <= h_sync_reg;
	blank <= blank_reg;
	column <= column_reg;
	completed <= completed_reg;
	
end Behavioral;
```






Conclusion
---------------
This lab proved to be quite challenging given that I have not coded in VHDL for about a year and a half. The sheep dunking of VHDL bootcamp proved to be easy at the beginning, but there was no room to fall behind. If you did fall behind, it was almost impossible to get caught up because everything compiled on itself. This lab proved to be quite similar to the VHDL bootcamp because if you could not correctly create a testbench, you were for sure not able to debug your code. The other large issue I found with the lab was that the directions of what each individual signal were supposed to do was unclear at times. The big one was what the vga_sync blank signal was supposed to do. I had some convoluted process involving a whole slew of stuff when in fact the code only needed to be one line long. A larger clarification of the individual components would have been handy as well. It could easily be included in a comment block above the instantiation of the code in the top level. It could explain what the different signals are and how they are used. That would give a much greater understanding of the design goals and not leave us flowndering quite as much. 

Overall it was a rewarding experience to complete the design exercise. Getting a complete red screen on the monitor was an excelent way to end hours of frustration. I have a profound appreciation for people who do this for a living. Someday I might get on their level. probably not though...



