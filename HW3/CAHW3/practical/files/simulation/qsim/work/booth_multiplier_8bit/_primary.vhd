library verilog;
use verilog.vl_types.all;
entity booth_multiplier_8bit is
    port(
        ready           : out    vl_logic;
        start_not       : in     vl_logic;
        clock           : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0);
        \in1_\          : in     vl_logic_vector(7 downto 0);
        \in2_\          : in     vl_logic_vector(7 downto 0)
    );
end booth_multiplier_8bit;
