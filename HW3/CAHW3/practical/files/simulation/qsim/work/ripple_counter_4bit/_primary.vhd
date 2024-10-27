library verilog;
use verilog.vl_types.all;
entity ripple_counter_4bit is
    port(
        \out\           : out    vl_logic_vector(0 to 3);
        clear_not       : in     vl_logic;
        clock           : in     vl_logic;
        en              : in     vl_logic;
        pri_not         : in     vl_logic
    );
end ripple_counter_4bit;
