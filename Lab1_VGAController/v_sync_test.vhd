
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
USE ieee.numeric_std.ALL;
 
ENTITY v_sync_test IS
END v_sync_test;
 
ARCHITECTURE behavior OF v_sync_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT v_sync_gen
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         h_blank : IN  std_logic;
         h_completed : IN  std_logic;
         v_sync : OUT  std_logic;
         blank : OUT  std_logic;
         completed : OUT  std_logic;
         row : OUT  unsigned(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal h_blank : std_logic := '0';
   signal h_completed : std_logic := '0';

 	--Outputs
   signal v_sync : std_logic;
   signal blank : std_logic;
   signal completed : std_logic;
   signal row : unsigned(10 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: v_sync_gen PORT MAP (
          clk => clk,
          reset => reset,
          h_blank => h_blank,
          h_completed => h_completed,
          v_sync => v_sync,
          blank => blank,
          completed => completed,
          row => row
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
		assert ((row = to_unsigned(0,11)) and (blank = '0') and (v_sync = '1') and (completed = '0'))
		report "reset broke";

		reset <= '0';
		wait for clk_period*480;
		assert ((row = to_unsigned(300,11)) and (blank = '0') and (v_sync = '1') and (completed = '0'))
		report "active at 300 broke";

		wait for clk_period*10;
		assert ((row = to_unsigned(0,11)) and (blank = '1') and (v_sync = '1') and (completed = '0'))
		report "front porch broke";

		wait for clk_period*2;
		assert ((row = to_unsigned(0,11)) and (blank = '1') and (v_sync = '0') and (completed = '0'))
		report "sync pulse broke";

		wait for clk_period*33;
		assert ((row = to_unsigned(0,11)) and (blank = '1') and (v_sync = '1') and (completed = '0'))
		report "back porch broke";

		wait for clk_period*48;
		assert ((row = to_unsigned(0,11)) and (blank = '1') and (v_sync = '1') and (completed = '1'))
		report "completed signal broke";

     
	   wait for clk_period*48;
      wait;
   end process;

END;