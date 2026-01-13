//Copyright (C)2014-2026 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.11.03 (64-bit) 
//Created Time: 2026-01-13 22:10:10
create_clock -name clk -period 37.037 -waveform {0 18.518} [get_ports {clk}] -add
create_clock -name mem_clk -period 2.5 -waveform {0 1.25} [get_nets {memory_clk}]
create_clock -name ppl_clk -period 83.333 -waveform {0 41.666} [get_nets {PPL_clk}]
report_timing -setup -from_clock [get_clocks {ppl_clk}] -to_clock [get_clocks {ppl_clk}]
report_timing -hold -rise_from_clock [get_clocks {ppl_clk}] -rise_to_clock [get_clocks {ppl_clk}]
