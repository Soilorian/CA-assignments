library verilog;
use verilog.vl_types.all;
entity register_8bit is
    port(
        s_out           : out    vl_logic;
        p_load          : in     vl_logic;
        pri_not         : in     vl_logic;
        s_in            : in     vl_logic;
        clock           : in     vl_logic;
        en              : in     vl_logic;
        clear_not       : in     vl_logic;
        p_in            : in     vl_logic_vector(7 downto 0);
        p_out           : out    vl_logic_vector(7 downto 0)
    );
end register_8bit;
