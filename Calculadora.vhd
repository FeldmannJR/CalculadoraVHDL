library IEEE;
USE IEEE.std_logic_1164.all;

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

  component Somador is  -- meiosomador
  port(a0, b0: in std_logic_vector(3 downto 0);
       saida: out std_logic_vector(3 downto 0);
      overflow: out std_logic
  );
end component;

begin
    soma: Somador
      port map(a0=>a,b0=>b,saida=>fiosoma,overflow=>v);
    WITH f select
        s<=
          fiosoma when "00",
          a when others;

end ArchCalculadora;
