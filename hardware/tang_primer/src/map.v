`timescale 1ns / 1ps

module map (
    input wire clk,
    input wire rst,

    input wire [14:0] write_addr,
    input wire [ 4:0] write_data,
    input wire        write_en,

    input  wire [14:0] block_addr,
    input  wire [12:0] texture_addr,
    output wire [ 4:0] block_id,

    input wire        valid,
    input wire [19:0] pixel_addr,

    output reg         data_valid,
    output reg  [19:0] data_addr,
    output wire [31:0] texture_data
);

    // map data
    // map_ram map_ram (
    //     .clka (clk),         // input wire clka
    //     .ena  (~rst),        // input wire ena
    //     .wea  (write_en),    // input wire [0 : 0] wea
    //     .addra(write_addr),  // input wire [16 : 0] addra
    //     .dina (write_data),  // input wire [4 : 0] dina

    //     .clkb (clk),         // input wire clkb
    //     .enb  ('b1),         // input wire enb
    //     .addrb(block_addr),  // input wire [16 : 0] addrb
    //     .doutb(block_id)     // output wire [4 : 0] doutb
    // );
    map_ram map_ram (
        .clka  (clk),         //input clka
        .reseta('b0),         //input reseta
        .cea   (write_en),    //input cea
        .ada   (write_addr),  //input [14:0] ada
        .din   (write_data),  //input [4:0] din

        .oce('b0),  //input oce

        .clkb  (clk),         //input clkb
        .resetb('b0),         //input resetb
        .ceb   ('b1),         //input ceb
        .adb   (block_addr),  //input [14:0] adb
        .dout  (block_id)     //output [4:0] dout
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
    // texture_rom texture_rom (
    //     .clka (clk),           // input wire clka
    //     .ena  (~rst),          // input wire ena
    //     .addra(texture_addr),  // input wire [13 : 0] addra
    //     .douta(texture_data)   // output wire [31 : 0] douta
    // );
    texture_rom texture_rom (
        .clk  (clk),           //input clk
        .reset('b0),           //input reset
        .oce  ('b0),           //input oce
        .ce   (~rst),          //input ce
        .dout (texture_data),  //output [31:0] dout
        .ad   (texture_addr)   //input [12:0] ad
    );

endmodule
