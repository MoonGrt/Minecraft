`timescale 1ns / 1ps

`define RECIPROCAL
`define DIVLUT

module ppl_proc (
    input clk,
    input rst,

    input [15:0] start_pos_x,
    input [15:0] start_pos_y,
    input [15:0] start_pos_z,
    input [13:0] ray_slope_x,
    input [13:0] ray_slope_y,
    input [13:0] ray_slope_z,
    input [19:0] pixel_addr,
    input [ 3:0] block_id,
    input [ 5:0] block_cnt,

    output [ 5:0] block_cnt_out,
    output [13:0] ray_slope_out_x,
    output [13:0] ray_slope_out_y,
    output [13:0] ray_slope_out_z,
    output [15:0] end_pos_x,
    output [15:0] end_pos_y,
    output [15:0] end_pos_z,

    output [14:0] block_addr,

    output        next_en,
    output [19:0] pixel_addr_out,
    output [12:0] texture_addr
);

    // Step 1
    reg [19:0] pixel_addr_d1 = 'b0;
    reg [13:0] ray_slope_x_d1 = 'b0;
    reg [13:0] ray_slope_y_d1 = 'b0;
    reg [13:0] ray_slope_z_d1 = 'b0;
    reg [ 4:0] block_x_d1 = 'b0;
    reg [ 4:0] block_y_d1 = 'b0;
    reg [ 4:0] block_z_d1 = 'b0;
    reg [15:0] start_pos_x_d1 = 'b0;
    reg [15:0] start_pos_y_d1 = 'b0;
    reg [15:0] start_pos_z_d1 = 'b0;
    reg [ 5:0] block_cnt_d1 = 'b0;
    reg [11:0] edge_x_d1 = 'b0;
    reg [11:0] edge_y_d1 = 'b0;
    reg [11:0] edge_z_d1 = 'b0;
`ifdef RECIPROCAL
    reg [23:0] recip_x_d1 = 'b0;
    reg [23:0] recip_y_d1 = 'b0;
    reg [23:0] recip_z_d1 = 'b0;
    wire [12:0] ray_slope_x_abs = ray_slope_x[13] ? (~ray_slope_x[12:0] + 13'd1) : ray_slope_x[12:0];
    wire [12:0] ray_slope_y_abs = ray_slope_y[13] ? (~ray_slope_y[12:0] + 13'd1) : ray_slope_y[12:0];
    wire [12:0] ray_slope_z_abs = ray_slope_z[13] ? (~ray_slope_z[12:0] + 13'd1) : ray_slope_z[12:0];
    // reciprocal module test
    // wire [15:0] recip_test_x, recip_test_y, recip_test_z;
    // reciprocal reciprocalx(clk, ray_slope_x_abs, recip_test_x);
    // reciprocal reciprocaly(clk, ray_slope_y_abs, recip_test_y);
    // reciprocal reciprocalz(clk, ray_slope_z_abs, recip_test_z);
`ifdef DIVLUT
    // integer divider lut
    wire [23:0] div_lut_x, div_lut_z, div_lut_y;
    div_lut div_lutx(clk, ray_slope_x_abs, div_lut_x);
    div_lut div_luty(clk, ray_slope_y_abs, div_lut_y);
    div_lut div_lutz(clk, ray_slope_z_abs, div_lut_z);
    // div_lut div_lutx(.clk(clk), .oce('b0), .ce(~rst), .reset(rst), .ad(ray_slope_x_abs[12:3]), .dout(div_lut_x));
    // div_lut div_luty(.clk(clk), .oce('b0), .ce(~rst), .reset(rst), .ad(ray_slope_y_abs[12:3]), .dout(div_lut_y));
    // div_lut div_lutz(.clk(clk), .oce('b0), .ce(~rst), .reset(rst), .ad(ray_slope_z_abs[12:3]), .dout(div_lut_z));
`endif
`endif
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
            block_cnt_d1   <= block_cnt + 'd1;
        end
    end
    // next
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            block_x_d1 <= 'b0;
            block_y_d1 <= 'b0;
            block_z_d1 <= 'b0;
            edge_x_d1 <= 'b0;
            edge_y_d1 <= 'b0;
            edge_z_d1 <= 'b0;
        end else begin
            block_x_d1 <= start_pos_x[15:11];
            block_y_d1 <= start_pos_y[15:11];
            block_z_d1 <= start_pos_z[15:11];
            edge_x_d1 <= ray_slope_x[13] ? (start_pos_x[10:0] ? start_pos_x[10:0] : ('d16 << 7)) : (('d16 << 7) - start_pos_x[10:0]);
            edge_y_d1 <= ray_slope_y[13] ? (start_pos_y[10:0] ? start_pos_y[10:0] : ('d16 << 7)) : (('d16 << 7) - start_pos_y[10:0]);
            edge_z_d1 <= ray_slope_z[13] ? (start_pos_z[10:0] ? start_pos_z[10:0] : ('d16 << 7)) : (('d16 << 7) - start_pos_z[10:0]);
`ifdef RECIPROCAL
            recip_x_d1 <= ('b1 << 15 + 3) / (ray_slope_x_abs >> 0);
            recip_y_d1 <= ('b1 << 15 + 3) / (ray_slope_y_abs >> 0);
            recip_z_d1 <= ('b1 << 15 + 3) / (ray_slope_z_abs >> 0);
`endif
        end
    end



    // Step 2
    reg [19:0] pixel_addr_d2 = 'b0;
    reg [13:0] ray_slope_x_d2 = 'b0;
    reg [13:0] ray_slope_y_d2 = 'b0;
    reg [13:0] ray_slope_z_d2 = 'b0;
    reg [ 4:0] block_x_d2 = 'b0;
    reg [ 4:0] block_y_d2 = 'b0;
    reg [ 4:0] block_z_d2 = 'b0;
    reg [15:0] start_pos_x_d2 = 'b0;
    reg [15:0] start_pos_y_d2 = 'b0;
    reg [15:0] start_pos_z_d2 = 'b0;
    reg [ 5:0] block_cnt_d2 = 'b0;
    reg [ 2:0] min_flag_d2 = 'b0;  // x, y, z
    reg [19:0] min = 'b0;
    reg [20:0] div_edge_x_d2 = 'b0;
    reg [20:0] div_edge_y_d2 = 'b0;
    reg [20:0] div_edge_z_d2 = 'b0;
`ifndef RECIPROCAL
    wire [12:0] ray_slope_x_abs = ray_slope_x_d1[13] ? (~ray_slope_x_d1[12:0]) + (13'd1) : ray_slope_x_d1[12:0];
    wire [12:0] ray_slope_y_abs = ray_slope_y_d1[13] ? (~ray_slope_y_d1[12:0]) + (13'd1) : ray_slope_y_d1[12:0];
    wire [12:0] ray_slope_z_abs = ray_slope_z_d1[13] ? (~ray_slope_z_d1[12:0]) + (13'd1) : ray_slope_z_d1[12:0];
`endif
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
    wire [15:0] minVal;
    wire [ 2:0] minIdx;
    wire        minIdx_yz;
    wire        minIdx_xyz;
    wire [15:0] minVal_yz;
    assign minIdx_yz = (div_edge_y_d2 < div_edge_z_d2);
    assign minVal_yz = (minIdx_yz ? div_edge_y_d2 : div_edge_z_d2);
    assign minIdx_xyz = (div_edge_x_d2 < minVal_yz);
    assign minVal = (minIdx_xyz ? div_edge_x_d2 : minVal_yz);
    assign minIdx = (minIdx_xyz ? 3'b100 : (minIdx_yz ? 3'b010 : 3'b001));

    // // 扩展减法（取符号位判断大小）
    // wire [16:0] xmy;  // x - y
    // wire [16:0] xmz;  // x - z
    // wire [16:0] ymz;  // y - z
    // assign xmy = {1'b0, div_edge_x_d2} - {1'b0, div_edge_y_d2};
    // assign xmz = {1'b0, div_edge_x_d2} - {1'b0, div_edge_z_d2};
    // assign ymz = {1'b0, div_edge_y_d2} - {1'b0, div_edge_z_d2};
    // // 最小值
    // wire [15:0] minVal = ( xmy[16] & xmz[16] ) ? div_edge_x_d2 : ( ~xmy[16] & ymz[16] ) ? div_edge_y_d2 : div_edge_z_d2;
    // // 最小轴索引（one-hot）
    // // 100 = X, 010 = Y, 001 = Z
    // wire [ 2:0] minIdx = ( xmy[16] & xmz[16] ) ? 3'b100 : ( ~xmy[16] & ymz[16] ) ? 3'b010 : 3'b001;

    always @(*) begin
        min = minVal;
        min_flag_d2 = minIdx;
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            div_edge_x_d2 <= 'b0;
            div_edge_y_d2 <= 'b0;
            div_edge_z_d2 <= 'b0;
        end else begin
`ifdef RECIPROCAL
`ifdef DIVLUT
            div_edge_x_d2 <= (edge_x_d1 * div_lut_x) >> 9;
            div_edge_y_d2 <= (edge_y_d1 * div_lut_y) >> 9;
            div_edge_z_d2 <= (edge_z_d1 * div_lut_z) >> 9;
`else
            div_edge_x_d2 <= (edge_x_d1 * recip_x_d1) >> 9;
            div_edge_y_d2 <= (edge_y_d1 * recip_y_d1) >> 9;
            div_edge_z_d2 <= (edge_z_d1 * recip_z_d1) >> 9;
`endif
`else
            div_edge_x_d2 <= (edge_x_d1 << 6) / (ray_slope_x_abs >> 3);
            div_edge_y_d2 <= (edge_y_d1 << 6) / (ray_slope_y_abs >> 3);
            div_edge_z_d2 <= (edge_z_d1 << 6) / (ray_slope_z_abs >> 3);
`endif
        end
    end



    // Step 3
    reg [19:0] pixel_addr_d3 = 'b0;
    reg [13:0] ray_slope_x_d3 = 'b0;
    reg [13:0] ray_slope_y_d3 = 'b0;
    reg [13:0] ray_slope_z_d3 = 'b0;
    reg [15:0] start_pos_x_d3 = 'b0;
    reg [15:0] start_pos_y_d3 = 'b0;
    reg [15:0] start_pos_z_d3 = 'b0;
    reg [ 5:0] block_cnt_d3 = 'b0;
    reg [ 2:0] min_flag_d3 = 'b0;  // x, y, z
    reg [ 4:0] block_next_x_d3 = 'b0;
    reg [ 4:0] block_next_y_d3 = 'b0;
    reg [ 4:0] block_next_z_d3 = 'b0;
    reg [15:0] div_edge_x_d3 = 'b0;
    reg [15:0] div_edge_y_d3 = 'b0;
    reg [15:0] div_edge_z_d3 = 'b0;
    // last
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ray_slope_x_d3 <= 'b0;
            ray_slope_y_d3 <= 'b0;
            ray_slope_z_d3 <= 'b0;
            start_pos_x_d3 <= 'b0;
            start_pos_y_d3 <= 'b0;
            start_pos_z_d3 <= 'b0;
            pixel_addr_d3  <= 'b0;
            block_cnt_d3   <= 'b0;
            min_flag_d3    <= 'b0;
            div_edge_x_d3 <= 'b0;
            div_edge_y_d3 <= 'b0;
            div_edge_z_d3 <= 'b0;
        end else begin
            ray_slope_x_d3 <= ray_slope_x_d2;
            ray_slope_y_d3 <= ray_slope_y_d2;
            ray_slope_z_d3 <= ray_slope_z_d2;
            start_pos_x_d3 <= start_pos_x_d2;
            start_pos_y_d3 <= start_pos_y_d2;
            start_pos_z_d3 <= start_pos_z_d2;
            pixel_addr_d3  <= pixel_addr_d2;
            block_cnt_d3   <= block_cnt_d2;
            min_flag_d3    <= min_flag_d2;
            div_edge_x_d3  <= (ray_slope_x_d2 != 0) ? div_edge_x_d2 : 16'hffff;
            div_edge_y_d3  <= (ray_slope_y_d2 != 0) ? div_edge_y_d2 : 16'hffff;
            div_edge_z_d3  <= (ray_slope_z_d2 != 0) ? div_edge_z_d2 : 16'hffff;
        end
    end
    // next
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            block_next_x_d3 <= 'b0;
            block_next_y_d3 <= 'b0;
            block_next_z_d3 <= 'b0;
        end else begin
            block_next_x_d3 <= min_flag_d2[2] ? (ray_slope_x_d2[13] ? ((start_pos_x_d2[10:0] == 0) && (ray_slope_x_d2[13]) ? block_x_d2 - 'd2 : block_x_d2 - 'd1) : block_x_d2 + 'd1) : 
                                ((start_pos_x_d2[10:0] == 0) && (ray_slope_x_d2[13]) ? block_x_d2 - 'd1 : block_x_d2);
            block_next_y_d3 <= min_flag_d2[1] ? (ray_slope_y_d2[13] ? ((start_pos_y_d2[10:0] == 0) && (ray_slope_y_d2[13]) ? block_y_d2 - 'd2 : block_y_d2 - 'd1) : block_y_d2 + 'd1) :
                                ((start_pos_y_d2[10:0] == 0) && (ray_slope_y_d2[13]) ? block_y_d2 - 'd1 : block_y_d2);
            block_next_z_d3 <= min_flag_d2[0] ? (ray_slope_z_d2[13] ? ((start_pos_z_d2[10:0] == 0) && (ray_slope_z_d2[13]) ? block_z_d2 - 'd2 : block_z_d2 - 'd1) : block_z_d2 + 'd1) :
                                ((start_pos_z_d2[10:0] == 0) && (ray_slope_z_d2[13]) ? block_z_d2 - 'd1 : block_z_d2);
        end
    end



    // Step 4
    reg  [19:0] pixel_addr_d4 = 'b0;
    reg  [13:0] ray_slope_x_d4 = 'b0;
    reg  [13:0] ray_slope_y_d4 = 'b0;
    reg  [13:0] ray_slope_z_d4 = 'b0;
    reg  [ 5:0] block_cnt_d4 = 'b0;
    reg  [ 2:0] min_flag_d4  = 'b0;  // x, y, z
    reg  [15:0] end_pos_x_d4 = 'b0;
    reg  [15:0] end_pos_y_d4 = 'b0;
    reg  [15:0] end_pos_z_d4 = 'b0;
    reg         map_border_flag_d4;
    reg  [14:0] block_addr_d4;
    wire [20:0] detal_xy = ($signed(ray_slope_x_d3) * $signed(div_edge_y_d3)) >>> 9;
    wire [20:0] detal_xz = ($signed(ray_slope_x_d3) * $signed(div_edge_z_d3)) >>> 9;
    wire [20:0] detal_yz = ($signed(ray_slope_y_d3) * $signed(div_edge_z_d3)) >>> 9;
    wire [20:0] detal_yx = ($signed(ray_slope_y_d3) * $signed(div_edge_x_d3)) >>> 9;
    wire [20:0] detal_zx = ($signed(ray_slope_z_d3) * $signed(div_edge_x_d3)) >>> 9;
    wire [20:0] detal_zy = ($signed(ray_slope_z_d3) * $signed(div_edge_y_d3)) >>> 9;
    // last
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ray_slope_x_d4 <= 'b0;
            ray_slope_y_d4 <= 'b0;
            ray_slope_z_d4 <= 'b0;
            pixel_addr_d4  <= 'b0;
            block_cnt_d4   <= 'b0;
            min_flag_d4    <= 'b0;
        end else begin
            ray_slope_x_d4 <= ray_slope_x_d3;
            ray_slope_y_d4 <= ray_slope_y_d3;
            ray_slope_z_d4 <= ray_slope_z_d3;
            pixel_addr_d4  <= pixel_addr_d3;
            block_cnt_d4   <= block_cnt_d3;
            min_flag_d4    <= min_flag_d3;
        end
    end
    // next
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            map_border_flag_d4 <= 'b0;
            block_addr_d4      <= 'b0;
            end_pos_x_d4       <= 'b0;
            end_pos_y_d4       <= 'b0;
            end_pos_z_d4       <= 'b0;
        end else begin
            // block_next_x * 32 * 32 + block_next_y * 32 + block_next_z;
            block_addr_d4 <= {block_next_x_d3, block_next_y_d3, block_next_z_d3};
            map_border_flag_d4 <= ((start_pos_x_d3[15:11] == 0) && ray_slope_x_d3[13]) || ((start_pos_x_d3[15:11] == 32) && ~ray_slope_x_d3[13]) ||
                                  ((start_pos_y_d3[15:11] == 0) && ray_slope_y_d3[13]) || ((start_pos_y_d3[15:11] == 32) && ~ray_slope_y_d3[13]) ||
                                  ((start_pos_z_d3[15:11] == 0) && ray_slope_z_d3[13]) || ((start_pos_z_d3[15:11] == 32) && ~ray_slope_z_d3[13]);
            end_pos_x_d4 <= min_flag_d3[2] ? ((ray_slope_x_d3[13] ? (start_pos_x_d3[10:0] ? start_pos_x_d3[15:11] : start_pos_x_d3[15:11] - 'd1) : start_pos_x_d3[15:11] + 'd1) << 11) :  // 4 + 7
                                (min_flag_d3[1] ? start_pos_x_d3 + detal_xy : start_pos_x_d3 + detal_xz);
            end_pos_y_d4 <= min_flag_d3[1] ? ((ray_slope_y_d3[13] ? (start_pos_y_d3[10:0] ? start_pos_y_d3[15:11] : start_pos_y_d3[15:11] - 'd1) : start_pos_y_d3[15:11] + 'd1) << 11) :  // 4 + 7
                                (min_flag_d3[0] ? start_pos_y_d3 + detal_yz : start_pos_y_d3 + detal_yx);
            end_pos_z_d4 <= min_flag_d3[0] ? ((ray_slope_z_d3[13] ? (start_pos_z_d3[10:0] ? start_pos_z_d3[15:11] : start_pos_z_d3[15:11] - 'd1) : start_pos_z_d3[15:11] + 'd1) << 11) :  // 4 + 7
                                (min_flag_d3[2] ? start_pos_z_d3 + detal_zx : start_pos_z_d3 + detal_zy);
        end
    end



    // Step 5
    reg [ 2:0] face_d5;
    reg [19:0] pixel_addr_d5 = 'b0;
    reg [13:0] ray_slope_x_d5 = 'b0;
    reg [13:0] ray_slope_y_d5 = 'b0;
    reg [13:0] ray_slope_z_d5 = 'b0;
    reg [15:0] end_pos_x_d5 = 'b0;
    reg [15:0] end_pos_y_d5 = 'b0;
    reg [15:0] end_pos_z_d5 = 'b0;
    reg [ 5:0] block_cnt_d5 = 'b0;
    reg [ 3:0] texture_x_d5 = 'b0;
    reg [ 3:0] texture_y_d5 = 'b0;
    reg        map_border_flag_d5;
    reg [14:0] block_addr_d5;
    assign block_addr = block_addr_d5;
    // last
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ray_slope_x_d5 <= 'b0;
            ray_slope_y_d5 <= 'b0;
            ray_slope_z_d5 <= 'b0;
            end_pos_x_d5 <= 'b0;
            end_pos_y_d5 <= 'b0;
            end_pos_z_d5 <= 'b0;
            pixel_addr_d5  <= 'b0;
            block_cnt_d5   <= 'b0;
            map_border_flag_d5 <= 'b0;
            block_addr_d5 <= 'b0;
        end else begin
            ray_slope_x_d5 <= ray_slope_x_d4;
            ray_slope_y_d5 <= ray_slope_y_d4;
            ray_slope_z_d5 <= ray_slope_z_d4;
            end_pos_x_d5 <= end_pos_x_d4;
            end_pos_y_d5 <= end_pos_y_d4;
            end_pos_z_d5 <= end_pos_z_d4;
            pixel_addr_d5 <= pixel_addr_d4;
            block_cnt_d5 <= block_cnt_d4;
            map_border_flag_d5 <= map_border_flag_d4;
            block_addr_d5 <= block_addr_d4;
        end
    end
    // next
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            texture_x_d5 <= 'b0;
            texture_y_d5 <= 'b0;
            face_d5 <= 'b0;
        end else begin
            face_d5 <= min_flag_d4[2] ? (ray_slope_x ? 3'd2 : 3'd3) :  // X
                       min_flag_d4[1] ? (ray_slope_y ? 3'd1 : 3'd4) :  // Y
                       min_flag_d4[0] ? (ray_slope_z ? 3'd0 : 3'd5) :  // Z
                       3'd0;  // 默认值
            texture_x_d5 <= min_flag_d4[2] ? end_pos_y_d4[10:7] : (min_flag_d4[1] ? end_pos_x_d4[10:7] : end_pos_x_d4[10:7]);
            texture_y_d5 <= min_flag_d4[2] ? end_pos_z_d4[10:7] : (min_flag_d4[1] ? end_pos_z_d4[10:7] : end_pos_y_d4[10:7]);
        end
    end



    // Step 6
    reg [ 2:0] face_d6 = 'b0;
    reg [19:0] pixel_addr_d6 = 'b0;
    reg [13:0] ray_slope_x_d6 = 'b0;
    reg [13:0] ray_slope_y_d6 = 'b0;
    reg [13:0] ray_slope_z_d6 = 'b0;
    reg [15:0] end_pos_x_d6 = 'b0;
    reg [15:0] end_pos_y_d6 = 'b0;
    reg [15:0] end_pos_z_d6 = 'b0;
    reg [ 5:0] block_cnt_d6 = 'b0;
    reg        map_border_flag_d6 = 'b0;
    reg [ 3:0] texture_x_d6 = 'b0;
    reg [ 3:0] texture_y_d6 = 'b0;
    // last
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            face_d6 <= 'b0;
            ray_slope_x_d6 <= 'b0;
            ray_slope_y_d6 <= 'b0;
            ray_slope_z_d6 <= 'b0;
            pixel_addr_d6 <= 'b0;
            end_pos_x_d6 <= 'b0;
            end_pos_y_d6 <= 'b0;
            end_pos_z_d6 <= 'b0;
            block_cnt_d6 <= 'b0;
            map_border_flag_d6 <= 'b0;
            texture_x_d6 <= 'b0;
            texture_y_d6 <= 'b0;
        end else begin
            face_d6 <= face_d5;
            ray_slope_x_d6 <= ray_slope_x_d5;
            ray_slope_y_d6 <= ray_slope_y_d5;
            ray_slope_z_d6 <= ray_slope_z_d5;
            pixel_addr_d6 <= pixel_addr_d5;
            end_pos_x_d6 <= end_pos_x_d5;
            end_pos_y_d6 <= end_pos_y_d5;
            end_pos_z_d6 <= end_pos_z_d5;
            block_cnt_d6 <= block_cnt_d5;
            map_border_flag_d6 <= map_border_flag_d5;
            texture_x_d6 <= texture_x_d5;
            texture_y_d6 <= texture_y_d5;
        end
    end
    // next
    parameter BLOCK_NUM = 16;
    parameter FACE_NUM = 6;
    parameter TEXTURE_NUM = 20;
    // 计算地址
    wire [$clog2(BLOCK_NUM*FACE_NUM)-1:0] face_idx = block_id ? (block_id - 1) * 6 + face_d6 : 0; // block_id - 1 (去除空气AIR方块)
    // 声明 ROM
    reg [$clog2(TEXTURE_NUM)-1:0] face_idx_mem [0:BLOCK_NUM*FACE_NUM-1];
    // 初始化 ROM
    // initial $readmemh("G:/VM/share/Minecraft/scripts/res/output/txt_idx.hex", face_idx_mem);
    initial $readmemb("./vsrc/txtidx.bin", face_idx_mem);
    // 组合逻辑直接读取
    wire [4:0] texture_id = face_idx_mem[face_idx];
    wire [12:0] texture_addr_d6 = block_id ? {texture_id, texture_y_d6, texture_x_d6} : 0;


    assign pixel_addr_out  = pixel_addr_d6;
    assign ray_slope_out_x = ray_slope_x_d6;
    assign ray_slope_out_y = ray_slope_y_d6;
    assign ray_slope_out_z = ray_slope_z_d6;
    assign texture_addr    = texture_addr_d6;
    assign end_pos_x       = end_pos_x_d6;
    assign end_pos_y       = end_pos_y_d6;
    assign end_pos_z       = end_pos_z_d6;
    assign block_cnt_out   = block_cnt_d6;
    assign next_en         = (block_id || map_border_flag_d6 || (block_cnt_d6 > 52));

endmodule
