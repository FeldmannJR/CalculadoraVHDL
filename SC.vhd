library ieee;
use ieee.std_logic_1164.all;

entity SC is
	port(x,y,cin: in std_logic;
		  s, cout: out std_logic
	);
end SC;
architecture somadorcompleto of SC is
signal temp0,temp1,temp2: std_logic;
begin
  s <= x xor y xor cin;
  cout <= (x and y) or (x and cin) or (y and cin);
end somadorcompleto;
