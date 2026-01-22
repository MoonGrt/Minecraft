module reciprocal (
    input  wire        clk,
    input  wire [15:0] x,  // Q4.12
    output reg  [15:0] y   // Q4.12
);

    // =========================================================
    // 1. MSB priority encoder
    // =========================================================
    reg [4:0] msb_index;

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

    // =========================================================
    // 2. signed shift calculation
    //    目标：最高 1 → bit11
    // =========================================================
    reg signed [5:0] shift;

    always @(*) begin
        if (x == 0)
            shift = 0;
        else
            shift = 11 - msb_index;  // signed!
    end

    // =========================================================
    // 3. normalization (left OR right shift)
    // =========================================================
    wire [15:0] m = shift >= 0 ? (x << shift) : (x >> (-shift));

    // m ∈ [0.5, 1.0)  // 映射 m=0.5→0, m≈1→255
    wire [15:0] temp_addr = (m - 16'h0800) >> 4;
    wire [7:0]  addr      = temp_addr[7:0];

    // =========================================================
    // 4. LUT : 1/m (Q4.12)
    // =========================================================
    reg [15:0] lut [0:255];
    initial $readmemh("./vsrc//recip_lut.mem", lut);

    // =========================================================
    // 5. denormalization
    //    y = (1/m) * 2^shift
    // =========================================================
    wire [31:0] temp = (shift >= 0) ? ({16'b0, lut[addr]} << shift) : ({16'b0, lut[addr]} >> (-shift));;

    always @(posedge clk) begin
        if (x == 0) begin
            y <= 16'hFFFF;  // 饱和
        end else begin            
            // 简单截断
            // y <= temp[15:0];
            // 饱和输出
            if (temp >= 16'hFFFF) y <= 16'hFFFF;
            else y <= temp[15:0];
        end
    end

endmodule
