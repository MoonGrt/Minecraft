module projection #(
    parameter BLOCK_NUM = 16,
    parameter FACE_NUM = 6,
    parameter TEXTURE_NUM = 20
)(
    input  wire [$clog2(BLOCK_NUM)-1:0] block_id,
    input  wire [$clog2(FACE_NUM)-1:0] face,
    output reg  [$clog2(TEXTURE_NUM)-1:0] texture_id
);

    // 计算地址
    wire [$clog2(BLOCK_NUM*FACE_NUM)-1:0] addr = block_id * 6 + face;
    // 声明 ROM
    reg [$clog2(TEXTURE_NUM)-1:0] mem [0:BLOCK_NUM*FACE_NUM-1];
    // 初始化 ROM
    initial begin
        $readmemh("G:/VM/share/Minecraft/scripts/res/output/txt_idx.hex", mem);
    end
    // 组合逻辑直接读取
    always @(*) begin
        texture_id = mem[addr];
    end

endmodule
