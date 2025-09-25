import numpy as np
import opensimplex


# 初始化噪声对象
noise = opensimplex.OpenSimplex(seed=233)

# 地形尺寸
MAPX, MAPY, MAPZ = 32, 32, 32

def is_coord_valid(x, y, z):
    if x < 0 or x >= MAPX:
        return False
    if y < 0 or y >= MAPY:
        return False
    if z < 0 or z >= MAPZ:
        return False
    return True

# 初始化地形数组
terrain = np.zeros((MAPX, MAPY, MAPZ), dtype=np.uint8)

# 定义地表高度
ground_offset = 8

# 生成地形
for x in range(MAPX):
    for y in range(MAPY):
        # 计算噪声值
        noise_val = noise.noise2(x / 20, y / 20)
        # 将噪声值转化为高度
        height = int((noise_val + 1) * 6) + ground_offset
        # 设置草方块
        for z in range(height, height + 2):
            terrain[x][y][z] = 3 # 草方块
        # 设置树
        if np.random.random() < 0.01:
            for z in range(height + 2, height + 7):
                if is_coord_valid(x, y, z):
                    terrain[x][y][z] = 7 # 树干
            for xx in range(x - 3, x + 4):
                for yy in range(y - 3, y + 4):
                    if abs(xx - x) + abs(yy - y) < 3:
                        for zz in range(height + 7, height + 9):
                            if is_coord_valid(xx, yy, zz):
                                terrain[xx][yy][zz] = 8 # 树叶
        # 设置下方方块类型
        for z in range(height - 1, -1, -1):
            if z > 1:
                terrain[x][y][z] = 4 # 泥土
            else:
                terrain[x][y][z] = 2 # 石头

# 设置基岩
for x in range(MAPX):
    for y in range(MAPY):
        terrain[x][y][0] = 1 # 基岩




# 打印地形数组
# 打印地形数组
def write_map(terrain, MAPX, MAPY, MAPZ, filetype='coe', datatype='bin', bitwidth=4):
    """通用地图文件输出函数
    terrain: 三维地形数组
    filetype: 'coe' / 'mi' / 'c' / None
    datatype: 'bin' / 'hex'
    bitwidth: 每个地块所需位宽 (默认为4位，支持16种方块)
    """
    import math

    # 选择文件名和头
    if filetype == 'coe':  # Xilinx COE 文件
        filename = f'output/map.{filetype}'
        if datatype == 'bin':
            header = "memory_initialization_radix=2;\nmemory_initialization_vector="
        elif datatype == 'hex':
            header = "memory_initialization_radix=16;\nmemory_initialization_vector="
    elif filetype == 'mi':  # Gowin MI 文件
        filename = f'output/map.{filetype}'
        if datatype == 'bin':
            header = f"#File_format=Bin\n#Address_depth={MAPX*MAPY*MAPZ}\n#Data_width={bitwidth}"
        elif datatype == 'hex':
            header = f"#File_format=Hex\n#Address_depth={MAPX*MAPY*MAPZ}\n#Data_width={bitwidth}"
    elif filetype == 'c':  # C语言数组
        filename = f'output/map.c'
        header = None
    else:  # 纯文本输出
        filename = f'output/map.{datatype}'
        header = None

    with open(filename, 'w') as f:
        all_lines = []
        if header:
            print(header, file=f)

        # === C语言模式，检测是否需要打包 ===
        pack_two = (filetype == 'c' and bitwidth == 4)
        if filetype == 'c':
            if pack_two:
                c_MAPZ = math.ceil(MAPZ / 2)  # 打包后长度
                f.write(f"const uint8_t MAP[{MAPX}][{MAPY}][{c_MAPZ}] = {{\n")
            else:
                c_bitwidth = max(8, ((bitwidth + 7) // 8) * 8)
                f.write(f"const uint{c_bitwidth}_t MAP[{MAPX}][{MAPY}][{MAPZ}] = {{\n")

        for i in range(MAPX):
            if filetype == 'c':
                f.write("  {\n")
            for j in range(MAPY):
                if filetype == 'c':
                    f.write("    { ")
                if pack_two:
                    # 每两个4bit打包成一个uint8_t
                    packed_bytes = []
                    for k in range(0, MAPZ, 2):
                        v1 = int(terrain[i, j, k])
                        v2 = int(terrain[i, j, k+1]) if k+1 < MAPZ else 0
                        byte_val = (v2 << 4) | v1
                        if datatype == 'bin':
                            packed_bytes.append(f"0b{byte_val:08b}")
                        else:
                            packed_bytes.append(f"0x{byte_val:02X}")
                    f.write(", ".join(packed_bytes))
                else:
                    for k in range(MAPZ):
                        v = int(terrain[i, j, k])
                        if datatype == 'bin':
                            val_str = format(v, f'0{bitwidth}b')
                            if filetype == 'c':
                                val_str = f"0b{val_str}"
                        elif datatype == 'hex':
                            hexwidth = (bitwidth + 3) // 4
                            val_str = format(v, f'0{hexwidth}X')
                            if filetype == 'c':
                                val_str = f"0x{val_str}"
                        else:
                            raise ValueError(f"Unsupported datatype: {datatype}")
                        if filetype == 'c':
                            sep = ", " if k < MAPZ - 1 else ""
                            f.write(val_str + sep)
                        else:
                            all_lines.append(val_str)
                if filetype == 'c':
                    f.write(" }" + ("," if j < MAPY - 1 else "") + "\n")
            if filetype == 'c':
                f.write("  }" + ("," if i < MAPX - 1 else "") + "\n")

        # 写入文件
        if filetype == 'coe':
            for i, line in enumerate(all_lines):
                sep = ',' if i < len(all_lines) - 1 else ';'
                f.write(line + sep + '\n')
        elif filetype not in ('c',):
            for line in all_lines:
                f.write(line + '\n')
        elif filetype == 'c':
            f.write("};\n")


write_map(terrain, MAPX, MAPY, MAPZ, filetype='coe', datatype='bin', bitwidth=4)
write_map(terrain, MAPX, MAPY, MAPZ, filetype='mi', datatype='hex', bitwidth=4)
write_map(terrain, MAPX, MAPY, MAPZ, filetype=None, datatype='bin', bitwidth=4)
write_map(terrain, MAPX, MAPY, MAPZ, filetype='c', datatype='bin', bitwidth=4)
print("Map generation and output files completed!")


# 可视化地形
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt

# 创建一个新的3D图形
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
# 遍历数组中所有非零元素，将其添加到图形中
X, Y, Z = [], [], []
for i in range(32):
    for j in range(32):
        for k in range(12, 32):
            if terrain[i, j, k] != 0:
                X.append(i)
                Y.append(j)
                Z.append(k)
ax.scatter(X, Y, Z, color='b', s=1)
# 设置坐标轴标签和范围
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
ax.set_xlim(0, MAPX)
ax.set_ylim(0, MAPY)
ax.set_zlim(0, MAPZ)
# 显示图形
plt.show()


# Minecraft 方块集合
# Block & Texture: MIN
#   Empty(0):           x;
#   Bedrock(1):         0;
#   Stone(2):           1;
#   Grass(3):           2(top), 3(side);
#   Dirt(4):            4;
#   Cobblestone(5):     5;
#   Oak Planks(6):      6;
#   Oak Log(7):         7(top, bottom), 8(side);
#   Oak Leaves(8):      9;
#   Sand(9):            10;
#   Sandstone(10):      11(top), 12(side);
#   Coal Ore(11):       13;
#   Coal Block(12):     14;
#   Iron Ore(13):       15;
#   Iron Block(14):     16;
#   Crafting Table(15): 17(top, bottom), 18(front), 19(side);
# Block & Texture: MID
#   gravel(16):         20;
#   Birch Planks(17):   21;
#   Birch Log(18):      22(top, bottom), 23(side);
#   Birch Leaves(19):   24;
#   Melon(20):          25(top, bottom), 26(side);
#   Gold Ore(21):       27;
#   Gold Block(22):     28;
#   Diamond Ore(23):    29;
#   Diamond Block(24):  30;
#   Ice(25):            31;
#   Water(26):          32;
#   Glass(27):          33;
#   Furnace(28):        34(top, bottom), 35(front), 36(side);
#   Bookshelf(29):      27;
#   Bricks(30):         38;
#   Stone Bricks(31):   39;
