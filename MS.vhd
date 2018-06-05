library ieee;
use ieee.std_logic_1164.all;

entity ms is
	port(a,b: in std_logic;
		  sum,carry: out std_logic
	);
end ms;

architecture meiosomador of ms is

begin
	sum <= a xor b;
	carry <= a and b;

end meiosomador;
		
