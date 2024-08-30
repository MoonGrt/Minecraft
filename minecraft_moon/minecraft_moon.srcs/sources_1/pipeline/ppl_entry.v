`timescale 1ns / 1ps
`include "constants.vh"

module ppl_entry (
    input               clk,
    input               rst,

    input        [`POS_X_RADIX-1:0] p_pos_x,
    input        [`POS_Y_RADIX-1:0] p_pos_y,
    input        [`POS_Z_RADIX-1:0] p_pos_z,
    input signed [`ANGLE_RADIX-1:0] p_angle_x,
    input signed [`ANGLE_RADIX-1:0] p_angle_y,

    input                               next_en,
    // input                               scanner_en,
    input                               scanner_stop,
    input        [`DISP_ADDR_RADIX-1:0] pixel_addr_out,
    input        [`POS_X_RADIX-1:0] end_pos_x,
    input        [`POS_Y_RADIX-1:0] end_pos_y,
    input        [`POS_Z_RADIX-1:0] end_pos_z,
    input signed [`ANGLE_RADIX-1:0] ray_slope_out_x,
    input signed [`ANGLE_RADIX-1:0] ray_slope_out_y,
    input signed [`ANGLE_RADIX-1:0] ray_slope_out_z,
    input        [ 3:0]             block_cnt_out,

    output        [ 3:0]             block_cnt,
    output        [`POS_X_RADIX-1:0] start_pos_x,
    output        [`POS_Y_RADIX-1:0] start_pos_y,
    output        [`POS_Z_RADIX-1:0] start_pos_z,
    output signed [`ANGLE_RADIX-1:0] ray_slope_x,
    output signed [`ANGLE_RADIX-1:0] ray_slope_y,
    output signed [`ANGLE_RADIX-1:0] ray_slope_z,
    output        [`DISP_ADDR_RADIX-1:0] pixel_addr
);

    wire signed [`ANGLE_RADIX-1:0] fragment_uv_x, fragment_uv_y;
    wire signed [`ANGLE_RADIX-1:0] vp_origin_x, vp_origin_y, vp_origin_z;
    wire signed [`ANGLE_RADIX-1:0] vp_u_x, vp_u_y, vp_u_z;
    wire signed [`ANGLE_RADIX-1:0] vp_v_x, vp_v_y, vp_v_z;

    // Viewport
    viewport_scanner vp_scan (
        .clk          (clk),
        .rst          (rst),
        // .enable       (scanner_en),
        .enable       (next_en && ~scanner_stop),
        .fragment_uv_x(fragment_uv_x),
        .fragment_uv_y(fragment_uv_y)
    );

    viewport_params vp_param (
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

    //    wire signed [`ANGLE_RADIX-1:0] vp_target_x, vp_target_y, vp_target_z;
    //    assign vp_target_x = p_pos_x + ray_slope_x;
    //    assign vp_target_y = p_pos_y + ray_slope_y;
    //    assign vp_target_z = p_pos_z + ray_slope_z;

    wire [`ANGLE_RADIX-1:0] ray_offset_x = (vp_u_x * fragment_uv_x - vp_v_x * fragment_uv_y) * `LOOKAT_REL_FAC / `ANGLE_RADIUS;
    wire [`ANGLE_RADIX-1:0] ray_offset_y = (vp_u_y * fragment_uv_x - vp_v_y * fragment_uv_y) * `LOOKAT_REL_FAC / `ANGLE_RADIUS;
    wire [`ANGLE_RADIX-1:0] ray_offset_z = (vp_u_z * fragment_uv_x - vp_v_z * fragment_uv_y) * `LOOKAT_REL_FAC / `ANGLE_RADIUS;

    // Output
    // assign start_pos_x = scanner_en ? p_pos_x : end_pos_x;
    // assign start_pos_y = scanner_en ? p_pos_y : end_pos_y;
    // assign start_pos_z = scanner_en ? p_pos_z : end_pos_z;
    // assign ray_slope_x = scanner_en ? vp_origin_x + ray_offset_x : ray_slope_out_x;
    // assign ray_slope_y = scanner_en ? vp_origin_y + ray_offset_y : ray_slope_out_y;
    // assign ray_slope_z = scanner_en ? vp_origin_z + ray_offset_z : ray_slope_out_z;
    // assign pixel_addr  = scanner_en ? fragment_uv_y * `H_DISP + fragment_uv_x : pixel_addr_out;
    // assign block_cnt   = scanner_en ? 'b0 : block_cnt_out;

    assign start_pos_x = next_en ? (scanner_stop ?          'b0 : p_pos_x) : end_pos_x;
    assign start_pos_y = next_en ? (scanner_stop ?          'b0 : p_pos_y) : end_pos_y;
    assign start_pos_z = next_en ? (scanner_stop ? ('d20 << 12) : p_pos_z) : end_pos_z;
    assign ray_slope_x = next_en ? (scanner_stop ? 'b0 : vp_origin_x + ray_offset_x) : ray_slope_out_x;
    assign ray_slope_y = next_en ? (scanner_stop ? 'b0 : vp_origin_y + ray_offset_y) : ray_slope_out_y;
    assign ray_slope_z = next_en ? (scanner_stop ? 'b0 : vp_origin_z + ray_offset_z) : ray_slope_out_z;
    assign pixel_addr  = next_en ? (scanner_stop ? 'b0 : fragment_uv_y * `H_DISP + fragment_uv_x) : pixel_addr_out;
    assign block_cnt   = next_en ? (scanner_stop ? 'b0 : 'b0) : block_cnt_out;


// (scanner_stop && next_en) ('d20 << 12)

endmodule
