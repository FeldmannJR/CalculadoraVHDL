library ieee;
use ieee.std_logic_1164.all;

entity DeslocadorDireita is
  port (AD: in std_logic_vector (3 downto 0);
        entraserialD: in std_logic;
        SD: out std_logic_vector(3 downto 0)
  );

end DeslocadorDireita;

architecture archdesdir of DeslocadorDireita is
  component Mux2to1 is
    PORT(Amux2,Bmux2,SELmux2: in std_logic;
         Smux2: out std_logic
    );
end component;
  begin

    SD(0)<= entraserialD;
    SD(1)<= AD(0);
    SD(2)<= AD(1);
    SD(3)<= AD(2);

end archdesdir;
