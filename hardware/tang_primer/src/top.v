module top (
    input clk,
    input rst_n,

    output [3:0] state_led,

    output [14-1:0] ddr_addr,     // ROW_WIDTH=14
    output [ 3-1:0] ddr_bank,     // BANK_WIDTH=3
    output          ddr_cs,
    output          ddr_ras,
    output          ddr_cas,
    output          ddr_we,
    output          ddr_ck,
    output          ddr_ck_n,
    output          ddr_cke,
    output          ddr_odt,
    output          ddr_reset_n,
    output [ 2-1:0] ddr_dm,       // DM_WIDTH=2
    inout  [16-1:0] ddr_dq,       // DQ_WIDTH=16
    inout  [ 2-1:0] ddr_dqs,      // DQS_WIDTH=2
    inout  [ 2-1:0] ddr_dqs_n,    // DQS_WIDTH=2

    output       O_tmds_clk_p,
    output       O_tmds_clk_n,
    output [2:0] O_tmds_data_p,  // {r,g,b}
    output [2:0] O_tmds_data_n
);

    //=========================================================
    // SRAM parameters
    `define WR_VIDEO_WIDTH_16
    `define DEF_WR_VIDEO_WIDTH 16
    `define RD_VIDEO_WIDTH_16
    `define DEF_RD_VIDEO_WIDTH 16
    `define USE_THREE_FRAME_BUFFER
    `define DEF_ADDR_WIDTH 28 
    `define DEF_SRAM_DATA_WIDTH 128
    parameter ADDR_WIDTH = `DEF_ADDR_WIDTH;  // 存储单元是byte，总容量=2^27*16bit = 2Gbit,增加1位rank地址，{rank[0],bank[2:0],row[13:0],cloumn[9:0]}
    parameter DATA_WIDTH = `DEF_SRAM_DATA_WIDTH;  // 与生成DDR3IP有关，此ddr3 2Gbit, x16， 时钟比例1:4 ，则固定128bit
    parameter WR_VIDEO_WIDTH = `DEF_WR_VIDEO_WIDTH;
    parameter RD_VIDEO_WIDTH = `DEF_RD_VIDEO_WIDTH;

    //-------------------
    //状态指示灯
    // assign state_led[3] = 
    assign state_led[2] = lcd_vs_cnt[4];
    assign state_led[1] = rst_n;  //复位指示灯
    assign state_led[0] = init_calib_complete;  //DDR3初始化指示灯
    reg [4:0] lcd_vs_cnt;
    always @(posedge lcd_vs) lcd_vs_cnt <= lcd_vs_cnt + 1;

    //-------------------
    // memory clock
    wire memory_clk;
    wire dma_clk;
    wire DDR_pll_lock;
    mem_pll mem_pll (
        .clkin (clk),
        .clkout(memory_clk),
        .lock  (DDR_pll_lock)
    );
    //TMDS TX (HDMI4)
    wire serial_clk;
    wire video_clk;  // video pixel clock
    wire TMDS_DDR_pll_lock;
    wire hdmi4_rst_n = rst_n & TMDS_DDR_pll_lock;
    TMDS_rPLL TMDS_rPLL (
        .clkin (clk),               // input clk 
        .clkout(serial_clk),        // output clk 
        .lock  (TMDS_DDR_pll_lock)  // output lock
    );
    CLKDIV u_clkdiv (
        .RESETN(hdmi4_rst_n),
        .HCLKIN(serial_clk),  // clk  x5
        .CLKOUT(video_clk),   // clk  x1
        .CALIB (1'b1)
    );
    defparam u_clkdiv.DIV_MODE = "5"; defparam u_clkdiv.GSREN = "false";
    // Pipeline pll
    wire PPL_clk;
    wire PLL_lock;
    ppl_clk ppl_clk(
        .clkout(PPL_clk), // output clkout
        .lock(PLL_lock),  // output lock
        .clkin(clk)       // input clkin
    );


    //--------------------------
    // 输入测试图
    reg        vs_r;
    reg  [8:0] cnt_vs;
    wire       tp0_vs_in;
    wire       tp0_hs_in;
    wire       tp0_de_in;
    wire [7:0] tp0_data_r;
    wire [7:0] tp0_data_g;
    wire [7:0] tp0_data_b;
    testpattern testpattern_inst (
        .I_pxl_clk (video_clk),            // pixel clock
        .I_rst_n   (rst_n),                // low active
        .I_mode    ({1'b0, cnt_vs[8:7]}),  // data select
        .I_single_r(8'd255),
        .I_single_g(8'd255),
        .I_single_b(8'd255),      //                    800x600   // 1024x768  // 1280x720  // 1920x1080
        .I_h_total (12'd1650),    // hor total time  // 12'd1056  // 12'd1344  // 12'd1650  // 12'd2200
        .I_h_sync  (12'd40),      // hor sync time   // 12'd128   // 12'd136   // 12'd40    // 12'd44
        .I_h_bporch(12'd220),     // hor back porch  // 12'd88    // 12'd160   // 12'd220   // 12'd148
        .I_h_res   (12'd1280),    // hor resolution  // 12'd800   // 12'd1024  // 12'd1280  // 12'd1920
        .I_v_total (12'd750),     // ver total time  // 12'd628   // 12'd806   // 12'd750   // 12'd1125
        .I_v_sync  (12'd5),       // ver sync time   // 12'd4     // 12'd6     // 12'd5     // 12'd5
        .I_v_bporch(12'd20),      // ver back porch  // 12'd23    // 12'd29    // 12'd20    // 12'd36
        .I_v_res   (12'd720),     // ver resolution  // 12'd600   // 12'd768   // 12'd720   // 12'd1080
        .I_hs_pol  (1'b1),        // 0,负极性; 1,正极性
        .I_vs_pol  (1'b1),        // 0,负极性; 1,正极性
        .O_de      (tp0_de_in),
        .O_hs      (tp0_hs_in),
        .O_vs      (tp0_vs_in),
        .O_data_r  (tp0_data_r),
        .O_data_g  (tp0_data_g),
        .O_data_b  (tp0_data_b)
    );

    always @(posedge video_clk) vs_r <= tp0_vs_in;
    always @(posedge video_clk or negedge rst_n) begin
        if (!rst_n) cnt_vs <= 0;
        else if (vs_r && !tp0_vs_in)  // tp0_vs_in falling edge
            cnt_vs <= cnt_vs + 1'b1;
    end








    reg  [17:0] p_pos_x = 'd170 << 8;
    reg  [17:0] p_pos_y = 'd170 << 8;
    reg  [17:0] p_pos_z = 'd280 << 8;
    reg  [19:0] p_angle_x = 30;
    reg  [19:0] p_angle_y = -120;
    wire [14:0] write_addr;
    wire [ 4:0] write_data;
    wire        write_en;
    wire [ 4:0] block_id;
    wire [31:0] texture_data;
    wire [23:0] color = texture_data[23:0];
    wire [19:0] pixel_addr_out;
    wire [14:0] block_addr;
    wire [12:0] texture_addr;
    wire valid;

    ppl #(
        .H_DISP(1280),
        .V_DISP(720)
    ) ppl (
        .clk_ppl  (PPL_clk),
        .rst      (~TMDS_DDR_pll_lock && ~PLL_lock),
        .p_pos_x  (p_pos_x),
        .p_pos_y  (p_pos_y),
        .p_pos_z  (p_pos_z),
        .p_angle_x(p_angle_x),
        .p_angle_y(p_angle_y),
        .block_id (block_id),

        .valid         (valid),
        .block_addr    (block_addr),
        .pixel_addr_out(pixel_addr_out),
        .texture_addr  (texture_addr)
    );

    wire [19:0] data_addr;
    wire        data_valid;
    map map (
        .clk(PPL_clk),
        .rst(~TMDS_DDR_pll_lock && ~PLL_lock),

        .write_addr  ('b0),
        .write_data  ('b0),
        .write_en    ('b0),
        .block_addr  (block_addr),
        .texture_addr(texture_addr),
        .block_id    (block_id),

        .valid       (valid),
        .pixel_addr  (pixel_addr_out),

        .data_valid  (data_valid),
        .data_addr   (data_addr),
        .texture_data(texture_data)
    );

    wire [15:0] data_aligned;
    wire        data_aligned_valid;
    wire        data_aligned_vs;
    align #(
        .H_DISP(1280),
        .V_DISP(720),
        .N     (16)
    ) align (
        .PPL_clk   (PPL_clk),
        .video_clk (video_clk),
        .rst       (~TMDS_DDR_pll_lock && ~PLL_lock),
        .data      (color),
        .data_addr (data_addr),
        .data_valid(data_valid),

        .data_aligned      (data_aligned),
        .data_aligned_valid(data_aligned_valid),
        .data_aligned_vs   (data_aligned_vs)
    );





    // algorithm Parameters
    parameter VIO_DATA_WIDTH = 8;
    parameter CHANNELS = 3;
    parameter BUFFER_SIZE = 3;
    parameter INPUT_X_RES_WIDTH = 11;
    parameter INPUT_Y_RES_WIDTH = 11;
    parameter OUTPUT_X_RES_WIDTH = 11;
    parameter OUTPUT_Y_RES_WIDTH = 11;

    // algorithm Inputs
    // parameter START_X = 12'd1280 / 4;
    // parameter START_Y = 12'd720 / 4;
    // parameter END_X = 12'd1280 * 3 / 4;
    // parameter END_Y = 12'd720 * 3 / 4;
    // parameter OUTPUT_X_RES = 12'd1280 - 1;  //Resolution of output data minus 1
    // parameter OUTPUT_Y_RES = 12'd720 - 1;  //Resolution of output data minus 1

    parameter START_X = 0;
    parameter START_Y = 0;
    parameter END_X = 12'd1280;
    parameter END_Y = 12'd720;
    parameter OUTPUT_X_RES = 12'd1280 - 1;  //Resolution of output data minus 1
    parameter OUTPUT_Y_RES = 12'd720 - 1;  //Resolution of output data minus 1

    // parameter START_X = 0;
    // parameter START_Y = 0;
    // parameter END_X = 12'd1280;
    // parameter END_Y = 12'd720;
    // parameter OUTPUT_X_RES = 12'd1280 / 2 - 1;  //Resolution of output data minus 1
    // parameter OUTPUT_Y_RES = 12'd720 / 2 - 1;  //Resolution of output data minus 1

    reg                                algorithm_sel = 1;
    wire [VIO_DATA_WIDTH*CHANNELS-1:0] algorithm_data;
    wire                               algorithm_dataValid;

    algorithm #(
        .H_DISP(12'd1280),
        .V_DISP(12'd720),

        .DATA_WIDTH (VIO_DATA_WIDTH),
        .CHANNELS   (CHANNELS),
        .BUFFER_SIZE(BUFFER_SIZE),

        .INPUT_X_RES_WIDTH (INPUT_X_RES_WIDTH),
        .INPUT_Y_RES_WIDTH (INPUT_Y_RES_WIDTH),
        .OUTPUT_X_RES_WIDTH(OUTPUT_X_RES_WIDTH),
        .OUTPUT_Y_RES_WIDTH(OUTPUT_Y_RES_WIDTH)
    ) algorithm (
        .clk   (video_clk),
        .clk_2x(video_clk),

        .START_X   (START_X),
        .START_Y   (START_Y),
        .END_X     (END_X),
        .END_Y     (END_Y),
        .outputXRes(OUTPUT_X_RES),
        .outputYRes(OUTPUT_Y_RES),

        .algorithm_sel(algorithm_sel),
        .hs_i         (tp0_hs_in),
        .vs_i         (~tp0_vs_in),
        .de_i         (tp0_de_in),
        .rgb_i        ({tp0_data_r, tp0_data_g, tp0_data_b}),

        .algorithm_data     (algorithm_data),
        .algorithm_dataValid(algorithm_dataValid)
        // .scaler_data     (algorithm_data),
        // .scaler_dataValid(algorithm_dataValid)
    );


    // syn_code
    wire                      syn_off0_vs;
    wire                      syn_off0_hs;
    wire                      off0_syn_de;
    wire [RD_VIDEO_WIDTH-1:0] off0_syn_data;
    // memory interface
    wire                    cmd_ready;
    wire [             2:0] cmd;
    wire                    cmd_en;
    wire [             5:0] app_burst_number;
    wire [  ADDR_WIDTH-1:0] addr;
    wire                    wr_data_rdy;
    wire                    wr_data_en;  
    wire                    wr_data_end;  
    wire [  DATA_WIDTH-1:0] wr_data;
    wire [DATA_WIDTH/8-1:0] wr_data_mask;
    wire                    rd_data_valid;
    wire                    rd_data_end;
    wire [  DATA_WIDTH-1:0] rd_data;
    wire                    init_calib_complete;
    // The video output timing generator and generate a frame read data request
    // 输出
    wire out_de;
    vga_timing vga_timing (
        .clk(video_clk),
        .rst(~rst_n),
        .hs (syn_off0_hs),
        .vs (syn_off0_vs),
        .de (out_de)
    );
    Video_Frame_Buffer_Top Video_Frame_Buffer_Top_inst (
        .I_rst_n  (init_calib_complete),
        .I_dma_clk(dma_clk),
`ifdef USE_THREE_FRAME_BUFFER
        .I_wr_halt(1'd0),  // 1: halt, 0: no halt
        .I_rd_halt(1'd0),  // 1: halt, 0: no halt
`endif
        // // 测试图
        // .I_vin0_clk      (video_clk),
        // .I_vin0_vs_n     (~tp0_vs_in), // 只接收负极性
        // .I_vin0_de       (tp0_de_in),
        // .I_vin0_data     ({tp0_data_r[7:3], tp0_data_g[7:2], tp0_data_b[7:3]}),

        // algorithm
        .I_vin0_clk      (video_clk),
        .I_vin0_vs_n     (~tp0_vs_in), // 只接收负极性
        .I_vin0_de       (algorithm_dataValid),
        .I_vin0_data     ({algorithm_data[23:19], algorithm_data[15:10], algorithm_data[7:3]}),

        // // minecraft
        // .I_vin0_clk      (video_clk),
        // .I_vin0_vs_n     (~data_aligned_vs), // 只接收负极性
        // .I_vin0_de       (data_aligned_valid),
        // .I_vin0_data     (data_aligned),

        .O_vin0_fifo_full(),
        // video data output            
        .I_vout0_clk          (video_clk),
        .I_vout0_vs_n         (~syn_off0_vs), // 只接收负极性
        .I_vout0_de           (out_de),
        .O_vout0_den          (off0_syn_de),
        .O_vout0_data         (off0_syn_data),
        .O_vout0_fifo_empty   (),
        // ddr write request
        .I_cmd_ready          (cmd_ready),
        .O_cmd                (cmd),                 
        .O_cmd_en             (cmd_en),
        .O_app_burst_number   (app_burst_number),
        .O_addr               (addr),
        .I_wr_data_rdy        (wr_data_rdy),
        .O_wr_data_en         (wr_data_en),
        .O_wr_data_end        (wr_data_end),
        .O_wr_data            (wr_data),
        .O_wr_data_mask       (wr_data_mask),
        .I_rd_data_valid      (rd_data_valid),
        .I_rd_data_end        (rd_data_end),
        .I_rd_data            (rd_data),
        .I_init_calib_complete(init_calib_complete)
    );

    localparam N = 7;  // delay N clocks
    reg [N-1:0] Pout_hs_dn;
    reg [N-1:0] Pout_vs_dn;
    reg [N-1:0] Pout_de_dn;
    always @(posedge video_clk or negedge rst_n) begin
        if (!rst_n) begin
            Pout_hs_dn <= {N{1'b1}};
            Pout_vs_dn <= {N{1'b1}};
            Pout_de_dn <= {N{1'b0}};
        end else begin
            Pout_hs_dn <= {Pout_hs_dn[N-2:0], syn_off0_hs};
            Pout_vs_dn <= {Pout_vs_dn[N-2:0], syn_off0_vs};
            Pout_de_dn <= {Pout_de_dn[N-2:0], out_de};
        end
    end

    // DDR3 memory interface
    DDR3MI DDR3_Memory_Interface_Top_inst (
        .clk                (video_clk),
        .memory_clk         (memory_clk),
        .pll_lock           (DDR_pll_lock),
        .rst_n              (rst_n),
        .app_burst_number   (app_burst_number),
        .cmd_ready          (cmd_ready),
        .cmd                (cmd), // 0: write; 1: read
        .cmd_en             (cmd_en),
        .addr               (addr),
        .wr_data_rdy        (wr_data_rdy),
        .wr_data            (wr_data),
        .wr_data_en         (wr_data_en),
        .wr_data_end        (wr_data_end),
        .wr_data_mask       (wr_data_mask),
        .rd_data            (rd_data),
        .rd_data_valid      (rd_data_valid),
        .rd_data_end        (rd_data_end),
        .sr_req             (1'b0),
        .ref_req            (1'b0),
        .sr_ack             (),
        .ref_ack            (),
        .init_calib_complete(init_calib_complete),
        .clk_out            (dma_clk),
        .burst              (1'b1),
        // mem interface
        .ddr_rst            (),
        .O_ddr_addr         (ddr_addr),
        .O_ddr_ba           (ddr_bank),
        .O_ddr_cs_n         (ddr_cs),
        .O_ddr_ras_n        (ddr_ras),
        .O_ddr_cas_n        (ddr_cas),
        .O_ddr_we_n         (ddr_we),
        .O_ddr_clk          (ddr_ck),
        .O_ddr_clk_n        (ddr_ck_n),
        .O_ddr_cke          (ddr_cke),
        .O_ddr_odt          (ddr_odt),
        .O_ddr_reset_n      (ddr_reset_n),
        .O_ddr_dqm          (ddr_dm),
        .IO_ddr_dq          (ddr_dq),
        .IO_ddr_dqs         (ddr_dqs),
        .IO_ddr_dqs_n       (ddr_dqs_n)
    );

    //==============================================================================
    wire [4:0] lcd_r, lcd_b;
    wire [5:0] lcd_g;
    wire lcd_vs, lcd_de, lcd_hs;
    assign {lcd_r, lcd_g, lcd_b} = off0_syn_data;  // {r,g,b}
    assign lcd_vs = Pout_vs_dn[4];  // syn_off0_vs;
    assign lcd_hs = Pout_hs_dn[4];  // syn_off0_hs;
    assign lcd_de = Pout_de_dn[4];  // off0_syn_de;
    DVI_TX_Top DVI_TX_Top_inst (
        .I_rst_n     (hdmi4_rst_n),  // asynchronous reset, low active
        .I_serial_clk(serial_clk),

        .I_rgb_clk(video_clk),
        .I_rgb_vs (lcd_vs),
        .I_rgb_hs (lcd_hs),
        .I_rgb_de (lcd_de),
        .I_rgb_r  ({lcd_r, 3'd0}),
        .I_rgb_g  ({lcd_g, 2'd0}),
        .I_rgb_b  ({lcd_b, 3'd0}),

        .O_tmds_clk_p (O_tmds_clk_p),
        .O_tmds_clk_n (O_tmds_clk_n),
        .O_tmds_data_p(O_tmds_data_p),
        .O_tmds_data_n(O_tmds_data_n)
    );

endmodule
