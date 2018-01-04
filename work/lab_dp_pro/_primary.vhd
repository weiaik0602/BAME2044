library verilog;
use verilog.vl_types.all;
entity lab_dp_pro is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        Input           : in     vl_logic_vector(7 downto 0);
        IRload          : in     vl_logic;
        JMPmux          : in     vl_logic;
        PCload          : in     vl_logic;
        \Meminst\       : in     vl_logic;
        MemWr           : in     vl_logic;
        Asel            : in     vl_logic_vector(1 downto 0);
        Aload           : in     vl_logic;
        Sub             : in     vl_logic;
        Aeq0            : out    vl_logic;
        Apos            : out    vl_logic;
        IR75            : out    vl_logic_vector(2 downto 0);
        \OUT\           : out    vl_logic_vector(7 downto 0);
        meminst         : out    vl_logic_vector(4 downto 0);
        da70            : out    vl_logic_vector(7 downto 0);
        q70             : out    vl_logic_vector(7 downto 0);
        ir70            : out    vl_logic_vector(7 downto 0);
        pc40            : out    vl_logic_vector(4 downto 0);
        a70             : out    vl_logic_vector(4 downto 0)
    );
end lab_dp_pro;
