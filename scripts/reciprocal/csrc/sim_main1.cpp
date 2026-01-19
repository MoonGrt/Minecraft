#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vreciprocal1.h"
#include <cstdio>
#include <cmath>

static vluint64_t sim_time = 0;

double fixed_to_double(uint16_t v, int frac) {
    return (double)v / (1 << frac);
}

uint16_t double_to_fixed(double v, int frac) {
    return (uint16_t)std::round(v * (1 << frac));
}

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);

    // ===============================
    // Instantiate DUT
    // ===============================
    Vreciprocal1 *dut = new Vreciprocal1;

    // ===============================
    // Enable tracing
    // ===============================
    Verilated::traceEverOn(true);
    VerilatedVcdC *tfp = new VerilatedVcdC;
    dut->trace(tfp, 99);
    tfp->open("build/wave.vcd");

    // ===============================
    // Reset
    // ===============================
    dut->clk = 0;
    dut->rst = 1;
    dut->eval();
    sim_time++;

    dut->clk = 1;
    dut->eval();
    sim_time++;

    dut->rst = 0;

    // ===============================
    // Test parameters
    // ===============================
    const int X_FRAC = 13;
    const int Y_FRAC = 16;

    for (int i = 1; i < 32; i++) {
        double x = (double)i / 16.0;
        uint16_t x_fixed = double_to_fixed(x, X_FRAC);

        dut->in_valid = 1;
        dut->x = x_fixed;

        // rising edge
        dut->clk = 0;
        dut->eval();
        tfp->dump(sim_time++);

        dut->clk = 1;
        dut->eval();
        tfp->dump(sim_time++);

        // wait for valid
        while (!dut->out_valid) {
            dut->clk = 0;
            dut->eval();
            tfp->dump(sim_time++);

            dut->clk = 1;
            dut->eval();
            tfp->dump(sim_time++);
        }

        uint16_t y_fixed = dut->y;
        double y = fixed_to_double(y_fixed, Y_FRAC);
        double y_ref = 1.0 / x;

        double err = y - y_ref;

        printf("x=%.4f y=%f ref=%f err=%f\n", x, y, y_ref, err);

        dut->in_valid = 0;
    }

    // ===============================
    // Finish
    // ===============================
    tfp->close();
    delete tfp;
    delete dut;

    printf("Simulation done, waveform saved to wave.vcd\n");
    return 0;
}
