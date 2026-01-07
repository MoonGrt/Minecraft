`timescale 1ns / 1ps

module framebuffer #(
    parameter DP = 512,
    parameter DW = 8,
    parameter AW = $clog2(DP)
)(
    /* 写端：视频输入 */
    input               video_clk,
    input               video_rst,
    input  [DW-1:0]     video_data,
    input               video_de,
    input               video_vs,

    /* 读端：像素读取 */
    input               pixel_clk,
    input               pixel_rst,
    input  [AW-1:0]     pixel_addr,
    input               pixel_en,
    output [DW-1:0]     pixel_data
);

    reg [AW-1:0] wr_addr;
    reg          video_vs_d;

    always @(posedge video_clk or posedge video_rst) begin
        if (video_rst) begin
            wr_addr     <= {AW{1'b0}};
            video_vs_d <= 1'b0;
        end else begin
            video_vs_d <= video_vs;

            /* 新一帧开始，地址清零 */
            if (~video_vs_d & video_vs)
                wr_addr <= {AW{1'b0}};
            else if (video_de)
                wr_addr <= wr_addr + 1'b1;
        end
    end

    reg frame_done;

    always @(posedge video_clk or posedge video_rst) begin
        if (video_rst)
            frame_done <= 1'b0;
        else
            frame_done <= (~video_vs_d & video_vs);  // VS 上升沿
    end

    reg buf_sel_wr;

    always @(posedge video_clk or posedge video_rst) begin
        if (video_rst)
            buf_sel_wr <= 1'b0;
        else if (frame_done)
            buf_sel_wr <= ~buf_sel_wr;
    end

    reg buf_sel_rd_ff1, buf_sel_rd_ff2;

    always @(posedge pixel_clk or posedge pixel_rst) begin
        if (pixel_rst) begin
            buf_sel_rd_ff1 <= 1'b0;
            buf_sel_rd_ff2 <= 1'b0;
        end else begin
            buf_sel_rd_ff1 <= buf_sel_wr;
            buf_sel_rd_ff2 <= buf_sel_rd_ff1;
        end
    end

    wire buf_sel_rd = buf_sel_rd_ff2;

    wire [DW-1:0] fb0_doutb;

    DPRAM #(
        .INIT_FILE(""),
        .DP(DP),
        .DW(DW),
        .AW(AW)
    ) fb0 (
        /* A 口：视频写 */
        .clka (video_clk),
        .rsta (video_rst),
        .cea  (video_de & ~buf_sel_wr),
        .wra  (video_de & ~buf_sel_wr),
        .addra(wr_addr),
        .dina (video_data),
        .douta(),

        /* B 口：像素读 */
        .clkb (pixel_clk),
        .rstb (pixel_rst),
        .ceb  (pixel_en &  buf_sel_rd),
        .wrb  (1'b0),
        .addrb(pixel_addr),
        .dinb ({DW{1'b0}}),
        .doutb(fb0_doutb)
    );

    wire [DW-1:0] fb1_doutb;

    DPRAM #(
        .INIT_FILE(""),
        .DP(DP),
        .DW(DW),
        .AW(AW)
    ) fb1 (
        /* A 口：视频写 */
        .clka (video_clk),
        .rsta (video_rst),
        .cea  (video_de &  buf_sel_wr),
        .wra  (video_de &  buf_sel_wr),
        .addra(wr_addr),
        .dina (video_data),
        .douta(),

        /* B 口：像素读 */
        .clkb (pixel_clk),
        .rstb (pixel_rst),
        .ceb  (pixel_en & ~buf_sel_rd),
        .wrb  (1'b0),
        .addrb(pixel_addr),
        .dinb ({DW{1'b0}}),
        .doutb(fb1_doutb)
    );

    assign pixel_data = buf_sel_rd ? fb0_doutb : fb1_doutb;

endmodule