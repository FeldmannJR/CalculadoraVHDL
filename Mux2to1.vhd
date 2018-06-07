library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Mux2to1 is
	PORT(Amux2,Bmux2,SELmux2: in std_logic;
			 Smus2: out std_logic
	);
end Mux2to1;

architecture ArchMux2to1 of Mux2to1 is
begin
	S<= (A and(not sel)) or (B and Sel);

end ArchMux2to1;
