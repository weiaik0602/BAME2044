library verilog;
use verilog.vl_types.all;
entity Integrate is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        enter           : in     vl_logic;
        Nin             : in     vl_logic_vector(7 downto 0);
        halt            : out    vl_logic;
        Nout            : out    vl_logic_vector(7 downto 0);
        IR75out         : out    vl_logic_vector(2 downto 0);
        StateNoout      : out    vl_logic_vector(3 downto 0)
    );
end Integrate;
