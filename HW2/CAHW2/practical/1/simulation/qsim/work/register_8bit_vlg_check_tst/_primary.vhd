library verilog;
use verilog.vl_types.all;
entity register_8bit_vlg_check_tst is
    port(
        reg_output      : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end register_8bit_vlg_check_tst;
