`timescale 1ns / 1ps

module top (
    input video_clk,
    input PPL_clk,
    input rst_n
);

    //输入测试图
    //--------------------------
    reg        vs_r;
    wire       tp0_vs_in;
    wire       tp0_hs_in;
    wire       tp0_de_in;
    wire [7:0] tp0_data_r;
    wire [7:0] tp0_data_g;
    wire [7:0] tp0_data_b;
    testpattern testpattern (
        .I_pxl_clk (video_clk),   //pixel clock
        .I_rst_n   (rst_n),       //low active 
        .I_mode    (0),  //data select
        // .I_mode    (3'b000),      //data select
        .I_single_r(8'd255),
        .I_single_g(8'd255),
        .I_single_b(8'd255),      //800x600    //1024x768   //1280x720   //1920x1080 
        .I_h_total (12'd1650),    //hor total time  // 12'd1056  // 12'd1344  // 12'd1650  // 12'd2200
        .I_h_sync  (12'd40),      //hor sync time   // 12'd128   // 12'd136   // 12'd40    // 12'd44  
        .I_h_bporch(12'd220),     //hor back porch  // 12'd88    // 12'd160   // 12'd220   // 12'd148 
        .I_h_res   (12'd1280),    //hor resolution  // 12'd800   // 12'd1024  // 12'd1280  // 12'd1920
        .I_v_total (12'd750),     //ver total time  // 12'd628   // 12'd806   // 12'd750   // 12'd1125 
        .I_v_sync  (12'd5),       //ver sync time   // 12'd4     // 12'd6     // 12'd5     // 12'd5   
        .I_v_bporch(12'd20),      //ver back porch  // 12'd23    // 12'd29    // 12'd20    // 12'd36  
        .I_v_res   (12'd720),     //ver resolution  // 12'd600   // 12'd768   // 12'd720   // 12'd1080 
        .I_hs_pol  (1'b1),        //0,负极性;1,正极性
        .I_vs_pol  (1'b1),        //0,负极性;1,正极性
        .O_de      (tp0_de_in),
        .O_hs      (tp0_hs_in),
        .O_vs      (tp0_vs_in),
        .O_data_r  (tp0_data_r),
        .O_data_g  (tp0_data_g),
        .O_data_b  (tp0_data_b)
    );



    // parameter H_DISP = 32;
    // parameter V_DISP = 24;
    parameter H_DISP = 480;
    parameter V_DISP = 272;

    reg  [16:0] p_pos_x = 'd33 << 3 << 7;
    reg  [16:0] p_pos_y = 'd33 << 3 << 7;
    reg  [16:0] p_pos_z = 'd62 << 3 << 7;
    // reg  [16:0] p_pos_x = 'd170 << 7;
    // reg  [16:0] p_pos_y = 'd170 << 7;
    // reg  [16:0] p_pos_z = 'd280 << 7;
    reg  [15:0] p_angle_x = -1;
    reg  [15:0] p_angle_y = 0;
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
        .H_DISP(H_DISP),
        .V_DISP(V_DISP)
    ) ppl (
        .clk_ppl  (PPL_clk),  // PPL_clk
        .rst      (~rst_n),
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
        .rst(~rst_n),

        .write_addr  ('b0),
        .write_data  ('b0),
        .write_en    ('b0),
        .block_addr  (block_addr),
        .texture_addr(texture_addr),
        .block_id    (block_id),

        .valid     (valid),
        .pixel_addr(pixel_addr_out),

        .data_valid  (data_valid),
        .data_addr   (data_addr),
        .texture_data(texture_data)
    );


    wire [15:0] data_aligned;
    wire        data_aligned_valid;
    align #(
        .H_DISP(H_DISP),
        .V_DISP(V_DISP),
        .N     (16)
    ) align (
        .video_clk (video_clk),
        .PPL_clk   (PPL_clk),
        .rst       (~rst_n),
        .data      (color),
        .data_addr (data_addr),
        .data_valid(data_valid),

        .data_aligned      (data_aligned),
        .data_aligned_valid(data_aligned_valid),
        .data_aligned_vs   (data_aligned_vs)
    );



endmodule
