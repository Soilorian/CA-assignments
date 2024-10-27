library verilog;
use verilog.vl_types.all;
entity myALU_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        \i1_\           : in     vl_logic_vector(7 downto 0);
        \i2_\           : in     vl_logic_vector(7 downto 0);
        opcode          : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end myALU_vlg_sample_tst;
