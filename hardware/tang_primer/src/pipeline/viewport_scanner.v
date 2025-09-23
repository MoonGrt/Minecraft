`timescale 1ns / 1ps

module viewport_scanner #(
    parameter H_DISP = 1280,
    parameter V_DISP = 720
)(
    input         clk,
    input         rst,
    input         enable,
    output [15:0] fragment_uv_x,
    output [15:0] fragment_uv_y
);

    //  one-cycle
    reg [15:0] h_cnt_reg = 'b0;
    reg [15:0] v_cnt_reg = 'b0;
    always @(posedge clk) begin
        if (rst) begin
            h_cnt_reg <= 'b0;
            v_cnt_reg <= 'b0;
        end else if (enable) begin
            h_cnt_reg <= (h_cnt_reg == (H_DISP - 1)) ? 0 : (h_cnt_reg + 'd1);
            v_cnt_reg <= (h_cnt_reg != (H_DISP - 1)) ? v_cnt_reg : (v_cnt_reg == (V_DISP - 1)) ? 'd0 : (v_cnt_reg + 1);
        end
    end

    assign fragment_uv_x = h_cnt_reg;
    assign fragment_uv_y = v_cnt_reg;

endmodule
