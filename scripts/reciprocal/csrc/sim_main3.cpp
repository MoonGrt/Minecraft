#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vreciprocal3.h"

#include <cstdio>
#include <cstdint>
#include <cmath>

vluint64_t sim_time = 0;

// 单个时钟周期
void tick(Vreciprocal3* dut, VerilatedVcdC* tfp) {
    dut->clk = 0;
    dut->eval();
    tfp->dump(sim_time++);

    dut->clk = 1;
    dut->eval();
    tfp->dump(sim_time++);
}

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);

    auto* dut = new Vreciprocal3;
    auto* tfp = new VerilatedVcdC;

    dut->trace(tfp, 99);
    tfp->open("build/wave.vcd");

    uint32_t max_err = 0;
    uint64_t err_sum = 0;
    uint32_t cnt = 0;

    // ===== 主测试循环 =====
    for (uint32_t x = 0; x < 4096; x++) {
        dut->x = x;
        tick(dut, tfp);

        uint32_t y_dut = dut->y;
        uint32_t y_ref;

        if (x == 0)
            y_ref = (1u << 24) - 1;
        else
            y_ref = (1u << 18) / x;

        uint32_t err = (y_dut > y_ref) ? (y_dut - y_ref) : (y_ref - y_dut);

        max_err = std::max(max_err, err);
        err_sum += err;
        cnt++;

        // 打印部分样本
        // if ((x & 0x1FF) == 0) {
        //     printf("x=%4u  y_dut=%7u  y_ref=%7u  err=%u\n",
        //            x, y_dut, y_ref, err);
        // }
        if (err > 32) {
            printf("x=%4u  y_dut=%7u  y_ref=%7u  err=%u\n",
                   x, y_dut, y_ref, err);
        }
    }

    printf("\n====== Reciprocal LUT Test ======\n");
    printf("Samples  : %u\n", cnt);
    printf("Max err  : %u (LSB of Q18)\n", max_err);
    printf("Avg err  : %.3f\n", double(err_sum) / cnt);

    tfp->close();
    delete tfp;
    delete dut;

    return 0;
}
