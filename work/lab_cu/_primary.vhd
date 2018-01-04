library verilog;
use verilog.vl_types.all;
entity lab_cu is
    generic(
        S0              : integer := 0;
        S1              : integer := 1;
        S2              : integer := 2;
        S3              : integer := 8;
        S4              : integer := 9;
        S5              : integer := 10;
        S6              : integer := 11;
        S7              : integer := 12;
        S8              : integer := 13;
        S9              : integer := 14;
        S10             : integer := 15
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        enter           : in     vl_logic;
        Aeq0            : in     vl_logic;
        Apos            : in     vl_logic;
        IR              : in     vl_logic_vector(2 downto 0);
        IRload          : out    vl_logic;
        JMPmux          : out    vl_logic;
        PCload          : out    vl_logic;
        Meminst         : out    vl_logic;
        MemWr           : out    vl_logic;
        Asel            : out    vl_logic_vector(1 downto 0);
        Aload           : out    vl_logic;
        Sub             : out    vl_logic;
        Halt            : out    vl_logic;
        StateNo         : out    vl_logic_vector(3 downto 0)
    );
end lab_cu;
