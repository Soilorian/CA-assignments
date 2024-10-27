library verilog;
use verilog.vl_types.all;
entity test_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        s               : in     vl_logic_vector(1 downto 0);
        x               : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end test_vlg_sample_tst;
