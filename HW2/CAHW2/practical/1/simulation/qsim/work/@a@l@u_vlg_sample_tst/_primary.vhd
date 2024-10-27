library verilog;
use verilog.vl_types.all;
entity ALU_vlg_sample_tst is
    port(
        operand1        : in     vl_logic_vector(7 downto 0);
        operand2        : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end ALU_vlg_sample_tst;
