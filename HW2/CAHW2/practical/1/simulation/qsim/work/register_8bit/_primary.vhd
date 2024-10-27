library verilog;
use verilog.vl_types.all;
entity register_8bit is
    port(
        reg_output      : out    vl_logic_vector(7 downto 0);
        clock           : in     vl_logic;
        reg_input       : in     vl_logic_vector(7 downto 0)
    );
end register_8bit;
