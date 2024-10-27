library verilog;
use verilog.vl_types.all;
entity myALU is
    port(
        zero            : out    vl_logic;
        opcode          : in     vl_logic_vector(3 downto 0);
        \i1_\           : in     vl_logic_vector(7 downto 0);
        \i2_\           : in     vl_logic_vector(7 downto 0);
        ready           : out    vl_logic;
        clock           : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end myALU;
