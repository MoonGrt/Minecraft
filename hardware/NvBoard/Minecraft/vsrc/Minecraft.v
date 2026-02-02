`define H_DISP 640
`define V_DISP 480
// `define H_DISP 30
// `define V_DISP 20

`define MINECRAFT
// `define PPL

module Minecraft (
    input clk,
    input rst,

    output       vga_clk,
    output       vga_vs,
    output       vga_hs,
    output       vga_de,
    output [7:0] vga_r,
    output [7:0] vga_g,
    output [7:0] vga_b
);

    wire rstn = ~rst;

    // 5 + 4 + 7 = 16
    reg  [15:0] p_pos_x = 'd39 << 3 << 7;
    reg  [15:0] p_pos_y = 'd33 << 3 << 7;
    reg  [15:0] p_pos_z = 'd62 << 3 << 7;
    wire [14:0] write_addr;
    wire [ 3:0] write_data;
    wire        write_en;
    wire [ 3:0] block_id;
    wire [14:0] block_addr;
    wire [12:0] texture_addr;
    wire valid;

`ifdef PPL
    wire [19:0] pixel_addr_out;
    reg [15:0] p_angle_x = -1;
    reg [15:0] p_angle_y = 0;
    ppl #(
        .H_DISP(`H_DISP),
        .V_DISP(`V_DISP)
    ) ppl (
        .clk      (clk),
        .rst      (rst | data_aligned_vs),
        .p_pos_x  (p_pos_x),
        .p_pos_y  (p_pos_y),
        .p_pos_z  (p_pos_z),
        .p_angle_x(p_angle_x),
        .p_angle_y(p_angle_y),
        .block_id (block_id),

        .valid         (valid),
        .block_addr    (block_addr),
        .pixel_addr_out(pixel_addr_out),
        .texture_addr  (texture_addr)
    );
`else
    reg [15:0] p_cam_x = 16'h0000;
    reg [15:0] p_cam_y = 16'hFFF0;
    reg [15:0] p_cam_z = 16'hF1F0;
    reg [15:0] p_vp_x  = 16'hFF1F;
    reg [15:0] p_vp_y  = 16'h00E1;
    wire [19:0] pixel_addr_out;
    dda dda (
        .clk(clk),
        .rst(rst | data_aligned_vs),

        .hdisp(`H_DISP),
        .vdisp(`V_DISP),
        .p_pos_x(p_pos_x), .p_pos_y(p_pos_y), .p_pos_z(p_pos_z),
        .p_cam_x(p_cam_x), .p_cam_y(p_cam_y), .p_cam_z(p_cam_z),
        .p_vp_x (p_vp_x),  .p_vp_y (p_vp_y),

        .hit_valid(valid),
        .hit_texture(texture_addr),
        .hit_paddr(pixel_addr_out)
    );
`endif

    wire [19:0] data_addr;
    wire        data_valid;
    wire [15:0] texture_data;
    map map (
        .clk(clk),
        .rst(rst | data_aligned_vs),

        .write_addr  ('b0),
        .write_data  ('b0),
        .write_en    ('b0),
        .block_addr  (block_addr),
        .texture_addr(texture_addr),
        .block_id    (block_id),

        .valid       (valid),
        .pixel_addr  (pixel_addr_out),

        .data_valid  (data_valid),
        .data_addr   (data_addr),
        .texture_data(texture_data)
    );

    wire [15:0] data_aligned;
    wire        data_aligned_valid;
    wire        data_aligned_vs;
    align #(
        .H_DISP(`H_DISP),
        .V_DISP(`V_DISP),
        .N     (16)
    ) align (
        .clk       (clk),
        .rst       (rst | data_aligned_vs),
        .data      (texture_data),
        .data_addr (data_addr),
        .data_valid(data_valid),

        .data_aligned      (data_aligned),
        .data_aligned_valid(data_aligned_valid),
        .data_aligned_vs   (data_aligned_vs)
    );

    //--------------------------
    wire [15:0] pixel_data;
    wire [18:0] pixel_addr;

    /* 根据 x 坐标生成彩条 */
    // assign pixel_data =
    //     ((pixel_addr % `H_DISP) < `H_DISP / 8 * 1) ? 16'hFFFF : // White
    //     ((pixel_addr % `H_DISP) < `H_DISP / 8 * 2) ? 16'hFFE0 : // Yellow
    //     ((pixel_addr % `H_DISP) < `H_DISP / 8 * 3) ? 16'h07FF : // Cyan
    //     ((pixel_addr % `H_DISP) < `H_DISP / 8 * 4) ? 16'h07E0 : // Green
    //     ((pixel_addr % `H_DISP) < `H_DISP / 8 * 5) ? 16'hF81F : // Magenta
    //     ((pixel_addr % `H_DISP) < `H_DISP / 8 * 6) ? 16'hF800 : // Red
    //     ((pixel_addr % `H_DISP) < `H_DISP / 8 * 7) ? 16'h001F : // Blue
    //                                                  16'h0000 ; // Black

    parameter DP = `H_DISP * `V_DISP;
    parameter DW = 16;
    parameter AW = $clog2(DP);
    framebuffer #(
        .DP (DP),
        .DW (DW),
        .AW (AW)
    ) framebuffer (
        /* 写端：视频输入 */
        .video_clk (clk),
        .video_rst (rst),
        .video_data(data_aligned),
        .video_de  (data_aligned_valid),
        .video_vs  (data_aligned_vs),

        /* 读端：像素读取 */
        .pixel_clk  (clk),
        .pixel_rst  (rst),
        .pixel_addr (pixel_addr),
        .pixel_en   ('b1),
        .pixel_data (pixel_data)
    );

    //==============================================================================
    // 输出 vga
    wire        vs;
    wire        hs;
    wire        de;
    wire [15:0] data;

    vga vga(
    .clk     (clk),
    .rst     (rst),

    .hsync (12'd96),
    .hback (12'd144),
    .hdisp (12'd784),
    .htotal(12'd800),
    .vsync (12'd2),
    .vback (12'd35),
    .vdisp (12'd515),
    .vtotal(12'd525),

    .pixel(pixel_data),
    .addr (pixel_addr),

    .hs  (hs),
    .vs  (vs),
    .de  (de),
    .data(data)
    );

    // char
    wire        minecraft_vs;
    wire        minecraft_hs;
    wire        minecraft_de;
    wire [15:0] minecraft_data;
    wire [ 7:0] minecraft_r = {minecraft_data[15:11], 3'b0}; // 红色分量
    wire [ 7:0] minecraft_g = {minecraft_data[10:5], 2'b0}; // 绿色分量
    wire [ 7:0] minecraft_b = {minecraft_data[4:0], 3'b0}; // 蓝色分量
    char #(
        .HDISP(`H_DISP),
        .VDISP(`V_DISP))
    char (
        .clk      (clk),
        .rst      (rst),
        .frame_vs(data_aligned_vs),
        .pre_hs   (hs),
        .pre_vs   (vs),
        .pre_de   (de),
        .pre_data (data),
        .post_hs  (minecraft_hs),
        .post_vs  (minecraft_vs),
        .post_de  (minecraft_de),
        .post_data(minecraft_data)
    );

    //--------------------------
    // 输出测试图
    wire       test_vs;
    wire       test_hs;
    wire       test_de;
    wire [7:0] test_r;
    wire [7:0] test_g;
    wire [7:0] test_b;
    testpattern testpattern (
        .I_pxl_clk (clk),   // pixel clock
        .I_rst_n   (rstn),  // low active
        .I_mode    (3'b0),  // data select
        .I_single_r(8'd255),
        .I_single_g(8'd255),
        .I_single_b(8'd255),
                               //                 // 480x272     800x600   // 1024x768  // 1280x720  // 1920x1080
        .I_h_total (12'd800),  // hor total time  // 12'd523  // 12'd1056  // 12'd1344  // 12'd1650  // 12'd2200
        .I_h_sync  (12'd41),   // hor sync time   // 12'd41   // 12'd128   // 12'd136   // 12'd40    // 12'd44
        .I_h_bporch(12'd2),    // hor back porch  // 12'd2    // 12'd88    // 12'd160   // 12'd220   // 12'd148
        .I_h_res   (12'd640),  // hor resolution  // 12'd480  // 12'd800   // 12'd1024  // 12'd1280  // 12'd1920
        .I_v_total (12'd525),  // ver total time  // 12'd284  // 12'd628   // 12'd806   // 12'd750   // 12'd1125
        .I_v_sync  (12'd10),   // ver sync time   // 12'd10   // 12'd4     // 12'd6     // 12'd5     // 12'd5
        .I_v_bporch(12'd2),    // ver back porch  // 12'd2    // 12'd23    // 12'd29    // 12'd20    // 12'd36
        .I_v_res   (12'd480),  // ver resolution  // 12'd272  // 12'd600   // 12'd768   // 12'd720   // 12'd1080

        .I_hs_pol  (1'b1),  // 0,负极性; 1,正极性
        .I_vs_pol  (1'b1),  // 0,负极性; 1,正极性
        .O_de      (test_de),
        .O_hs      (test_hs),
        .O_vs      (test_vs),
        .O_data_r  (test_r),
        .O_data_g  (test_g),
        .O_data_b  (test_b)
    );


    //==============================================================================
`ifdef MINECRAFT
    assign {vga_r, vga_g, vga_b} = {minecraft_r, minecraft_g, minecraft_b};  // {r,g,b}
    assign vga_vs = minecraft_vs;
    assign vga_hs = minecraft_hs;
    assign vga_de = minecraft_de;
    assign vga_clk = clk;
`else
    assign {vga_r, vga_g, vga_b} = {test_r, test_g, test_b};  // {r,g,b}
    assign vga_vs = test_vs;
    assign vga_hs = test_hs;
    assign vga_de = test_de;
    assign vga_clk = clk;
`endif

endmodule
