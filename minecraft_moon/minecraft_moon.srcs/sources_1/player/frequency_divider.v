module frequency_divider #(
    parameter PERIOD = 100000
) (
    input  wire clk,
    input  wire rst,
    input  wire en,
    output reg  pulse
);

    reg [31:0] cnt_reg, cnt_next;

    // Main process block
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt_reg <= 0;
        end else if (en) begin
            cnt_reg <= cnt_next;
        end
    end

    // Next count logic
    always @(*) begin
        if (cnt_reg == PERIOD - 1) begin
            cnt_next = 0;
            pulse    = 1;
        end else begin
            cnt_next = cnt_reg + 1;
            pulse    = 0;
        end
    end

endmodule
