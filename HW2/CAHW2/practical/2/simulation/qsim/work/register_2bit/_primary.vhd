library verilog;
use verilog.vl_types.all;
entity register_2bit is
    port(
        o               : out    vl_logic_vector(0 to 1);
        CLR             : in     vl_logic;
        CLK             : in     vl_logic;
        i               : in     vl_logic_vector(0 to 1);
        PRI             : in     vl_logic
    );
end register_2bit;
