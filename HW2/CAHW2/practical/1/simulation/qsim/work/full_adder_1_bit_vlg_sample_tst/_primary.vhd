library verilog;
use verilog.vl_types.all;
entity full_adder_1_bit_vlg_sample_tst is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c_in            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end full_adder_1_bit_vlg_sample_tst;
