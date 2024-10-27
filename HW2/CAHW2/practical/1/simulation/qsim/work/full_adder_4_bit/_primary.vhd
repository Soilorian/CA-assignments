library verilog;
use verilog.vl_types.all;
entity full_adder_4_bit is
    port(
        c_out           : out    vl_logic;
        x               : in     vl_logic_vector(3 downto 0);
        y               : in     vl_logic_vector(3 downto 0);
        s               : out    vl_logic_vector(3 downto 0)
    );
end full_adder_4_bit;
