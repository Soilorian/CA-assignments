library verilog;
use verilog.vl_types.all;
entity mux4to1_16bit_vlg_sample_tst is
    port(
        input0          : in     vl_logic_vector(0 to 15);
        input1          : in     vl_logic_vector(0 to 15);
        input2          : in     vl_logic_vector(0 to 15);
        input3          : in     vl_logic_vector(0 to 15);
        sel             : in     vl_logic_vector(0 to 1);
        sampler_tx      : out    vl_logic
    );
end mux4to1_16bit_vlg_sample_tst;
