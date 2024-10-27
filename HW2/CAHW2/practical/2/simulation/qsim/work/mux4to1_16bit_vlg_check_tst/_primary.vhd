library verilog;
use verilog.vl_types.all;
entity mux4to1_16bit_vlg_check_tst is
    port(
        res             : in     vl_logic_vector(0 to 15);
        sampler_rx      : in     vl_logic
    );
end mux4to1_16bit_vlg_check_tst;
