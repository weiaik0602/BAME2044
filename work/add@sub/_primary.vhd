library verilog;
use verilog.vl_types.all;
entity addSub is
    port(
        Cin             : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        M               : in     vl_logic_vector(7 downto 0);
        \OUT\           : out    vl_logic_vector(7 downto 0)
    );
end addSub;
