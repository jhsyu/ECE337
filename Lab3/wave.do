onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_test_case_num
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_test_case
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_test_case_stage
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_test_case_err
add wave -noupdate -divider {DUT Signals}
add wave -noupdate -radix unsigned -childformat {{{/tb_adder_16bit/tb_a[15]} -radix unsigned} {{/tb_adder_16bit/tb_a[14]} -radix unsigned} {{/tb_adder_16bit/tb_a[13]} -radix unsigned} {{/tb_adder_16bit/tb_a[12]} -radix unsigned} {{/tb_adder_16bit/tb_a[11]} -radix unsigned} {{/tb_adder_16bit/tb_a[10]} -radix unsigned} {{/tb_adder_16bit/tb_a[9]} -radix unsigned} {{/tb_adder_16bit/tb_a[8]} -radix unsigned} {{/tb_adder_16bit/tb_a[7]} -radix unsigned} {{/tb_adder_16bit/tb_a[6]} -radix unsigned} {{/tb_adder_16bit/tb_a[5]} -radix unsigned} {{/tb_adder_16bit/tb_a[4]} -radix unsigned} {{/tb_adder_16bit/tb_a[3]} -radix unsigned} {{/tb_adder_16bit/tb_a[2]} -radix unsigned} {{/tb_adder_16bit/tb_a[1]} -radix unsigned} {{/tb_adder_16bit/tb_a[0]} -radix unsigned}} -subitemconfig {{/tb_adder_16bit/tb_a[15]} {-radix unsigned} {/tb_adder_16bit/tb_a[14]} {-radix unsigned} {/tb_adder_16bit/tb_a[13]} {-radix unsigned} {/tb_adder_16bit/tb_a[12]} {-radix unsigned} {/tb_adder_16bit/tb_a[11]} {-radix unsigned} {/tb_adder_16bit/tb_a[10]} {-radix unsigned} {/tb_adder_16bit/tb_a[9]} {-radix unsigned} {/tb_adder_16bit/tb_a[8]} {-radix unsigned} {/tb_adder_16bit/tb_a[7]} {-radix unsigned} {/tb_adder_16bit/tb_a[6]} {-radix unsigned} {/tb_adder_16bit/tb_a[5]} {-radix unsigned} {/tb_adder_16bit/tb_a[4]} {-radix unsigned} {/tb_adder_16bit/tb_a[3]} {-radix unsigned} {/tb_adder_16bit/tb_a[2]} {-radix unsigned} {/tb_adder_16bit/tb_a[1]} {-radix unsigned} {/tb_adder_16bit/tb_a[0]} {-radix unsigned}} /tb_adder_16bit/tb_a
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_b
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_carry_in
add wave -noupdate -expand -group Sum -color {Cornflower Blue} -radix unsigned /tb_adder_16bit/tb_expected_sum
add wave -noupdate -expand -group Sum -color Violet -radix unsigned /tb_adder_16bit/tb_sum
add wave -noupdate -expand -group Overflow -color {Cornflower Blue} -radix unsigned /tb_adder_16bit/tb_expected_overflow
add wave -noupdate -expand -group Overflow -color Violet -radix unsigned /tb_adder_16bit/tb_overflow
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16099 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 256
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {200170 ps}
