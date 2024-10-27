library verilog;
use verilog.vl_types.all;
entity mux_8_vlg_check_tst is
    port(
        mux_output      : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end mux_8_vlg_check_tst;
