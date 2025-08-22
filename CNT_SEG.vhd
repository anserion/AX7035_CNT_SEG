--Copyright 2025 Andrey S. Ionisyan (anserion@gmail.com)
--Licensed under the Apache License, Version 2.0 (the "License");
--you may not use this file except in compliance with the License.
--You may obtain a copy of the License at
--    http://www.apache.org/licenses/LICENSE-2.0
--Unless required by applicable law or agreed to in writing, software
--distributed under the License is distributed on an "AS IS" BASIS,
--WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--See the License for the specific language governing permissions and
--limitations under the License.
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity CNT_SEG is
    Port (KEY1,RESET: in STD_LOGIC;
          SMG_DATA : out  STD_LOGIC_VECTOR (7 downto 0);
          SCAN_SIG : out  STD_LOGIC_VECTOR (5 downto 0));
end CNT_SEG;

architecture Behavioral of CNT_SEG is
component ROM_SEG     
Port (CLK,EN: in STD_LOGIC;
      ADDR: in STD_LOGIC_VECTOR (3 downto 0);
      DOUT: out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal CNT: std_logic_vector(3 downto 0);
begin
SCAN_SIG<="111110";
ROM: ROM_SEG port map (KEY1,'1',CNT,SMG_DATA);
cnt_proc: process(KEY1)
begin
  if rising_edge(KEY1) then
    if (RESET='1') or (CNT="1010") then CNT<=(others=>'0'); else CNT<=CNT+1; end if;
  end if;
end process;
end Behavioral;
