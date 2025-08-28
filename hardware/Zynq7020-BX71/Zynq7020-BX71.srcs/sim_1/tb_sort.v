module tb_sort;

    // Parameters
    parameter N = 12;
    parameter H_DISP = 8;
    parameter V_DISP = 8;

    // Testbench signals
    reg clk;
    reg rst;
    reg data_valid;
    reg [23:0] data=0;
    reg [19:0] data_addr=0;
    wire [23:0] data_sorted;
    wire data_sorted_valid;

    // Instantiate the ImageBuffer module
    sort1 sort1 (
        .clk(clk),
        .rst(rst),
        .data_valid(data_valid),
        .data(data),
        .data_addr(data_addr),
        .data_sorted(data_sorted),
        .data_sorted_valid(data_sorted_valid)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 20 time units period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        data_valid = 0;
        data = 0;

        // Release reset
        #10;
        rst = 0;
        
        #20;
        // Test cases
        write_pixel(2, 24'h000002);
        write_pixel(3, 24'h000003);
        write_pixel(0, 24'h000000);
        write_pixel(1, 24'h000001);
        #100;
        write_pixel(5, 24'h000005);
        write_pixel(4, 24'h000004);
        write_pixel(9, 24'h000009);
        write_pixel(7, 24'h000007);
        #100;
        write_pixel(8, 24'h000008);
        write_pixel(6, 24'h000006);
        write_pixel(10, 24'h000010);
        write_pixel(12, 24'h000012);
        #100;
        write_pixel(14, 24'h000014);
        write_pixel(13, 24'h000013);
        write_pixel(11, 24'h000011);
        write_pixel(15, 24'h000015);
        #100;
        write_pixel(16, 24'h000016);
        write_pixel(19, 24'h000019);
        write_pixel(18, 24'h000018);
        write_pixel(17, 24'h000017);

        // // Read data
        // read_data();
        
        // Finish simulation
        #100;
    end

    // Task to write pixel data
    task write_pixel(input [19:0] x, input [23:0] data_in);
        begin
            data_valid = 1;
            data_addr = x;
            data = data_in;
            #20;
            data_valid = 0;
        end
    endtask

    // // Task to read output data
    // task read_data;
    //     begin
    //         #10;
    //         if (data_sorted_valid) $display("Output Data: %h", data_sorted);
    //     end
    // endtask

endmodule
