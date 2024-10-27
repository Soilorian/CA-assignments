library verilog;
use verilog.vl_types.all;
entity mux4to1_16bit is
    port(
        res             : out    vl_logic_vector(0 to 15);
        sel             : in     vl_logic_vector(0 to 1);
        input0          : in     vl_logic_vector(0 to 15);
        input1          : in     vl_logic_vector(0 to 15);
        input2          : in     vl_logic_vector(0 to 15);
        input3          : in     vl_logic_vector(0 to 15)
    );
end mux4to1_16bit;
