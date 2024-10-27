library verilog;
use verilog.vl_types.all;
entity register_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        reg_input       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end register_vlg_sample_tst;
