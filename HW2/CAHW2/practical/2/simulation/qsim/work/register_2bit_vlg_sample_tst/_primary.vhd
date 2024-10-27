library verilog;
use verilog.vl_types.all;
entity register_2bit_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        CLR             : in     vl_logic;
        i               : in     vl_logic_vector(0 to 1);
        PRI             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end register_2bit_vlg_sample_tst;
