`timescale 1ns / 1ps

module dda_emitter (
    input wire clk,
    input wire rst,

    input wire [11:0] hdisp, vdisp,
    input wire [15:0] p_pos_x, p_pos_y, p_pos_z,  // player position
    input wire [15:0] p_cam_x, p_cam_y, p_cam_z,  // player camera
    input wire [15:0] p_vp_x,  p_vp_y,            // player viewplane vector

    input  wire        ready,  // upstream allows new pixel
    output wire        valid,  // output valid signal
    output wire [15:0] pos_x, pos_y, pos_z,  // ray start position
    output wire [13:0] ray_x, ray_y, ray_z,  // ray direction
    output wire [23:0] next_x, next_y, next_z,  // next side distance
    output wire [23:0] jump_x, jump_y, jump_z,  // delta distance
    output wire [19:0] paddr
);

    // ------------------------------------------------------------
    // position passthrough
    // ------------------------------------------------------------
    assign pos_x = p_pos_x;
    assign pos_y = p_pos_y;
    assign pos_z = p_pos_z;

    // ------------------------------------------------------------
    // pixel counter
    // ------------------------------------------------------------
    reg [11:0] pixel_x;
    reg [11:0] pixel_y;
    assign paddr = pixel_y * hdisp + pixel_x;
    always @(posedge clk) begin
        if (rst) begin
            pixel_x <= 12'd0;
            pixel_y <= 12'd0;
        end  else if (ready) begin
            pixel_x <= (pixel_x == hdisp - 1) ? 12'd0 : pixel_x + 1;
            pixel_y <= (pixel_x != hdisp - 1) ? pixel_y :
                       (pixel_y == vdisp - 1) ? 12'd0 : pixel_y + 1;
        end
    end

    // ------------------------------------------------------------
    // valid generation
    // ------------------------------------------------------------
    assign valid = ready;

    // ------------------------------------------------------------
    // ray offset
    // ------------------------------------------------------------
    wire signed [12:0] frame_x = $signed({1'b0, pixel_x}) * 2 - $signed({1'b0, hdisp});
    wire signed [12:0] frame_y = $signed({1'b0, pixel_y}) * 2 - $signed({1'b0, vdisp});
    wire signed [31:0] ray_offset_x = ($signed(p_vp_x) * frame_x) >>> 5;
    wire signed [31:0] ray_offset_y = ($signed(p_vp_y) * frame_y) >>> 5;
    wire signed [31:0] ray_offset_z = 0;

    // ------------------------------------------------------------
    // ray direction
    // ------------------------------------------------------------
    assign ray_x = $signed(p_cam_x) + ray_offset_x;
    assign ray_y = $signed(p_cam_y) + ray_offset_y;
    assign ray_z = $signed(p_cam_z) + ray_offset_z;
    // abs
    wire [12:0] ray_x_abs = ray_x[13] ? (~ray_x[12:0] + 13'd1) : ray_x[12:0];
    wire [12:0] ray_y_abs = ray_y[13] ? (~ray_y[12:0] + 13'd1) : ray_y[12:0];
    wire [12:0] ray_z_abs = ray_z[13] ? (~ray_z[12:0] + 13'd1) : ray_z[12:0];

    // ------------------------------------------------------------
    // inverse LUT (pure combinational)
    // (1 << 18) / |ray|
    // ------------------------------------------------------------
    wire [23:0] div_lut_x, div_lut_z, div_lut_y;
    div_lut div_lutx(clk, ray_x_abs, div_lut_x);
    div_lut div_luty(clk, ray_y_abs, div_lut_y);
    div_lut div_lutz(clk, ray_z_abs, div_lut_z);

    // ------------------------------------------------------------
    // jump (delta distance)
    // ------------------------------------------------------------
    assign jump_x = div_lut_x << (4 + 7);
    assign jump_y = div_lut_y << (4 + 7);
    assign jump_z = div_lut_z << (4 + 7);

    // ------------------------------------------------------------
    // next side distance init
    // ------------------------------------------------------------
    wire [10:0] edge_x = ray_x[13] ? (pos_x[10:0] ? pos_x[10:0] : ('d16 << 7))
                                   : (('d16 << 7) - pos_x[10:0]);
    wire [10:0] edge_y = ray_y[13] ? (pos_y[10:0] ? pos_y[10:0] : ('d16 << 7))
                                   : (('d16 << 7) - pos_y[10:0]);
    wire [10:0] edge_z = ray_z[13] ? (pos_z[10:0] ? pos_z[10:0] : ('d16 << 7))
                                   : (('d16 << 7) - pos_z[10:0]);
    assign next_x = edge_x * div_lut_x;
    assign next_y = edge_y * div_lut_y;
    assign next_z = edge_z * div_lut_z;

endmodule
