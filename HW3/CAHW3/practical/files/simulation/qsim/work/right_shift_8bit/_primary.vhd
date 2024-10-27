library verilog;
use verilog.vl_types.all;
entity right_shift_8bit is
    port(
        \out\           : out    vl_logic_vector(7 downto 0);
        \in\            : in     vl_logic_vector(7 downto 0)
    );
end right_shift_8bit;
