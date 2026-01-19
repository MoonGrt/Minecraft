#!/usr/bin/env python3
import argparse, os
import math

def fixed_to_float(v, frac):
    return v / (1 << frac)

def float_to_fixed(x, frac):
    return int(round(x * (1 << frac)))

def gen_lut(
    addr_bits,
    x_int, x_frac,
    y_int, y_frac,
    skip_zero=True
):
    depth = 1 << addr_bits
    x_width = x_int + x_frac
    y_width = y_int + y_frac

    lut = []

    for addr in range(depth):
        # reconstruct x from address (use mid-point)
        x_fixed = addr << (x_width - addr_bits)
        if skip_zero and x_fixed == 0:
            y_fixed = (1 << y_width) - 1
        else:
            x_real = fixed_to_float(x_fixed, x_frac)
            if x_real == 0:
                y_fixed = (1 << y_width) - 1
            else:
                y_real = 1.0 / x_real
                y_fixed = float_to_fixed(y_real, y_frac)

        # saturation
        max_y = (1 << y_width) - 1
        y_fixed = min(max(y_fixed, 0), max_y)

        lut.append(y_fixed)

    return lut, y_width

def write_mem(lut, width, fname):
    with open(fname, "w") as f:
        for v in lut:
            f.write(f"{v:0{width//4}x}\n")

def write_coe(lut, width, fname):
    with open(fname, "w") as f:
        f.write("memory_initialization_radix=16;\n")
        f.write("memory_initialization_vector=\n")
        for i, v in enumerate(lut):
            sep = "," if i != len(lut) - 1 else ";"
            f.write(f"{v:0{width//4}x}{sep}\n")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--addr-bits", type=int, default=8)
    ap.add_argument("--x-int", type=int, default=4)
    ap.add_argument("--x-frac", type=int, default=12)
    ap.add_argument("--y-int", type=int, default=4)
    ap.add_argument("--y-frac", type=int, default=16)
    ap.add_argument("--width", type=int, default=16)
    ap.add_argument("--format", choices=["mem", "coe"], default="mem")
    ap.add_argument("--out", default="build/recip_lut")
    args = ap.parse_args()

    lut = gen_lut(args.addr_bits, args.x_int, args.x_frac, args.y_int, args.y_frac)[0]

    if args.format == "mem":
        write_mem(lut, args.width, args.out + ".mem")
    else:
        write_coe(lut, args.width, args.out + ".coe")

    print(f"Generated {args.out}.{args.format}")


if __name__ == "__main__":
    main()

'''
Vivado .coe file generation example:
python gen_recip_lut.py \
    --addr-bits 8 \
    --x-int 0 \
    --x-frac 13 \
    --y-int 4 \
    --y-frac 15 \
    --width 16 \
    --format coe \
    --out recip_lut

Quartus .mem file generation example:
python gen_recip_lut.py \
    --addr-bits 8 \
    --x-int 0 \
    --x-frac 13 \
    --y-int 4 \
    --y-frac 15 \
    --width 16 \
    --format mem \
    --out recip_lut
'''