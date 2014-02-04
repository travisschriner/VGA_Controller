----------------------------------------------------------------------------------
-- Company: USAFA DFEC
-- Engineer: C2C Travis Schriner
-- 
-- Create Date:    12:02:27 01/31/2014 
-- Design Name: 
-- Module Name:    atlys_lab_video - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity atlys_lab_video is
    port ( 
             clk   : in  std_logic; -- 100 MHz
             reset : in  std_logic;
             tmds  : out std_logic_vector(3 downto 0);
             tmdsb : out std_logic_vector(3 downto 0)
         );
end atlys_lab_video;

architecture Schriner_VGA of atlys_lab_video is
Signal red_s, green_s, blue_s, clock_s, h_sync_sig, v_sync_sig, v_completed_sig, blank_sig, pixel_clk, serialize_clk, serialize_clk_n : std_logic;
signal row_sig, column_sig : unsigned(10 downto 0);
signal r_pixel, g_pixel, b_pixel : std_logic_vector (7 downto 0);
	 
	 
begin

    -- Clock divider - creates pixel clock from 100MHz clock
    inst_DCM_pixel: DCM
    generic map(
                   CLKFX_MULTIPLY => 2,
                   CLKFX_DIVIDE   => 8,
                   CLK_FEEDBACK   => "1X"
               )
    port map(
                clkin => clk,
                rst   => reset,
                clkfx => pixel_clk
            );

    -- Clock divider - creates HDMI serial output clock
    inst_DCM_serialize: DCM
    generic map(
                   CLKFX_MULTIPLY => 10, -- 5x speed of pixel clock
                   CLKFX_DIVIDE   => 8,
                   CLK_FEEDBACK   => "1X"
               )
    port map(
                clkin => clk,
                rst   => reset,
                clkfx => serialize_clk,
                clkfx180 => serialize_clk_n
            );
				
				
		vga_sync_instance : entity work.vga_sync(behavioral)
			port map (	clk   		=> clk,
							reset  		=> reset,
							h_sync   	=> h_sync_sig,
							v_sync   	=> v_sync_sig,
							v_completed => v_completed_sig,
							blank       => blank_sig,
							row         => row_sig,
							column      => column_sig
						);
						
		pixel_gen_instance : entity work.pixel_gen(behavioral)
			port map ( 	row      => row_sig,
							column   => column_sig,
							blank    => blank_sig,
							r        => r_pixel,
							g        => g_pixel,
							b        => b_pixel
						);
			

   
    -- Convert VGA signals to HDMI (actually, DVID ... but close enough)
    inst_dvid: entity work.dvid
    port map(
                clk       => serialize_clk,
                clk_n     => serialize_clk_n, 
                clk_pixel => pixel_clk,
                red_p     => r_pixel,
                green_p   => g_pixel,
                blue_p    => b_pixel,
                blank     => blank_sig,
                hsync     => h_sync_sig,
                vsync     => v_sync_sig,
                -- outputs to TMDS drivers
                red_s     => red_s,
                green_s   => green_s,
                blue_s    => blue_s,
                clock_s   => clock_s
            );

    -- Output the HDMI data on differential signalling pins
    OBUFDS_blue  : OBUFDS port map
        ( O  => TMDS(0), OB => TMDSB(0), I  => blue_s  );
    OBUFDS_red   : OBUFDS port map
        ( O  => TMDS(1), OB => TMDSB(1), I  => green_s );
    OBUFDS_green : OBUFDS port map
        ( O  => TMDS(2), OB => TMDSB(2), I  => red_s   );
    OBUFDS_clock : OBUFDS port map
        ( O  => TMDS(3), OB => TMDSB(3), I  => clock_s );

end Schriner_VGA;