library verilog;
use verilog.vl_types.all;
entity Q1_vlg_check_tst is
    port(
        R0_value        : in     vl_logic_vector(7 downto 0);
        R1_value        : in     vl_logic_vector(7 downto 0);
        R2_value        : in     vl_logic_vector(7 downto 0);
        R3_value        : in     vl_logic_vector(7 downto 0);
        result_pin      : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end Q1_vlg_check_tst;
