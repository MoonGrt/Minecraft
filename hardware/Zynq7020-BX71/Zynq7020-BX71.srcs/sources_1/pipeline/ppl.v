`timescale 1ns / 1ps

module ppl (
    input               clk_ppl,
    input               rst,
    input               prepare_flag,

    input        [`POS_X_RADIX-1:0] p_pos_x,
    input        [`POS_Y_RADIX-1:0] p_pos_y,
    input        [`POS_Z_RADIX-1:0] p_pos_z,
    input signed [`ANGLE_RADIX-1:0] p_angle_x,
    input signed [`ANGLE_RADIX-1:0] p_angle_y,
    input        [`BLOCK_TYPE_RADIX-1:0] block_id,

    output        valid,
    output [`DISP_ADDR_RADIX-1:0] pixel_addr_out,
    output [`MAP_ADDR_RADIX-1:0] block_addr,
    output [`TEXTURE_ADDR_RADIX-1:0] texture_addr
);

    wire        [`POS_X_RADIX-1:0] end_pos_x;
    wire        [`POS_Y_RADIX-1:0] end_pos_y;
    wire        [`POS_Z_RADIX-1:0] end_pos_z;
    wire        [`POS_X_RADIX-1:0] start_pos_x;
    wire        [`POS_Y_RADIX-1:0] start_pos_y;
    wire        [`POS_Z_RADIX-1:0] start_pos_z;
    wire signed [`ANGLE_RADIX-1:0] ray_slope_x;
    wire signed [`ANGLE_RADIX-1:0] ray_slope_y;
    wire signed [`ANGLE_RADIX-1:0] ray_slope_z;
    wire signed [`ANGLE_RADIX-1:0] ray_slope_out_x;
    wire signed [`ANGLE_RADIX-1:0] ray_slope_out_y;
    wire signed [`ANGLE_RADIX-1:0] ray_slope_out_z;

    wire        [`DISP_ADDR_RADIX-1:0] pixel_addr;
    wire [3:0]  block_cnt_out, block_cnt;
    wire        next_en;

    assign valid = next_en && ~prepare_flag;
    wire    scanner_stop, scanner_en;
    ctrl ctrl (
        .clk            (clk_ppl),
        .rst            (rst),
        .next_en        (next_en),
        .pixel_addr_out (pixel_addr_out),

        .prepare_flag   (prepare_flag),
        .scanner_en     (scanner_en),
        .scanner_stop   (scanner_stop)
    );

    ppl_entry ppl_entry (
        .clk            (clk_ppl),
        .rst            (rst),
        .p_pos_x        (p_pos_x),
        .p_pos_y        (p_pos_y),
        .p_pos_z        (p_pos_z),
        .p_angle_x      (p_angle_x),
        .p_angle_y      (p_angle_y),

        .next_en        (next_en),
        // .scanner_en     (scanner_en),
        .scanner_stop   (scanner_stop),
        .pixel_addr_out (pixel_addr_out),
        .end_pos_x      (end_pos_x),
        .end_pos_y      (end_pos_y),
        .end_pos_z      (end_pos_z),
        .ray_slope_out_x(ray_slope_out_x),
        .ray_slope_out_y(ray_slope_out_y),
        .ray_slope_out_z(ray_slope_out_z),
        .block_cnt      (block_cnt),

        .block_cnt_out(block_cnt_out),
        .start_pos_x  (start_pos_x),
        .start_pos_y  (start_pos_y),
        .start_pos_z  (start_pos_z),
        .ray_slope_x  (ray_slope_x),
        .ray_slope_y  (ray_slope_y),
        .ray_slope_z  (ray_slope_z),
        .pixel_addr   (pixel_addr)
    );

    ppl_proc ppl_proc (
        .clk         (clk_ppl),
        .rst         (rst),
        .prepare_flag(prepare_flag),

        .start_pos_x(start_pos_x),
        .start_pos_y(start_pos_y),
        .start_pos_z(start_pos_z),
        .ray_slope_x(ray_slope_x),
        .ray_slope_y(ray_slope_y),
        .ray_slope_z(ray_slope_z),
        .pixel_addr (pixel_addr),
        .block_id   (block_id),
        .block_cnt  (block_cnt),

        .block_cnt_out  (block_cnt_out),
        .next_en        (next_en),
        .ray_slope_out_x(ray_slope_out_x),
        .ray_slope_out_y(ray_slope_out_y),
        .ray_slope_out_z(ray_slope_out_z),
        .end_pos_x      (end_pos_x),
        .end_pos_y      (end_pos_y),
        .end_pos_z      (end_pos_z),
        .pixel_addr_out (pixel_addr_out),
        .texture_addr   (texture_addr),
        .block_addr     (block_addr)
    );

endmodule
