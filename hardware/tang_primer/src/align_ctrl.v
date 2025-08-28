`timescale 1ns / 1ps

module align_ctrl #(
    parameter H_DISP = 1280,
    parameter V_DISP = 720,
    parameter DLY = 10
) (
    input wire        clk,
    input wire        rst,
    input wire        vs,
    input wire [11:0] fifo_WrDNum,
    input wire        fifo_almost_full,

    output reg  fifo_rd_en,
    output wire data_aligned_vs
);

    // align FSM
    localparam NEW = 2'd0;
    localparam WAIT = 2'd1;
    localparam ALIGN = 2'd2;

    // State Machine
    reg [$clog2(H_DISP)-1:0] h_cnt = 'b0;
    reg [$clog2(V_DISP)-1:0] v_cnt = 'b0;
    reg [               1:0] align_state = WAIT;
    reg                      data_aligned_vs_reg = 'b0;
    reg                      vs_reg = 'b0;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            h_cnt <= 'b0;
            v_cnt <= 'b0;
            fifo_rd_en <= 'b0;
            data_aligned_vs_reg <= 'b0;
            vs_reg <= 'b0;
        end else begin
            if (vs) vs_reg <= 'b1;
            case (align_state)
                NEW: begin
                    align_state <= WAIT;
                    data_aligned_vs_reg <= 'b1;
                    vs_reg <= 'b0;
                end
                WAIT: begin
                    if ((fifo_WrDNum >= H_DISP - 1) || fifo_almost_full) align_state <= ALIGN;
                    h_cnt <= 'b0;
                    fifo_rd_en <= 'b0;
                    data_aligned_vs_reg <= 'b0;
                end
                ALIGN: begin
                    if (h_cnt == H_DISP - 1) begin
                        align_state <= WAIT;
                        v_cnt <= v_cnt + 'b1;
                        // if (v_cnt == V_DISP - 1) data_aligned_vs_reg <= 'b1;
                        if (vs_reg) align_state <= NEW;
                    end
                    h_cnt <= h_cnt + 'b1;
                    fifo_rd_en <= 'b1;
                end
                default: align_state <= WAIT;
            endcase
        end
    end

    reg [DLY:0] vs_dly = {(DLY + 1) {1'b0}};
    always @(posedge clk) vs_dly <= {data_aligned_vs_reg, vs_dly[DLY:1]};
    assign data_aligned_vs = vs_dly[0];

endmodule
