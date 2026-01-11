`timescale 1ns / 1ps

/*
    // DPRAM Parameters
    parameter INIT_FILE = "init.hex";
    parameter DP = 512;
    parameter DW = 8;
    parameter AW = $clog2(DP);
    // DPRAM Signals
    reg           clka;
    reg           rsta;
    reg           cea;
    reg           wra;
    reg  [AW-1:0] addra;
    reg  [DW-1:0] dina;
    wire [DW-1:0] douta;
    reg           clkb;
    reg           rstb;
    reg           ceb;
    reg           wrb;
    reg  [AW-1:0] addrb;
    reg  [DW-1:0] dinb;
    wire [DW-1:0] doutb;
    // DPRAM Instance
    DPRAM #(
        .INIT_FILE(INIT_FILE),
        .DP       (DP),
        .DW       (DW),
        .AW       (AW)
    ) DPRAM (
        .clka (clka),
        .rsta (rsta),
        .cea  (cea),
        .wra  (wra),
        .addra(addra),
        .dina (dina),
        .douta(douta),
        .clkb (clkb),
        .rstb (rstb),
        .ceb  (ceb),
        .wrb  (wrb),
        .addrb(addrb),
        .dinb (dinb),
        .doutb(doutb)
    );
*/

`define SYNCHRONOUS

module DPRAM #(
    parameter INIT_FILE = "init.hex",
    parameter DP = 512,
    parameter DW = 8,
    parameter AW = $clog2(DP)
) (
    input  wire          clka,
    input  wire          rsta,
    input  wire          cea,
    input  wire          wra,
    input  wire [AW-1:0] addra,
    input  wire [DW-1:0] dina,
`ifdef SYNCHRONOUS
    output reg  [DW-1:0] douta,
`else
    output wire [DW-1:0] douta,
`endif

    input  wire          clkb,
    input  wire          rstb,
    input  wire          ceb,
    input  wire          wrb,
    input  wire [AW-1:0] addrb,
    input  wire [DW-1:0] dinb,
`ifdef SYNCHRONOUS
    output reg  [DW-1:0] doutb
`else
    output wire [DW-1:0] doutb
`endif
);

    // Memory declaration
    reg [DW-1:0] ram[0:DP-1];
    initial begin  // Initialize memory from file
        // `define HEX_INIT_FILE
        `define BIN_INIT_FILE
        if (INIT_FILE != "") begin
        `ifdef HEX_INIT_FILE
            $readmemh(INIT_FILE, ram);
        `elsif BIN_INIT_FILE
            $readmemb(INIT_FILE, ram);
        `else
            $error("Unsupported INIT_FILE_FORMAT");
        `endif
        end
    end

    // Port A logic
    wire CLKA = cea ? clka : 1'b0;
`ifdef SYNCHRONOUS
    // Synchronous read logic
    always @(posedge CLKA) begin
        if (rsta) douta <= {DW{1'b0}};
        else if (wra) ram[addra] <= dina;
        else douta <= ram[addra];
    end
`else
    // Asynchronous read logic
    assign douta = ram[addra];
    // assign douta = rsta ? 'b0 : ram[addra];
    always @(posedge CLKA) begin
        if (wra) ram[addra] <= dina;
    end
`endif

    // Port B logic
    wire CLKB = ceb ? clkb : 1'b0;
`ifdef SYNCHRONOUS
    // Synchronous read logic
    always @(posedge CLKB) begin
        if (rstb) doutb <= {DW{1'b0}};
        else if (wrb) ram[addrb] <= dinb;
        else doutb <= ram[addrb];
    end
`else
    // Asynchronous read logic
    assign doutb = ram[addrb];
    // assign doutb = rstb ? 'b0 : ram[addrb];
    always @(posedge CLKB) begin
        if (wrb) ram[addrb] <= dinb;
    end
`endif

endmodule


/*
    // ROM Parameters
    parameter INIT_FILE = "init.hex";
    parameter DP = 512;
    parameter DW = 8;
    parameter AW = $clog2(DP);

    // ROM Signals
    reg           clk;
    reg           rst;
    reg           ce;
    reg  [AW-1:0] addr;
    wire [DW-1:0] dout;

    // ROM Instance
    ROM #(
        .INIT_FILE(INIT_FILE),
        .DP       (DP),
        .DW       (DW),
        .AW       (AW)
    ) ROM (
        .clk (clk),
        .rst (rst),
        .ce  (ce),
        .addr(addr),
        .dout(dout)
    );
*/

`define SYNCHRONOUS

module ROM #(
    parameter INIT_FILE = "init.hex",
    parameter DP = 512,
    parameter DW = 8,
    parameter AW = $clog2(DP)
)(
    input  wire          clk,
    input  wire          rst,
    input  wire          ce,
    input  wire [AW-1:0] addr,
`ifdef SYNCHRONOUS
    output reg  [DW-1:0] dout
`else
    output wire [DW-1:0] dout
`endif
);

    // Memory declaration
    reg [DW-1:0] rom [0:DP-1];

    // Initialize ROM from file
    initial begin
        // `define HEX_INIT_FILE
        `define BIN_INIT_FILE
        if (INIT_FILE != "") begin
        `ifdef HEX_INIT_FILE
            $readmemh(INIT_FILE, rom);
        `elsif BIN_INIT_FILE
            $readmemb(INIT_FILE, rom);
        `else
            $error("Unsupported INIT_FILE_FORMAT");
        `endif
        end
    end

    // Clock enable gating（保持与 DPRAM 一致）
    wire CLK = ce ? clk : 1'b0;

`ifdef SYNCHRONOUS
    // Synchronous read logic
    always @(posedge CLK) begin
        if (rst)
            dout <= {DW{1'b0}};
        else
            dout <= rom[addr];
    end
`else
    // Asynchronous read logic
    assign dout = rom[addr];
`endif

endmodule
