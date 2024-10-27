library verilog;
use verilog.vl_types.all;
entity full_adder_4_bit_vlg_sample_tst is
    port(
        x               : in     vl_logic_vector(3 downto 0);
        y               : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end full_adder_4_bit_vlg_sample_tst;
