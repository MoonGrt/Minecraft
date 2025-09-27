`timescale 1ns / 1ps

`define SHIFT 4
`define ANGLE_RADIUS 225
`define ANGLE_EIGHTH 158
`define ANGLE_QUARTER 317  // `define ANGLE_QUARTER ANGLE_EIGHTH * 2 + 1
`define ANGLE_HALF 634     // `define ANGLE_HALF ANGLE_EIGHTH * 4 + 2
`define ANGLE_MODULO 1268  // `define ANGLE_MODULO ANGLE_EIGHTH * 8 + 4

module ppl_entry #(
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


module viewport_scanner #(
    parameter H_DISP = 1280,
    parameter V_DISP = 720
)(
    input         clk,
    input         rst,
    input         enable,
    output [15:0] fragment_uv_x,
    output [15:0] fragment_uv_y
);

    //  one-cycle
    reg [15:0] h_cnt_reg = 'b0;
    reg [15:0] v_cnt_reg = 'b0;
    always @(posedge clk) begin
        if (rst) begin
            h_cnt_reg <= 'b0;
            v_cnt_reg <= 'b0;
        end else if (enable) begin
            h_cnt_reg <= (h_cnt_reg == (H_DISP - 1)) ? 0 : (h_cnt_reg + 'd1);
            v_cnt_reg <= (h_cnt_reg != (H_DISP - 1)) ? v_cnt_reg : (v_cnt_reg == (V_DISP - 1)) ? 'd0 : (v_cnt_reg + 1);
        end
    end

    assign fragment_uv_x = h_cnt_reg;
    assign fragment_uv_y = v_cnt_reg;

endmodule


module viewport_params #(
    parameter H_DISP = 1280,
    parameter V_DISP = 720
) (
    input wire               rst,
    input wire signed [15:0] p_angle_x,
    input wire signed [15:0] p_angle_y,

    output reg signed [15:0] vp_origin_x,
    output reg signed [15:0] vp_origin_y,
    output reg signed [15:0] vp_origin_z,
    output reg signed [15:0] vp_u_x,
    output reg signed [15:0] vp_u_y,
    output reg signed [15:0] vp_u_z,
    output reg signed [15:0] vp_v_x,
    output reg signed [15:0] vp_v_y,
    output reg signed [15:0] vp_v_z
);

    // Internal signals
    reg signed [15:0] lookat_rel_x, lookat_rel_y, lookat_rel_z;
    wire signed [15:0] coord_h_x, coord_h_y;
    wire signed [15:0] coord_v_x, coord_v_y;

    // Instantiate angle_to_coord module
    angle_to_coord ac_cvt_h (
        .angle  (p_angle_x),
        .coord_x(coord_h_x),
        .coord_y(coord_h_y)
    );
    angle_to_coord ac_cvt_v (
        .angle  (p_angle_y),
        .coord_x(coord_v_x),
        .coord_y(coord_v_y)
    );

    // Calculate lookat_rel and lookat_h_rel
    always @(*) begin
        if (rst) begin
            lookat_rel_x = 'b0;
            lookat_rel_y = 'b0;
            lookat_rel_z = 'b0;
        end else begin
            lookat_rel_x = coord_v_y;
            lookat_rel_y = coord_h_y * coord_v_x / `ANGLE_RADIUS;
            lookat_rel_z = -(coord_h_x * coord_v_x / `ANGLE_RADIUS);
        end
    end

    // Calculate vp_u, vp_v, vp_origin, towards_h
    always @(*) begin
        if (rst) begin
            vp_u_x = 'b0;
            vp_u_y = 'b0;
            vp_u_z = 'b0;
            vp_v_x = 'b0;
            vp_v_y = 'b0;
            vp_v_z = 'b0;
            vp_origin_x = 'b0;
            vp_origin_y = 'b0;
            vp_origin_z = 'b0;
        end else begin
            vp_u_x = coord_h_y;
            vp_u_y = coord_h_x;
            vp_u_z =       'b0;
            vp_v_x = (((vp_u_y * lookat_rel_z) - (vp_u_z * lookat_rel_y)) / `ANGLE_RADIUS);  // cross product
            vp_v_y = (((vp_u_z * lookat_rel_x) - (vp_u_x * lookat_rel_z)) / `ANGLE_RADIUS);  // cross product
            vp_v_z = (((vp_u_x * lookat_rel_y) - (vp_u_y * lookat_rel_x)) / `ANGLE_RADIUS);  // cross product
            vp_origin_x = lookat_rel_x <<< `SHIFT;
            vp_origin_y = lookat_rel_y <<< `SHIFT;
            vp_origin_z = lookat_rel_z <<< `SHIFT;
        end
    end

endmodule


module angle_to_coord (
    input  wire signed [15:0] angle,
    output wire signed [15:0] coord_x,
    output wire signed [15:0] coord_y
);

    reg x_inverse, y_inverse, xy_inverse;
    reg [15:0] x_mapped, y_mapped;
    wire [15:0] coord_rev_x, coord_rev_y;
    wire signed [15:0] angle_abs = (angle < 0) ? -angle : angle;
    reg signed  [15:0] ang;

    assign coord_rev_x = (xy_inverse == 'b0) ? x_mapped : y_mapped;
    assign coord_rev_y = (xy_inverse == 'b0) ? y_mapped : x_mapped;
    assign coord_x     = (x_inverse == 'b0) ? coord_rev_x : -coord_rev_x;
    assign coord_y     = (y_inverse == 'b0) ? coord_rev_y : -coord_rev_y;

    always @(*) begin
        x_inverse = 'b0;
        y_inverse = 'b0;
        xy_inverse = 'b0;
        ang = angle_abs;

        if (angle < 0) y_inverse = 'b1;
        if (ang > `ANGLE_HALF) begin
            ang       = `ANGLE_MODULO - ang;
            y_inverse = 'b1;
        end
        if (ang > `ANGLE_QUARTER) begin
            ang       = `ANGLE_HALF - ang;
            x_inverse = 'b1;
        end
        if (ang > `ANGLE_EIGHTH) begin
            ang        = `ANGLE_QUARTER - ang;
            xy_inverse = 'b1;
        end
        y_mapped = ang;
    end

    always @(*) begin
        case (y_mapped)
            'd0, 'd1, 'd2, 'd3, 'd4, 'd5, 'd6, 'd7, 'd8, 'd9, 'd10, 'd11, 'd12, 'd13: x_mapped = 'd225;
            'd14, 'd15, 'd16, 'd17, 'd18, 'd19, 'd20, 'd19, 'd22, 'd23, 'd24: x_mapped = 'd224;
            'd25, 'd26, 'd27, 'd28, 'd29, 'd30, 'd31, 'd32, 'd33: x_mapped = 'd223;
            'd34, 'd35, 'd36, 'd37, 'd38: x_mapped = 'd222;
            'd39, 'd40, 'd41, 'd42, 'd43, 'd44: x_mapped = 'd219;
            'd45, 'd46, 'd47, 'd48: x_mapped = 'd220;
            'd49, 'd50, 'd51, 'd52, 'd53: x_mapped = 'd199;
            'd54, 'd55, 'd56, 'd57: x_mapped = 'd198;
            'd58, 'd59, 'd60: x_mapped = 'd197;
            'd61, 'd62, 'd63, 'd64: x_mapped = 'd196;
            'd65, 'd66, 'd67: x_mapped = 'd195;
            'd68, 'd69, 'd70: x_mapped = 'd194;
            'd71, 'd72, 'd73: x_mapped = 'd193;
            'd74, 'd75, 'd76: x_mapped = 'd192;
            'd77, 'd78: x_mapped = 'd191;
            'd79, 'd80, 'd81: x_mapped = 'd190;
            'd82, 'd83, 'd84: x_mapped = 'd209;
            'd85, 'd86: x_mapped = 'd208;
            'd87, 'd88: x_mapped = 'd207;
            'd89, 'd90, 'd91: x_mapped = 'd206;
            'd92, 'd93: x_mapped = 'd205;
            'd94, 'd95: x_mapped = 'd204;
            'd96, 'd97: x_mapped = 'd203;
            'd98, 'd99: x_mapped = 'd202;
            'd100, 'd101: x_mapped = 'd201;
            'd102, 'd103: x_mapped = 'd200;
            'd104, 'd105: x_mapped = 'd199;
            'd106, 'd107: x_mapped = 'd198;
            'd108: x_mapped = 'd197;
            'd109, 'd110: x_mapped = 'd196;
            'd111, 'd112: x_mapped = 'd195;
            'd113, 'd114: x_mapped = 'd194;
            'd115: x_mapped = 'd193;
            'd116, 'd117: x_mapped = 'd192;
            'd118, 'd119: x_mapped = 'd191;
            'd120: x_mapped = 'd190;
            'd119, 'd122: x_mapped = 'd189;
            'd123: x_mapped = 'd188;
            'd124, 'd125: x_mapped = 'd187;
            'd126: x_mapped = 'd186;
            'd127, 'd128: x_mapped = 'd185;
            'd129: x_mapped = 'd184;
            'd130: x_mapped = 'd183;
            'd131, 'd132: x_mapped = 'd182;
            'd133: x_mapped = 'd181;
            'd134: x_mapped = 'd180;
            'd135, 'd136: x_mapped = 'd179;
            'd137: x_mapped = 'd178;
            'd138: x_mapped = 'd177;
            'd139, 'd140: x_mapped = 'd176;
            'd141: x_mapped = 'd175;
            'd142: x_mapped = 'd174;
            'd143: x_mapped = 'd173;
            'd144: x_mapped = 'd172;
            'd145, 'd146: x_mapped = 'd171;
            'd147: x_mapped = 'd170;
            'd148: x_mapped = 'd169;
            'd149: x_mapped = 'd168;
            'd150: x_mapped = 'd167;
            'd151: x_mapped = 'd166;
            'd152: x_mapped = 'd165;
            'd153: x_mapped = 'd164;
            'd154: x_mapped = 'd163;
            'd155: x_mapped = 'd162;
            'd156: x_mapped = 'd161;
            'd157: x_mapped = 'd160;
            'd158: x_mapped = 'd159;
            default: x_mapped = 20'b0;
        endcase
    end

endmodule
