library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Mux2to1 is
	PORT(Amux2,Bmux2,SELmux2: in std_logic;
			 Smux2: out std_logic
			 );
end Mux2to1;

architecture ArchMux2to1 of Mux2to1 is
	begin
		Smux2<= (Amux2 and (not SELmux2)) or (Bmux2 and SELmux2);

end ArchMux2to1;
