#!/usr/bin/env python3
import math
import argparse
import numpy as np

def fixed_to_float(v, frac):
    return v / (1 << frac)

def float_to_fixed(x, frac):
    return int(round(x * (1 << frac)))

def newton_iter(x, y):
    # y <- y * (2 - x*y)
    return y * (2.0 - x * y)

def analyze(
    addr_bits,
    x_int, x_frac,
    y_int, y_frac,
    newton_steps=0
):
    depth = 1 << addr_bits
    x_width = x_int + x_frac

    abs_err = []
    rel_err = []
    ulp_err = []

    for addr in range(1, depth):
        x_fixed = addr << (x_width - addr_bits)
        x = fixed_to_float(x_fixed, x_frac)

        if x == 0:
            continue

        # LUT 初值（等价 fpga_craft）
        y = 1.0 / x

        # Newton refinement
        for _ in range(newton_steps):
            y = newton_iter(x, y)

        y_fixed = float_to_fixed(y, y_frac)
        y_q = fixed_to_float(y_fixed, y_frac)
        y_true = 1.0 / x

        abs_err.append(abs(y_q - y_true))
        rel_err.append(abs(y_q - y_true) / y_true)
        ulp_err.append(abs(y_q - y_true) * (1 << y_frac))

    print("========== Reciprocal Error Analysis ==========")
    print(f"Newton steps       : {newton_steps}")
    print(f"Samples            : {len(abs_err)}")
    print(f"Max abs error      : {max(abs_err):.6e}")
    print(f"RMS abs error      : {math.sqrt(np.mean(np.square(abs_err))):.6e}")
    print(f"Max relative error : {max(rel_err):.6e}")
    print(f"Max ULP error      : {max(ulp_err):.2f}")
    print("===============================================")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--addr-bits", type=int, default=8)
    ap.add_argument("--x-int", type=int, default=0)
    ap.add_argument("--x-frac", type=int, default=13)
    ap.add_argument("--y-int", type=int, default=4)
    ap.add_argument("--y-frac", type=int, default=16)
    ap.add_argument("--newton", type=int, default=0)
    args = ap.parse_args()

    analyze(
        args.addr_bits,
        args.x_int, args.x_frac,
        args.y_int, args.y_frac,
        args.newton
    )

if __name__ == "__main__":
    main()

'''
python recip_error_analysis.py \
    --addr-bits 8 \
    --x-int 0 --x-frac 13 \
    --y-int 4 --y-frac 15 \
    --newton 1
'''