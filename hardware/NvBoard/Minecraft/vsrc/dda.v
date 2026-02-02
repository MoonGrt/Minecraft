`timescale 1ns / 1ps

module dda #(
    parameter integer N_TRACER = 1
)(
    input  wire clk,
    input  wire rst,

    // ===== pixel / camera input =====
    input  wire [11:0] hdisp,
    input  wire [11:0] vdisp,

    input  wire [15:0] p_pos_x,
    input  wire [15:0] p_pos_y,
    input  wire [15:0] p_pos_z,
    input  wire [15:0] p_cam_x,
    input  wire [15:0] p_cam_y,
    input  wire [15:0] p_cam_z,
    input  wire [15:0] p_vp_x,
    input  wire [15:0] p_vp_y,

    // ===== final hit result =====
    output wire [19:0] out_pixel_addr,
    output wire        hit_valid,
    output wire [12:0] hit_texture
);

    // ============================================================
    // parameters
    // ============================================================
    localparam TR_W  = (N_TRACER <= 1) ? 1 : $clog2(N_TRACER);
    localparam HIT_W = 20 + 13; // pixel_addr + texture

    // ============================================================
    // emitter outputs
    // ============================================================
    wire        e_valid;
    wire        e_ready;

    wire [15:0] e_pos_x, e_pos_y, e_pos_z;
    wire [13:0] e_ray_x, e_ray_y, e_ray_z;
    wire [23:0] e_next_x, e_next_y, e_next_z;
    wire [23:0] e_jump_x, e_jump_y, e_jump_z;
    wire [19:0] e_pixel_addr;

    // ============================================================
    // tracer interface arrays
    // ============================================================
    wire [N_TRACER-1:0] tr_valid;
    wire [N_TRACER-1:0] tr_ready;

    wire [N_TRACER-1:0] tr_hit_valid;
    wire [12:0]         tr_hit_texture [0:N_TRACER-1];
    wire [19:0]         tr_pixel_addr  [0:N_TRACER-1];

    // ============================================================
    // dda_emitter
    // ============================================================
    dda_emitter u_emitter (
        .clk(clk),
        .rst(rst),

        .hdisp(hdisp),
        .vdisp(vdisp),

        .p_pos_x(p_pos_x),
        .p_pos_y(p_pos_y),
        .p_pos_z(p_pos_z),
        .p_cam_x(p_cam_x),
        .p_cam_y(p_cam_y),
        .p_cam_z(p_cam_z),
        .p_vp_x (p_vp_x),
        .p_vp_y (p_vp_y),

        .valid(e_valid),
        .ready(e_ready),

        .pos_x (e_pos_x),
        .pos_y (e_pos_y),
        .pos_z (e_pos_z),
        .ray_x (e_ray_x),
        .ray_y (e_ray_y),
        .ray_z (e_ray_z),
        .next_x(e_next_x),
        .next_y(e_next_y),
        .next_z(e_next_z),
        .jump_x(e_jump_x),
        .jump_y(e_jump_y),
        .jump_z(e_jump_z),
        .pixel_addr(e_pixel_addr)
    );

    // ============================================================
    // Round-robin arbiter (emitter -> tracer)
    // ============================================================
    generate
    if (N_TRACER == 1) begin : GEN_IN_SINGLE
        assign tr_valid[0] = e_valid;
        assign e_ready     = tr_ready[0];
    end else begin : GEN_IN_MULTI

        reg [TR_W-1:0] in_rr_ptr;
        reg [TR_W-1:0] in_grant;
        integer i;

        always @(*) begin
            in_grant = in_rr_ptr;
            for (i = 0; i < N_TRACER; i = i + 1) begin
                if (tr_ready[(in_rr_ptr + i) % N_TRACER]) begin
                    in_grant = (in_rr_ptr + i) % N_TRACER;
                end
            end
        end

        genvar gi;
        for (gi = 0; gi < N_TRACER; gi = gi + 1) begin
            assign tr_valid[gi] = e_valid && (in_grant == gi);
        end

        assign e_ready = tr_ready[in_grant];

        always @(posedge clk) begin
            if (rst)
                in_rr_ptr <= 0;
            else if (e_valid && e_ready)
                in_rr_ptr <= in_grant + 1'b1;
        end
    end
    endgenerate

    // ============================================================
    // tracer instances
    // ============================================================
    wire  [3:0] tr_block_id   [0:N_TRACER-1];
    wire [14:0] tr_block_addr [0:N_TRACER-1];
    generate
    genvar ti;
    for (ti = 0; ti < N_TRACER; ti = ti + 1) begin : TRACERS
        dda_tracer u_tracer (
            .clk(clk),
            .rst(rst),

            .valid(tr_valid[ti]),
            .ready(tr_ready[ti]),

            .in_pos_x (e_pos_x),
            .in_pos_y (e_pos_y),
            .in_pos_z (e_pos_z),
            .in_ray_x (e_ray_x),
            .in_ray_y (e_ray_y),
            .in_ray_z (e_ray_z),
            .in_next_x(e_next_x),
            .in_next_y(e_next_y),
            .in_next_z(e_next_z),
            .in_jump_x(e_jump_x),
            .in_jump_y(e_jump_y),
            .in_jump_z(e_jump_z),

            .block_id  (tr_block_id[ti]),
            .block_addr(tr_block_addr[ti]),

            .hit_valid  (tr_hit_valid[ti]),
            .hit_texture(tr_hit_texture[ti]),
            .in_pixel_addr (e_pixel_addr),
            .out_pixel_addr(tr_pixel_addr[ti])
        );
    

        DPRAM #(
            .INIT_FILE("./vsrc/map.bin"),
            .DP       (32768),
            .DW       (4),
            .AW       ($clog2(32768))
        ) map_ram (
            .clka (clk),
            .rsta (rst),
            .cea  ('b1),
            .wra  ('b0),
            .addra('b0),
            .dina ('b0),
            .douta(),
            .clkb (clk),
            .rstb (rst),
            .ceb  ('b1),
            .wrb  ('b0),
            .addrb(tr_block_addr[ti]),
            .dinb (),
            .doutb(tr_block_id[ti])
        );
    end
    endgenerate

    // ============================================================
    // hit FIFOs (one per tracer)
    // ============================================================
    wire [N_TRACER-1:0] fifo_empty;
    wire [N_TRACER-1:0] fifo_dataval;
    wire [N_TRACER-1:0] fifo_rd_en;

    wire [HIT_W-1:0] fifo_wr_data [0:N_TRACER-1];
    wire [HIT_W-1:0] fifo_rd_data [0:N_TRACER-1];

    generate
    for (ti = 0; ti < N_TRACER; ti = ti + 1) begin : HIT_FIFO
        assign fifo_wr_data[ti] = {
            tr_pixel_addr[ti],
            tr_hit_texture[ti]
        };

        FIFO #(
            .FIFO_MODE ("Normal"),
            .DATA_WIDTH(HIT_W),
            .FIFO_DEPTH(32)
        ) FIFO (
            .Reset   ( rst ),

            .WrClk   ( clk ),
            .WrEn    ( tr_hit_valid[ti] ),
            .WrDNum  ( ),
            .WrFull  ( ),
            .WrData  ( fifo_wr_data[ti] ),

            .RdClk   ( clk ),
            .RdEn    ( fifo_rd_en[ti] ),
            .RdDNum  ( ),
            .RdEmpty ( fifo_empty[ti] ),
            .DataVal ( fifo_dataval[ti] ),
            .RdData  ( fifo_rd_data[ti] )
        );
    end
    endgenerate

    // ============================================================
    // output RR arbiter (based on FIFO empty)
    // ============================================================
    generate
    if (N_TRACER == 1) begin : GEN_OUT_SINGLE
        assign fifo_rd_en[0] = ~fifo_empty[0];
        assign hit_valid   = fifo_dataval[0];
        assign hit_texture = fifo_rd_data[0][12:0];
        assign out_pixel_addr = fifo_rd_data[0][32:13];
    end else begin : GEN_OUT_MULTI
        reg [TR_W-1:0] out_rr_ptr;
        reg [TR_W-1:0] out_grant, out_grant_d;
        integer j;

        always @(*) begin
            out_grant = out_rr_ptr;
            for (j = 0; j < N_TRACER; j = j + 1) begin
                if (!fifo_empty[(out_rr_ptr + j) % N_TRACER]) begin
                    out_grant = (out_rr_ptr + j) % N_TRACER;
                end
            end
        end

        genvar oj;
        for (oj = 0; oj < N_TRACER; oj = oj + 1) begin
            assign fifo_rd_en[oj] =
                (oj == out_grant) && !fifo_empty[oj];
        end

        always @(posedge clk) out_grant_d <= out_grant;
        assign hit_valid   = fifo_dataval[out_grant_d];
        assign hit_texture = fifo_rd_data[out_grant_d][12:0];
        assign out_pixel_addr = fifo_rd_data[out_grant_d][32:13];

        always @(posedge clk) begin
            if (rst)
                out_rr_ptr <= 0;
            else if (hit_valid)
                out_rr_ptr <= out_grant + 1'b1;
        end
    end
    endgenerate

endmodule
