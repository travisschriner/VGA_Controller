
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY h_sync_testbench IS
END h_sync_testbench;
 
ARCHITECTURE behavior OF h_sync_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT h_sync_gen
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         h_sync : OUT  std_logic;
         blank : OUT  std_logic;
         completed : OUT  std_logic;
         column : OUT  unsigned(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal h_sync : std_logic;
   signal blank : std_logic;
   signal completed : std_logic;
   signal column : unsigned(10 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: h_sync_gen PORT MAP (
          clk => clk,
          reset => reset,
          h_sync => h_sync,
          blank => blank,
          completed => completed,
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
		assert ((column = to_unsigned(0,11)) and (blank = '0') and (h_sync = '1') and (completed = '0'))
		report "reset broke";

		reset <= '0';
		wait for clk_period*300;
		assert ((column = to_unsigned(300,11)) and (blank = '0') and (h_sync = '1') and (completed = '0'))
		report "active at 300 broke";

		wait for clk_period*350;
		assert ((column = to_unsigned(0,11)) and (blank = '1') and (h_sync = '1') and (completed = '0'))
		report "front porch broke";

		wait for clk_period*16;
		assert ((column = to_unsigned(0,11)) and (blank = '1') and (h_sync = '0') and (completed = '0'))
		report "sync pulse broke";

		wait for clk_period*90;
		assert ((column = to_unsigned(0,11)) and (blank = '1') and (h_sync = '1') and (completed = '0'))
		report "back porch broke";

		wait for clk_period*48;
		assert ((column = to_unsigned(0,11)) and (blank = '1') and (h_sync = '1') and (completed = '1'))
		report "completed signal broke";

     
	   wait for clk_period*48;
		
      wait;
   end process;

END;
