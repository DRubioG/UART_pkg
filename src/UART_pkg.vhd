-- UART_pkg
-- repository : https://github.com/DRubioG/UART_pkg
-- This package simulates the behaviour of the UART for the testbenchs.
-- This package has procedures to write a UART message and read a UART message
-- in every frequency of the UART protocol (by default to 115200 bauds).
--
-- TABLE OF UART PERIOD
--      BAUDS   |   UART BIT PERIOD
--___________________________________
--      300     |   3333 us
--      600     |   1666 us
--      1200    |   833 us
--      2400    |   416.66 us
--      9600    |   104 us
--      19200   |   52 us
--      31250   |   32 us
--      38400   |   26 us
--      57600   |   17.61 us
--      74880   |   13.355 us
--      115200  |   8681 ns
--      230400  |   4340 ns
--      250000  |   4000 ns
--      460800  |   2170 ns
--      500000  |   2000 ns
--      921600  |   1085 ns
--      1000000 |   1000 ns
--      2000000 |   500 ns
--
-- You can find this table in this blog:
-- Reference: https://soceame.wordpress.com/2023/10/27/cual-es-la-frecuencia-real-de-los-baudios-de-la-uart/

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- DEFINITION OF THE COMPONENENTS
package UART_pkg is

    -- UART_WIDTH : defines the size of the UART messages
    constant UART_WIDTH : integer := 8;

    -- send_UART: procedure for sending message
    procedure send_UART (
        signal rx : out std_logic;
        valu : std_logic_vector(UART_WIDTH-1 downto 0);
        tempo : time
        );

    -- uart_write_data: procedure for using in the testbench
    procedure uart_write_data (
        signal rx : out std_logic;
        value : std_logic_vector(UART_WIDTH-1 downto 0);
        constant freq : integer := 115200
        );
        
    -- read_UART: procedure for reading a message and plotting
    procedure read_UART(
        signal rx : in std_logic;
        tempo : time
        );
        
    -- read_data_uart: procedure for using in the testbench
    procedure read_data_uart(
        signal rx : in std_logic;
        constant freq : integer := 115200
        );

end package;




package body UART_pkg is


--      send_UART:
--      This procedure simulates the transmission of a message using the UART protocol, 
--      to do this task needs the bit period of the UART, and the sending value.
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
        report "write data finish" severity note;
    
    end procedure;
    
  
--  uart_write_data_pkg:
--      This procedure fill the procedure send_UART for sending data 
--      with the period of the UART.
--      To do this task has the bit period table in the head of the file.
--      By default it sends the message to 115200 bauds.
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


--          read_UART:
--          This procedure simulates the reading of the data by UART.
--          To do this task this procedure needs the period of the UART.
--          When it finish the reading it plots the bits rode.
    procedure read_UART(
        signal rx : in std_logic;
        tempo : time
        ) is
        variable data : std_logic_vector(UART_WIDTH-1 downto 0);
    begin
    
        wait until rx='0';
        wait for tempo;
        wait for tempo/2;
        for i in 0 to UART_WIDTH-1 loop
            data(i) := rx;
            wait for tempo;
        end loop;
    
        report "Read UART data : " &    std_logic'image(data(UART_WIDTH-1)) & "," &
                                        std_logic'image(data(UART_WIDTH-2)) & "," &
                                        std_logic'image(data(UART_WIDTH-3)) & "," &
                                        std_logic'image(data(UART_WIDTH-4)) & "," &
                                        std_logic'image(data(UART_WIDTH-5)) & "," &
                                        std_logic'image(data(UART_WIDTH-6)) & "," &
                                        std_logic'image(data(UART_WIDTH-7)) & "," &
                                        std_logic'image(data(UART_WIDTH-8)) severity note;
    
    end procedure;
        

--          read_data_uart:
--          This procedure uses the procedure "read_UART" filling the 
--          UART period.
--          By default it reads the message to 115200 bauds.
    procedure read_data_uart(
        signal rx : in std_logic;
        constant freq : integer := 115200
        ) is 
    begin
    
        if freq = 300 then
            read_UART(rx, 3333 us);
            
        elsif freq = 600 then
            read_UART(rx, 1666 us);
            
        elsif freq = 1200 then
            read_UART(rx, 833 us);
            
        elsif freq = 2400 then
            read_UART(rx, 416.66 us);
            
        elsif freq = 9600 then
            read_UART(rx, 104 us);
            
        elsif freq = 19200 then
            read_UART(rx, 52 us);
            
        elsif freq = 31250 then
            read_UART(rx, 32 us);
            
        elsif freq = 38400 then
            read_UART(rx, 26 us);
            
        elsif freq = 57600 then
            read_UART(rx, 17.61 us);
            
        elsif freq = 74880 then
            read_UART(rx, 13.355 us);
            
        elsif freq = 115200 then
            read_UART(rx, 8681 ns);
            
        elsif freq = 230400 then
            read_UART(rx, 4340 ns);
            
        elsif freq = 250000 then
            read_UART(rx, 4000 ns);
            
        elsif freq = 460800 then
            read_UART(rx, 2170 ns);
            
        elsif freq = 500000 then
            read_UART(rx, 2000 ns);
            
        elsif freq = 921600 then
            read_UART(rx, 1085 ns);
            
        elsif freq = 1000000 then
            read_UART(rx, 1000 ns);
            
        elsif freq = 2000000 then
            read_UART(rx, 500 ns);
        
        end if;

    end procedure;

end UART_pkg;