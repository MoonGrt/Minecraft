//Copyright (C)2014-2026 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.11.03 (64-bit) 
//Created Time: 2026-02-01 20:54:08
create_clock -name mem_clk -period 2.5 -waveform {0 1.25} [get_nets {memory_clk}]
create_clock -name ppl_clk -period 18.519 -waveform {0 11.111} [get_nets {PPL_clk}]
create_clock -name clk -period 37.037 -waveform {0 18.518} [get_ports {clk}] -add
report_timing -setup -from_clock [get_clocks {ppl_clk}] -to_clock [get_clocks {ppl_clk}] -max_paths 25 -max_common_paths 1
report_timing -hold -rise_from_clock [get_clocks {ppl_clk}] -rise_to_clock [get_clocks {ppl_clk}] -max_paths 25 -max_common_paths 1
