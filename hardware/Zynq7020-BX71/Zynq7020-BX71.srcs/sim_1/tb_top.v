`timescale 1ns / 1ps
module tb_top;

// top Parameters
parameter T = 20;

// top Inputs
reg   clk = 0;
reg   rst;

initial begin
    forever #(T/2) clk = ~clk;
end

initial begin
    rst = 1;
    #(T*2) rst = 0;
end

top top (
    .clk ( clk ),
    .rst ( rst )
);

endmodule