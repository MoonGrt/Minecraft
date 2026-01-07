`timescale 1ns / 1ps

module vga (
    input wire clk,
    input wire rst,

    input wire [11:0] hsync,
    input wire [11:0] hback,
    input wire [11:0] hdisp,
    input wire [11:0] htotal,
    input wire [11:0] vsync,
    input wire [11:0] vback,
    input wire [11:0] vdisp,
    input wire [11:0] vtotal,

    input  wire [15:0] pixel,
    output wire [18:0] addr,
    output wire        vs,
    output wire        hs,
    output wire        de,
    output wire [15:0] data
);

    reg  [11:0] hCnt;
    reg  [11:0] vCnt;
    wire [11:0] x;
    wire [11:0] y;
    wire        hen;
    wire        ven;
    assign addr = y * hdisp + x;

    assign hen = ((hback <= hCnt) && (hCnt < hdisp));
    assign ven = ((vback <= vCnt) && (vCnt < vdisp));
    assign data = pixel;
    assign vs = (vCnt <= vsync);
    assign hs = (hCnt <= hsync);
    assign de = (hen && ven);
    assign x = de ? (hCnt - hback) : 12'd0;
    assign y = de ? (vCnt - vback) : 12'd0;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            hCnt <= 12'h0;
            vCnt <= 12'h0;
        end else begin
        if (hCnt == htotal) begin
            hCnt <= 12'h0;
            if (vCnt == vtotal) begin
                vCnt <= 12'h0;
            end else begin
                vCnt <= (vCnt + 12'h001);
            end
        end else begin
            hCnt <= (hCnt + 12'h001);
        end
        end
    end

endmodule
