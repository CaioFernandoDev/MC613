library ieee;
use ieee.std_logic_1164.all;

entity xbar_v3 is
  port(x1, x2, s: in std_logic;
       y1, y2: out std_logic);
end xbar_v3;

architecture rtl of xbar_v3 is
begin
	process (x1, x2, s)
	begin
		case s is
			when '1' =>
				y1 <= x2;
				y2 <= x1;
			when others =>
				y1 <= x1;
				y2 <= x2;
		end case;
				
	end process;

end rtl;

