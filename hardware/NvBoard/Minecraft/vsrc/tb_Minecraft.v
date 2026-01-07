`timescale 1ns / 1ps

module tb_Minecraft;

  // Minecraft Parameters
  parameter T = 10;

  // Minecraft Inputs
  reg        clk = 0;
  reg        rst = 1;

  // Minecraft Outputs
  wire       vga_clk;
  wire       vga_hs;
  wire       vga_vs;
  wire       vga_de;
  wire [7:0] vga_r;
  wire [7:0] vga_g;
  wire [7:0] vga_b;

  initial begin
    forever #(T / 2) clk = ~clk;
  end

  initial begin
    #(T * 2) rst = 0;
  end

  Minecraft Minecraft (
      .clk    (clk),
      .rst    (rst),
      .vga_clk(vga_clk),
      .vga_hs (vga_hs),
      .vga_vs (vga_vs),
      .vga_de (vga_de),
      .vga_r  (vga_r),
      .vga_g  (vga_g),
      .vga_b  (vga_b)
  );

endmodule
