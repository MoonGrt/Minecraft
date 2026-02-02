`timescale 1ns / 1ps

`define PIPELINE

module dda_tracer (
    input  wire clk,
    input  wire rst,

    // ===== from dda_emitter =====
    input  wire valid,
    output wire ready,

    input  wire [15:0] in_pos_x,
    input  wire [15:0] in_pos_y,
    input  wire [15:0] in_pos_z,
    input  wire [13:0] in_ray_x,
    input  wire [13:0] in_ray_y,
    input  wire [13:0] in_ray_z,
    input  wire [23:0] in_next_x,
    input  wire [23:0] in_next_y,
    input  wire [23:0] in_next_z,
    input  wire [23:0] in_jump_x,
    input  wire [23:0] in_jump_y,
    input  wire [23:0] in_jump_z,

    // ===== block access =====
    input  wire [ 3:0] block_id,
    output wire [14:0] block_addr,

    // ===== hit output =====
    output wire        hit_valid,
    output wire [12:0] hit_texture,

    // ===== pixel addr =====
    input  wire [19:0] in_pixel_addr,
    output wire [19:0] out_pixel_addr
);

`ifndef PIPELINE

    // ============================================================
    // FSM State
    // ============================================================
    localparam S_IDLE  = 3'd0;
    localparam S_STEP  = 3'd1;
    localparam S_REQ   = 3'd2;
    localparam S_CHECK = 3'd3;
    localparam S_HIT   = 3'd4;
    reg [2:0] state;

    // ============================================================
    // DDA signal
    // ============================================================
    reg  [4:0] bx, by, bz;
    reg [23:0] pos_x, pos_y, pos_z;
    reg [23:0] ray_x, ray_y, ray_z;
    reg [23:0] next_x, next_y, next_z;
    reg [23:0] jump_x, jump_y, jump_z;
    reg [31:0] hit;
    reg  [4:0] axis;  // 1-bit for dir; 3bit for x,y,z axis
    reg  [3:0] hit_u, hit_v;
    reg  [7:0] step_cnt;

    parameter MAP_X = 32;
    parameter MAP_Y = 32;
    parameter MAP_Z = 32;
    parameter MAX_STEP = 54;
    wire out_of_bounds = (bx >= MAP_X) || (by >= MAP_Y) || (bz >= MAP_Z);
    wire too_many_steps = (step_cnt >= MAX_STEP);

    // ============================================================
    // Main FSM
    // ============================================================
    always @(posedge clk) begin
        if (rst) begin
            state    <= S_IDLE;
            step_cnt <= 'b0;
        end else begin
            case (state)
                // ---------- IDLE ----------
                S_IDLE: begin
                    step_cnt <= 'b0;
                    if (valid) begin
                        bx <= in_pos_x[15:11];
                        by <= in_pos_y[15:11];
                        bz <= in_pos_z[15:11];
                        ray_x <= in_ray_x;
                        ray_y <= in_ray_y;
                        ray_z <= in_ray_z;
                        pos_x <= in_pos_x;
                        pos_y <= in_pos_y;
                        pos_z <= in_pos_z;
                        next_x <= in_next_x;
                        next_y <= in_next_y;
                        next_z <= in_next_z;
                        jump_x <= in_jump_x;
                        jump_y <= in_jump_y;
                        jump_z <= in_jump_z;
                        state <= S_STEP;
                    end
                end
                // ---------- STEP ----------
                S_STEP: begin
                    if (next_x <= next_y && next_x <= next_z) begin
                        axis   <= {~ray_x[13], 3'b100};
                        bx     <= ~ray_x[13] ? bx + 'b1 : bx - 'b1;
                        hit    <= next_x;
                        next_x <= next_x + jump_x;
                    end else if (next_y <= next_z) begin
                        axis   <= {~ray_y[13], 3'b010};
                        by     <= ~ray_y[13] ? by + 'b1 : by - 'b1;
                        hit    <= next_y;
                        next_y <= next_y + jump_y;
                    end else begin
                        axis   <= {~ray_z[13], 3'b001};
                        bz     <= ~ray_z[13] ? bz + 'b1 : bz - 'b1;
                        hit    <= next_z;
                        next_z <= next_z + jump_z;
                    end
                    state <= S_REQ;
                end
                // ---------- REQUEST BLOCK ----------
                S_REQ: begin
                    if (out_of_bounds) state <= S_IDLE;  // 越界：当作 miss，直接结束
                    else state <= S_CHECK;
                end
                // ---------- CHECK BLOCK ----------
                S_CHECK: begin
                    step_cnt <= step_cnt + 'b1;
                    if (block_id != 4'd0) state <= S_HIT;
                    else if (too_many_steps) state <= S_IDLE;
                    else state <= S_STEP;
                end
                // ---------- HIT ----------
                S_HIT: begin
                    state <= S_IDLE;
                    case (axis)
                        3'b100: begin  // X face → YZ
                            hit_u <= (pos_y + ($signed(ray_y * hit) >>> 18)) >> 7;
                            hit_v <= (pos_z + ($signed(ray_z * hit) >>> 18)) >> 7;
                        end
                        3'b010: begin  // Y face → XZ
                            hit_u <= (pos_x + ($signed(ray_x * hit) >>> 18)) >> 7;
                            hit_v <= (pos_z + ($signed(ray_z * hit) >>> 18)) >> 7;
                        end
                        3'b001: begin  // Z face → XY
                            hit_u <= (pos_x + ($signed(ray_x * hit) >>> 18)) >> 7;
                            hit_v <= (pos_y + ($signed(ray_y * hit) >>> 18)) >> 7;
                        end
                        default: begin
                            hit_u <= 'b0;
                            hit_v <= 'b0;
                        end
                    endcase
                end
                default: state <= S_IDLE;
            endcase
        end
    end

    // ============================================================
    // texture index mapping
    // ============================================================
    wire [2:0] face =
        axis[2] ? (axis[3] ? 3'd3 : 3'd2) :  // X
        axis[1] ? (axis[3] ? 3'd4 : 3'd1) :  // Y
        axis[0] ? (axis[3] ? 3'd5 : 3'd0) :  // Z
        3'd0;
    wire [6:0] face_idx = (state == S_HIT) ? (block_id - 1) * 6 + face : 'b0;
    // ROM: face -> texture id
    reg [4:0] face_idx_mem [0:16*6-1];
    // initial $readmemh("G:/VM/share/Minecraft/scripts/res/output/txt_idx.hex", face_idx_mem);
    initial $readmemb("./vsrc/txtidx.bin", face_idx_mem);
    wire [4:0] texture_id = face_idx_mem[face_idx];

    // ============================================================
    // final texture address
    // ============================================================
    assign out_pixel_addr = in_pixel_addr;
    assign ready = (state == S_IDLE);
    assign block_addr = {bx, by, bz};
    assign hit_texture = {texture_id, hit_v, hit_u};
    assign hit_valid = (state == S_HIT) || out_of_bounds || too_many_steps;

`else

    // ============================================================
    // parameters
    // ============================================================
    parameter MAP_X = 32;
    parameter MAP_Y = 32;
    parameter MAP_Z = 32;
    parameter MAX_STEP = 54;

    // ============================================================
    // Token definition (manual flatten)
    // ============================================================

    // ---------- Stage 0 ----------
    reg        vld_s0;
    reg  [4:0] bx_s0, by_s0, bz_s0;
    reg [23:0] pos_x_s0, pos_y_s0, pos_z_s0;
    reg [13:0] ray_x_s0, ray_y_s0, ray_z_s0;
    reg [23:0] next_x_s0, next_y_s0, next_z_s0;
    reg [23:0] jump_x_s0, jump_y_s0, jump_z_s0;
    reg  [7:0] step_cnt_s0;

    // ---------- Stage 1 ----------
    reg        vld_s1;
    reg  [2:0] sel_axis_s1;
    reg  [4:0] bx_s1, by_s1, bz_s1;
    reg [23:0] pos_x_s1, pos_y_s1, pos_z_s1;
    reg [13:0] ray_x_s1, ray_y_s1, ray_z_s1;
    reg [23:0] next_x_s1, next_y_s1, next_z_s1;
    reg [23:0] jump_x_s1, jump_y_s1, jump_z_s1;
    reg  [7:0] step_cnt_s1;

    // ---------- Stage 2 ----------
    reg        vld_s2;
    reg  [4:0] bx_s2, by_s2, bz_s2;
    reg [23:0] pos_x_s2, pos_y_s2, pos_z_s2;
    reg [13:0] ray_x_s2, ray_y_s2, ray_z_s2;
    reg [23:0] next_x_s2, next_y_s2, next_z_s2;
    reg [23:0] jump_x_s2, jump_y_s2, jump_z_s2;
    reg  [4:0] axis_s2;
    reg [31:0] hit_s2;
    reg  [7:0] step_cnt_s2;

    // ---------- Stage 3 ----------
    reg        vld_s3;
    reg  [4:0] bx_s3, by_s3, bz_s3;
    reg [23:0] pos_x_s3, pos_y_s3, pos_z_s3;
    reg [13:0] ray_x_s3, ray_y_s3, ray_z_s3;
    reg [23:0] next_x_s3, next_y_s3, next_z_s3;
    reg [23:0] jump_x_s3, jump_y_s3, jump_z_s3;
    reg  [4:0] axis_s3;
    reg [31:0] hit_s3;
    reg  [7:0] step_cnt_s3;

`ifdef PIPELINE
    // ---------- pixel addr----------
    reg [19:0] pixel_addr_s0;
    reg [19:0] pixel_addr_s1;
    reg [19:0] pixel_addr_s2;
    reg [19:0] pixel_addr_s3;
`endif

    // ============================================================
    // FEEDBACK wires
    // ============================================================
    wire fb_valid;
    wire feed_from_input = valid;
    wire feed_from_fb = fb_valid;
    wire feed_en = feed_from_input || feed_from_fb;

    // ============================================================
    // Stage 0 : FEED
    // ============================================================
    assign ready = ~fb_valid;
    always @(posedge clk) begin
        if (rst) begin
            vld_s0 <= 1'b0;
        end else begin
            vld_s0 <= feed_en;
            if (feed_from_fb) begin
                bx_s0 <= bx_s3;
                by_s0 <= by_s3;
                bz_s0 <= bz_s3;
                pos_x_s0 <= pos_x_s3;
                pos_y_s0 <= pos_y_s3;
                pos_z_s0 <= pos_z_s3;
                ray_x_s0 <= ray_x_s3;
                ray_y_s0 <= ray_y_s3;
                ray_z_s0 <= ray_z_s3;
                next_x_s0 <= next_x_s3;
                next_y_s0 <= next_y_s3;
                next_z_s0 <= next_z_s3;
                jump_x_s0 <= jump_x_s3;
                jump_y_s0 <= jump_y_s3;
                jump_z_s0 <= jump_z_s3;
                step_cnt_s0 <= step_cnt_s3;
            end else if (feed_from_input) begin
                bx_s0 <= in_pos_x[15:11];
                by_s0 <= in_pos_y[15:11];
                bz_s0 <= in_pos_z[15:11];
                pos_x_s0 <= in_pos_x;
                pos_y_s0 <= in_pos_y;
                pos_z_s0 <= in_pos_z;
                ray_x_s0 <= in_ray_x;
                ray_y_s0 <= in_ray_y;
                ray_z_s0 <= in_ray_z;
                next_x_s0 <= in_next_x;
                next_y_s0 <= in_next_y;
                next_z_s0 <= in_next_z;
                jump_x_s0 <= in_jump_x;
                jump_y_s0 <= in_jump_y;
                jump_z_s0 <= in_jump_z;
                step_cnt_s0 <= 0;
            end
        end
    end

    // ============================================================
    // Stage 1 : STEP_CMP
    // ============================================================
    always @(posedge clk) begin
        vld_s1 <= vld_s0;
        bx_s1 <= bx_s0;
        by_s1 <= by_s0;
        bz_s1 <= bz_s0;
        pos_x_s1 <= pos_x_s0;
        pos_y_s1 <= pos_y_s0;
        pos_z_s1 <= pos_z_s0;
        ray_x_s1 <= ray_x_s0;
        ray_y_s1 <= ray_y_s0;
        ray_z_s1 <= ray_z_s0;
        next_x_s1 <= next_x_s0;
        next_y_s1 <= next_y_s0;
        next_z_s1 <= next_z_s0;
        jump_x_s1 <= jump_x_s0;
        jump_y_s1 <= jump_y_s0;
        jump_z_s1 <= jump_z_s0;
        step_cnt_s1 <= step_cnt_s0;

        if (vld_s0) begin
            if (next_x_s0 <= next_y_s0 && next_x_s0 <= next_z_s0)
                sel_axis_s1 <= 3'b100;
            else if (next_y_s0 <= next_z_s0)
                sel_axis_s1 <= 3'b010;
            else
                sel_axis_s1 <= 3'b001;
        end
    end

    // ============================================================
    // Stage 2 : STEP_UPDATE
    // ============================================================
    assign block_addr = {bx_s2, by_s2, bz_s2};
    always @(posedge clk) begin
        vld_s2 <= vld_s1;
        bx_s2 <= bx_s1;
        by_s2 <= by_s1;
        bz_s2 <= bz_s1;
        pos_x_s2 <= pos_x_s1;
        pos_y_s2 <= pos_y_s1;
        pos_z_s2 <= pos_z_s1;
        ray_x_s2 <= ray_x_s1;
        ray_y_s2 <= ray_y_s1;
        ray_z_s2 <= ray_z_s1;
        next_x_s2 <= next_x_s1;
        next_y_s2 <= next_y_s1;
        next_z_s2 <= next_z_s1;
        jump_x_s2 <= jump_x_s1;
        jump_y_s2 <= jump_y_s1;
        jump_z_s2 <= jump_z_s1;
        step_cnt_s2 <= step_cnt_s1;

        if (vld_s1) begin
            case (sel_axis_s1)
                3'b100: begin
                    axis_s2 <= {~ray_x_s1[13], sel_axis_s1};
                    hit_s2 <= next_x_s1;
                    next_x_s2 <= next_x_s1 + jump_x_s1;
                    bx_s2 <= ~ray_x_s1[13] ? bx_s1 + 1 : bx_s1 - 1;
                end
                3'b010: begin
                    axis_s2 <= {~ray_y_s1[13], sel_axis_s1};
                    hit_s2 <= next_y_s1;
                    next_y_s2 <= next_y_s1 + jump_y_s1;
                    by_s2 <= ~ray_y_s1[13] ? by_s1 + 1 : by_s1 - 1;
                end
                3'b001: begin
                    axis_s2 <= {~ray_z_s1[13], sel_axis_s1};
                    hit_s2 <= next_z_s1;
                    next_z_s2 <= next_z_s1 + jump_z_s1;
                    bz_s2 <= ~ray_z_s1[13] ? bz_s1 + 1 : bz_s1 - 1;
                end
                default: begin
                    axis_s2 <= 'b0;
                    hit_s2 <= 'b0;
                    next_z_s2 <= 'b0;
                    bz_s2 <= 'b0;
                end
            endcase
        end
    end

    // ============================================================
    // Stage 3 : CHECK
    // ============================================================
    wire out_of_bounds = (bx_s2 >= MAP_X) || (by_s2 >= MAP_Y) || (bz_s2 >= MAP_Z);
    wire hit_fire = vld_s3 && (block_id != 0);
    assign fb_valid = vld_s3 && (block_id == 0) && ~out_of_bounds && (step_cnt_s3 < MAX_STEP);

    always @(posedge clk) begin
        vld_s3 <= vld_s2;
        bx_s3 <= bx_s2;
        by_s3 <= by_s2;
        bz_s3 <= bz_s2;
        pos_x_s3 <= pos_x_s2;
        pos_y_s3 <= pos_y_s2;
        pos_z_s3 <= pos_z_s2;
        ray_x_s3 <= ray_x_s2;
        ray_y_s3 <= ray_y_s2;
        ray_z_s3 <= ray_z_s2;
        next_x_s3 <= next_x_s2;
        next_y_s3 <= next_y_s2;
        next_z_s3 <= next_z_s2;
        jump_x_s3 <= jump_x_s2;
        jump_y_s3 <= jump_y_s2;
        jump_z_s3 <= jump_z_s2;
        axis_s3 <= axis_s2;
        hit_s3 <= hit_s2;
        step_cnt_s3 <= step_cnt_s2 + 1;
    end

    // ============================================================
    // texture mapping (same as original)
    // ============================================================
    wire [2:0] face =
        axis_s3[2] ? (axis_s3[3] ? 3'd3 : 3'd2) :
        axis_s3[1] ? (axis_s3[3] ? 3'd4 : 3'd1) :
        axis_s3[0] ? (axis_s3[3] ? 3'd5 : 3'd0) :
        3'd0;
    wire [6:0] face_idx = hit_fire ? (block_id - 1) * 6 + face : 0;
    reg [4:0] face_idx_mem [0:16*6-1];
    initial $readmemb("./vsrc/txtidx.bin", face_idx_mem);
    wire [4:0] texture_id = face_idx_mem[face_idx];

    // ============================================================
    // hit uv
    // ============================================================
    reg [3:0] hit_u, hit_v;
    always @(*) begin
        hit_u = 0;
        hit_v = 0;
        case (axis_s3[2:0])
            3'b100: begin
                hit_u = (pos_y_s3 + ($signed(ray_y_s3 * hit_s3) >>> 18)) >> 7;
                hit_v = (pos_z_s3 + ($signed(ray_z_s3 * hit_s3) >>> 18)) >> 7;
            end
            3'b010: begin
                hit_u = (pos_x_s3 + ($signed(ray_x_s3 * hit_s3) >>> 18)) >> 7;
                hit_v = (pos_z_s3 + ($signed(ray_z_s3 * hit_s3) >>> 18)) >> 7;
            end
            3'b001: begin
                hit_u = (pos_x_s3 + ($signed(ray_x_s3 * hit_s3) >>> 18)) >> 7;
                hit_v = (pos_y_s3 + ($signed(ray_y_s3 * hit_s3) >>> 18)) >> 7;
            end
            default: begin
                hit_u = 'b0;
                hit_v = 'b0;
            end
        endcase
    end

    assign hit_texture = {texture_id, hit_v, hit_u};
    assign hit_valid = hit_fire || out_of_bounds || (step_cnt_s3 >= MAX_STEP);


`ifdef PIPELINE
    // ---------- pixel addr----------
    assign out_pixel_addr = pixel_addr_s3;
    always @(posedge clk) begin
        if (feed_from_fb) pixel_addr_s0 <= pixel_addr_s3;
        else if (feed_from_input) pixel_addr_s0 <= in_pixel_addr;
        pixel_addr_s1 <= pixel_addr_s0;
        pixel_addr_s2 <= pixel_addr_s1;
        pixel_addr_s3 <= pixel_addr_s2;
    end
`endif

`endif

endmodule
