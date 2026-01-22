// Integer division lut

module div_lut (
    input  wire        clk,
    input  wire [12:0] x,     // 13 bit 输入
    output reg  [23:0] y
);

    wire [9:0] addr = x[12:3];  // 取高 10 bit
    reg [23:0] lut [0:1023];
    initial $readmemh("./vsrc/div_lut.hex", lut);
    always @(posedge clk) y <= lut[addr];

endmodule
