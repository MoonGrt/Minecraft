//Copyright (C)2014-2025 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.11.03 (64-bit) 
//Created Time: 2025-09-21 21:17:05
create_clock -name mem_clk -period 2.5 -waveform {0 1.25} [get_nets {memory_clk}]
create_clock -name video_clk -period 13.468 -waveform {0 6.734} [get_nets {video_clk}]
create_clock -name serial_clk -period 2.694 -waveform {0 1.347} [get_nets {serial_clk}]
create_clock -name clk -period 37.037 -waveform {0 18.518} [get_ports {clk}] -add
report_timing -hold -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
report_timing -setup -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
