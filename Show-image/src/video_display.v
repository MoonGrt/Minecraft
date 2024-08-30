module video_display
#(
    parameter H_DISP = 12'd800,        //分辨率--行
    parameter V_DISP = 12'd480        //分辨率--列
)(
    input                pixel_clk,
    input                sys_rst_n,
    
    input        [11:0]  pixel_xpos,  //像素点横坐标
    input        [11:0]  pixel_ypos,  //像素点纵坐标
    output  reg  [23:0]  pixel_data  //像素点数据
);

//parameter define
localparam WHITE  = 24'b11111111_11111111_11111111;  //RGB888 白色
localparam BLACK  = 24'b00000000_00000000_00000000;  //RGB888 黑色
localparam RED    = 24'b11111111_00000000_00000000;  //RGB888 红色
localparam GREEN  = 24'b00000000_11111111_00000000;  //RGB888 绿色
localparam BLUE   = 24'b00000000_00000000_11111111;  //RGB888 蓝色

//*****************************************************
//**                    main code
//*****************************************************

wire [7:0] data_addr;
assign data_addr = pixel_xpos % 16 + (pixel_ypos % 16) * 16;
wire [23:0] data;

Gowin_pROM Gowin_pROM(
    .dout(data),      //output [23:0] dout 
    .clk(pixel_clk),        //input clk
    .oce(1'b1),        //input oce
    .ce(1'b1),          //input ce
    .reset(1'b0),    //input reset
    .ad(data_addr)           //input [7:0] ad
);

//根据当前像素点坐标指定当前像素点颜色数据，在屏幕上显示彩条
always @(posedge pixel_clk) begin
    if (!sys_rst_n)
        pixel_data <= 16'd0;
    else begin
        pixel_data <= data;
    end
end

endmodule
