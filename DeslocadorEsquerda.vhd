library ieee;
use ieee.std_logic_1164.all;

entity DeslocadorEsquerda is
  port (AE: in std_logic_vector (3 downto 0);
        entraserialE: in std_logic;
        SE: out std_logic_vector(3 downto 0)
  );

end DeslocadorEsquerda;

architecture archdesesq of DeslocadorEsquerda is
  component Mux2to1 is
    PORT(Amux2,Bmux2,SELmux2: in std_logic;
         Smux2: out std_logic
    );
end component;
  begin

    SE(3)<= entraserialE;
    SE(2)<= AE(3);
    SE(1)<= AE(2);
    SE(0)<= AE(1);

end archdesesq;
