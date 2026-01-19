// reciprocal.v
// 使用 LUT + 1 次牛顿迭代实现 1/x
// LUT 从外部 .mem 文件加载
module reciprocal1 #(
    parameter ADDR_BITS = 8,   // LUT 地址位数
    parameter X_FRAC    = 13,  // 输入小数位
    parameter Y_FRAC    = 16,  // 输出小数位
    parameter WIDTH     = 16   // 输出总宽度
)(
    input  wire              clk,
    input  wire              rst,
    input  wire              in_valid,
    input  wire [X_FRAC+ADDR_BITS-1:0] x,
    output reg               out_valid,
    output reg [WIDTH-1:0]   y
);

    // -----------------------------
    // 1. LUT 阶段
    // -----------------------------
    localparam LUT_DEPTH = 1 << ADDR_BITS;
    reg [WIDTH-1:0] lut [0:LUT_DEPTH-1];

    // LUT 地址取输入的高 ADDR_BITS 位
    wire [ADDR_BITS-1:0] addr = x[X_FRAC+ADDR_BITS-1:X_FRAC];

    reg [WIDTH-1:0] y_lut;

    always @(posedge clk) begin
        if (in_valid) begin
            y_lut <= lut[addr];
        end
    end

    // -----------------------------
    // 2. Newton-Raphson refinement
    // y_next = y_lut * (2 - x * y_lut)
    // -----------------------------
    reg [2*WIDTH-1:0] mul1;
    reg [2*WIDTH-1:0] mul2;
    reg [WIDTH-1:0] y_next;

    always @(posedge clk) begin
        if (in_valid) begin
            // 乘法：x * y_lut
            mul1 <= x * y_lut; // 定点 Qx_frac * Qy_frac
        end
    end

    // NR: 2 - x*y
    wire [2*WIDTH-1:0] two_fixed = 1 << (X_FRAC + Y_FRAC); // 2.0 in same frac as mul1
    wire [2*WIDTH-1:0] diff = two_fixed - mul1;

    always @(posedge clk) begin
        if (in_valid) begin
            mul2 <= y_lut * diff;  // QY_FRAC * Q? -> 再调整小数位
            y_next <= mul2[2*Y_FRAC-1:Y_FRAC]; // 保持 QY_FRAC 输出
        end
    end

    // -----------------------------
    // 3. 输出
    // -----------------------------
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out_valid <= 0;
            y <= 0;
        end else begin
            out_valid <= in_valid;
            y <= y_next;
        end
    end

    // -----------------------------
    // 4. 初始化 LUT
    // -----------------------------
    initial begin
        $readmemh("./build/recip_lut.mem", lut);
    end

endmodule
