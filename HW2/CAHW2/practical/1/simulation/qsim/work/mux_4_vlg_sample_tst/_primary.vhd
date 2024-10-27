library verilog;
use verilog.vl_types.all;
entity mux_4_vlg_sample_tst is
    port(
        data0           : in     vl_logic_vector(31 downto 0);
        data1           : in     vl_logic_vector(31 downto 0);
        data2           : in     vl_logic_vector(31 downto 0);
        data3           : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end mux_4_vlg_sample_tst;
