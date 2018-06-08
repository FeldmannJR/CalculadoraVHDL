library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Mux8to4 is
PORT(sel: in std_logic;
		 R1: in std_logic_vector(3 downto 0);
		 R2: in std_logic_vector(3 downto 0);
		 S1: out std_logic_vector(3 downto 0)
);
end Mux8to4;

architecture ArchMux8to4 of Mux8to4 is
begin
	WITH sel SELECT

		S1<=
		  R1 WHEN '0',
		  R2 WHEN '1';

end ArchMux8to4;
