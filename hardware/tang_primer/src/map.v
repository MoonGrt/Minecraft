`timescale 1ns / 1ps

module map (
    input wire clk,
    input wire rst,

    input wire [14:0] write_addr,
    input wire [ 3:0] write_data,
    input wire        write_en,

    input  wire [14:0] block_addr,
    input  wire [12:0] texture_addr,
    output wire [ 3:0] block_id,

    input wire        valid,
    input wire [19:0] pixel_addr,

    output reg         data_valid,
    output reg  [19:0] data_addr,
    output wire [15:0] texture_data
);

    map_ram map_ram (
        .clka  (clk),         // input clka
        .reseta('b0),         // input reseta
        .cea   (write_en),    // input cea
        .ada   (write_addr),  // input [14:0] ada
        .din   (write_data),  // input [3:0] din
        .oce   ('b0),         // input oce
        .clkb  (clk),         // input clkb
        .resetb('b0),         // input resetb
        .ceb   ('b1),         // input ceb
        .adb   (block_addr),  // input [14:0] adb
        .dout  (block_id)     // output [3:0] dout
    );

    // texture colour
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_valid <= 'b0;
            data_addr  <= 'b0;
        end else begin
            data_valid <= valid;
            data_addr  <= pixel_addr;
        end
    end
    texture_rom texture_rom (
        .clk  (clk),           // input clk
        .reset('b0),           // input reset
        .oce  ('b0),           // input oce
        .ce   (~rst),          // input ce
        .dout (texture_data),  // output [15:0] dout
        .ad   (texture_addr)   // input [12:0] ad
    );

endmodule


module sort #(
    parameter N = 16
) (
    input wire clk,
    input wire rst,

    input wire [15:0] data,
    input wire [19:0] data_addr,
    input wire        data_valid,

    output reg [15:0] data_sorted,
    output reg        data_sorted_valid
);

    reg  [         15:0] buffer[0:N-1];
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
