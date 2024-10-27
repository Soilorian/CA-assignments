library verilog;
use verilog.vl_types.all;
entity mux_8 is
    port(
        mux_output      : out    vl_logic_vector(7 downto 0);
        sel             : in     vl_logic_vector(2 downto 0);
        data0           : in     vl_logic_vector(7 downto 0);
        data1           : in     vl_logic_vector(7 downto 0);
        data2           : in     vl_logic_vector(7 downto 0);
        data3           : in     vl_logic_vector(7 downto 0);
        data4           : in     vl_logic_vector(7 downto 0);
        data5           : in     vl_logic_vector(7 downto 0);
        data6           : in     vl_logic_vector(7 downto 0);
        data7           : in     vl_logic_vector(7 downto 0)
    );
end mux_8;
