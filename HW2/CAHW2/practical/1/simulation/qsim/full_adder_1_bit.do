onerror {exit -code 1}
vlib work
vlog -work work full_adder_1_bit.vo
vlog -work work Waveform13.vwf.vt
vsim -novopt -c -t 1ps -L maxv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Q1_vlg_vec_tst -voptargs="+acc"
vcd file -direction full_adder_1_bit.msim.vcd
vcd add -internal Q1_vlg_vec_tst/*
vcd add -internal Q1_vlg_vec_tst/i1/*
run -all
quit -f
