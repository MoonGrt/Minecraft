module reciprocal2 (
    input  wire        clk,
    input  wire [15:0] x,   // Q4.12
    output reg  [15:0] y    // Q4.12
);

    // ----------------------------
    // MSB priority encoder
    // ----------------------------
    reg [4:0] msb_index;
    reg [4:0] shift;

    always @(*) begin
        casez (x)
            16'b1???????????????: msb_index = 15;
            16'b01??????????????: msb_index = 14;
            16'b001?????????????: msb_index = 13;
            16'b0001????????????: msb_index = 12;
            16'b00001???????????: msb_index = 11;
            16'b000001??????????: msb_index = 10;
            16'b0000001?????????: msb_index = 9;
            16'b00000001????????: msb_index = 8;
            16'b000000001???????: msb_index = 7;
            16'b0000000001??????: msb_index = 6;
            16'b00000000001?????: msb_index = 5;
            16'b000000000001????: msb_index = 4;
            16'b0000000000001???: msb_index = 3;
            16'b00000000000001??: msb_index = 2;
            16'b000000000000001?: msb_index = 1;
            16'b0000000000000001: msb_index = 0;
            default:              msb_index = 0;
        endcase
    end

    // 规格化：最高位 → bit11
    always @(*) begin
        if (x == 0)
            shift = 0;
        else
            shift = 11 - msb_index;
    end

    wire [15:0] m    = x << shift;      // Q4.12, 0.5~1
    wire [7:0]  addr = m[11:4];          // 8bit LUT index

    // ----------------------------
    // LUT
    // ----------------------------
    reg [15:0] lut [0:255];
    initial $readmemh("./build/recip_lut.mem", lut);

    // ----------------------------
    // Output
    // ----------------------------
    always @(posedge clk) y <= lut[addr] >> shift;

endmodule
