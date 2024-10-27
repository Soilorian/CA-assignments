library verilog;
use verilog.vl_types.all;
entity register_8bit_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        reg_input       : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end register_8bit_vlg_sample_tst;
