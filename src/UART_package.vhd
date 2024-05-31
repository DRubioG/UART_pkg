library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



package UART_pkg is

    constant UART_WIDTH : integer := 8;

    procedure send_UART (
        signal rx : out std_logic;
        valu : std_logic_vector(UART_WIDTH-1 downto 0);
        tempo : time
        );

    procedure uart_write_data (
        signal rx : out std_logic;
        value : std_logic_vector(UART_WIDTH-1 downto 0);
        constant freq : integer := 115200
        );

end package;




package body UART_pkg is

  procedure send_UART (
        signal rx : out std_logic;
        valu : std_logic_vector(UART_WIDTH-1 downto 0);
        tempo : time
        ) is
  begin
    rx <= '1';
    wait for tempo;
    rx <= '0';
    wait for tempo;
    
    for i in 0 to UART_WIDTH-1 loop
        rx <= valu(i);
        wait for tempo;
    end loop;
    
    rx <= '1';
    wait for tempo;
    report "uart data finish";
    
  end send_UART;
  
  
  procedure uart_write_data (
        signal rx : out std_logic;
        value : std_logic_vector(UART_WIDTH-1 downto 0);
        constant freq : integer := 115200
        ) is
    begin
        if freq = 300 then
            send_UART(rx, value, 3333 us);
            
        elsif freq = 600 then
            send_UART(rx, value, 1666 us);
            
        elsif freq = 1200 then
            send_UART(rx, value, 833 us);
            
        elsif freq = 2400 then
            send_UART(rx, value, 416.66 us);
            
        elsif freq = 9600 then
            send_UART(rx, value, 104 us);
            
        elsif freq = 19200 then
            send_UART(rx, value, 52 us);
            
        elsif freq = 31250 then
            send_UART(rx, value, 32 us);
            
        elsif freq = 38400 then
            send_UART(rx, value, 26 us);
            
        elsif freq = 57600 then
            send_UART(rx, value, 17.61 us);
            
        elsif freq = 74880 then
            send_UART(rx, value, 13.355 us);
            
        elsif freq = 115200 then
            send_UART(rx, value, 8681 ns);
            
        elsif freq = 230400 then
            send_UART(rx, value, 4340 ns);
            
        elsif freq = 250000 then
            send_UART(rx, value, 4000 ns);
            
        elsif freq = 460800 then
            send_UART(rx, value, 2170 ns);
            
        elsif freq = 500000 then
            send_UART(rx, value, 2000 ns);
            
        elsif freq = 921600 then
            send_UART(rx, value, 1085 ns);
            
        elsif freq = 1000000 then
            send_UART(rx, value, 1000 ns);
            
        elsif freq = 2000000 then
            send_UART(rx, value, 500 ns);
        
        end if;
    end procedure;

end UART_pkg;