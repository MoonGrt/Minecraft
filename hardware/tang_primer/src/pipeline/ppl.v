`timescale 1ns / 1ps

module ppl #(
    parameter H_DISP = 1280,
    parameter V_DISP = 720
) (
    input clk_ppl,
    input rst,

    input        [15:0] p_pos_x,
    input        [15:0] p_pos_y,
    input        [15:0] p_pos_z,
    input signed [15:0] p_angle_x,
    input signed [15:0] p_angle_y,
    input        [ 3:0] block_id,

    output        valid,
    output [19:0] pixel_addr_out,
    output [14:0] block_addr,
    output [12:0] texture_addr
);

    wire        [15:0] end_pos_x;
    wire        [15:0] end_pos_y;
    wire        [15:0] end_pos_z;
    wire        [15:0] start_pos_x;
    wire        [15:0] start_pos_y;
    wire        [15:0] start_pos_z;
    wire signed [15:0] ray_slope_x;
    wire signed [15:0] ray_slope_y;
    wire signed [15:0] ray_slope_z;
    wire signed [15:0] ray_slope_out_x;
    wire signed [15:0] ray_slope_out_y;
    wire signed [15:0] ray_slope_out_z;

    wire        [19:0] pixel_addr;
    wire [4:0] block_cnt_out, block_cnt;
    wire next_en;

    wire prepare_flag;
    assign valid = next_en && ~prepare_flag;
    wire scanner_stop;

    ppl_ctrl #(
        .H_DISP(H_DISP),
        .V_DISP(V_DISP)
    ) ppl_ctrl (
        .clk           (clk_ppl),
        .rst           (rst),
        .next_en       (next_en),
        .pixel_addr_out(pixel_addr_out),

        .prepare_flag(prepare_flag),
        .scanner_stop(scanner_stop)
    );

    ppl_entry #(
        .H_DISP(H_DISP),
        .V_DISP(V_DISP)
    ) ppl_entry (
        .clk      (clk_ppl),
        .rst      (rst),
        .p_pos_x  (p_pos_x),
        .p_pos_y  (p_pos_y),
        .p_pos_z  (p_pos_z),
        .p_angle_x(p_angle_x),
        .p_angle_y(p_angle_y),

        .next_en        (1),
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
        // .ray_slope_x(ray_slope_x),
        // .ray_slope_y(ray_slope_y),
        // .ray_slope_z(ray_slope_z),
        .ray_slope_x(-663),
        .ray_slope_y(374),
        .ray_slope_z(-651),
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
