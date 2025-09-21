module align #(
    parameter H_DISP = 1280,
    parameter V_DISP = 720,
    parameter N = 16,
    parameter DLY = 10
) (
    input      PPL_clk,
    input      video_clk,
    input wire rst,

    input wire [23:0] data,
    input wire [19:0] data_addr,
    input wire        data_valid,

    output wire [15:0] data_aligned,
    output wire        data_aligned_valid,
    output wire        data_aligned_vs
);

    wire [23:0] data_sorted;
    wire        data_sorted_valid;
    sort #(
        .N(N)
    ) sort (
        .clk(PPL_clk),
        .rst(rst),

        .data      (data),
        .data_addr (data_addr),
        .data_valid(data_valid),

        .data_sorted      (data_sorted),
        .data_sorted_valid(data_sorted_valid)
    );

    // FIFO信号
    wire [$clog2(H_DISP*2):0] fifo_wr_count;
    wire [$clog2(H_DISP*2):0] fifo_rd_count;
    wire                 fifo_wr_full;
    wire                 fifo_rd_empty;

    wire              rd_en;
    reg               sending;
    reg [$clog2(H_DISP):0] Hcnt;
    reg [$clog2(V_DISP):0] Vcnt;

    // FIFO实例化
    FIFO #(
        .FIFO_MODE ("Normal"),
        .DATA_WIDTH(16),
        .FIFO_DEPTH(H_DISP+64)
    ) u_fifo (
        .Reset    (rst),
        .WrClk    (PPL_clk),
        .WrEn     (data_sorted_valid),
        .WrDNum   (fifo_wr_count),
        .WrFull   (fifo_wr_full),
        .WrData   (data_sorted),
        .RdClk    (video_clk),
        .RdEn     (rd_en),
        .RdDNum   (fifo_rd_count),
        .RdEmpty  (fifo_rd_empty),
        .DataVal  (data_aligned_valid),
        .RdData   (data_aligned)
    );

    // 读出逻辑
    assign rd_en = sending & ~fifo_rd_empty; // FIFO不空就一直读
    reg vs;
    always @(posedge video_clk or posedge rst) begin
        if (rst) begin
            vs      <= 1;
            sending <= 0;
            Hcnt    <= 0;
            Vcnt    <= 0;
        end else begin
            vs <= 0;
            if (sending) begin
                if (Hcnt == H_DISP - 1) begin
                    sending <= 0;
                    if (Vcnt == V_DISP - 1) begin 
                        vs <= 1;
                        Vcnt <= 0;
                    end
                    else Vcnt <= Vcnt + 1;
                end
                else Hcnt <= Hcnt + 1;
            end else if (fifo_wr_count == H_DISP) begin
                sending <= 1;
                Hcnt <= 0;
            end
        end
    end

    // vs delay
    reg [DLY:0] rst_dly = {(DLY + 1) {1'b0}};
    always @(posedge video_clk) rst_dly <= {vs, rst_dly[DLY:1]};
    assign data_aligned_vs = rst_dly[0];

endmodule
