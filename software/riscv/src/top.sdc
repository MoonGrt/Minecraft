//Copyright (C)2014-2025 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.11.03 (64-bit) 
//Created Time: 2025-07-30 21:07:12
create_clock -name clk -period 37.037 -waveform {0 18.518} [get_ports {io_clk}]
create_clock -name sysclk -period 10 -waveform {0 5} [get_nets {sysclk_clkout}]
