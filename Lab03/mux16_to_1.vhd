library ieee;
use ieee.std_logic_1164.all;

entity mux16_to_1 is
  port(data : in std_logic_vector(15 downto 0);
       sel : in std_logic_vector(3 downto 0);
       output : out std_logic);
end mux16_to_1;

architecture rtl of mux16_to_1 is
	signal m : std_logic_vector(0 TO 3) ;
	
	component mux4_to_1 
		port(d3, d2, d1, d0 : in std_logic;
				sel : in std_logic_vector(1 downto 0);
				output : out std_logic);
	end component;

begin
	mux1: mux4_to_1 port map(data(15), data(14), data(13), data(12), sel(1 downto 0), m(0));
	mux2: mux4_to_1 port map(data(11), data(10), data(9), data(8), sel(1 downto 0), m(1));
	mux3: mux4_to_1 port map(data(7), data(6), data(5), data(4), sel(1 downto 0), m(2));
	mux4: mux4_to_1 port map(data(3), data(2), data(1), data(0), sel(1 downto 0), m(3));
	mux5: mux4_to_1 port map(m(0), m(1), m(2), m(3), sel(3 downto 2), output);
end rtl;

