// Integer division lut

// module reciprocal3 (
//     input  wire        clk,
//     input  wire [12:0] x,   // 0~8192
//     output reg  [23:0] y    // (1<<18)/x
// );

//     reg [23:0] lut [0:8191];
//     initial $readmemh("./build/div_lut.hex", lut);
//     always @(posedge clk) y <= lut[x];

// endmodule

module reciprocal3 (
    input  wire        clk,
    input  wire [12:0] x,     // 13 bit 输入
    output reg  [23:0] y
);

    wire [9:0] addr = x[12:3];  // 取高 10 bit
    reg [23:0] lut [0:1023];
    initial $readmemh("./build/div_lut.hex", lut);
    always @(posedge clk) y <= lut[addr];

endmodule

