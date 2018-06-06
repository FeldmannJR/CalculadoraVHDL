library ieee;
use ieee.std_logic_1164.all;

entity Somador is
	port(a0, b0: in std_logic_vector(3 downto 0);
	     saida: out std_logic_vector(3 downto 0);
		  overflow: out std_logic
	);
end Somador;

architecture somador4 of somador is
signal fio0,fio1,fio2: std_logic;

component MS is  -- meiosomador
	port(a,b: in std_logic;
		  sum,carry: out std_logic
);
end component;

component SC is  -- somadorcompleto
	port(x,y,cin: in std_logic;
		  s, cout: out std_logic
	);
end component;

begin

	half0: MS
		port map(a=>a0(0),b=>b0(0),sum=>saida(0),carry=>fio0);

	half1: SC
		port map(x=>a0(1),y=>b0(1),s=>saida(1),cin=>fio0,cout=>fio1);

	half2: SC
		port map(x=>a0(2),y=>b0(2),s=>saida(2),cin=>fio1,cout=>fio2);

	half3: SC
		port map(x=>a0(3),y=>b0(3),s=>saida(3),cin=>fio2,cout=>overflow);

end somador4;
