library verilog;
use verilog.vl_types.all;
entity RamReg is
    port(
        clock           : in     vl_logic;
        address         : in     vl_logic_vector(4 downto 0);
        WE              : in     vl_logic;
        D               : in     vl_logic_vector(7 downto 0);
        Q               : out    vl_logic_vector(7 downto 0)
    );
end RamReg;
