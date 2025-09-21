`timescale 1ns / 1ps

module top (
    input video_clk,
    input PPL_clk,
    input rst_n
);

    parameter H_DISP = 32;
    parameter V_DISP = 24;
    // parameter H_DISP = 1280;
    // parameter V_DISP = 720;

    reg  [17:0] p_pos_x = 'd170 << 8;
    reg  [17:0] p_pos_y = 'd170 << 8;
    reg  [17:0] p_pos_z = 'd280 << 8;
    reg  [19:0] p_angle_x = 30;
    reg  [19:0] p_angle_y = -120;
    wire [14:0] write_addr;
    wire [ 4:0] write_data;
    wire        write_en;
    wire [ 4:0] block_id;
    wire [31:0] texture_data;
    wire [23:0] color = texture_data[23:0];
    wire [19:0] pixel_addr_out;
    wire [14:0] block_addr;
    wire [12:0] texture_addr;
    wire valid;

    ppl #(
        .H_DISP(H_DISP),
        .V_DISP(V_DISP)
    ) ppl (
        .clk_ppl  (PPL_clk),  // PPL_clk
        .rst      (~rst_n),
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

    wire [19:0] data_addr;
    wire        data_valid;
    map map (
        .clk(PPL_clk),
        .rst(~rst_n),

        .write_addr  ('b0),
        .write_data  ('b0),
        .write_en    ('b0),
        .block_addr  (block_addr),
        .texture_addr(texture_addr),
        .block_id    (block_id),

        .valid     (valid),
        .pixel_addr(pixel_addr_out),

        .data_valid  (data_valid),
        .data_addr   (data_addr),
        .texture_data(texture_data)
    );


    wire [15:0] data_aligned;
    wire        data_aligned_valid;
    align #(
        .H_DISP(H_DISP),
        .V_DISP(V_DISP),
        .N     (16)
    ) align (
        .video_clk (video_clk),
        .PPL_clk   (PPL_clk),
        .rst       (~rst_n),
        .data      (color),
        .data_addr (data_addr),
        .data_valid(data_valid),

        .data_aligned      (data_aligned),
        .data_aligned_valid(data_aligned_valid),
        .data_aligned_vs   (data_aligned_vs)
    );



endmodule
