library IEEE;
USE IEEE.std_logic_1164.all;
-- f = seletor v= overflow z = zero n = negative
ENTITY Calculadora IS
  port(
    a,b :in std_logic_vector(3 downto 0);
    f: in std_logic_vector(1 downto 0);
    s:out std_logic_vector(3 downto 0);
    saidaled:out std_logic_vector(6 downto 0);
    v,z,n: out std_logic
  );
END Calculadora;

architecture ArchCalculadora of Calculadora is

  signal fiodeslocadore,fiodeslocadord,temps,c2,absnum,fiosoma : std_logic_vector(3 downto 0);
  signal overso,overde,overdd: std_logic;

  component Somador is
      port(a0, b0: in std_logic_vector(3 downto 0);
           controle: in std_logic;
      	   saida: out std_logic_vector(3 downto 0);
      	 	overflow: out std_logic
      	);
  end component;
  component Complemento2 is
      port (AComp: in std_logic_vector (3 downto 0);
          SComp: out std_logic_vector(3 downto 0)
        );
  end component;
  component LED is
      port (aLED: in std_logic_vector(3 downto 0);
            sLED: out std_logic_vector(6 downto 0)
        );
  end component;
  component Mux16to4 is
    port(sel: in std_logic_vector(1 downto 0);
         R1: in std_logic_vector(3 downto 0);
         R2: in std_logic_vector(3 downto 0);
         R3: in std_logic_vector(3 downto 0);
         R4: in std_logic_vector(3 downto 0);
         S1: out std_logic_vector(3 downto 0)
    );
  end component;
  component Mux8to4 is
    PORT(sel: in std_logic;
    		 R1: in std_logic_vector(3 downto 0);
    		 R2: in std_logic_vector(3 downto 0);
    		 S1: out std_logic_vector(3 downto 0)
    );
  end component;
  component DeslocadorDireita is
    port (AD: in std_logic_vector (3 downto 0);
          SD: out std_logic_vector(3 downto 0);
          overflow: out std_logic
    );
  end component;
  component DeslocadorEsquerda is
    port (AE: in std_logic_vector (3 downto 0);
          SE: out std_logic_vector(3 downto 0);
          overflow: out std_logic
    );
  end component;
begin
  --Menu
  Mux16to41 : Mux16to4
    port map(sel=>f,R1=>fiosoma,R2=>fiosoma,R3=>fiodeslocadord,R4=>fiodeslocadore,S1=>temps);
  soma: Somador
    port map(a0=>a,b0=>b,controle=>f(0),saida=>fiosoma,overflow=>overso);
  desd: DeslocadorDireita
    port map(AD=>a,SD=>fiodeslocadord,overflow=>overdd);
  dese: DeslocadorEsquerda
    port map(AE=>a,SE=>fiodeslocadore,overflow=>overde);
  Comp2: Complemento2
    port map(AComp=>temps,SComp=>c2);
  Led1: LED
    port map(aLED=>absnum,sLED=>saidaled);
  --Transforma o numero em positivo se for negativo, para mostrar no led somente
  Mux8to41: Mux8to4
    port map(sel=>temps(3),R1=>temps,R2=>c2,S1=>absnum);

   z <= (not temps(0)) and (not temps(1)) and (not temps(2)) and (not temps(3));
   n <= temps(3);
   v <= overdd or overde or overso;
   s <= temps;
end ArchCalculadora;
