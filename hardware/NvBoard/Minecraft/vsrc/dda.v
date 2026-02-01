`timescale 1ns / 1ps

`define PIPELINE

module dda (
    input  wire clk,
    input  wire rst,

    // ===== pixel / camera input =====
    input  wire [11:0] hdisp,
    input  wire [11:0] vdisp,

    input  wire [15:0] p_pos_x,
    input  wire [15:0] p_pos_y,
    input  wire [15:0] p_pos_z,
    input  wire [15:0] p_cam_x,
    input  wire [15:0] p_cam_y,
    input  wire [15:0] p_cam_z,
    input  wire [15:0] p_vp_x,
    input  wire [15:0] p_vp_y,

    // ===== block query =====
    input  wire [ 3:0] block_id,
    output wire [14:0] block_addr,

    // ===== final hit result =====
`ifdef PIPELINE
    output wire [19:0] out_pixel_addr,
`endif
    output wire        hit_valid,
    output wire [12:0] hit_texture
);

    // ============================================================
    // wires between emitter and tracer
    // ============================================================
    wire        e_valid;
    wire        e_ready;
    wire [15:0] e_pos_x;
    wire [15:0] e_pos_y;
    wire [15:0] e_pos_z;
    wire [13:0] e_ray_x;
    wire [13:0] e_ray_y;
    wire [13:0] e_ray_z;
    wire [23:0] e_next_x;
    wire [23:0] e_next_y;
    wire [23:0] e_next_z;
    wire [23:0] e_jump_x;
    wire [23:0] e_jump_y;
    wire [23:0] e_jump_z;

`ifdef PIPELINE
    wire [19:0] e_pixel_addr;
`endif

    // ============================================================
    // dda_emitter
    // ============================================================
    dda_emitter dda_emitter (
        .clk(clk),
        .rst(rst),

        .hdisp(hdisp),
        .vdisp(vdisp),

        .p_pos_x(p_pos_x),
        .p_pos_y(p_pos_y),
        .p_pos_z(p_pos_z),
        .p_cam_x(p_cam_x),
        .p_cam_y(p_cam_y),
        .p_cam_z(p_cam_z),
        .p_vp_x (p_vp_x),
        .p_vp_y (p_vp_y),

        .ready(e_ready),
        .valid(e_valid),

        .pos_x (e_pos_x),
        .pos_y (e_pos_y),
        .pos_z (e_pos_z),
        .ray_x (e_ray_x),
        .ray_y (e_ray_y),
        .ray_z (e_ray_z),
        .next_x(e_next_x),
        .next_y(e_next_y),
        .next_z(e_next_z),
        .jump_x(e_jump_x),
        .jump_y(e_jump_y),
        .jump_z(e_jump_z)
`ifdef PIPELINE
       ,.pixel_addr(e_pixel_addr)
`endif
    );

    // ============================================================
    // dda_tracer
    // ============================================================
    dda_tracer dda_tracer (
        .clk(clk),
        .rst(rst),

        .valid(e_valid),
        .ready(e_ready),

        .in_pos_x (e_pos_x),
        .in_pos_y (e_pos_y),
        .in_pos_z (e_pos_z),
        .in_ray_x (e_ray_x),
        .in_ray_y (e_ray_y),
        .in_ray_z (e_ray_z),
        .in_next_x(e_next_x),
        .in_next_y(e_next_y),
        .in_next_z(e_next_z),
        .in_jump_x(e_jump_x),
        .in_jump_y(e_jump_y),
        .in_jump_z(e_jump_z),

        .block_id  (block_id),
        .block_addr(block_addr),

        .hit_valid  (hit_valid),
        .hit_texture(hit_texture)
`ifdef PIPELINE
       ,.in_pixel_addr (e_pixel_addr),
        .out_pixel_addr(out_pixel_addr)
`endif
    );

endmodule
