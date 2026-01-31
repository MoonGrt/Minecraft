#include <verilated.h>
#include <verilated_fst_c.h>
#include "VMinecraft.h"

static vluint64_t sim_time = 0;

static void tick(VMinecraft* top, VerilatedFstC* tfp) {
    top->clk = 0;
    top->eval();
    tfp->dump(sim_time++);

    top->clk = 1;
    top->eval();
    tfp->dump(sim_time++);
}

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);

    VMinecraft* top = new VMinecraft;

    // ===== 打开波形 =====
    Verilated::traceEverOn(true);
    VerilatedFstC* tfp = new VerilatedFstC;
    top->trace(tfp, 99);
    tfp->open("build/wave.fst");

    // ===== 复位 =====
    printf("Resetting...\n");
    top->rst = 1;
    tick(top, tfp);
    top->rst = 0;

    // ===== 主仿真 =====
    // VGA 一帧大约 640*480 = 307,200 像素时钟
    printf("Starting simulation...\n");
    for (int i = 0; i < 50000; i++) {
        tick(top, tfp);
    }

    // ===== 结束 =====
    printf("Simulation done!\n");
    tfp->close();
    delete top;
    return 0;
}
