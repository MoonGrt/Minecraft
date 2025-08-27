//Copyright (C)2014-2024 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.10.02 
//Created Time: 2024-08-30 23:19:13
create_clock -name PPL_clk -period 166.667 -waveform {0 83.334} [get_nets {PPL_clk}]
create_clock -name mem_clk -period 2.5 -waveform {0 1.25} [get_nets {memory_clk}]
create_clock -name clk -period 37.037 -waveform {0 18.518} [get_ports {clk}] -add
report_timing -hold -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
report_timing -setup -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
