# gen_reciprocal_lut.py

import math

ADDR_BITS = 8
DATA_BITS = 16
# FRAC_BITS = 15
FRAC_BITS = 12

DEPTH = 1 << ADDR_BITS

with open("build/recip_lut.mem", "w") as f:
    for i in range(DEPTH):
        # i=0 -> m=0.5, i=255 -> m≈0.9961
        m = 0.5 + i / 256.0  # 注意除 256 而不是 512
        y = int(round((1.0 / m) * (1 << FRAC_BITS)))
        # 饱和保护
        if y >= (1 << DATA_BITS):
            y = (1 << DATA_BITS) - 1
        f.write("{:04X}\n".format(y))
