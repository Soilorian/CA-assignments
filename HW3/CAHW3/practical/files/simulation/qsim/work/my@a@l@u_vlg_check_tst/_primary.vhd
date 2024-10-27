library verilog;
use verilog.vl_types.all;
entity myALU_vlg_check_tst is
    port(
        \out\           : in     vl_logic_vector(7 downto 0);
        ready           : in     vl_logic;
        zero            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end myALU_vlg_check_tst;
