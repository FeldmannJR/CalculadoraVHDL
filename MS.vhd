library ieee;
use ieee.std_logic_1164.all;

entity MS is
	port(a,b: in std_logic;
		  sum,carry: out std_logic
	);
end MS;

architecture meiosomador of MS is

begin
	sum <= a xor b;
	carry <= a and b;

end meiosomador;
