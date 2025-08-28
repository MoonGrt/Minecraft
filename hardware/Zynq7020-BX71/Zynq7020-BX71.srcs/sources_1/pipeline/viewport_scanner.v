`timescale 1ns / 1ps
`include "constants.vh"

module viewport_scanner (
    input                     clk,
    input                     rst,
    input                     enable,
    output [`ANGLE_RADIX-1:0] fragment_uv_x,
    output [`ANGLE_RADIX-1:0] fragment_uv_y
);

    //  one-cycle
    reg [`ANGLE_RADIX-1:0] h_cnt_reg = 'b0;
    reg [`ANGLE_RADIX-1:0] v_cnt_reg = 'b0;
    always @(posedge clk) begin
        if (rst) begin
            h_cnt_reg <= 'b0;
            v_cnt_reg <= 'b0;
        end else if (enable) begin
            h_cnt_reg <= (h_cnt_reg == (`H_DISP - 1)) ? 0 : (h_cnt_reg + 1);
            v_cnt_reg <= (h_cnt_reg != (`H_DISP - 1)) ? v_cnt_reg : (v_cnt_reg == (`V_DISP - 1)) ? 0 : (v_cnt_reg + 1);
        end
    end

    assign fragment_uv_x = h_cnt_reg;
    assign fragment_uv_y = v_cnt_reg;

endmodule
