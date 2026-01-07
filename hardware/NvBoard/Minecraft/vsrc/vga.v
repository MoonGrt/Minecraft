`timescale 1ns / 1ps

module vga (
    input clk,   // 时钟
    input rstn,  // 复位信号，低有效

    // VGA 时序参数输入
    input [11:0] I_h_total   ,  // hor total time 
    input [11:0] I_h_sync    ,  // hor sync time
    input [11:0] I_h_bporch  ,  // hor back porch
    input [11:0] I_h_res     ,  // hor resolution
    input [11:0] I_v_total   ,  // ver total time 
    input [11:0] I_v_sync    ,  // ver sync time  
    input [11:0] I_v_bporch  ,  // ver back porch  
    input [11:0] I_v_res     ,  // ver resolution 

    // 像素点坐标输出
    input  [15:0] pixel,  // 像素数据
    output [18:0] addr,   // 像素地址
    // RGB LCD接口
    output        vs,  // 场同步信号
    output        hs,  // 行同步信号
    output        de,  // VGA 数据使能信号
    output [7:0]  r,   // 红色分量
    output [7:0]  g,   // 绿色分量
    output [7:0]  b    // 蓝色分量
);

    // 寄存器定义
    reg  [11:0] h_cnt = 0; // 行计数器
    reg  [11:0] v_cnt = 0; // 场计数器
    wire [10:0] x, y;      // 当前像素点坐标
    assign addr = y * I_h_res + x;

    // 网线定义
    wire        data_req; // 数据请求信号
    wire        h_valid;  // 水平有效信号
    wire        v_valid;  // 垂直有效信号

    // 使能数据输出
    assign hs = !(h_cnt < I_h_sync);
    assign vs = !(v_cnt < I_v_sync);

    assign h_valid = (h_cnt >= I_h_sync) && (h_cnt < I_h_sync + I_h_bporch + I_h_res);
    assign v_valid = (v_cnt >= I_v_sync) && (v_cnt < I_v_sync + I_v_bporch + I_v_res);

    assign de = h_valid && (v_cnt >= (I_v_sync + I_v_bporch)) && (v_cnt < (I_v_sync + I_v_bporch + I_v_res));

    // 请求像素点颜色数据输入
    assign data_req = (h_cnt >= (I_h_sync - 1)) && (h_cnt < (I_h_sync + I_h_bporch + I_h_res - 1)) &&
                       (v_cnt >= I_v_sync) && (v_cnt < (I_v_sync + I_v_bporch + I_v_res));

    // 像素点坐标
    assign x = data_req ? (h_cnt - (I_h_sync + I_h_bporch - 1)) : 11'd0;
    assign y = data_req ? (v_cnt - (I_v_sync + I_v_bporch - 1)) : 11'd0;

    // 像素数据输出
    assign r = {pixel[15:11], 3'b0}; // 红色分量
    assign g = {pixel[10:5], 2'b0}; // 绿色分量
    assign b = {pixel[4:0], 3'b0}; // 蓝色分量

    // 时序控制
    always @(posedge clk) begin
        if (h_cnt == I_h_total) begin
            h_cnt <= 'b0;
            v_cnt <= (v_cnt == I_v_total) ? 'b0 : v_cnt + 'b1;
        end else begin
            h_cnt <= h_cnt + 1'b1;
        end
    end

endmodule
