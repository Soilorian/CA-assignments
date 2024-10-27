library verilog;
use verilog.vl_types.all;
entity Q1 is
    port(
        R0_value        : out    vl_logic_vector(7 downto 0);
        clock           : in     vl_logic;
        opernad0        : in     vl_logic_vector(2 downto 0);
        operand1        : in     vl_logic_vector(2 downto 0);
        instr3          : in     vl_logic_vector(2 downto 0);
        instr2          : in     vl_logic_vector(2 downto 0);
        instr1          : in     vl_logic_vector(2 downto 0);
        instr0          : in     vl_logic_vector(2 downto 0);
        R1_value        : out    vl_logic_vector(7 downto 0);
        R2_value        : out    vl_logic_vector(7 downto 0);
        R3_value        : out    vl_logic_vector(7 downto 0);
        result_pin      : out    vl_logic_vector(7 downto 0)
    );
end Q1;
