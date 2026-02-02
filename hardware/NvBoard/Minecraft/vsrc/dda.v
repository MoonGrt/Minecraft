`timescale 1ns / 1ps

module dda #(
    parameter integer N_TRACER = 4
)(
    input  wire clk,
    input  wire rst,

    // ===== pixel / camera input =====
    input  wire [11:0] hdisp, vdisp,
    input  wire [15:0] p_pos_x, p_pos_y, p_pos_z,
    input  wire [15:0] p_cam_x, p_cam_y, p_cam_z,
    input  wire [15:0] p_vp_x,  p_vp_y,

    // ===== final hit result =====
    output wire        hit_valid,
    output wire [19:0] hit_paddr,
    output wire [12:0] hit_texture
);

    // ============================================================
    // parameters
    // ============================================================
    localparam TR_W  = (N_TRACER <= 1) ? 1 : $clog2(N_TRACER);
    localparam HIT_W = 20 + 13; // paddr + texture

    // ============================================================
    // emitter outputs
    // ============================================================
    wire        e_valid;
    wire        e_ready;

    wire [15:0] e_pos_x, e_pos_y, e_pos_z;
    wire [13:0] e_ray_x, e_ray_y, e_ray_z;
    wire [23:0] e_next_x, e_next_y, e_next_z;
    wire [23:0] e_jump_x, e_jump_y, e_jump_z;
    wire [19:0] e_paddr;

    // ============================================================
    // tracer interface arrays
    // ============================================================
    wire [N_TRACER-1:0] tr_valid;
    wire [N_TRACER-1:0] tr_ready;
    wire [N_TRACER-1:0] tr_hit_valid;

    wire [12:0] tr_hit_texture [0:N_TRACER-1];
    wire [19:0] tr_hit_paddr [0:N_TRACER-1];

    // ============================================================
    // dda_emitter
    // ============================================================
    dda_emitter emitter (
        .clk(clk),
        .rst(rst),

        .hdisp(hdisp), .vdisp(vdisp),
        .p_pos_x(p_pos_x), .p_pos_y(p_pos_y), .p_pos_z(p_pos_z),
        .p_cam_x(p_cam_x), .p_cam_y(p_cam_y), .p_cam_z(p_cam_z),
        .p_vp_x (p_vp_x),  .p_vp_y (p_vp_y),

        .valid(e_valid),
        .ready(e_ready),

        .pos_x (e_pos_x), .pos_y (e_pos_y), .pos_z (e_pos_z),
        .ray_x (e_ray_x), .ray_y (e_ray_y), .ray_z (e_ray_z),
        .next_x(e_next_x), .next_y(e_next_y), .next_z(e_next_z),
        .jump_x(e_jump_x), .jump_y(e_jump_y), .jump_z(e_jump_z),
        .paddr (e_paddr)
    );

    // ============================================================
    // Round-robin arbiter (emitter -> tracer)
    // ============================================================
    generate
    if (N_TRACER == 1) begin : GEN_IN_SINGLE
        assign tr_valid[0] = e_valid;
        assign e_ready = tr_ready[0];
    end else begin : GEN_IN_MULTI
        reg [TR_W-1:0] in_rr_ptr;
        reg [TR_W-1:0] in_grant;

        genvar gi;
        for (gi = 0; gi < N_TRACER; gi = gi + 1)
            assign tr_valid[gi] = e_valid && (in_grant == gi);
        integer i;
        always @(*) begin
            in_grant = in_rr_ptr;
            // for (i = 0; i < N_TRACER; i = i + 1)  // index: high -> low
            for (i = N_TRACER-1; i >= 0; i = i - 1)  // index: low -> high
                if (tr_ready[(in_rr_ptr + i) % N_TRACER])
                    in_grant = (in_rr_ptr + i) % N_TRACER;
        end
        always @(posedge clk) begin
            if (rst) in_rr_ptr <= 0;
            else if (e_valid && e_ready) in_rr_ptr <= in_grant + 1'b1;
        end

        assign e_ready = tr_ready[in_grant];
    end
    endgenerate

    // ============================================================
    // (tracer + DRAM + FIFO) instances
    // ============================================================
    wire  [3:0] tr_block_id   [0:N_TRACER-1];
    wire [14:0] tr_block_addr [0:N_TRACER-1];

    wire [N_TRACER-1:0] fifo_empty;
    wire [N_TRACER-1:0] fifo_dataval;
    wire [N_TRACER-1:0] fifo_rd_en;
    wire [HIT_W-1:0] fifo_wr_data [0:N_TRACER-1];
    wire [HIT_W-1:0] fifo_rd_data [0:N_TRACER-1];

    generate
    genvar gi;
    for (gi = 0; gi < N_TRACER; gi = gi + 1) begin : TRACERS
        dda_tracer tracer (
            .clk(clk),
            .rst(rst),

            .valid(tr_valid[gi]),
            .ready(tr_ready[gi]),

            .in_pos_x(e_pos_x), .in_pos_y(e_pos_y), .in_pos_z(e_pos_z),
            .in_ray_x(e_ray_x), .in_ray_y(e_ray_y), .in_ray_z(e_ray_z),
            .in_next_x(e_next_x), .in_next_y(e_next_y), .in_next_z(e_next_z),
            .in_jump_x(e_jump_x), .in_jump_y(e_jump_y), .in_jump_z(e_jump_z),

            .block_id(tr_block_id[gi]),
            .block_addr(tr_block_addr[gi]),

            .hit_valid(tr_hit_valid[gi]),
            .hit_texture(tr_hit_texture[gi]),
            .in_paddr(e_paddr),
            .hit_paddr(tr_hit_paddr[gi])
        );
    
        DPRAM #(
            .INIT_FILE("./vsrc/map.bin"),
            .DP(32768),
            .DW(4),
            .AW($clog2(32768))
        ) map_ram (
            .clka(clk), .rsta(rst), .cea('b1), .wra('b0), .addra('b0), .dina('b0), .douta(),
            .clkb(clk), .rstb(rst), .ceb('b1), .wrb('b0), .addrb(tr_block_addr[gi]), .dinb(), .doutb(tr_block_id[gi])
        );

        assign fifo_wr_data[gi] = {tr_hit_paddr[gi], tr_hit_texture[gi]};
        FIFO #(
            .FIFO_MODE ("Normal"),
            .DATA_WIDTH(HIT_W),
            .FIFO_DEPTH(32)
        ) FIFO (
            .Reset(rst),

            .WrClk (clk),
            .WrEn  (tr_hit_valid[gi]),
            .WrDNum(),
            .WrFull(),
            .WrData(fifo_wr_data[gi]),

            .RdClk  (clk),
            .RdEn   (fifo_rd_en[gi]),
            .RdDNum (),
            .RdEmpty(fifo_empty[gi]),
            .DataVal(fifo_dataval[gi]),
            .RdData (fifo_rd_data[gi])
        );
    end
    endgenerate

    // ============================================================
    // output RR arbiter (based on FIFO empty)
    // ============================================================
    generate
    if (N_TRACER == 1) begin : GEN_OUT_SINGLE
        assign fifo_rd_en[0] = ~fifo_empty[0];
        assign hit_valid = fifo_dataval[0];
        assign hit_texture = fifo_rd_data[0][12:0];
        assign hit_paddr = fifo_rd_data[0][32:13];
    end else begin : GEN_OUT_MULTI
        reg [TR_W-1:0] out_rr_ptr;
        reg [TR_W-1:0] out_grant, out_grant_d;

        genvar gj;
        for (gj = 0; gj < N_TRACER; gj = gj + 1)
            assign fifo_rd_en[gj] = (gj == out_grant) && !fifo_empty[gj];
        integer j;
        always @(*) begin
            out_grant = out_rr_ptr;
            // for (j = 0; j < N_TRACER; j = j + 1)  // index: high -> low
            for (j = N_TRACER-1; j >= 0; j = j - 1)  // index: low -> high
                if (!fifo_empty[(out_rr_ptr + j) % N_TRACER])
                    out_grant = (out_rr_ptr + j) % N_TRACER;
        end
        always @(posedge clk) begin
            if (rst) out_rr_ptr <= 0;
            else if (hit_valid) out_rr_ptr <= out_grant + 1'b1;
        end

        always @(posedge clk) out_grant_d <= out_grant;
        assign hit_valid = fifo_dataval[out_grant_d];
        assign hit_texture = fifo_rd_data[out_grant_d][12:0];
        assign hit_paddr = fifo_rd_data[out_grant_d][32:13];
    end
    endgenerate

endmodule
