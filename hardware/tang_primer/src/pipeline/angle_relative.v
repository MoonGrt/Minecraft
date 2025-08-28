`timescale 1ns / 1ps

module angle_relative (
    input                     rst,
    input  wire signed [19:0] angle_x,
    input  wire signed [19:0] angle_y,
    output reg signed  [19:0] lookat_rel_x,
    output reg signed  [19:0] lookat_rel_y,
    output reg signed  [19:0] lookat_rel_z,
    output reg signed  [19:0] lookat_h_rel_x,
    output reg signed  [19:0] lookat_h_rel_y
);

    // Internal signals
    wire signed [19:0] coord_h_x, coord_h_y;
    wire signed [19:0] coord_v_x, coord_v_y;

    // Instantiate angle_to_coord module
    angle_to_coord ac_cvt_h (
        .angle  (angle_x),
        .coord_x(coord_h_x),
        .coord_y(coord_h_y)
    );

    angle_to_coord ac_cvt_v (
        .angle  (angle_y),
        .coord_x(coord_v_x),
        .coord_y(coord_v_y)
    );

    // Calculate lookat_rel and lookat_h_rel
    always @(*) begin
        if (rst) begin
            lookat_rel_x   = 'b0;
            lookat_rel_y   = 'b0;
            lookat_rel_z   = 'b0;
            lookat_h_rel_x = 'b0;
            lookat_h_rel_y = 'b0;
        end else begin
            lookat_rel_x   = coord_h_x * coord_v_x / 'd225;
            lookat_rel_y   = coord_h_y * coord_v_x / 'd225;
            lookat_rel_z   = coord_v_y;
            lookat_h_rel_x = coord_h_x;
            lookat_h_rel_y = coord_h_y;
        end
    end

endmodule
