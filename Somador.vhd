library ieee;
use ieee.std_logic_1164.all;

entity Somador is
	port(a0, b0: in std_logic_vector(3 downto 0);
			 controle: in std_logic;
	     saida: out std_logic_vector(3 downto 0);
		  overflow: out std_logic
	);
end Somador;

architecture somador4 of somador is
signal fio0,fio1,fio2,fio3: std_logic;
signal mb: std_logic_vector(3 downto 0);

component SC is  -- somadorcompleto
	port(x,y,cin: in std_logic;
		  s, cout: out std_logic
	);
end component;

begin
	mb(0) <= b0(0) xor controle;
	mb(1) <= b0(1) xor controle;
	mb(2) <= b0(2) xor controle;
	mb(3) <= b0(3) xor controle;

	half0: SC
		port map(x=>a0(0),y=>mb(0),s=>saida(0),cin=>controle,cout=>fio0);

	half1: SC
		port map(x=>a0(1),y=>mb(1),s=>saida(1),cin=>fio0,cout=>fio1);

	half2: SC
		port map(x=>a0(2),y=>mb(2),s=>saida(2),cin=>fio1,cout=>fio2);

	half3: SC
		port map(x=>a0(3),y=>mb(3),s=>saida(3),cin=>fio2,cout=>fio3);

	overflow <= fio3 xor fio2;

end somador4;
