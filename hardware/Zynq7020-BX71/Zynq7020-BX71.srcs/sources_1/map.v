`timescale 1ns / 1ps

module map (
    input clk,
    input rst,

    input [  `MAP_ADDR_RADIX-1:0] write_addr,
    input [`BLOCK_TYPE_RADIX-1:0] write_data,
    input                         write_en,

    input  [    `MAP_ADDR_RADIX-1:0] block_addr,
    input  [`TEXTURE_ADDR_RADIX-1:0] texture_addr,
    output [  `BLOCK_TYPE_RADIX-1:0] block_id,

    input                             valid,
    input      [`DISP_ADDR_RADIX-1:0] pixel_addr,

    output reg                        data_valid,
    output reg [`DISP_ADDR_RADIX-1:0] data_addr,
    output     [                31:0] texture_data
);

    map_ram map_ram (
        .clka (clk),         // input wire clka
        .ena  (~rst),        // input wire ena
        .wea  (write_en),    // input wire [0 : 0] wea
        .addra(write_addr),  // input wire [16 : 0] addra
        .dina (write_data),  // input wire [4 : 0] dina

        .clkb (clk),         // input wire clkb
        .enb  ('b1),         // input wire enb
        .addrb(block_addr),  // input wire [16 : 0] addrb
        .doutb(block_id)     // output wire [4 : 0] doutb
    );


    // delay
    // reg        next_en_d1 = 'b0;
    // reg [`DISP_ADDR_RADIX-1:0] pixel_addr_d1 = 'b0;
    // always @(posedge clk or posedge rst) begin
    //     if (rst) begin
    //         next_en_d1 <= 'b0;
    //         data_valid <= 'b0;
    //         pixel_addr_d1 <= 'b0;
    //         data_addr <= 'b0;
    //     end else begin
    //         next_en_d1 <= valid;
    //         data_valid <= next_en_d1;
    //         pixel_addr_d1 <= pixel_addr;
    //         data_addr <= pixel_addr_d1;
    //     end
    // end
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
        .clka (clk),           // input wire clka
        .ena  (~rst),          // input wire ena
        .addra(texture_addr),  // input wire [`TEXTURE_ADDR_RADIX-1 : 0] addra
        .douta(texture_data)   // output wire [31 : 0] douta
    );

endmodule
