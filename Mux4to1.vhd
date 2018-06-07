library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Mux4to1 is
PORT(
	sel: in std_logic_vector(1 downto 0);
	i: in std_logic_vector(3 downto 0);
	s: out std_logic
);
end Mux4to1;

architecture ArchMux4to1 of Mux4to1 is
begin
	WITH sel SELECT
		s<=
			i(0) WHEN "00",
			i(1) WHEN "01",
			i(2) WHEN "10",
			i(3) WHEN "11";
end ArchMux4to1;