library verilog;
use verilog.vl_types.all;
entity gather_vlg_check_tst is
    port(
        \index1_\       : in     vl_logic_vector(0 to 15);
        \index2_\       : in     vl_logic_vector(0 to 15);
        \index3_\       : in     vl_logic_vector(0 to 15);
        \index4_\       : in     vl_logic_vector(0 to 15);
        \selected1_\    : in     vl_logic_vector(0 to 15);
        \selected2_\    : in     vl_logic_vector(0 to 15);
        \selected3_\    : in     vl_logic_vector(0 to 15);
        \selected4_\    : in     vl_logic_vector(0 to 15);
        sampler_rx      : in     vl_logic
    );
end gather_vlg_check_tst;
