#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vreciprocal2.h"

#include <cmath>
#include <cstdint>
#include <cstdio>
#include <algorithm>

vluint64_t sim_time = 0;

// ----------------------------
// Q4.12 helpers
// ----------------------------
static inline double q4_12_to_double(uint16_t v) {
    return (double)v / (1 << 12);
}

static inline uint16_t double_to_q4_12(double v) {
    return (uint16_t)std::round(v * (1 << 12));
}

static inline void tick(Vreciprocal2 *dut,
                        VerilatedVcdC *tfp) {
    dut->clk = 0;
    dut->eval();
    tfp->dump(sim_time++);

    dut->clk = 1;
    dut->eval();
    tfp->dump(sim_time++);
}

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);

    auto *dut = new Vreciprocal2;

    // ----------------------------
    // VCD
    // ----------------------------
    Verilated::traceEverOn(true);
    auto *tfp = new VerilatedVcdC;
    dut->trace(tfp, 99);
    tfp->open("build/wave.vcd");

    double max_err = 0.0;
    double err_sq  = 0.0;
    int    samples = 0;

    // ----------------------------
    // initial tick
    // ----------------------------
    dut->x = 0;
    tick(dut, tfp);

    // ----------------------------
    // sweep input
    // x ∈ (0, 8.0]
    // ----------------------------
    for (uint32_t xi = 1; xi <= (8 << 12); xi += 7) {
        dut->x = xi;          // Q4.12 input
        tick(dut, tfp);       // 1-cycle latency

        double x_real = q4_12_to_double(xi);
        double y_ref  = 1.0 / x_real;
        double y_dut  = q4_12_to_double(dut->y);

        double err = y_dut - y_ref;

        max_err = std::max(max_err, std::abs(err));
        err_sq += err * err;
        samples++;

        // periodic print
        if ((xi & 0x3FF) == 0) {
            printf("x=%7.4f  y_ref=%9.6f  y_dut=%9.6f  err=%+.3e\n",
                   x_real, y_ref, y_dut, err);
        }
    }

    double rms_err = std::sqrt(err_sq / samples);

    printf("\n========== Q4.12 Reciprocal Report ==========\n");
    printf("Samples   : %d\n", samples);
    printf("Max Error : %.6e\n", max_err);
    printf("RMS Error : %.6e\n", rms_err);

    tfp->close();
    delete tfp;
    delete dut;
    return 0;
}
