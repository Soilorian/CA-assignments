library verilog;
use verilog.vl_types.all;
entity ripple_counter_4bit_vlg_sample_tst is
    port(
        clear_not       : in     vl_logic;
        clock           : in     vl_logic;
        en              : in     vl_logic;
        pri_not         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ripple_counter_4bit_vlg_sample_tst;
