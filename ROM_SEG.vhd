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

entity ROM_SEG is
    Port (CLK,EN: in STD_LOGIC;
          ADDR: in STD_LOGIC_VECTOR (3 downto 0);
          DOUT: out STD_LOGIC_VECTOR (7 downto 0));
end ROM_SEG;

architecture Behavioral of ROM_SEG is
   type rom_type is array (0 to 15) of std_logic_vector(6 downto 0);
   constant ROM: rom_type:= (
	"1000000", "1111001", "0100100", "0110000", "0011001", "0010010", "0000010", "1111000",
	"0000000", "0010000", "1111111", "1111111", "1111111", "1111111", "1111111", "1111111"
	);
	signal rdata: std_logic_vector(6 downto 0);
begin
	rdata<=ROM(conv_integer(ADDR));
   process(CLK)
   begin
		if rising_edge(CLK) then
         if EN='1' then DOUT<='0'&rdata; end if;
		end if;
	end process;
end Behavioral;
