library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.UART_pkg.all;



entity uart_tb is
end entity;

architecture arch_uart_tb of uart_tb is

signal rx : std_logic;
 
--  procedure send_UART (
--        signal rx : out std_logic;
--        valu : std_logic_vector(7 downto 0);
--        tempo : time
--        ) is
--  begin
--    rx <= '0';
--    wait for tempo;
--    rx <= valu(7);
--    wait for tempo;
--    rx <= valu(6);
--    wait for tempo;
--    rx <= valu(5);
--    wait for tempo;
--    rx <= valu(4);
--    wait for tempo;
--    rx <= valu(3);
--    wait for tempo;
--    rx <= valu(2);
--    wait for tempo;
--    rx <= valu(1);
--    wait for tempo;
--    rx <= valu(0);
--    wait for tempo;
--    rx <= '1';
--    wait for tempo;
    
--  end send_UART;
 
   
begin
 
  process is
  begin
--    wait for 10 ns;
--    uart_write_data(rx, x"05", 9600);
--    wait for 10 ns;
--    uart_write_data(rx, x"AA");
    rx <= '1';  
    wait for 10 ns;
    uart_write_data(rx, x"C0");
    wait;
  end process;  

end architecture;