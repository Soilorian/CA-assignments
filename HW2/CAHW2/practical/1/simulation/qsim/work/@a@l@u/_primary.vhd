library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        result          : out    vl_logic_vector(7 downto 0);
        operand1        : in     vl_logic_vector(7 downto 0);
        operand2        : in     vl_logic_vector(7 downto 0)
    );
end ALU;
