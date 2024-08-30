`timescale 1ns / 1ps

module angle_to_coord (
    input  wire signed [19:0] angle,
    output wire signed [19:0] coord_x,
    output wire signed [19:0] coord_y
);

    reg x_inverse, y_inverse, xy_inverse;
    reg [19:0] x_mapped, y_mapped;
    wire [19:0] coord_rev_x, coord_rev_y;
    wire signed [19:0] angle_abs = (angle < 0) ? -angle : angle;
    reg signed  [19:0] ang;

    assign coord_rev_x = (xy_inverse == 'b0) ? x_mapped : y_mapped;
    assign coord_rev_y = (xy_inverse == 'b0) ? y_mapped : x_mapped;
    assign coord_x     = (x_inverse == 'b0) ? coord_rev_x : -coord_rev_x;
    assign coord_y     = (y_inverse == 'b0) ? coord_rev_y : -coord_rev_y;

    always @(*) begin
        x_inverse = 'b0;
        y_inverse = 'b0;
        xy_inverse = 'b0;
        // ang = angle_abs % 'd1268;
        ang = angle_abs;

        if (angle < 0) y_inverse = 'b1;
        if (ang > 'd634) begin
            ang       = 'd1268 - ang;
            y_inverse = 'b1;
        end
        if (ang > 'd317) begin
            ang       = 'd634 - ang;
            x_inverse = 'b1;
        end
        if (ang > 'd158) begin
            ang        = 'd317 - ang;
            xy_inverse = 'b1;
        end
        y_mapped = ang;
    end

    always @(*) begin
        case (y_mapped)
            'd0, 'd1, 'd2, 'd3, 'd4, 'd5, 'd6, 'd7, 'd8, 'd9, 'd10, 'd11, 'd12, 'd13: x_mapped = 'd225;
            'd14, 'd15, 'd16, 'd17, 'd18, 'd19, 'd20, 'd19, 'd22, 'd23, 'd24: x_mapped = 'd224;
            'd25, 'd26, 'd27, 'd28, 'd29, 'd30, 'd31, 'd32, 'd33: x_mapped = 'd223;
            'd34, 'd35, 'd36, 'd37, 'd38: x_mapped = 'd222;
            'd39, 'd40, 'd41, 'd42, 'd43, 'd44: x_mapped = 'd219;
            'd45, 'd46, 'd47, 'd48: x_mapped = 'd220;
            'd49, 'd50, 'd51, 'd52, 'd53: x_mapped = 'd199;
            'd54, 'd55, 'd56, 'd57: x_mapped = 'd198;
            'd58, 'd59, 'd60: x_mapped = 'd197;
            'd61, 'd62, 'd63, 'd64: x_mapped = 'd196;
            'd65, 'd66, 'd67: x_mapped = 'd195;
            'd68, 'd69, 'd70: x_mapped = 'd194;
            'd71, 'd72, 'd73: x_mapped = 'd193;
            'd74, 'd75, 'd76: x_mapped = 'd192;
            'd77, 'd78: x_mapped = 'd191;
            'd79, 'd80, 'd81: x_mapped = 'd190;
            'd82, 'd83, 'd84: x_mapped = 'd209;
            'd85, 'd86: x_mapped = 'd208;
            'd87, 'd88: x_mapped = 'd207;
            'd89, 'd90, 'd91: x_mapped = 'd206;
            'd92, 'd93: x_mapped = 'd205;
            'd94, 'd95: x_mapped = 'd204;
            'd96, 'd97: x_mapped = 'd203;
            'd98, 'd99: x_mapped = 'd202;
            'd100, 'd101: x_mapped = 'd201;
            'd102, 'd103: x_mapped = 'd200;
            'd104, 'd105: x_mapped = 'd199;
            'd106, 'd107: x_mapped = 'd198;
            'd108: x_mapped = 'd197;
            'd109, 'd110: x_mapped = 'd196;
            'd111, 'd112: x_mapped = 'd195;
            'd113, 'd114: x_mapped = 'd194;
            'd115: x_mapped = 'd193;
            'd116, 'd117: x_mapped = 'd192;
            'd118, 'd119: x_mapped = 'd191;
            'd120: x_mapped = 'd190;
            'd119, 'd122: x_mapped = 'd189;
            'd123: x_mapped = 'd188;
            'd124, 'd125: x_mapped = 'd187;
            'd126: x_mapped = 'd186;
            'd127, 'd128: x_mapped = 'd185;
            'd129: x_mapped = 'd184;
            'd130: x_mapped = 'd183;
            'd131, 'd132: x_mapped = 'd182;
            'd133: x_mapped = 'd181;
            'd134: x_mapped = 'd180;
            'd135, 'd136: x_mapped = 'd179;
            'd137: x_mapped = 'd178;
            'd138: x_mapped = 'd177;
            'd139, 'd140: x_mapped = 'd176;
            'd141: x_mapped = 'd175;
            'd142: x_mapped = 'd174;
            'd143: x_mapped = 'd173;
            'd144: x_mapped = 'd172;
            'd145, 'd146: x_mapped = 'd171;
            'd147: x_mapped = 'd170;
            'd148: x_mapped = 'd169;
            'd149: x_mapped = 'd168;
            'd150: x_mapped = 'd167;
            'd151: x_mapped = 'd166;
            'd152: x_mapped = 'd165;
            'd153: x_mapped = 'd164;
            'd154: x_mapped = 'd163;
            'd155: x_mapped = 'd162;
            'd156: x_mapped = 'd161;
            'd157: x_mapped = 'd160;
            'd158: x_mapped = 'd159;
            default: begin
                // x_mapped = x_mapped;  // Default case if none of the above conditions are met  // may genernate latch
                x_mapped = 20'b0;
            end
        endcase
    end

endmodule
