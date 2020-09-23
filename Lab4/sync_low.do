onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_sync_low/tb_stream_check_tag
add wave -noupdate /tb_sync_low/tb_stream_test_num
add wave -noupdate /tb_sync_low/tb_test_num
add wave -noupdate /tb_sync_low/tb_test_case
add wave -noupdate /tb_sync_low/tb_clk
add wave -noupdate /tb_sync_low/tb_n_rst
add wave -noupdate /tb_sync_low/tb_async_in
add wave -noupdate /tb_sync_low/tb_sync_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {158585 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 243
configure wave -valuecolwidth 145
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
WaveRestoreZoom {150125 ps} {202625 ps}
