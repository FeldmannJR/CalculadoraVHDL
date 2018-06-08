library ieee;
use ieee.std_logic_1164.all;

entity Multiplicador is
	port(a, b: in std_logic_vector(3 downto 0);
	     resultado: out std_logic_vector(7 downto 0);
			 somasaida1,somasaida2,somasaida3: out std_logic_vector(3 downto 0);
			 o1,o2,o3: out std_logic
	);
end Multiplicador;

architecture multiplicador4 of multiplicador is

signal sm11,sm21,sm31: std_logic_vector(3 downto 0);
signal sm12,sm22,sm32: std_logic_vector(3 downto 0);
signal saidasm1,saidasm2,saidasm3: std_logic_vector(3 downto 0);
signal overflowsm1,overflowsm2,overflowsm3: std_logic;


component Somador is
port(a0, b0: in std_logic_vector(3 downto 0);
		 controle: in std_logic;
		 saida: out std_logic_vector(3 downto 0);
		overflow: out std_logic
);
end component;

begin

sm11(0)<= a(1) and b(0); --1
sm11(1)<= a(2) and b(0); --1
sm11(2)<= a(3) and b(0); --1
sm11(3)<='0'; --0

sm12(0)<= a(0) and b(1); --1
sm12(1)<= a(1) and b(1); --1
sm12(2)<= a(2) and b(1); --1
sm12(3)<= a(3) and b(1); --1

--0111
--1111
--
Som1: Somador
	port map(a0=>sm11,b0=>sm12,controle=>'0',saida=>saidasm1,overflow=>overflowsm1);

sm21(0)<=saidasm1(1);
sm21(1)<=saidasm1(2);
sm21(2)<=saidasm1(3);
sm21(3)<=overflowsm1;
sm22(0)<= b(2) and a(0);
sm22(1)<= b(2) and a(1);
sm22(2)<= b(2) and a(2);
sm22(3)<= b(2) and a(3);

Som2: Somador
	port map(a0=>sm21,b0=>sm22,controle=>'0',saida=>saidasm2,overflow=>overflowsm2);

sm31(0)<=saidasm2(1);
sm31(1)<=saidasm2(2);
sm31(2)<=saidasm2(3);
sm31(3)<=overflowsm2;
sm32(0)<=b(3) and a(0);
sm32(1)<=b(3) and a(1);
sm32(2)<=b(3) and a(2);
sm32(3)<=b(3) and a(3);

Som3: Somador
	port map(a0=>sm31,b0=>sm32,controle=>'0',saida=>saidasm3,overflow=>overflowsm3);

resultado(0)<= a(0) and b(0);
resultado(1)<= saidasm1(0);
resultado(2)<= saidasm2(0);
resultado(3)<=saidasm3(0);
resultado(4)<=saidasm3(1);
resultado(5)<=saidasm3(2);
resultado(6)<=saidasm3(3);
resultado(7)<=overflowsm3;

somasaida1<=saidasm1;
somasaida2<=saidasm2;
somasaida3<=saidasm3;

o1<=overflowsm1;
o2<=overflowsm2;
o3<=overflowsm3;

end multiplicador4;
