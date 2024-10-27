library verilog;
use verilog.vl_types.all;
entity mux_4_vlg_check_tst is
    port(
        mux_output      : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end mux_4_vlg_check_tst;
