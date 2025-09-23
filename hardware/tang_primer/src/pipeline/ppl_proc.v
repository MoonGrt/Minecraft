`timescale 1ns / 1ps

module ppl_proc (
    input clk,
    input rst,
    input prepare_flag,

    input        [15:0] start_pos_x,
    input        [15:0] start_pos_y,
    input        [15:0] start_pos_z,
    input signed [19:0] ray_slope_x,
    input signed [19:0] ray_slope_y,
    input signed [19:0] ray_slope_z,
    input        [19:0] pixel_addr,
    input        [ 3:0] block_id,
    input        [ 3:0] block_cnt,

    output        [ 3:0] block_cnt_out,
    output signed [19:0] ray_slope_out_x,
    output signed [19:0] ray_slope_out_y,
    output signed [19:0] ray_slope_out_z,
    output        [15:0] end_pos_x,
    output        [15:0] end_pos_y,
    output        [15:0] end_pos_z,

    output [14:0] block_addr,

    output        next_en,
    output [19:0] pixel_addr_out,
    output [12:0] texture_addr
);

    // Step 1
    reg        [19:0] pixel_addr_d1 = 'b0;
    reg signed [19:0] ray_slope_x_d1 = 'b0;
    reg signed [19:0] ray_slope_y_d1 = 'b0;
    reg signed [19:0] ray_slope_z_d1 = 'b0;
    reg signed [ 4:0] block_x_d1 = 'b0;
    reg signed [ 4:0] block_y_d1 = 'b0;
    reg signed [ 4:0] block_z_d1 = 'b0;
    reg        [15:0] start_pos_x_d1 = 'b0;
    reg        [15:0] start_pos_y_d1 = 'b0;
    reg        [15:0] start_pos_z_d1 = 'b0;
    reg        [ 3:0] block_cnt_d1 = 'b0;

    reg        [11:0] edge_x_d1 = 'b0;  // 16 << 7
    reg        [11:0] edge_y_d1 = 'b0;
    reg        [11:0] edge_z_d1 = 'b0;
    // reg signed [19:0] ray_slope_x_pn_d1 = 'b0;  // positive: 1; negative: 0 (without considering 0)
    // reg signed [19:0] ray_slope_y_pn_d1 = 'b0;
    // reg signed [19:0] ray_slope_z_pn_d1 = 'b0;
    wire       [ 3:0] pos_modulus_x = start_pos_x[10:7];
    wire       [ 3:0] pos_modulus_y = start_pos_y[10:7];
    wire       [ 3:0] pos_modulus_z = start_pos_z[10:7];
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
            // ray_slope_x_pn_d1 <= 'b0;
            // ray_slope_y_pn_d1 <= 'b0;
            // ray_slope_z_pn_d1 <= 'b0;
        end else begin
            block_x_d1 <= start_pos_x[15:11];
            block_y_d1 <= start_pos_y[15:11];
            block_z_d1 <= start_pos_z[15:11];
            edge_x_d1 <= ray_slope_x[19] ? (pos_modulus_x ? pos_modulus_x : 'd16) : ('d16 - pos_modulus_x);
            edge_y_d1 <= ray_slope_y[19] ? (pos_modulus_y ? pos_modulus_y : 'd16) : ('d16 - pos_modulus_y);
            edge_z_d1 <= ray_slope_z[19] ? (pos_modulus_z ? pos_modulus_z : 'd16) : ('d16 - pos_modulus_z);
        end
    end



    // Step 2
    reg [19:0] pixel_addr_d2 = 'b0;
    reg signed [19:0] ray_slope_x_d2 = 'b0;
    reg signed [19:0] ray_slope_y_d2 = 'b0;
    reg signed [19:0] ray_slope_z_d2 = 'b0;
    // reg signed [19:0] ray_slope_x_pn_d2 = 'b0;
    // reg signed [19:0] ray_slope_y_pn_d2 = 'b0;
    // reg signed [19:0] ray_slope_z_pn_d2 = 'b0;
    reg signed [4:0] block_x_d2 = 'b0;
    reg signed [4:0] block_y_d2 = 'b0;
    reg signed [4:0] block_z_d2 = 'b0;
    reg [15:0] start_pos_x_d2 = 'b0;
    reg [15:0] start_pos_y_d2 = 'b0;
    reg [15:0] start_pos_z_d2 = 'b0;
    reg [3:0] block_cnt_d2 = 'b0;

    reg [2:0] min_flag_d2 = 'b0;  // x, y, z
    reg [19:0] min = 'b0;
    wire signed [19:0] ray_slope_x_abs = ray_slope_x_d1[19] ? -ray_slope_x_d1 : ray_slope_x_d1;
    wire signed [19:0] ray_slope_y_abs = ray_slope_y_d1[19] ? -ray_slope_y_d1 : ray_slope_y_d1;
    wire signed [19:0] ray_slope_z_abs = ray_slope_z_d1[19] ? -ray_slope_z_d1 : ray_slope_z_d1;
    wire signed [39:0] div_edge_x = ray_slope_x_d1 ? (edge_x_d1 << 20 + 7) / ray_slope_x_abs : 'hffffffffff;
    wire signed [39:0] div_edge_y = ray_slope_y_d1 ? (edge_y_d1 << 20 + 7) / ray_slope_y_abs : 'hffffffffff;
    wire signed [39:0] div_edge_z = ray_slope_z_d1 ? (edge_z_d1 << 20 + 7) / ray_slope_z_abs : 'hffffffffff;
    reg [19:0] div_edge_x_d2 = 'b0;
    reg [19:0] div_edge_y_d2 = 'b0;
    reg [19:0] div_edge_z_d2 = 'b0;
    // last
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ray_slope_x_d2 <= 'b0;
            ray_slope_y_d2 <= 'b0;
            ray_slope_z_d2 <= 'b0;
            // ray_slope_x_pn_d2 <= 'b0;
            // ray_slope_y_pn_d2 <= 'b0;
            // ray_slope_z_pn_d2 <= 'b0;
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
        min = div_edge_x[39:20];
        min_flag_d2 = 3'b100;
        if (div_edge_y[39:20] < min) begin
            min = div_edge_y[39:20];
            min_flag_d2 = 3'b010;
        end
        if (div_edge_z[39:20] < min) begin
            min = div_edge_z[39:20];
            min_flag_d2 = 3'b001;
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            div_edge_x_d2 <= 'b0;
            div_edge_y_d2 <= 'b0;
            div_edge_z_d2 <= 'b0;
        end else begin
            div_edge_x_d2 <= div_edge_x[39:20];
            div_edge_y_d2 <= div_edge_y[39:20];
            div_edge_z_d2 <= div_edge_z[39:20];
        end
    end



    // Step 3
    reg [19:0] pixel_addr_d3 = 'b0;
    reg signed [19:0] ray_slope_x_d3 = 'b0;
    reg signed [19:0] ray_slope_y_d3 = 'b0;
    reg signed [19:0] ray_slope_z_d3 = 'b0;
    reg [15:0] start_pos_x_d3 = 'b0;
    reg [15:0] start_pos_y_d3 = 'b0;
    reg [15:0] start_pos_z_d3 = 'b0;
    reg [3:0] block_cnt_d3 = 'b0;
    reg [2:0] min_flag_d3 = 'b0;  // x, y, z

    reg [4:0] block_next_x_d3 = 'b0;
    reg [4:0] block_next_y_d3 = 'b0;
    reg [4:0] block_next_z_d3 = 'b0;
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
        end
    end
    // next
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            block_next_x_d3 <= 'b0;
            block_next_y_d3 <= 'b0;
            block_next_z_d3 <= 'b0;
        end else begin
            block_next_x_d3 <= min_flag_d2[2] ? (ray_slope_x_d2[19] ? block_x_d2 - 'd1 : block_x_d2 + 'd1) : block_x_d2;
            block_next_y_d3 <= min_flag_d2[1] ? (ray_slope_y_d2[19] ? block_y_d2 - 'd1 : block_y_d2 + 'd1) : block_y_d2;
            block_next_z_d3 <= min_flag_d2[0] ? (ray_slope_z_d2[19] ? block_z_d2 - 'd1 : block_z_d2 + 'd1) : block_z_d2;
        end
    end



    // Step4
    reg [2:0] face_d4 = 'b0;
    reg [19:0] pixel_addr_d4 = 'b0;
    reg signed [19:0] ray_slope_x_d4 = 'b0;
    reg signed [19:0] ray_slope_y_d4 = 'b0;
    reg signed [19:0] ray_slope_z_d4 = 'b0;
    reg [3:0] block_cnt_d4 = 'b0;
    reg [2:0] min_flag_d4 = 'b0;  // x, y, z
    reg [15:0] end_pos_x_d4 = 'b0;
    reg [15:0] end_pos_y_d4 = 'b0;
    reg [15:0] end_pos_z_d4 = 'b0;
    wire signed [39:0] detal_xy = ray_slope_x_d3 * div_edge_y;
    wire signed [39:0] detal_xz = ray_slope_x_d3 * div_edge_z;
    wire signed [39:0] detal_yz = ray_slope_y_d3 * div_edge_z;
    wire signed [39:0] detal_yx = ray_slope_y_d3 * div_edge_x;
    wire signed [39:0] detal_zx = ray_slope_z_d3 * div_edge_x;
    wire signed [39:0] detal_zy = ray_slope_z_d3 * div_edge_y;
    reg map_border_flag_d4;
    reg [14:0] block_addr_d4;
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
            block_addr_d4      <= 'b0;
            map_border_flag_d4 <= 'b0;
            end_pos_x_d4       <= 'b0;
            end_pos_y_d4       <= 'b0;
            end_pos_z_d4       <= 'b0;
        end else begin
            face_d4 <= min_flag_d4[0] ? (ray_slope_x ? 3'd0 : 3'd1) :  // X
                       min_flag_d4[1] ? (ray_slope_y ? 3'd2 : 3'd3) :  // Y
                       min_flag_d4[2] ? (ray_slope_z ? 3'd4 : 3'd5) :  // Z
                       3'd0;  // 默认值
            block_addr_d4 <= (block_next_x_d3 << 10) + (block_next_y_d3 << 5) + block_next_z_d3;  // block_next_x * 32 * 32 + block_next_y * 32 + block_next_z;
            map_border_flag_d4 <= (block_next_x_d3 == 0) || (block_next_x_d3 == 32) || (block_next_y_d3 == 0) || (block_next_y_d3 == 32) ||
                                    (block_next_z_d3 == 0) || (block_next_z_d3 == 32);
            end_pos_x_d4 <= min_flag_d3[2] ? (block_next_x_d3 << 11) :  // 4 + 7
                                (min_flag_d3[1] ? start_pos_x_d3 + detal_xy[39:20] : start_pos_x_d3 + detal_xz[39:20]);
            end_pos_y_d4 <= min_flag_d3[1] ? (block_next_y_d3 << 11) :  // 4 + 7
                                (min_flag_d3[0] ? start_pos_y_d3 + detal_yz[39:20] : start_pos_y_d3 + detal_yx[39:20]);
            end_pos_z_d4 <= min_flag_d3[0] ? (block_next_z_d3 << 11) :  // 4 + 7
                                (min_flag_d3[2] ? start_pos_z_d3 + detal_zx[39:20] : start_pos_z_d3 + detal_zy[39:20]);
        end
    end



    // Step5
    reg [19:0] pixel_addr_d5 = 'b0;
    reg signed [19:0] ray_slope_x_d5 = 'b0;
    reg signed [19:0] ray_slope_y_d5 = 'b0;
    reg signed [19:0] ray_slope_z_d5 = 'b0;
    reg        [15:0] end_pos_x_d5 = 'b0;
    reg        [15:0] end_pos_y_d5 = 'b0;
    reg        [15:0] end_pos_z_d5 = 'b0;
    reg [3:0] block_cnt_d5 = 'b0;
    reg [3:0] texture_x_d5 = 'b0;
    reg [3:0] texture_y_d5 = 'b0;
    reg map_border_flag_d5;
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
        end else begin
            texture_x_d5 <= min_flag_d4[2] ? end_pos_y_d4[11:8] : (min_flag_d4[1] ? end_pos_x_d4[11:8] : end_pos_x_d4[11:8]);
            texture_y_d5 <= min_flag_d4[2] ? end_pos_z_d4[11:8] : (min_flag_d4[1] ? end_pos_z_d4[11:8] : end_pos_y_d4[11:8]);
        end
    end



    // Step6
    reg        [19:0] pixel_addr_d6 = 'b0;
    reg signed [19:0] ray_slope_x_d6 = 'b0;
    reg signed [19:0] ray_slope_y_d6 = 'b0;
    reg signed [19:0] ray_slope_z_d6 = 'b0;
    reg        [15:0] end_pos_x_d6 = 'b0;
    reg        [15:0] end_pos_y_d6 = 'b0;
    reg        [15:0] end_pos_z_d6 = 'b0;
    reg        [ 3:0] block_cnt_d6 = 'b0;
    reg               map_border_flag_d6 = 'b0;
    // last
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ray_slope_x_d6 <= 'b0;
            ray_slope_y_d6 <= 'b0;
            ray_slope_z_d6 <= 'b0;
            pixel_addr_d6 <= 'b0;
            end_pos_x_d6 <= 'b0;
            end_pos_y_d6 <= 'b0;
            end_pos_z_d6 <= 'b0;
            block_cnt_d6 <= 'b0;
            map_border_flag_d6 <= 'b0;
        end else begin
            ray_slope_x_d6 <= ray_slope_x_d5;
            ray_slope_y_d6 <= ray_slope_y_d5;
            ray_slope_z_d6 <= ray_slope_z_d5;
            pixel_addr_d6 <= pixel_addr_d5;
            end_pos_x_d6 <= end_pos_x_d5;
            end_pos_y_d6 <= end_pos_y_d5;
            end_pos_z_d6 <= end_pos_z_d5;
            block_cnt_d6 <= block_cnt_d5;
            map_border_flag_d6 <= map_border_flag_d5;
        end
    end
    // next
    wire [4:0] texture_id;
    projection projection (
        .block_id  (block_id),
        .face      (face_d4),
        .texture_id(texture_id)
    );
    wire [12:0] texture_addr_d6 = texture_x_d5 + (texture_y_d5 << 4) + (texture_id << 8);
    // wire [12:0] texture_addr_d6 = texture_x_d5 + (texture_y_d5 << 4) + (block_id << 8);


    assign pixel_addr_out  = prepare_flag ? 'b0 : pixel_addr_d6;
    assign ray_slope_out_x = prepare_flag ? 'b0 : ray_slope_x_d6;
    assign ray_slope_out_y = prepare_flag ? 'b0 : ray_slope_y_d6;
    assign ray_slope_out_z = prepare_flag ? 'b0 : ray_slope_z_d6;
    assign texture_addr    = prepare_flag ? 'b0 : texture_addr_d6;
    assign end_pos_x       = prepare_flag ? 'b0 : end_pos_x_d6;
    assign end_pos_y       = prepare_flag ? 'b0 : end_pos_y_d6;
    assign end_pos_z       = prepare_flag ? 'b0 : end_pos_z_d6;
    assign block_cnt_out   = prepare_flag ? 'b0 : block_cnt_d6;
    assign next_en         = prepare_flag ? 'b1 : (block_id || map_border_flag_d6 || (block_cnt_d6 > 12));
    // assign next_en         = prepare_flag ? 'b1 : (block_id || map_border_flag_d6);

endmodule
