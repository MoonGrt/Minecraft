module align #(
    parameter H_DISP = 1280,
    parameter V_DISP = 720,
    parameter N = 16,
    parameter DLY = 64,
    parameter VS_WIDTH = 8 // 帧同步信号宽度，不能太低，不然 Gowin Video Frame Buffer IP 会有问题
) (
    input      clk,
    input wire rst,

    input wire [15:0] data,
    input wire [19:0] data_addr,
    input wire        data_valid,

    output wire [15:0] data_aligned,
    output wire        data_aligned_valid,
    output wire        data_aligned_vs
);

    wire [15:0] data_sorted;
    wire        data_sorted_valid;
    sort #(
        .N(N)
    ) sort (
        .clk(clk),
        .rst(rst),

        .data_addr (data_addr),
        .data      (data),
        .data_valid(data_valid),

        .data_sorted      (data_sorted),
        .data_sorted_valid(data_sorted_valid)
    );

    // FIFO信号
    wire [$clog2(H_DISP+64):0] fifo_wr_count;
    wire [$clog2(H_DISP+64):0] fifo_rd_count;
    wire                       fifo_wr_full;
    wire                       fifo_rd_empty;

    // FIFO实例化
    wire        rd_en;
    wire        fifo_rd_valid;
    wire [15:0] fifo_rd_data;
    FIFO #(
        .FIFO_MODE ("Normal"),
        .DATA_WIDTH(16),
        .FIFO_DEPTH(H_DISP+64)
    ) FIFO1 (
        .Reset    (rst),
        .WrClk    (clk),
        .WrEn     (data_sorted_valid),
        .WrDNum   (fifo_wr_count),
        .WrFull   (fifo_wr_full),
        .WrData   (data_sorted),
        .RdClk    (clk),
        .RdEn     (rd_en),
        .RdDNum   (fifo_rd_count),
        .RdEmpty  (fifo_rd_empty),
        .DataVal  (fifo_rd_valid),
        .RdData   (fifo_rd_data)
    );

    // 读出逻辑
    reg  send;
    reg [$clog2(H_DISP):0] Hcnt;
    reg [$clog2(V_DISP):0] Vcnt;
    wire vs = (Hcnt == H_DISP - 1) && (Vcnt == V_DISP - 1);
    assign rd_en = send & ~fifo_rd_empty; // FIFO不空就一直读
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            send <= 0;
            Hcnt <= 0;
            Vcnt <= 0;
        end else begin
            if (Hcnt == H_DISP - 1) begin
                send <= 0;
                if (Vcnt == V_DISP - 1) Vcnt <= 0;
                else Vcnt <= Vcnt + 1;
            end
            if (fifo_wr_count == H_DISP) send <= 1;
            if (send) Hcnt <= Hcnt + 1;
            else Hcnt <= 0;
        end
    end

    // vs delay
    reg [DLY:0] rst_dly = {(DLY + 1) {1'b0}};
    always @(posedge clk) rst_dly <= {vs, rst_dly[DLY:1]};

    assign data_aligned_valid = fifo_rd_valid;
    assign data_aligned = fifo_rd_data;
    assign data_aligned_vs = |rst_dly[VS_WIDTH-1:0];

    // 计数器
    reg [19:0] pixel_cnt = 'b0;
    always @(posedge clk or posedge rst) begin
        if (rst | data_aligned_vs) pixel_cnt <= 'b0;
        else if (data_aligned_valid) pixel_cnt <= pixel_cnt + 'b1;
    end

endmodule


module sort #(
    parameter N = 16
) (
    input wire clk,
    input wire rst,

    input wire [19:0] data_addr,
    input wire [15:0] data,
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

endmodule
