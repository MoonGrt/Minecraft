module sort #(
    parameter N = 16
) (
    input wire clk,
    input wire rst,

    input wire [23:0] data,
    input wire [19:0] data_addr,
    input wire        data_valid,

    output reg [23:0] data_sorted,
    output reg        data_sorted_valid
);

    reg  [         23:0] buffer[0:N-1];
    reg  [        N-1:0] valid_flags = 'b0;
    reg  [$clog2(N)-1:0] out_ptr = 'b0;
    reg                  out_flag = 'b0;
    wire [$clog2(N)-1:0] buffer_index = data_addr[$clog2(N)-1:0];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out_ptr <= 'b0;
            data_sorted <= 'b0;
            data_sorted_valid <= 'b0;
            valid_flags <= 'b0;
        end else if (data_valid) begin
            // if (out_ptr == data_addr) begin
            if (out_ptr == buffer_index) begin
                valid_flags <= valid_flags;
                out_ptr <= (out_ptr + 1) % N;
                data_sorted <= data;
                data_sorted_valid <= 'b1;
            end else begin
                valid_flags[buffer_index] <= 'b1;
                buffer[buffer_index] <= data;
                out_ptr <= out_ptr;
                data_sorted <= 'd0;
                data_sorted_valid <= 'b0;
            end
        end else begin
            if (valid_flags[out_ptr]) begin
                valid_flags[out_ptr] <= 'b0;
                out_ptr <= (out_ptr + 1) % N;
                data_sorted <= buffer[out_ptr];
                data_sorted_valid <= 'b1;
            end else begin
                valid_flags <= valid_flags;
                out_ptr <= out_ptr;
                data_sorted <= 'd0;
                data_sorted_valid <= 'b0;
            end
        end
    end

    reg [19:0] pixel_cnt = 'b0;
    always @(posedge clk or posedge rst) begin
        if (rst) pixel_cnt <= 'b0;
        else if (data_sorted_valid) pixel_cnt <= pixel_cnt + 'b1;
        else pixel_cnt <= pixel_cnt;
    end

endmodule
