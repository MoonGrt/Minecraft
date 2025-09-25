//Copyright (C)2014-2025 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.11.03 (64-bit)
//Part Number: GW2A-LV18PG256C8/I7
//Device: GW2A-18
//Device Version: C
//Created Time: Wed Sep 24 21:24:33 2025

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    texture_rom your_instance_name(
        .dout(dout), //output [15:0] dout
        .clk(clk), //input clk
        .oce(oce), //input oce
        .ce(ce), //input ce
        .reset(reset), //input reset
        .ad(ad) //input [12:0] ad
    );

//--------Copy end-------------------
