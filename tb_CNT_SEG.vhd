LIBRARY ieee; USE ieee.std_logic_1164.ALL;
ENTITY tb_CNT_SEG IS
END tb_CNT_SEG;
ARCHITECTURE behavior OF tb_CNT_SEG IS 
    COMPONENT CNT_SEG
    PORT(KEY1,RESET: IN std_logic;
         SMG_DATA : OUT  std_logic_vector(7 downto 0);
         SCAN_SIG : OUT  std_logic_vector(5 downto 0));
    END COMPONENT;
   signal KEY1,RESET : std_logic := '0'; --Inputs
 	--Outputs
   signal SMG_DATA : std_logic_vector(7 downto 0);
   signal SCAN_SIG : std_logic_vector(5 downto 0);
BEGIN
   uut: CNT_SEG PORT MAP (KEY1,RESET,SMG_DATA,SCAN_SIG);
   tb_proc: process
   begin
	  KEY1<='1'; RESET<='1'; WAIT FOR 50ns; KEY1<='0'; RESET<='0'; WAIT FOR 50ns; 
	  KEY1<='0'; WAIT FOR 50ns; KEY1<='1'; WAIT FOR 50ns;
	  KEY1<='0'; WAIT FOR 50ns; KEY1<='1'; WAIT FOR 50ns;
	  KEY1<='0'; WAIT FOR 50ns; KEY1<='1'; WAIT FOR 50ns;
	  KEY1<='0'; WAIT FOR 50ns; KEY1<='1'; WAIT FOR 50ns;
	  WAIT;
   end process;
END;