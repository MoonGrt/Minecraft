module reciprocal2 (
    input  wire        clk,
    input  wire [15:0] x,   // Q1.15
    output reg  [15:0] y
);

    reg [15:0] lut [0:255];
    wire [4:0] shift;
    wire [15:0] m;
    wire [7:0] addr;

    assign shift = lzd16(x);
    assign m     = x << shift;
    assign addr  = m[14:7];

    initial begin
        $readmemh("./build/recip_lut.mem", lut);
    end

    always @(posedge clk)
        y <= lut[addr] >> shift;

endmodule

function automatic [4:0] lzd16;
    input [15:0] x;
    integer i;
    begin
        lzd16 = 0;
        for (i = 15; i >= 0; i = i - 1)
            if (x[i]) begin
                lzd16 = 5'(15) - i[4:0];
            end
    end
endfunction
