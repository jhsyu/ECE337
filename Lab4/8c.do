onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TESTCASES /tb_counter_8bit/tb_test_num
add wave -noupdate -expand -group TESTCASES /tb_counter_8bit/tb_test_case
add wave -noupdate -expand -group TESTCASES /tb_counter_8bit/tb_stream_test_num
add wave -noupdate -expand -group TESTCASES /tb_counter_8bit/tb_stream_check_tag
add wave -noupdate /tb_counter_8bit/tb_clk
add wave -noupdate /tb_counter_8bit/tb_n_rst
add wave -noupdate -expand -group INPUT /tb_counter_8bit/tb_clear
add wave -noupdate -expand -group INPUT /tb_counter_8bit/tb_count_enable
add wave -noupdate -expand -group INPUT -radix decimal /tb_counter_8bit/tb_rollover_val
add wave -noupdate -expand -group OUTPUT -radix decimal /tb_counter_8bit/tb_count_out
add wave -noupdate -expand -group OUTPUT /tb_counter_8bit/tb_rollover_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 250
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {63 ns}
