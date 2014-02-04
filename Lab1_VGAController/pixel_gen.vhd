----------------------------------------------------------------------------------
-- Company: USAFA DFEC
-- Engineer: C2C Travis Schriner
-- 
-- Create Date:    12:00:29 01/31/2014 
-- Design Name: 
-- Module Name:    pixel_gen - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity pixel_gen is
    port ( row      : in unsigned(10 downto 0);
           column   : in unsigned(10 downto 0);
           blank    : in std_logic;
           r        : out std_logic_vector(7 downto 0);
           g        : out std_logic_vector(7 downto 0);
           b        : out std_logic_vector(7 downto 0));
end pixel_gen;


architecture Behavioral of pixel_gen is
signal r_sig, g_sig, b_sig : std_logic_vector(7 downto 0);

begin
	process(blank)
	begin
		if blank = '0' then r_sig <= (others => '1'); 
								  g_sig <= (others => '0');
								  b_sig <= (others => '0');
		else r_sig <= (others => '0');
			  g_sig <= (others => '0');
			  b_sig <= (others => '0');
		end if;
	end process;

--output logic
	r <= r_sig;
	g <= g_sig;
	b <= b_sig;

end Behavioral;

