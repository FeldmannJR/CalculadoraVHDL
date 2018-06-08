library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Mux16to4 is
PORT(sel: in std_logic_vector(1 downto 0);
		 R1: in std_logic_vector(3 downto 0);
		 R2: in std_logic_vector(3 downto 0);
		 R3: in std_logic_vector(3 downto 0);
		 R4: in std_logic_vector(3 downto 0);
		 S1: out std_logic_vector(3 downto 0)
);
end Mux16to4;

architecture ArchMux16to4 of Mux16to4 is
begin
	WITH sel SELECT
		S1<=
		  R1 WHEN "00",
			R2 WHEN "01",
			R3 WHEN "10",
			R4 WHEN "11";
end ArchMux16to4;
