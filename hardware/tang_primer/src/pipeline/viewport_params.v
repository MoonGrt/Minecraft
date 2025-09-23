`timescale 1ns / 1ps

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

    reg signed [15:0] towards_h_x;
    reg signed [15:0] towards_h_y;
    wire signed [15:0] lookat_rel_x, lookat_rel_y, lookat_rel_z;
    wire signed [15:0] lookat_h_rel_x, lookat_h_rel_y;

    angle_relative angle_relatives (
        .rst           (rst),
        .angle_x       (p_angle_x),
        .angle_y       (p_angle_y),
        .lookat_rel_x  (lookat_rel_x),
        .lookat_rel_y  (lookat_rel_y),
        .lookat_rel_z  (lookat_rel_z),
        .lookat_h_rel_x(lookat_h_rel_x),
        .lookat_h_rel_y(lookat_h_rel_y)
    );

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

            towards_h_x = 'b0;
            towards_h_y = 'b0;
        end else begin
            vp_u_x = lookat_h_rel_y;
            vp_u_y = -lookat_h_rel_x;
            vp_u_z = 'b0;

            vp_v_x = ((vp_u_y * lookat_rel_z) - (vp_u_z * lookat_rel_y)) / 225;  // cross product
            vp_v_y = ((vp_u_z * lookat_rel_x) - (vp_u_x * lookat_rel_z)) / 225;  // cross product
            vp_v_z = ((vp_u_x * lookat_rel_y) - (vp_u_y * lookat_rel_x)) / 225;  // cross product

            vp_origin_x = (lookat_rel_x + (-vp_u_x * H_DISP + vp_v_x * V_DISP) / 2 / 225) * 2;
            vp_origin_y = (lookat_rel_y + (-vp_u_y * H_DISP + vp_v_y * V_DISP) / 2 / 225) * 2;
            vp_origin_z = (lookat_rel_z + (-vp_u_z * H_DISP + vp_v_z * V_DISP) / 2 / 225) * 2;

            towards_h_x = lookat_h_rel_x;
            towards_h_y = lookat_h_rel_y;
        end
    end

endmodule
