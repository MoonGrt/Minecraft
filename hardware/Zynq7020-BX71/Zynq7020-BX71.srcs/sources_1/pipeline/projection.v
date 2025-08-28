module projection (
    input  wire [4:0] block_id,
    input  wire [1:0] face,
    output reg  [4:0] texture_id
);

    // projection of block_id and face
    always @(*) begin
        case ({block_id, face})
            'b00000_00: texture_id = 'b00000;
            'b00000_01: texture_id = 'b00000;
            'b00000_10: texture_id = 'b00000;
            'b00001_00: texture_id = 'b00000;
            'b00001_01: texture_id = 'b00000;
            'b00001_10: texture_id = 'b00000;
            'b00010_00: texture_id = 'b00010;
            'b00010_01: texture_id = 'b00011;
            'b00010_10: texture_id = 'b00001;
            'b00011_00: texture_id = 'b00011;
            'b00011_01: texture_id = 'b00011;
            'b00011_10: texture_id = 'b00011;
            'b00100_00: texture_id = 'b00100;
            'b00100_01: texture_id = 'b00100;
            'b00100_10: texture_id = 'b00100;
            'b00101_00: texture_id = 'b00101;
            'b00101_01: texture_id = 'b00101;
            'b00101_10: texture_id = 'b00101;
            'b00110_00: texture_id = 'b00110;
            'b00110_01: texture_id = 'b00110;
            'b00110_10: texture_id = 'b00110;
            'b00111_00: texture_id = 'b00111;
            'b00111_01: texture_id = 'b00111;
            'b00111_10: texture_id = 'b00111;
            'b01000_00: texture_id = 'b01001;
            'b01000_01: texture_id = 'b01000;
            'b01000_10: texture_id = 'b01000;
            'b01001_00: texture_id = 'b01011;
            'b01001_01: texture_id = 'b01010;
            'b01001_10: texture_id = 'b01010;
            'b01010_00: texture_id = 'b01100;
            'b01010_01: texture_id = 'b01100;
            'b01010_10: texture_id = 'b01100;
            'b01011_00: texture_id = 'b01101;
            'b01011_01: texture_id = 'b01101;
            'b01011_10: texture_id = 'b01101;
            'b01100_00: texture_id = 'b01110;
            'b01100_01: texture_id = 'b01110;
            'b01100_10: texture_id = 'b01110;
            'b01101_00: texture_id = 'b01111;
            'b01101_01: texture_id = 'b01111;
            'b01101_10: texture_id = 'b01111;
            'b01110_00: texture_id = 'b10000;
            'b01110_01: texture_id = 'b10000;
            'b01110_10: texture_id = 'b10000;
            'b01111_00: texture_id = 'b10001;
            'b01111_01: texture_id = 'b10001;
            'b01111_10: texture_id = 'b10001;
            'b10000_00: texture_id = 'b10010;
            'b10000_01: texture_id = 'b10010;
            'b10000_10: texture_id = 'b10010;
            'b10001_00: texture_id = 'b10011;
            'b10001_01: texture_id = 'b10011;
            'b10001_10: texture_id = 'b10011;
            'b10010_00: texture_id = 'b10100;
            'b10010_01: texture_id = 'b10100;
            'b10010_10: texture_id = 'b10100;
            'b10011_00: texture_id = 'b10110;
            'b10011_01: texture_id = 'b10111;
            'b10011_10: texture_id = 'b10101;
            'b10100_00: texture_id = 'b11000;
            'b10100_01: texture_id = 'b00111;
            'b10100_10: texture_id = 'b00111;
            'b10101_00: texture_id = 'b11011;
            'b10101_01: texture_id = 'b00111;
            'b10101_10: texture_id = 'b11001;
            'b10110_00: texture_id = 'b11110;
            'b10110_01: texture_id = 'b11100;
            'b10110_10: texture_id = 'b11100;
            'b10111_00: texture_id = 'b11111;
            'b10111_01: texture_id = 'b11111;
            'b10111_10: texture_id = 'b11111;
            default : texture_id = 'b00000;
        endcase
    end

endmodule
