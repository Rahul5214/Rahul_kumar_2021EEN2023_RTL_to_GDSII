###############################################################
#  Generated by:      Cadence Innovus 16.26-s040_1
#  OS:                Linux x86_64(Host ID bessel1)
#  Generated on:      Sat Oct 16 23:41:02 2021
#  Design:            counter
#  Command:           saveDesign counter_v1
###############################################################
current_design counter
set_clock_gating_check -rise -setup 0 
set_clock_gating_check -fall -setup 0 
create_clock [get_ports {clk}]  -name clk -period 10.000000 -waveform {0.000000 5.000000}
set_clock_transition  -rise -min 0.1 [get_clocks {clk}]
set_clock_transition  -rise -max 0.1 [get_clocks {clk}]
set_clock_transition  -fall -min 0.1 [get_clocks {clk}]
set_clock_transition  -fall -max 0.1 [get_clocks {clk}]
set_propagated_clock  [get_ports {clk}]
set_wire_load_mode top
set_input_delay -add_delay 1 -max -clock [get_clocks {clk}] [get_ports {rst}]
set_output_delay -add_delay 1 -max -clock [get_clocks {clk}] [get_ports {count[1]}]
set_output_delay -add_delay 1 -max -clock [get_clocks {clk}] [get_ports {count[2]}]
set_output_delay -add_delay 1 -max -clock [get_clocks {clk}] [get_ports {count[0]}]
