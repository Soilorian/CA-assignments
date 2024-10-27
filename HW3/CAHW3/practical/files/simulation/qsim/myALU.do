onerror {exit -code 1}
vlib work
vlog -work work myALU.vo
vlog -work work Waveform_alu_test.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.myALU_vlg_vec_tst -voptargs="+acc"
vcd file -direction myALU.msim.vcd
vcd add -internal myALU_vlg_vec_tst/*
vcd add -internal myALU_vlg_vec_tst/i1/*
run -all
quit -f
