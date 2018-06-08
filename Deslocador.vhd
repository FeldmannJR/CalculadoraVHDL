library ieee;
use ieee.std_logic_1164.all;

entity Deslocador is
  port (INA: in std_logic_vector (3 downto 0);
        entraserialE,entraserialD: in std_logic;
        C: in std_logic_vector(1 downto 0);
        OUTS: out std_logic_vector(3 downto 0)
  );
end Deslocador;

architecture archdes of Deslocador is
    signal fio1,fio2,fio3,fio4 : std_logic;

  component Mux2to1 is  -- Mux2to1
    PORT(
          Amux2: in std_logic;
          Bmux2:  in std_logic;
          SELmux2: in std_logic;
			    Smux2: out std_logic
	      );
  end component;

  begin
      Mux0: Mux2to1
        port map(Amux2=>INA(0),Bmux2=>entraserialE,SELmux2=>C(1),Smux2=>fio1);

      Mux1: Mux2to1
        port map(Amux2=>INA(1),Bmux2=>INA(0),SELmux2=>C(1),Smux2=>fio2);

      Mux2: Mux2to1
        port map(Amux2=>INA(2),Bmux2=>INA(1),SELmux2=>C(1),Smux2=>fio3);

      Mux3: Mux2to1
        port map(Amux2=>INA(3),Bmux2=>INA(2),SELmux2=>C(1),Smux2=>fio4);

      -- Linha de baixo
      Mux4: Mux2to1
        port map(Amux2=>fio2,Bmux2=>fio1,SELmux2=>C(0),Smux2=>OUTS(0));

      Mux5: Mux2to1
        port map(Amux2=>fio3,Bmux2=>fio2,SELmux2=>C(0),Smux2=>OUTS(1));

      Mux6: Mux2to1
        port map(Amux2=>fio4,Bmux2=>fio3,SELmux2=>C(0),Smux2=>OUTS(2));

      Mux7: Mux2to1
        port map(Amux2=>fio4,Bmux2=>entraserialD,SELmux2=>C(0),Smux2=>OUTS(3));

end archdes;
