# gen_reciprocal_lut.py

import math

ADDR_BITS = 8
DATA_BITS = 16
FRAC_BITS = 15

DEPTH = 1 << ADDR_BITS

with open("build/recip_lut.mem", "w") as f:
    for i in range(DEPTH):
        # m = 0.5 + i / 512
        m = 0.5 + i / (2.0 * DEPTH)
        y = int(round((1.0 / m) * (1 << FRAC_BITS)))
        # Clamp to max value
        if y >= (1 << DATA_BITS):
            y = (1 << DATA_BITS) - 1
        f.write("{:04X}\n".format(y))
