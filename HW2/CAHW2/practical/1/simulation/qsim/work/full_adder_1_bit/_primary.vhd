library verilog;
use verilog.vl_types.all;
entity full_adder_1_bit is
    port(
        s               : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic;
        c_in            : in     vl_logic;
        c_out           : out    vl_logic
    );
end full_adder_1_bit;
