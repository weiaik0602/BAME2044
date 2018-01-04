library verilog;
use verilog.vl_types.all;
entity lab4B_p2 is
    port(
        s               : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        Q               : out    vl_logic
    );
end lab4B_p2;
