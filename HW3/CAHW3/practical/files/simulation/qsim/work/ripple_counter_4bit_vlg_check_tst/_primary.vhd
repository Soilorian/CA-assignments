library verilog;
use verilog.vl_types.all;
entity ripple_counter_4bit_vlg_check_tst is
    port(
        \out\           : in     vl_logic_vector(0 to 3);
        sampler_rx      : in     vl_logic
    );
end ripple_counter_4bit_vlg_check_tst;
