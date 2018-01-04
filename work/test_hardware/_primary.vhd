library verilog;
use verilog.vl_types.all;
entity test_hardware is
    port(
        CLOCK_50        : in     vl_logic;
        SW              : in     vl_logic_vector(9 downto 0);
        KEY             : in     vl_logic_vector(0 downto 0);
        LEDR            : out    vl_logic_vector(9 downto 0)
    );
end test_hardware;
