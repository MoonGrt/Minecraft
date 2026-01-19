#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vreciprocal2.h"

#include <cmath>
#include <cstdio>
#include <cstdint>

vluint64_t sim_time = 0;

double q15_to_double(uint16_t v) {
    return (double)v / (1 << 15);
}

uint16_t double_to_q15(double v) {
    return (uint16_t)std::round(v * (1 << 15));
}

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);

    Vreciprocal2 *dut = new Vreciprocal2;

    // ===== VCD =====
    Verilated::traceEverOn(true);
    VerilatedVcdC *tfp = new VerilatedVcdC;
    dut->trace(tfp, 99);
    tfp->open("build/wave.vcd");

    double max_err = 0.0;
    double err_sq_sum = 0.0;
    int    err_cnt = 0;

    // ===== reset-like initial clock =====
    dut->clk = 0;
    dut->eval();
    tfp->dump(sim_time++);

    // ===== sweep input =====
    for (uint32_t xi = 1; xi < 0x8000; xi += 17) {
        // Q1.15, avoid 0
        dut->x = xi;

        // clock rising
        dut->clk = 1;
        dut->eval();
        tfp->dump(sim_time++);

        // clock falling
        dut->clk = 0;
        dut->eval();
        tfp->dump(sim_time++);

        // ===== reference =====
        double x_real = q15_to_double(xi);
        double y_ref  = 1.0 / x_real;
        double y_dut  = q15_to_double(dut->y);

        double err = y_dut - y_ref;

        max_err = std::max(max_err, std::abs(err));
        err_sq_sum += err * err;
        err_cnt++;

        if ((xi & 0x0FFF) == 0) {
            printf("x=%f  y_ref=%f  y_dut=%f  err=%e\n",
                   x_real, y_ref, y_dut, err);
        }
    }

    double rms_err = std::sqrt(err_sq_sum / err_cnt);

    printf("\n====== Error Report ======\n");
    printf("Samples   : %d\n", err_cnt);
    printf("Max Error : %.8e\n", max_err);
    printf("RMS Error : %.8e\n", rms_err);

    tfp->close();
    delete tfp;
    delete dut;
    return 0;
}
