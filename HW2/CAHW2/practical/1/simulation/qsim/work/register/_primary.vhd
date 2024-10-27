library verilog;
use verilog.vl_types.all;
entity \register\ is
    port(
        reg_output      : out    vl_logic;
        clock           : in     vl_logic;
        reg_input       : in     vl_logic
    );
end \register\;
