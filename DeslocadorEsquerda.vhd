library ieee;
use ieee.std_logic_1164.all;

entity DeslocadorEsquerda is
  port (AE: in std_logic_vector (3 downto 0);
        SE: out std_logic_vector(3 downto 0);
        overflow: out std_logic
  );

end DeslocadorEsquerda;

architecture archeesquer of DeslocadorEsquerda is
  begin

    overflow<=AE(3);
    SE(3)<= AE(2);
    SE(2)<= AE(1);
    SE(1)<= AE(0);
    SE(0)<= '0';

end archeesquer;
