library verilog;
use verilog.vl_types.all;
entity ModuleReg is
    generic(
        size            : integer := 8
    );
    port(
        clock           : in     vl_logic;
        load            : in     vl_logic;
        clear           : in     vl_logic;
        \IN\            : in     vl_logic_vector;
        \OUT\           : out    vl_logic_vector
    );
end ModuleReg;
