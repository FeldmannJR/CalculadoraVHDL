library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Muxpt1 is
PORT(
	sel: in std_logic_vector(1 downto 0);
	i: in std_logic_vector(3 downto 0);
	s: out std_logic
);
end Muxpt1;

architecture ArchMuxpt1 of Mux4p1 is
begin
	WITH sel SELECT
		s<=
			i(0) WHEN "00",
			i(1) WHEN "01",
			i(2) WHEN "10",
			i(3) WHEN "11";
end ArchMuxpt1;
