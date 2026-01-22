# Integer division lut

# X_BITS = 13
# OUT_BITS = 24
# SHIFT = 18

# DEPTH = 1 << X_BITS

# with open("build/div_lut.hex", "w") as f:
#     for x in range(DEPTH):
#         if x == 0:
#             y = (1 << OUT_BITS) - 1  # 除0 → 饱和
#         else:
#             y = (1 << SHIFT) // x  # 整数除法
#         if y >= (1 << OUT_BITS):
#             y = (1 << OUT_BITS) - 1
#         f.write("{:06X}\n".format(y))


SHIFT = 18
OUT_BITS = 224

with open("build/div_lut.hex", "w") as f:
    for addr in range(1024):
        vals = []
        for k in range(8):
            x = (addr << 3) + k
            if x != 0:
                vals.append((1 << SHIFT) / x)

        if not vals:
            y = (1 << OUT_BITS) - 1
        else:
            y = int(round((max(vals) + min(vals)) / 2))

        y = min(y, (1 << OUT_BITS) - 1)
        f.write("{:06X}\n".format(y))
