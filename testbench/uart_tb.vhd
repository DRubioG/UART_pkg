library ieee;
use ieee.std_logic_1164.all;

library work;
use work.UART_pkg.all;


entity uart_tb is
end entity;

architecture arch_uart_tb of uart_tb is
signal rx : std_logic;
begin
 
-- SEND messages
  process is
  begin
    rx <= '1';  
    wait for 10 ns;
    uart_write_data(rx, x"05", 9600);
    wait for 10 ns;
    uart_write_data(rx, x"AA");
    wait for 10 ns;
    uart_write_data(rx, x"C0");
    wait;
  end process;  
  
-- READ messages
  process begin
    read_data_uart(rx, 9600);
    read_data_uart(rx);
    read_data_uart(rx);
    wait;
  end process;

end architecture;