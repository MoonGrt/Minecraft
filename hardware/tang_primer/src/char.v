module char #(
    parameter CLK_FREQ = 45_000_000,  // Hz
    parameter HDISP = 640,
    parameter VDISP = 480
)(
    input  wire clk,
    input  wire rst,
    input  wire frame_vs,

    input  wire        pre_hs,
    input  wire        pre_vs,
    input  wire        pre_de,
    input  wire [15:0] pre_data,

    output  wire        post_hs,
    output  wire        post_vs,
    output  wire        post_de,
    output  wire [15:0] post_data
);

    // 当前像素点坐标
    reg [12:0] hcnt, vcnt;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            hcnt <= 'd0;
            vcnt <= 'd0;
        end else begin
            if (pre_hs) hcnt <= 'd0;
            else if (pre_de) hcnt <= hcnt + 1;
            if (pre_vs) vcnt <= 'd0;
            else if (hcnt == HDISP - 1) vcnt <= vcnt + 1;
        end
    end

    // 根据当前像素点坐标指定当前像素点颜色数据
    localparam WHITE = 24'b11111111_11111111_11111111;  //RGB888 白色
    localparam BLACK = 24'b00000000_00000000_00000000;  //RGB888 黑色
    localparam RED   = 24'b11111111_00000000_00000000;  //RGB888 红色
    localparam GREEN = 24'b00000000_11111111_00000000;  //RGB888 绿色
    localparam BLUE  = 24'b00000000_00000000_11111111;  //RGB888 蓝色
    localparam CHAR_WIDTH  = 16;  // 字符宽度
    localparam CHAR_HEIGHT = 32;  // 字符高度
    localparam CHARNUM     = 10;
    reg [15:0] data;
    reg [511:0] char[14:0];
    reg [6:0] str[CHARNUM:1];
    wire [6:0] ascii = str[hcnt/CHAR_WIDTH+1];
    always @(*) begin
        if(char[ascii][511 - ((hcnt) % CHAR_WIDTH) - ((vcnt) % CHAR_HEIGHT) * CHAR_WIDTH] && 
           (vcnt < CHAR_HEIGHT) && (hcnt < CHAR_WIDTH * CHARNUM))
            data = WHITE;
        else  data = pre_data;
    end



    localparam W = 48;
    reg [W-1:0] clk_cnt, clk_cnt_d;
    reg [W-1:0] fps_x100;

    //--------------------------------------
    // VS 上升沿检测
    //--------------------------------------
    reg  vs_d;
    wire vs_rise = frame_vs & ~vs_d;
    always @(posedge clk or posedge rst) begin
        if (rst) vs_d <= 1'b0;
        else vs_d <= frame_vs;
    end

    //--------------------------------------
    // 帧周期计数 + FPS 计算
    //--------------------------------------
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_cnt   <= 'd0;
            clk_cnt_d <= 'd0;
            fps_x100  <= 'd0;
        end else begin
            clk_cnt <= clk_cnt + 1'b1;
            if (vs_rise) begin
                clk_cnt_d <= clk_cnt;
                clk_cnt   <= 'd0;
                if (clk_cnt != 0) fps_x100 <= (CLK_FREQ * 100) / clk_cnt;
            end
        end
    end

    //--------------------------------------
    // FPS 分解
    //--------------------------------------
    reg [W-1:0] fps_int;
    reg [6:0]   fps_dec;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            fps_int <= 'd0;
            fps_dec <= 'd0;
        end else begin
            fps_int <= fps_x100 / 100;
            fps_dec <= fps_x100 % 100;
        end
    end

    //--------------------------------------
    // 十进制 → ASCII
    //--------------------------------------
    reg [3:0] i_h, i_t, i_o;
    reg [3:0] d_t, d_o;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            i_h <= 'd0;
            i_t <= 'd0;
            i_o <= 'd0;
            d_t <= 'd0;
            d_o <= 'd0;
        end else begin
            i_h <= fps_int / 100;
            i_t <= (fps_int / 10) % 10;
            i_o <= fps_int % 10;
            d_t <= fps_dec / 10;
            d_o <= fps_dec % 10;
        end
    end

    //--------------------------------------
    // 写入字符串
    //--------------------------------------
    always @(*) begin
        str[1]  = 'd10;  // 'F'
        str[2]  = 'd11;  // 'P'
        str[3]  = 'd12;  // 'S'
        str[4]  = 'd13;  // ':'
        str[5]  = i_h;
        str[6]  = i_t;
        str[7]  = i_o;
        str[8]  = 'd14;  // '.'
        str[9]  = d_t;
        str[10] = d_o;
    end


    // output
    assign post_vs = pre_hs;
    assign post_hs = pre_vs;
    assign post_de = pre_de;
    assign post_data = data;

    // char mem
    initial begin
        char[0] = 512'h00000000000000000000000003C006200C30181818181808300C300C300C300C300C300C300C300C300C300C1808181818180C30062003C00000000000000000;  // '0'
        char[1] = 512'h000000000000000000000000008001801F800180018001800180018001800180018001800180018001800180018001800180018003C01FF80000000000000000;  // '1'
        char[2] = 512'h00000000000000000000000007E008381018200C200C300C300C000C001800180030006000C0018003000200040408041004200C3FF83FF80000000000000000;  // '2'
        char[3] = 512'h00000000000000000000000007C018603030301830183018001800180030006003C0007000180008000C000C300C300C30083018183007C00000000000000000;  // '3'
        char[4] = 512'h0000000000000000000000000060006000E000E0016001600260046004600860086010603060206040607FFC0060006000600060006003FC0000000000000000;  // '4'
        char[5] = 512'h0000000000000000000000000FFC0FFC10001000100010001000100013E0143018181008000C000C000C000C300C300C20182018183007C00000000000000000;  // '5'
        char[6] = 512'h00000000000000000000000001E006180C180818180010001000300033E0347038183808300C300C300C300C300C180C18080C180E3003E00000000000000000;  // '6'
        char[7] = 512'h0000000000000000000000001FFC1FFC100830102010202000200040004000400080008001000100010001000300030003000300030003000000000000000000;  // '7'
        char[8] = 512'h00000000000000000000000007E00C301818300C300C300C380C38081E180F2007C018F030783038601C600C600C600C600C3018183007C00000000000000000;  // '8'
        char[9] = 512'h00000000000000000000000007C01820301030186008600C600C600C600C600C701C302C186C0F8C000C0018001800103030306030C00F800000000000000000;  // '9'

        char[10] = 512'h0000000000000000000000007FFC181C180418021802180018001810181018301FF018301810181018101800180018001800180018007E000000000000000000;  // 'F'
        char[11] = 512'h0000000000000000000000007FF01818180C180618061806180618061806180C18181FE01800180018001800180018001800180018007E000000000000000000;  // 'P'
        char[12] = 512'h0000000000000000000000000FC818783018601860086008600070003C001F0007C001F000780018001C400C400C600C200C3018383027E00000000000000000;  // 'S'

        char[13] = 512'h0000000000000000000000000000000000000000000000000000018003C003C001800000000000000000000000000000018003C003C001800000000000000000;  // ':'
        char[14] = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018003C003C0018000000000000000000;  // '.'
    end

endmodule
