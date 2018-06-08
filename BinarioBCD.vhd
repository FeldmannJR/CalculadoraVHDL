library ieee;
use ieee.std_logic_1164.all;

entity BinarioBCD is
  port (abin: in std_logic_vector(3 downto 0);
        sbin: out std_logic_vector(6 downto 0)
  );
end BinarioBCD;

architecture binBCD of BinarioBCD is
begin
    with abin select

    sbin<= "0000" when "0000",  --0
           "0001" when "1111",  --1
           "0010" when "1110",  --2
           "0011" when "1101",  --3
           "0100" when "1100",  --4
           "0101" when "1011",  --5
           "0110" when "1010",  --6
           "0111" when "1001",  --7
           "1000" when "1000",  --8
           "1001" when "0111",  --9
           "1110" when others;
            -- 1234 1= sinal 234= numero
            -- 234 = bcd
            -- 1 = checamos pra ver se é negativo e botamos o sinal na frente
end binBCD;
