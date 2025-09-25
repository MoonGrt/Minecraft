//Copyright (C)2014-2025 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.11.03 (64-bit)
//Part Number: GW2A-LV18PG256C8/I7
//Device: GW2A-18
//Device Version: C
//Created Time: Wed Sep 24 19:14:38 2025

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    map_ram your_instance_name(
        .dout(dout), //output [3:0] dout
        .clka(clka), //input clka
        .cea(cea), //input cea
        .reseta(reseta), //input reseta
        .clkb(clkb), //input clkb
        .ceb(ceb), //input ceb
        .resetb(resetb), //input resetb
        .oce(oce), //input oce
        .ada(ada), //input [14:0] ada
        .din(din), //input [3:0] din
        .adb(adb) //input [14:0] adb
    );

//--------Copy end-------------------
