
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
      	--reset
      wait for clk_period;
		reset <= '1';
		wait for clk_period;
		reset <= '0';
		wait for clk_period;



		--test sync
		assert v_sync = '0' report "sync v_sync incorrect" severity error;
		assert blank = '1' report "sync blank incorrect" severity error;
		assert completed = '0' report "sync completed incorrect" severity error;
		assert row = "00000000000" report "sync row incorrect" severity error;


      --check for h_completed first appearance
		wait for clk_period*142;
		assert h_completed = '1' report "h_completed 1 failed" severity error;

		--this means that the counter has incremented by one
		--wait for another h_completed cycle
		--an h_completed cycle is equivalent to active video + front porch +
		--sync + back porch = 800 clock cycles.
		wait for clk_period*800;
		assert h_completed = '1' report "h_completed 2 failed" severity error;
		--this assert should return true after 800 cycles, but instead it returns true
		--at 804, not sure what's going on.

		--test Back Porch
		wait for clk_period*2;
		assert v_sync = '1' report "Back porch v_sync incorrect" severity error;
		assert blank = '1' report "Back porch blank incorrect" severity error;
		assert completed = '0' report "Back porch completed incorrect" severity error;
		assert row = "00000000000" report "Back porch row incorrect" severity error;


      wait;
   end process;

END;