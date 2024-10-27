library verilog;
use verilog.vl_types.all;
entity Q1_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        instr0          : in     vl_logic_vector(2 downto 0);
        instr1          : in     vl_logic_vector(2 downto 0);
        instr2          : in     vl_logic_vector(2 downto 0);
        instr3          : in     vl_logic_vector(2 downto 0);
        operand1        : in     vl_logic_vector(2 downto 0);
        opernad0        : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end Q1_vlg_sample_tst;
