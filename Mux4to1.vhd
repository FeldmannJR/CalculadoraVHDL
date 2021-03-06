library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Mux4to1 is
PORT(sel: in std_logic_vector(1 downto 0);
 		 i1: in std_logic;
 		 i2: in std_logic;
 		 i3: in std_logic;
 		 i4: in std_logic;
 		 stdm: out std_logic
);
end Mux4to1;

architecture ArchMux4to1 of Mux4to1 is
begin
	WITH sel SELECT
		stdm<=
			i1 WHEN "00",
			i2 WHEN "01",
			i3 WHEN "10",
			i4 WHEN "11";
end ArchMux4to1;
