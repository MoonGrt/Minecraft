`timescale 1ns / 1ps

module dda_tracer (
    input  wire clk,
    input  wire rst,

    // ===== from dda_emitter =====
    input  wire valid,
    output wire ready,

    input  wire [15:0] pos_x,
    input  wire [15:0] pos_y,
    input  wire [15:0] pos_z,
    input  wire [13:0] ray_x,
    input  wire [13:0] ray_y,
    input  wire [13:0] ray_z,
    input  wire [23:0] next_x,
    input  wire [23:0] next_y,
    input  wire [23:0] next_z,
    input  wire [23:0] jump_x,
    input  wire [23:0] jump_y,
    input  wire [23:0] jump_z,

    // ===== block access =====
    output wire [14:0] block_addr,
    input  wire [ 3:0] block_id,

    // ===== hit output =====
    output reg         hit_valid,
    output wire [12:0] hit_texture
);

    // ================= FSM =================
    localparam S_IDLE = 3'd0;
    localparam S_STEP = 3'd1;
    localparam S_REQ  = 3'd2;
    localparam S_WAIT = 3'd3;
    localparam S_HIT  = 3'd4;

    reg [2:0] state;
    assign ready = (state == S_IDLE);

    // ================= DDA signal =================
    reg [ 4:0] bx, by, bz;
    reg [23:0] tMaxX, tMaxY, tMaxZ;
    reg [23:0] tDeltaX, tDeltaY, tDeltaZ;
    reg [31:0] tHit;
    reg [ 1:0] axis;
    reg        dir;
    reg  [1:0] hit_axis;
    reg        hit_dir;
    reg  [3:0] hit_u;
    reg  [3:0] hit_v;
    reg  [7:0] step_cnt;

    parameter MAP_X = 32;
    parameter MAP_Y = 32;
    parameter MAP_Z = 32;
    wire out_of_bounds = (bx >= MAP_X) || (by >= MAP_Y) || (bz >= MAP_Z);
    assign block_addr = {bx, by, bz};
    // ================= main FSM =================
    always @(posedge clk) begin
        if (rst) begin
            state     <= S_IDLE;
            hit_valid <= 'b0;
            step_cnt  <= 'b0;
        end else begin
            hit_valid <= 'b0;
            case (state)
                // ---------- IDLE ----------
                S_IDLE: begin
                    step_cnt <= 'b0;
                    if (valid) begin
                        bx <= pos_x[15:11];
                        by <= pos_y[15:11];
                        bz <= pos_z[15:11];
                        tMaxX <= next_x;
                        tMaxY <= next_y;
                        tMaxZ <= next_z;
                        tDeltaX <= jump_x;
                        tDeltaY <= jump_y;
                        tDeltaZ <= jump_z;
                        state <= S_STEP;
                    end
                end
                // ---------- STEP ----------
                S_STEP: begin
                    if (tMaxX <= tMaxY && tMaxX <= tMaxZ) begin
                        axis  <= 2'd1;
                        dir   <= ~ray_x[13];
                        tHit  <= tMaxX;
                        bx    <= ray_x[13] ? bx - 'b1 : bx + 'b1;
                        tMaxX <= tMaxX + tDeltaX;
                    end else if (tMaxY <= tMaxZ) begin
                        axis  <= 2'd2;
                        dir   <= ~ray_y[13];
                        tHit  <= tMaxY;
                        by    <= ray_y[13] ? by - 'b1 : by + 'b1;
                        tMaxY <= tMaxY + tDeltaY;
                    end else begin
                        axis  <= 2'd3;
                        dir   <= ~ray_z[13];
                        tHit  <= tMaxZ;
                        bz    <= ray_z[13] ? bz - 'b1 : bz + 'b1;
                        tMaxZ <= tMaxZ + tDeltaZ;
                    end
                    state <= S_REQ;
                end
                // ---------- REQUEST BLOCK ----------
                S_REQ: begin
                    if (out_of_bounds) begin  // 越界：当作 miss，直接结束
                        state <= S_IDLE;
                        hit_valid <= 1'b1;
                    end
                    else state <= S_WAIT;
                end
                // ---------- WAIT BLOCK ----------
                S_WAIT: begin
                    if (block_id != 4'd0) begin
                        state <= S_HIT;
                    end else if (step_cnt > 8'd52) begin
                        state <= S_IDLE;
                        hit_valid <= 1'b1;
                    end else begin
                        state <= S_STEP;
                        step_cnt <= step_cnt + 'b1;
                    end
                end
                // ---------- HIT ----------
                S_HIT: begin
                    hit_valid <= 1'b1;
                    hit_axis  <= axis;
                    hit_dir   <= dir;
                    case (axis)
                    2'd1: begin // X face → YZ
                        hit_u <= (pos_y + $signed(($signed(ray_y) * $signed(tHit)) >>> 18)) >> 7;
                        hit_v <= (pos_z + $signed(($signed(ray_z) * $signed(tHit)) >>> 18)) >> 7;
                    end
                    2'd2: begin // Y face → XZ
                        hit_u <= (pos_x + $signed(($signed(ray_x) * $signed(tHit)) >>> 18)) >> 7;
                        hit_v <= (pos_z + $signed(($signed(ray_z) * $signed(tHit)) >>> 18)) >> 7;
                    end
                    2'd3: begin // Z face → XY
                        hit_u <= (pos_x + $signed(($signed(ray_x) * $signed(tHit)) >>> 18)) >> 7;
                        hit_v <= (pos_y + $signed(($signed(ray_y) * $signed(tHit)) >>> 18)) >> 7;
                    end
                    default: begin
                        hit_u <= 'b0;
                        hit_v <= 'b0;
                    end
                    endcase
                    state <= S_IDLE;
                end
                default: state <= S_IDLE;
            endcase
        end
    end

    // ============================================================
    // texture index mapping
    // ============================================================
    wire [2:0] face =
        (hit_axis == 2'd0) ? (hit_dir ? 3'd3 : 3'd2) :  // X
        (hit_axis == 2'd1) ? (hit_dir ? 3'd4 : 3'd1) :  // Y
        (hit_axis == 2'd2) ? (hit_dir ? 3'd5 : 3'd0) :  // Z
        3'd0;
    wire [6:0] face_idx = hit_valid ? (block_id - 1) * 6 + face : 'b0;
    // ROM: face -> texture id
    reg [4:0] face_idx_mem [0:16*6-1];
    initial $readmemb("./vsrc/txtidx.bin", face_idx_mem);
    wire [5:0] texture_id = face_idx_mem[face_idx];

    // ============================================================
    // final texture address
    // ============================================================
    assign hit_texture = {texture_id, hit_v, hit_u};

endmodule
