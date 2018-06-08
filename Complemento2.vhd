library ieee;
use ieee.std_logic_1164.all;

entity Complemento2 is
  port (AComp: in std_logic_vector (3 downto 0);
        SComp: out std_logic_vector(3 downto 0)
  );

end Complemento2;

architecture archcom of Complemento2 is
signal temp: std_logic_vector(3 downto 0);

component Somador is
    port(a0, b0: in std_logic_vector(3 downto 0);
         controle: in std_logic;
         saida: out std_logic_vector(3 downto 0);
         overflow: out std_logic
      );
end component;

  begin
    temp<= not AComp;
    soma:Somador
      port map(a0=>temp,b0=>"0001",controle=>'0',saida=>SComp);
    -- 0010
    -- 1101
      -- +1
    -- 1110
    -- 0001
    --   +1
    -- 0010

end archcom;
