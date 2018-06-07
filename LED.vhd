library ieee;
use ieee.std_logic_1164.all;

entity bcdto7 is
  port (a: in std_logic_vector(3 downto 0);
        s: out std_logic_vector(6 downto 0)
  );
end bcdto7;

architecture bcd of bcdto7 is
begin
    with a select

    s<= "0000001" when "0000",  --0
        "1001111" when "0001",  --1
        "0010010" when "0010",  --2
        "0000110" when "0011",  --3
        "1001100" when "0100",  --4
        "0100100" when "0101",  --5
        "0100000" when "0110",  --6
        "0001111" when "0111",  --7
        "0000000" when "1000",  --8
        "0000100" when "1001",  --9
        "1111110" when others;

end bcd;
