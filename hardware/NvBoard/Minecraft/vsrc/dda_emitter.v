`timescale 1ns / 1ps

`define SHIFT 4
`define ANGLE_RADIUS 225
`define ANGLE_EIGHTH 158
`define ANGLE_QUARTER 317  // `define ANGLE_QUARTER ANGLE_EIGHTH * 2 + 1
`define ANGLE_HALF 634     // `define ANGLE_HALF ANGLE_EIGHTH * 4 + 2
`define ANGLE_MODULO 1268  // `define ANGLE_MODULO ANGLE_EIGHTH * 8 + 4

/* verilator lint_off WIDTH */

module dda_emitter #(
    parameter H_DISP = 1280,
    parameter V_DISP = 720
) (
    input clk,
    input rst,

    input        [15:0] p_pos_x,
    input        [15:0] p_pos_y,
    input        [15:0] p_pos_z,
    input signed [15:0] p_angle_x,
    input signed [15:0] p_angle_y,

    input               next_en,
    input        [19:0] pixel_addr_out,
    input        [15:0] end_pos_x,
    input        [15:0] end_pos_y,
    input        [15:0] end_pos_z,
    input signed [15:0] ray_slope_out_x,
    input signed [15:0] ray_slope_out_y,
    input signed [15:0] ray_slope_out_z,
    input        [ 5:0] block_cnt_out,

    output        [ 5:0] block_cnt,
    output        [15:0] start_pos_x,
    output        [15:0] start_pos_y,
    output        [15:0] start_pos_z,
    output signed [15:0] ray_slope_x,
    output signed [15:0] ray_slope_y,
    output signed [15:0] ray_slope_z,
    output        [19:0] pixel_addr
);

    wire signed [15:0] fragment_uv_x, fragment_uv_y;
    wire signed [15:0] vp_origin_x, vp_origin_y, vp_origin_z;
    wire signed [15:0] vp_u_x, vp_u_y, vp_u_z;
    wire signed [15:0] vp_v_x, vp_v_y, vp_v_z;

    viewport_scanner #(
        .H_DISP(H_DISP),
        .V_DISP(V_DISP)
    ) viewport_scanner (
        .clk          (clk),
        .rst          (rst),
        .enable       (next_en),
        .fragment_uv_x(fragment_uv_x),
        .fragment_uv_y(fragment_uv_y)
    );

    viewport_params #(
        .H_DISP(H_DISP),
        .V_DISP(V_DISP)
    ) viewport_params (
        .rst        (rst),
        .p_angle_x  (p_angle_x),
        .p_angle_y  (p_angle_y),
        .vp_origin_x(vp_origin_x),
        .vp_origin_y(vp_origin_y),
        .vp_origin_z(vp_origin_z),
        .vp_u_x     (vp_u_x),
        .vp_u_y     (vp_u_y),
        .vp_u_z     (vp_u_z),
        .vp_v_x     (vp_v_x),
        .vp_v_y     (vp_v_y),
        .vp_v_z     (vp_v_z)
    );

    wire signed [15:0] fragment_offset_x = fragment_uv_x * 2 - H_DISP;
    wire signed [15:0] fragment_offset_y = -(fragment_uv_y * 2 - V_DISP);
    wire signed [20:0] ray_offset_x = (vp_v_x * fragment_offset_x + vp_u_x * fragment_offset_y) >>> (`SHIFT + 1);
    wire signed [20:0] ray_offset_y = (vp_v_y * fragment_offset_x + vp_u_y * fragment_offset_y) >>> (`SHIFT + 1);
    wire signed [20:0] ray_offset_z = (vp_v_z * fragment_offset_x + vp_u_z * fragment_offset_y) >>> (`SHIFT + 1);

    // Output
    assign start_pos_x = next_en ? p_pos_x : end_pos_x;
    assign start_pos_y = next_en ? p_pos_y : end_pos_y;
    assign start_pos_z = next_en ? p_pos_z : end_pos_z;
    assign ray_slope_x = next_en ? vp_origin_x + ray_offset_x : ray_slope_out_x;
    assign ray_slope_y = next_en ? vp_origin_y + ray_offset_y : ray_slope_out_y;
    assign ray_slope_z = next_en ? vp_origin_z + ray_offset_z : ray_slope_out_z;
    assign pixel_addr  = next_en ? fragment_uv_y * H_DISP + fragment_uv_x : pixel_addr_out;
    assign block_cnt   = next_en ? 'b0 : block_cnt_out;

endmodule
