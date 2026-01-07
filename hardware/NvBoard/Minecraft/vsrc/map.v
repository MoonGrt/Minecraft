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

    // DPRAM Instance
    DPRAM #(
        .INIT_FILE("./vsrc/map.bin"),
        .DP       (32768),
        .DW       (4),
        .AW       ($clog2(32768))
    ) map_ram (
        .clka (clk),
        .rsta (rst),
        .cea  ('b1),
        .wra  (write_en),
        .addra(write_addr),
        .dina (write_data),
        .douta(),
        .clkb (clk),
        .rstb (rst),
        .ceb  ('b1),
        .wrb  ('b1),
        .addrb(block_addr),
        .dinb (),
        .doutb(block_id)
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

    // ROM Instance
    ROM #(
        .INIT_FILE("./vsrc/textures.bin"),
        .DP       (8192),
        .DW       (16),
        .AW       ($clog2(8192))
    ) texture_rom (
        .clk (clk),
        .rst (rst),
        .ce  ('b1),
        .addr(texture_addr),
        .dout(texture_data)
    );

endmodule
