module align #(
    parameter H_DISP = 1280,
    parameter V_DISP = 720,
    parameter N = 16
) (
    input      PPL_clk,
    input      video_clk,
    input wire rst,

    input wire [23:0] data,
    input wire [19:0] data_addr,
    input wire        data_valid,
    input wire        data_vs,

    output wire [15:0] data_aligned,
    output wire        data_aligned_valid,
    output wire        data_aligned_vs
);

    wire [11:0] fifo_WrDNum;
    wire        fifo_rd_en;
    wire        fifo_almost_full;
    align_ctrl #(
        .H_DISP(H_DISP),
        .V_DISP(V_DISP)
    ) align_ctrl (
        .clk             (PPL_clk),           // PPL_clk
        .rst             (rst),
        .vs              (data_vs),
        .fifo_WrDNum     (fifo_WrDNum),
        .fifo_almost_full(fifo_almost_full),
        .fifo_rd_en      (fifo_rd_en),
        .data_aligned_vs (data_aligned_vs)
    );


    wire [23:0] data_sorted;
    wire        data_sorted_valid;
    wire        data_sorted_vs;
    sort #(
        .N(N)
    ) sort (
        .clk(PPL_clk),
        .rst(rst),

        .data      (data),
        .data_addr (data_addr),
        .data_valid(data_valid),
        .data_vs   (data_vs),

        .data_sorted      (data_sorted),
        .data_sorted_valid(data_sorted_valid),
        .data_sorted_vs   (data_sorted_vs)
    );


    wire [15:0] fifo_idata = {data_sorted[23:19], data_sorted[15:10], data_sorted[7:3]};
    wire fifo_idata_valid = data_sorted_valid;
    wire [15:0] fifo_odata;
    reg fifo_odata_valid, fifo_rd_en_d1;
    always @(posedge video_clk or posedge rst) begin
        if (rst) begin
            fifo_rd_en_d1 <= 'b0;
            fifo_odata_valid <= 'b0;
        end else begin
            fifo_rd_en_d1 <= fifo_rd_en;
            fifo_odata_valid <= fifo_rd_en_d1;
        end
    end
    FIFO #(
        .FIFO_MODE ("Normal"),  //"Normal"; //"ShowAhead"
        .DATA_WIDTH(16),
        .FIFO_DEPTH(2048)
    ) FIFO (
        /*i*/.Reset(rst),  //System Reset

        /*i*/.WrClk (PPL_clk),           //(I)Wirte Clock
        /*i*/.WrEn  (fifo_idata_valid),  //(I)Write Enable
        /*o*/.WrDNum(fifo_WrDNum),       //(O)Write Data Number In Fifo
        /*o*/.WrFull(),                  //(I)Write Full
        /*i*/.WrData(fifo_idata),        //(I)Write Data

        /*i*/.RdClk  (video_clk),   //(I)Read Clock
        /*i*/.RdEn   (fifo_rd_en),  //(I)Read Enable
        /*o*/.RdDNum (),            //(O)Radd Data Number In Fifo
        /*o*/.RdEmpty(),            //(O)Read FifoEmpty
        /*o*/.RdData (fifo_odata)   //(O)Read Data
    );
    // FIFO FIFO (
    //     .Data       (fifo_idata),        //input [15:0] Data
    //     .WrClk      (PPL_clk),           //input WrClk
    //     .RdClk      (video_clk),         //input RdClk
    //     .WrEn       (fifo_idata_valid),  //input WrEn
    //     .RdEn       (fifo_rd_en),        //input RdEn
    //     .Almost_Full(fifo_almost_full),  //output Almost_Full
    //     .Q          (fifo_odata),        //output [15:0] Q
    //     .Empty      (),                  //output Empty
    //     .Full       ()                   //output Full
    // );

    assign data_aligned = fifo_odata;
    assign data_aligned_valid = fifo_odata_valid;

endmodule
