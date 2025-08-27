`timescale 1ns / 1ps
module tb_top;

    // top Parameters
    parameter T = 37.037;

    // top Inputs
    reg clk = 0;
    reg rst_n;

    initial begin
        forever #(T / 2) clk = ~clk;
    end

    initial begin
        rst_n = 0;
        #(T * 2) rst_n = 1;
    end

    TMDS_rPLL u_tmds_rpll (
          .clkin (clk)                //input clk 
        , .clkout(serial_clk)         //output clk 
        , .lock  (TMDS_DDR_pll_lock)  //output lock
    );
    CLKDIV u_clkdiv (
          .RESETN(TMDS_DDR_pll_lock),
          .HCLKIN(serial_clk)          //clk  x5
        , .CLKOUT(video_clk)           //clk  x1
        , .CALIB (1'b1)
    );
    defparam u_clkdiv.DIV_MODE = "5"; defparam u_clkdiv.GSREN = "false";

    wire PPL_clk;
    wire PLL_lock;
    ppl_clk ppl_clk (
        .clkout(PPL_clk),   //output clkout
        .lock  (PLL_lock),  //output lock
        .clkin (clk)        //input clkin
    );

    top top (
        .video_clk(video_clk),
        .PPL_clk  (PPL_clk),
        .rst_n    (TMDS_DDR_pll_lock && PLL_lock)
    );

    GSR GSR (.GSRI(1'b1));

endmodule
