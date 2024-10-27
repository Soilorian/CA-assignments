library verilog;
use verilog.vl_types.all;
entity full_adder_8_bit_vlg_check_tst is
    port(
        c_out           : in     vl_logic;
        s               : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end full_adder_8_bit_vlg_check_tst;
