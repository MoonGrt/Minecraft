`timescale 1ns / 1ps

module ppl_ctrl #(
    parameter H_DISP = 1280,
    parameter V_DISP = 720
)(
    input        clk,
    input        rst,
    input [19:0] pixel_addr_out,
    input        next_en,

    output     prepare_flag,
    output reg scanner_stop,
    output     vs
);

    // prepare FSM
    localparam PREPARE_CYCLES = 5;  // may be the ppl count minus 1
    localparam BEFORE_PREPARE = 2'd0;
    localparam PREPARING = 2'd1;
    localparam RUNNING = 2'd2;
    localparam NEXT = 2'd3;

    // reg scanner_stop;
    reg [1:0] prepare_state = BEFORE_PREPARE;
    reg [3:0] prepare_cnt = 'b0;
    reg vs_reg = 'b0;
    wire frame_end = (pixel_addr_out == H_DISP * V_DISP);
    assign prepare_flag = (prepare_state == BEFORE_PREPARE || prepare_state == PREPARING);

    reg [19:0] pixel_cnt = 'b0;
    always @(posedge clk or posedge rst) begin
        if (rst) pixel_cnt <= 'b0;
        else if (next_en && ~prepare_flag)
            if (pixel_cnt == H_DISP * V_DISP) pixel_cnt <= 'b0;
            else pixel_cnt <= pixel_cnt + 'b1;
//        else if (prepare_flag)
//            pixel_cnt <= 'b0;
        else pixel_cnt <= pixel_cnt;
    end

    // State Machine
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prepare_state <= BEFORE_PREPARE;
            prepare_cnt <= 'b0;
            vs_reg <= 'b0;
            scanner_stop = 1'b0;
        end else begin
            case (prepare_state)
                BEFORE_PREPARE: begin
                    prepare_state <= PREPARING;
                    prepare_cnt <= 'b0;
                    vs_reg <= 'b0;
                end
                PREPARING: begin
                    if (prepare_cnt == PREPARE_CYCLES - 1) prepare_state = RUNNING;
                    prepare_cnt = prepare_cnt + 'b1;
                end
                RUNNING: begin
                    if (frame_end) begin
                        prepare_state <= NEXT;
                        scanner_stop  <= 1'b1;
                    end
                end
                NEXT: begin
                    // if (next_en && frame_end) begin
                    if (pixel_cnt == H_DISP * V_DISP) begin
                        prepare_state <= BEFORE_PREPARE;
                        scanner_stop <= 1'b0;
                        vs_reg <= 'b1;
                    end
                end
            endcase
        end
    end

    reg vs_d1 = 'b0, vs_d2 = 'b0;
    assign vs = vs_d2;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            vs_d1 <= 'b0;
            vs_d2 <= 'b0;
        end else begin
            vs_d1 <= vs_reg;
            vs_d2 <= vs_d1;
        end
    end

endmodule
