`timescale 1ns / 1ps
`include "constants.vh"

module ppl_proc #(
    parameter PREPARE_CYCLES = 3
) (
    input clk,
    input rst,
    input prepare_flag,

    input        [`POS_X_RADIX-1:0] start_pos_x,
    input        [`POS_Y_RADIX-1:0] start_pos_y,
    input        [`POS_Z_RADIX-1:0] start_pos_z,
    input signed [`ANGLE_RADIX-1:0] ray_slope_x,
    input signed [`ANGLE_RADIX-1:0] ray_slope_y,
    input signed [`ANGLE_RADIX-1:0] ray_slope_z,
    input        [`DISP_ADDR_RADIX-1:0] pixel_addr,
    input        [`BLOCK_TYPE_RADIX-1:0] block_id,
    input        [ 3:0] block_cnt,

    output        [ 3:0] block_cnt_out,
    output signed [`ANGLE_RADIX-1:0] ray_slope_out_x,
    output signed [`ANGLE_RADIX-1:0] ray_slope_out_y,
    output signed [`ANGLE_RADIX-1:0] ray_slope_out_z,
    output        [`POS_X_RADIX-1:0] end_pos_x,
    output        [`POS_Y_RADIX-1:0] end_pos_y,
    output        [`POS_Z_RADIX-1:0] end_pos_z,

    output [`MAP_ADDR_RADIX-1:0] block_addr,

    output        next_en,
    output [`DISP_ADDR_RADIX-1:0] pixel_addr_out,
    output [`TEXTURE_ADDR_RADIX-1:0] texture_addr
);

    // Step 1
    reg        [`DISP_ADDR_RADIX-1:0] pixel_addr_d1 = 'b0;
    reg signed [`ANGLE_RADIX-1:0] ray_slope_x_d1 = 'b0;
    reg signed [`ANGLE_RADIX-1:0] ray_slope_y_d1 = 'b0;
    reg signed [`ANGLE_RADIX-1:0] ray_slope_z_d1 = 'b0;
    reg signed [ 5:0] block_x_d1 = 'b0;
    reg signed [ 5:0] block_y_d1 = 'b0;
    reg signed [ 4:0] block_z_d1 = 'b0;
    reg        [`POS_X_RADIX-1:0] start_pos_x_d1 = 'b0;
    reg        [`POS_Y_RADIX-1:0] start_pos_y_d1 = 'b0;
    reg        [`POS_Z_RADIX-1:0] start_pos_z_d1 = 'b0;
    reg        [ 3:0] block_cnt_d1 = 'b0;

    reg        [`TEXTURE_ADDR_RADIX-1:0] edge_x_d1 = 'b0;
    reg        [`TEXTURE_ADDR_RADIX-1:0] edge_y_d1 = 'b0;
    reg        [`TEXTURE_ADDR_RADIX-1:0] edge_z_d1 = 'b0;
    wire       [ 3:0] pos_modulus_x = start_pos_x[11:8];
    wire       [ 3:0] pos_modulus_y = start_pos_y[11:8];
    wire       [ 3:0] pos_modulus_z = start_pos_z[11:8];
    // last
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pixel_addr_d1  <= 'b0;
            ray_slope_x_d1 <= 'b0;
            ray_slope_y_d1 <= 'b0;
            ray_slope_z_d1 <= 'b0;
            start_pos_x_d1 <= 'b0;
            start_pos_y_d1 <= 'b0;
            start_pos_z_d1 <= 'b0;
            block_cnt_d1   <= 'b0;
        end else begin
            pixel_addr_d1  <= pixel_addr;
            ray_slope_x_d1 <= ray_slope_x;
            ray_slope_y_d1 <= ray_slope_y;
            ray_slope_z_d1 <= ray_slope_z;
            start_pos_x_d1 <= start_pos_x;
            start_pos_y_d1 <= start_pos_y;
            start_pos_z_d1 <= start_pos_z;
            block_cnt_d1   <= block_cnt + 1;
        end
    end
    // next
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            block_x_d1 <= 'b0;
            block_y_d1 <= 'b0;
            block_z_d1 <= 'b0;
            edge_x_d1  <= 'b0;
            edge_y_d1  <= 'b0;
            edge_z_d1  <= 'b0;
        end else begin
            block_x_d1 <= start_pos_x[17:12];
            block_y_d1 <= start_pos_y[17:12];
            block_z_d1 <= start_pos_z[16:12];
            edge_x_d1  <= ray_slope_x > 0 ? ('d16 - pos_modulus_x) << 8 : (pos_modulus_x ? (pos_modulus_x << 8) : ('d16 << 8));
            edge_y_d1  <= ray_slope_y > 0 ? ('d16 - pos_modulus_y) << 8 : (pos_modulus_y ? (pos_modulus_y << 8) : ('d16 << 8));
            edge_z_d1  <= ray_slope_z > 0 ? ('d16 - pos_modulus_z) << 8 : (pos_modulus_z ? (pos_modulus_z << 8) : ('d16 << 8));
        end
    end



    // Step 2
    reg [`DISP_ADDR_RADIX-1:0] pixel_addr_d2 = 'b0;
    reg signed [`ANGLE_RADIX-1:0] ray_slope_x_d2 = 'b0;
    reg signed [`ANGLE_RADIX-1:0] ray_slope_y_d2 = 'b0;
    reg signed [`ANGLE_RADIX-1:0] ray_slope_z_d2 = 'b0;
    reg signed [5:0] block_x_d2 = 'b0;
    reg signed [5:0] block_y_d2 = 'b0;
    reg signed [4:0] block_z_d2 = 'b0;
    reg [`POS_X_RADIX-1:0] start_pos_x_d2 = 'b0;
    reg [`POS_Y_RADIX-1:0] start_pos_y_d2 = 'b0;
    reg [`POS_Z_RADIX-1:0] start_pos_z_d2 = 'b0;
    reg [3:0] block_cnt_d2 = 'b0;

    reg [2:0] min_flag_d2 = 'b0;  // x, y, z
    reg [`ANGLE_RADIX-1:0] min = 'b0;
    wire signed [`ANGLE_RADIX-1:0] ray_slope_x_abs = (ray_slope_x_d1 < 0) ? -ray_slope_x_d1 : ray_slope_x_d1;
    wire signed [`ANGLE_RADIX-1:0] ray_slope_y_abs = (ray_slope_y_d1 < 0) ? -ray_slope_y_d1 : ray_slope_y_d1;
    wire signed [`ANGLE_RADIX-1:0] ray_slope_z_abs = (ray_slope_z_d1 < 0) ? -ray_slope_z_d1 : ray_slope_z_d1;
    wire signed [43:0] div_edge_x = ray_slope_x_d1 ? (edge_x_d1 << 22) / ray_slope_x_abs : 'b0;
    wire signed [43:0] div_edge_y = ray_slope_y_d1 ? (edge_y_d1 << 22) / ray_slope_y_abs : 'b0;
    wire signed [43:0] div_edge_z = ray_slope_z_d1 ? (edge_z_d1 << 22) / ray_slope_z_abs : 'b0;
    reg [`ANGLE_RADIX-1:0] div_edge_x_d2 = 'b0;
    reg [`ANGLE_RADIX-1:0] div_edge_y_d2 = 'b0;
    reg [`ANGLE_RADIX-1:0] div_edge_z_d2 = 'b0;
    // last
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ray_slope_x_d2 <= 'b0;
            ray_slope_y_d2 <= 'b0;
            ray_slope_z_d2 <= 'b0;
            pixel_addr_d2  <= 'b0;
            block_x_d2     <= 'b0;
            block_y_d2     <= 'b0;
            block_z_d2     <= 'b0;
            start_pos_x_d2 <= 'b0;
            start_pos_y_d2 <= 'b0;
            start_pos_z_d2 <= 'b0;
            block_cnt_d2   <= 'b0;
        end else begin
            ray_slope_x_d2 <= ray_slope_x_d1;
            ray_slope_y_d2 <= ray_slope_y_d1;
            ray_slope_z_d2 <= ray_slope_z_d1;
            pixel_addr_d2  <= pixel_addr_d1;
            block_x_d2     <= block_x_d1;
            block_y_d2     <= block_y_d1;
            block_z_d2     <= block_z_d1;
            start_pos_x_d2 <= start_pos_x_d1;
            start_pos_y_d2 <= start_pos_y_d1;
            start_pos_z_d2 <= start_pos_z_d1;
            block_cnt_d2   <= block_cnt_d1;
        end
    end
    // next
    always @(*) begin
        min = div_edge_x[43:22];
        min_flag_d2 = 3'b100;
        if (div_edge_y[43:22] < min) begin
            min = div_edge_y[43:22];
            min_flag_d2 = 3'b010;
        end
        if (div_edge_z[43:22] < min) begin
            min = div_edge_z[43:22];
            min_flag_d2 = 3'b001;
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            div_edge_x_d2 <= 'b0;
            div_edge_y_d2 <= 'b0;
            div_edge_z_d2 <= 'b0;
        end else begin
            div_edge_x_d2 <= div_edge_x[43:22];
            div_edge_y_d2 <= div_edge_y[43:22];
            div_edge_z_d2 <= div_edge_z[43:22];
        end
    end



    // Step 3
    reg [1:0] face_d3 = 'b0;
    reg [`DISP_ADDR_RADIX-1:0] pixel_addr_d3 = 'b0;
    reg signed [`ANGLE_RADIX-1:0] ray_slope_x_d3 = 'b0;
    reg signed [`ANGLE_RADIX-1:0] ray_slope_y_d3 = 'b0;
    reg signed [`ANGLE_RADIX-1:0] ray_slope_z_d3 = 'b0;
    reg [3:0] block_cnt_d3 = 'b0;

    reg [3:0] texture_x_d3 = 'b0;
    reg [3:0] texture_y_d3 = 'b0;
    reg [`POS_X_RADIX-1:0] end_pos_x_d3 = 'b0;
    reg [`POS_Y_RADIX-1:0] end_pos_y_d3 = 'b0;
    reg [`POS_Z_RADIX-1:0] end_pos_z_d3 = 'b0;
    wire signed [ 5:0] block_next_x = min_flag_d2[2] ? (ray_slope_x_d2 > 0 ? block_x_d2 + 1 : block_x_d2 - 1) : block_x_d2;  // ray_slope_x_d2 == 0 ??
    wire signed [ 5:0] block_next_y = min_flag_d2[1] ? (ray_slope_y_d2 > 0 ? block_y_d2 + 1 : block_y_d2 - 1) : block_y_d2;
    wire signed [ 4:0] block_next_z = min_flag_d2[0] ? (ray_slope_z_d2 > 0 ? block_z_d2 + 1 : block_z_d2 - 1) : block_z_d2;
    wire [`POS_X_RADIX-1:0] end_pos_x_temp = min_flag_d2[2] ? (block_next_x << 12) :  // 4 + 8
    (min_flag_d2[1] ? start_pos_x_d2 + ray_slope_x_d2 * div_edge_y_d2 : start_pos_x_d2 + ray_slope_x_d2 * div_edge_z_d2);
    wire [`POS_Y_RADIX-1:0] end_pos_y_temp = min_flag_d2[1] ? (block_next_y << 12) :  // 4 + 8
    (min_flag_d2[0] ? start_pos_y_d2 + ray_slope_y_d2 * div_edge_z_d2 : start_pos_y_d2 + ray_slope_y_d2 * div_edge_x_d2);
    wire [`POS_Z_RADIX-1:0] end_pos_z_temp = min_flag_d2[0] ? (block_next_z << 12) :  // 4 + 8
    (min_flag_d2[2] ? start_pos_z_d2 + ray_slope_z_d2 * div_edge_x_d2 : start_pos_z_d2 + ray_slope_z_d2 * div_edge_y_d2);
    wire next_en_d3 = (block_id) ? 1'b1 : 1'b0;
    reg map_border_flag_d3;
    reg [`MAP_ADDR_RADIX-1:0] block_addr_d3;
    assign block_addr = block_addr_d3;
    // last
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ray_slope_x_d3 <= 'b0;
            ray_slope_y_d3 <= 'b0;
            ray_slope_z_d3 <= 'b0;
            pixel_addr_d3  <= 'b0;
            block_cnt_d3   <= 'b0;
        end else begin
            ray_slope_x_d3 <= ray_slope_x_d2;
            ray_slope_y_d3 <= ray_slope_y_d2;
            ray_slope_z_d3 <= ray_slope_z_d2;
            pixel_addr_d3  <= pixel_addr_d2;
            block_cnt_d3   <= block_cnt_d2;
        end
    end
    // next
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            block_addr_d3      <= 'b0;
            texture_x_d3       <= 'b0;
            texture_y_d3       <= 'b0;
            face_d3            <= 'b0;
            end_pos_x_d3       <= 'b0;
            end_pos_y_d3       <= 'b0;
            end_pos_z_d3       <= 'b0;
            map_border_flag_d3 <= 'b0;
        end else begin
            // block_addr_d3 <= block_next_x + (block_next_y << 6) + (block_next_z << 12);  // block_next_x + block_next_y * 64 + block_next_z * 64 * 64;
            block_addr_d3 <= (block_next_x << 11) + (block_next_y << 5) + block_next_z;  // block_next_x * 64 *32 + block_next_y * 32 + block_next_z;
            face_d3 <= min_flag_d2[0] ? (ray_slope_z ? 2'b00 : 2'b10) : 2'b01;
            texture_x_d3  <= min_flag_d2[2] ? end_pos_y_temp % 16 : (min_flag_d2[1] ? end_pos_x_temp % 16 : end_pos_x_temp % 16);
            texture_y_d3  <= min_flag_d2[2] ? end_pos_z_temp % 16 : (min_flag_d2[1] ? end_pos_z_temp % 16 : end_pos_y_temp % 16);
            end_pos_x_d3 <= end_pos_x_temp;
            end_pos_y_d3 <= end_pos_y_temp;
            end_pos_z_d3 <= end_pos_z_temp;
            map_border_flag_d3 <= (block_next_x == 0) || (block_next_x == 64) ||
                                    (block_next_y == 0) || (block_next_y == 64) ||
                                    (block_next_z == 0) || (block_next_z == 32);
        end
    end



    // Step`BLOCK_TYPE_RADIX-1
    reg        [`DISP_ADDR_RADIX-1:0] pixel_addr_d4 = 'b0;
    reg signed [`ANGLE_RADIX-1:0] ray_slope_x_d4 = 'b0;
    reg signed [`ANGLE_RADIX-1:0] ray_slope_y_d4 = 'b0;
    reg signed [`ANGLE_RADIX-1:0] ray_slope_z_d4 = 'b0;
    reg        [`POS_X_RADIX-1:0] end_pos_x_d4 = 'b0;
    reg        [`POS_Y_RADIX-1:0] end_pos_y_d4 = 'b0;
    reg        [`POS_Z_RADIX-1:0] end_pos_z_d4 = 'b0;
    reg        [ 3:0] block_cnt_d4 = 'b0;
    reg               map_border_flag_d4;

    // last
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ray_slope_x_d4 <= 'b0;
            ray_slope_y_d4 <= 'b0;
            ray_slope_z_d4 <= 'b0;
            pixel_addr_d4 <= 'b0;
            end_pos_x_d4 <= 'b0;
            end_pos_y_d4 <= 'b0;
            end_pos_z_d4 <= 'b0;
            block_cnt_d4 <= 'b0;
            map_border_flag_d4 <= 'b0;
        end else begin
            ray_slope_x_d4 <= ray_slope_x_d3;
            ray_slope_y_d4 <= ray_slope_y_d3;
            ray_slope_z_d4 <= ray_slope_z_d3;
            pixel_addr_d4 <= pixel_addr_d3;
            end_pos_x_d4 <= end_pos_x_d3;
            end_pos_y_d4 <= end_pos_y_d3;
            end_pos_z_d4 <= end_pos_z_d3;
            block_cnt_d4 <= block_cnt_d3;
            map_border_flag_d4 <= map_border_flag_d3;
        end
    end
    // next
    wire [4:0] texture_id;
    projection projection (
        .block_id  (block_id),
        .face      (face_d3),
        .texture_id(texture_id)
    );
    wire [`TEXTURE_ADDR_RADIX-1:0] texture_addr_d4 = texture_x_d3 + (texture_y_d3 << 4) + (texture_id << 8);

    assign pixel_addr_out  = prepare_flag ? 'b0 : pixel_addr_d4;
    assign ray_slope_out_x = prepare_flag ? 'b0 : ray_slope_x_d4;
    assign ray_slope_out_y = prepare_flag ? 'b0 : ray_slope_y_d4;
    assign ray_slope_out_z = prepare_flag ? 'b0 : ray_slope_z_d4;
    assign texture_addr    = prepare_flag ? 'b0 : texture_addr_d4;
    assign end_pos_x       = prepare_flag ? 'b0 : end_pos_x_d4;
    assign end_pos_y       = prepare_flag ? 'b0 : end_pos_y_d4;
    assign end_pos_z       = prepare_flag ? 'b0 : end_pos_z_d4;
    assign block_cnt_out   = prepare_flag ? 'b0 : block_cnt_d4;
    // assign next_en         = prepare_flag ? 'b1 : (next_en_d3 || map_border_flag_d4 || (block_cnt_d4 > 11));
    assign next_en         = prepare_flag ? 'b1 : next_en_d3;

endmodule
