library IEEE;
USE IEEE.std_logic_1164.all;
-- f = seletor v= overflow z = zero n = negative
ENTITY Calculadora IS
  port(
    a,b :in std_logic_vector(3 downto 0);
    f: in std_logic_vector(1 downto 0);
    s:out std_logic_vector(3 downto 0);
    v,z,n: out std_logic
  );
END Calculadora;

architecture ArchCalculadora of Calculadora is
  signal fiosoma : std_logic_vector(3 downto 0);
  signal fiodeslocadore : std_logic_vector(3 downto 0);
  signal fiodeslocadord : std_logic_vector(3 downto 0);
  signal temps : std_logic_vector(3 downto 0);
  signal c: std_logic;
  component Somador is
      port(
          a0, b0: in std_logic_vector(3 downto 0);
          controle: in std_logic;
      	  saida: out std_logic_vector(3 downto 0);
      		overflow: out std_logic
      	);
  end component;
  component DeslocadorDireita is
    port (AD: in std_logic_vector (3 downto 0);
          entraserialD: in std_logic;
          SD: out std_logic_vector(3 downto 0)
    );
  end component;
  component DeslocadorEsquerda is
    port (AE: in std_logic_vector (3 downto 0);
          entraserialE: in std_logic;
          SE: out std_logic_vector(3 downto 0)
    );
  end component;
begin
  soma: Somador
    port map(a0=>a,b0=>b,controle=>c,saida=>fiosoma,overflow=>v);
  desd: DeslocadorDireita
    port map(AD=>a,entraserialD=>'0',SD=> fiodeslocadord);
  dese: DeslocadorEsquerda
    port map(AE=>a,entraserialE=>'1',SE=> fiodeslocadore);

  WITH f SELECT
    c<=
      '0' WHEN "00",
      '1' WHEN others;
  WITH f select

    temps<=
      fiosoma when "00",
      fiosoma when "01",
      fiodeslocadord when "10",
      fiodeslocadore when "11";
   z <= (not temps(0)) and (not temps(1)) and (not temps(2)) and (not temps(3));
   n <= temps(0);
   s <= temps;
end ArchCalculadora;
