`timescale 1ns / 1ps
`include "constants.vh"

module top (
    input clk,
    input rst
);

    // ctrl Outputs
    wire  prepare_flag;
    reg  [`POS_X_RADIX-1:0] p_pos_x = 'd470 << 8;
    reg  [`POS_Y_RADIX-1:0] p_pos_y = 'd470 << 8;
    reg  [`POS_Z_RADIX-1:0] p_pos_z = 'd280 << 8;
    reg  [`ANGLE_RADIX-1:0] p_angle_x = 0;
    reg  [`ANGLE_RADIX-1:0] p_angle_y = -225;
    wire [  `MAP_ADDR_RADIX-1:0] write_addr;
    wire [`BLOCK_TYPE_RADIX-1:0] write_data;
    wire                         write_en;
    wire [`BLOCK_TYPE_RADIX-1:0] block_id;
    wire [31:0] texture_data;
    wire [23:0] color = texture_data[23:0];
    wire [`DISP_ADDR_RADIX-1:0] pixel_addr_out;
    wire [`MAP_ADDR_RADIX-1:0] block_addr;
    wire [`TEXTURE_ADDR_RADIX-1:0] texture_addr;
    wire valid;

    ppl ppl (
        .clk_ppl     (clk),
        .rst         (rst),
        // .scanner_stop(scanner_stop),
        .prepare_flag(prepare_flag),
        .p_pos_x     (p_pos_x),
        .p_pos_y     (p_pos_y),
        .p_pos_z     (p_pos_z),
        .p_angle_x   (p_angle_x),
        .p_angle_y   (p_angle_y),
        .block_id    (block_id),

        .valid         (valid),
        .block_addr    (block_addr),
        .pixel_addr_out(pixel_addr_out),
        .texture_addr  (texture_addr)
    );

    wire [`DISP_ADDR_RADIX-1:0] data_addr;
    wire                        data_valid;
    map map (
        .clk(clk),
        .rst(rst),

        .write_addr  (0),
        .write_data  (0),
        .write_en    (0),
        .block_addr  (block_addr),
        .texture_addr(texture_addr),
        .block_id    (block_id),

        .valid       (valid),
        .pixel_addr  (pixel_addr_out),

        .data_valid  (data_valid),
        .data_addr   (data_addr),
        .texture_data(texture_data)
    );

    wire [23:0] data_sorted;
    wire        data_sorted_valid;
    sort sort (
        .clk       (clk),
        .rst       (rst),

        .data      (color),
        .data_addr (data_addr),
        .data_valid(data_valid),

        .data_sorted      (data_sorted),
        .data_sorted_valid(data_sorted_valid)
    );

    wire [23:0] data_linefifo;
    wire        data_linefifo_valid;
    wire        data_linefifo_vs;
    linefifo #(
        .H(`H_DISP),
        .V(`V_DISP)
    )linefifo(
        .clk            (clk),
        .rst            (rst),
        .data_in        (data_sorted),
        .data_in_valid  (data_sorted_valid),
        .data_out       (data_linefifo),
        .data_out_valid (data_linefifo_valid),
        .data_out_vs    (data_linefifo_vs)
    );

endmodule
