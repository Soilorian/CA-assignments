library verilog;
use verilog.vl_types.all;
entity register_2bit_vlg_check_tst is
    port(
        o               : in     vl_logic_vector(0 to 1);
        sampler_rx      : in     vl_logic
    );
end register_2bit_vlg_check_tst;
