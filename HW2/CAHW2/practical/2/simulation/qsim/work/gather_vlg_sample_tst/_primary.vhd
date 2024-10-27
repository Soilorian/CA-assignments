library verilog;
use verilog.vl_types.all;
entity gather_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        \data_0_\       : in     vl_logic_vector(0 to 15);
        \data_1_\       : in     vl_logic_vector(0 to 15);
        \data_2_\       : in     vl_logic_vector(0 to 15);
        \data_3_\       : in     vl_logic_vector(0 to 15);
        \data_4_\       : in     vl_logic_vector(0 to 15);
        \data_5_\       : in     vl_logic_vector(0 to 15);
        \data_6_\       : in     vl_logic_vector(0 to 15);
        \data_7_\       : in     vl_logic_vector(0 to 15);
        \data_8_\       : in     vl_logic_vector(0 to 15);
        \data_9_\       : in     vl_logic_vector(0 to 15);
        \data_10_\      : in     vl_logic_vector(0 to 15);
        \data_11_\      : in     vl_logic_vector(0 to 15);
        \data_12_\      : in     vl_logic_vector(0 to 15);
        \data_13_\      : in     vl_logic_vector(0 to 15);
        \data_14_\      : in     vl_logic_vector(0 to 15);
        \data_15_\      : in     vl_logic_vector(0 to 15);
        index_vector    : in     vl_logic_vector(0 to 63);
        sampler_tx      : out    vl_logic
    );
end gather_vlg_sample_tst;
