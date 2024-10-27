library verilog;
use verilog.vl_types.all;
entity test is
    port(
        \out\           : out    vl_logic;
        x               : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic
    );
end test;
