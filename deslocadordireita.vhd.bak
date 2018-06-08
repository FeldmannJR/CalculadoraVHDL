library ieee;
use ieee.std_logic_1164.all;

entity DeslocadorDireita is
  port (AD: in std_logic_vector (3 downto 0);
        SD: out std_logic_vector(3 downto 0);
        overflow: out std_logic
  );

end DeslocadorDireita;

architecture archdesdir of DeslocadorDireita is
  begin

    SD(3)<= '0';
    SD(2)<= AD(3);
    SD(1)<= AD(2);
    SD(0)<= AD(1);
    overflow<=AD(0);

end archdesdir;
