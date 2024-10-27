library verilog;
use verilog.vl_types.all;
entity booth_multiplier_8bit_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        \in1_\          : in     vl_logic_vector(7 downto 0);
        \in2_\          : in     vl_logic_vector(7 downto 0);
        start_not       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end booth_multiplier_8bit_vlg_sample_tst;
