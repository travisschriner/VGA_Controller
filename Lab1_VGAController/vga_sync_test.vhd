
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY vga_sync_test IS
END vga_sync_test;
 
ARCHITECTURE behavior OF vga_sync_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vga_sync
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         h_sync : OUT  std_logic;
         v_sync : OUT  std_logic;
         v_completed : OUT  std_logic;
         blank : OUT  std_logic;
         row : OUT  std_logic_vector(10 downto 0);
         column : OUT  std_logic_vector(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal h_sync : std_logic;
   signal v_sync : std_logic;
   signal v_completed : std_logic;
   signal blank : std_logic;
   signal row : std_logic_vector(10 downto 0);
   signal column : std_logic_vector(10 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vga_sync PORT MAP (
          clk => clk,
          reset => reset,
          h_sync => h_sync,
          v_sync => v_sync,
          v_completed => v_completed,
          blank => blank,
          row => row,
          column => column
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		reset <= '1';
      wait for clk_period;
		reset <= '0';
		
		wait for clk_period*100;

      -- insert stimulus here 

      wait;
   end process;

END;
