set sdc_version 1.7

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design counter

create_clock -name clk -period 10 -waveform {0 5} [get_ports "clk"]
set_clock_transition -rise 0.1 [get_clocks "clk"]
set_clock_transition -fall 0.1 [get_clocks "clk"]
set_clock_uncertainity 0.1 [get_ports "clk"]
#set_clock_uncertainty -setup 1 [get_ports "clk"]
#set_clock_uncertainty -hold  1 [get_ports "clk"]
#set_clock_gating_check -setup 0.0 

set_input_delay -max 1.0 [get_ports "rst"] -clock [get_clocks "clk"]
set_output_delay -max 1.0 [get_ports "count"] -clock [get_clocks "clk"]

set_wire_load_mode "top"


