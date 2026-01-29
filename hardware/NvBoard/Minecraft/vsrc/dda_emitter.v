`timescale 1ns / 1ps

module dda_emitter (
    input clk,
    input rst,

    input [11:0] hdisp,
    input [11:0] vdisp,

    input [15:0] p_pos_x,   // player position
    input [15:0] p_pos_y,
    input [15:0] p_pos_z,
    input [15:0] p_cam_x,   // player camera
    input [15:0] p_cam_y,
    input [15:0] p_cam_z,
    input [15:0] p_vp_x,    // player viewplane vector
    input [15:0] p_vp_y,

    input        next_en,
    input [19:0] pixel_addr_out,
    input [15:0] end_pos_x,
    input [15:0] end_pos_y,
    input [15:0] end_pos_z,
    input [13:0] ray_slope_out_x,
    input [13:0] ray_slope_out_y,
    input [13:0] ray_slope_out_z,
    input [ 5:0] block_cnt_out,

    output [ 5:0] block_cnt,
    output [15:0] start_pos_x,
    output [15:0] start_pos_y,
    output [15:0] start_pos_z,
    output [13:0] ray_slope_x,
    output [13:0] ray_slope_y,
    output [13:0] ray_slope_z,
    output [19:0] pixel_addr
);

    // pixel cnt
    reg [11:0] pixel_x = 'd0;
    reg [11:0] pixel_y = 'd0;
    always @(posedge clk) begin
        if (rst) begin
            pixel_x <= 'd0;
            pixel_y <= 'd0;
        end else if (next_en) begin
            pixel_x <= (pixel_x == (hdisp - 'd1)) ? 0 : (pixel_x + 'd1);
            pixel_y <= (pixel_x != (hdisp - 'd1)) ? pixel_y : (pixel_y == (vdisp - 'd1)) ? 'd0 : (pixel_y + 'd1);
        end
    end

    wire signed [12:0] frame_x = pixel_x * 2 - hdisp;
    wire signed [12:0] frame_y = -(pixel_y * 2 - vdisp);
    wire signed [31:0] ray_offset_x = ($signed(p_vp_x) * frame_x) >>> 5;
    wire signed [31:0] ray_offset_y = ($signed(p_vp_y) * frame_y) >>> 5;
    wire signed [31:0] ray_offset_z = 0;

    // Output
    assign start_pos_x = next_en ? p_pos_x : end_pos_x;
    assign start_pos_y = next_en ? p_pos_y : end_pos_y;
    assign start_pos_z = next_en ? p_pos_z : end_pos_z;
    assign ray_slope_x = next_en ? $signed(p_cam_x) + ray_offset_x : ray_slope_out_x;
    assign ray_slope_y = next_en ? $signed(p_cam_y) + ray_offset_y : ray_slope_out_y;
    assign ray_slope_z = next_en ? $signed(p_cam_z) + ray_offset_z : ray_slope_out_z;
    assign pixel_addr  = next_en ? pixel_y * hdisp + pixel_x : pixel_addr_out;
    assign block_cnt   = next_en ? 'b0 : block_cnt_out;

endmodule
