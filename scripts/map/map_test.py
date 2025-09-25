import numpy as np

# 地形尺寸
MAPX, MAPY, MAPZ = 32, 32, 32

# 初始化地形数组
terrain = np.zeros((MAPX, MAPY, MAPZ), dtype=np.uint8)

# 方块类型
AIR = 0
BLK_BEDROCK = 1
BLK_STONE = 2
BLK_GRASS = 3
BLK_DIRT = 4
BLK_COBBLE = 5
BLK_OAK_PLANKS = 6
BLK_OAK_LOG = 7
BLK_OAK_LEAVES = 8
BLK_SAND = 9
BLK_SANDSTONE = 10
BLK_COAL_ORE = 11
BLK_COAL_BLOCK = 12
BLK_IRON_ORE = 13
BLK_IRON_BLOCK = 14
BLK_CRAFTING_TABLE = 15

# 初始化地图数组
terrain = np.zeros((MAPX, MAPY, MAPZ), dtype=int)
ground_height = 15  # 草地高度

def init_test_map(terrain):
    terrain.fill(0)  # 清空地图
    # 1. 填充地面
    for x in range(MAPX):
        for y in range(MAPY):
            for z in range(ground_height - 1):
                terrain[x, y, z] = BLK_STONE
            terrain[x, y, ground_height] = BLK_GRASS
            for z in range(ground_height + 1, MAPZ):
                terrain[x, y, z] = AIR
    # 2. 在地图中心生成一棵 Minecraft 风格树
    center_x = MAPX // 2
    center_y = MAPY // 2
    trunk_height = 5
    leaves_radius = 2
    leaves_height = 2
    # 树干
    for z in range(ground_height + 1, ground_height + trunk_height + 1):
        terrain[center_x, center_y, z] = BLK_OAK_LOG
    # 树叶（球状/方块层叠）
    for z in range(ground_height + trunk_height, ground_height + trunk_height + leaves_height + 1):
        layer_radius = leaves_radius + (ground_height + trunk_height) - z
        if layer_radius < 1:
            layer_radius = 1
        for dx in range(-layer_radius, layer_radius + 1):
            for dy in range(-layer_radius, layer_radius + 1):
                ax = center_x + dx
                ay = center_y + dy
                if ax < 0 or ax >= MAPX or ay < 0 or ay >= MAPY:
                    continue
                # 不覆盖树干位置
                if not (dx == 0 and dy == 0 and z <= ground_height + trunk_height):
                    terrain[ax, ay, z] = BLK_OAK_LEAVES
    # 3. 底层基岩
    for x in range(MAPX):
        for y in range(MAPY):
            terrain[x, y, 0] = BLK_BEDROCK
    # 4. 放几个矿石块作演示
    terrain[10, 10, 16] = BLK_COAL_ORE
    terrain[12,  9, 16] = BLK_IRON_ORE
    terrain[20, 20, 16] = BLK_COAL_BLOCK
    terrain[21, 20, 16] = BLK_IRON_BLOCK


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
        filename = f'output/map_test.{filetype}'
        if datatype == 'bin':
            header = "memory_initialization_radix=2;\nmemory_initialization_vector="
        elif datatype == 'hex':
            header = "memory_initialization_radix=16;\nmemory_initialization_vector="
    elif filetype == 'mi':  # Gowin MI 文件
        filename = f'output/map_test.{filetype}'
        if datatype == 'bin':
            header = f"#File_format=Bin\n#Address_depth={MAPX*MAPY*MAPZ}\n#Data_width={bitwidth}"
        elif datatype == 'hex':
            header = f"#File_format=Hex\n#Address_depth={MAPX*MAPY*MAPZ}\n#Data_width={bitwidth}"
    elif filetype == 'c':  # C语言数组
        filename = f'output/map_test.c'
        header = None
    else:  # 纯文本输出
        filename = f'output/map_test.{datatype}'
        header = None

    with open(filename, 'w') as f:
        all_lines = []
        if header:
            print(header, file=f)
        # === C语言模式，检测是否需要打包 ===
        pack_two = (filetype == 'c' and bitwidth == 4)
        if filetype == 'c':
            if pack_two:
                c_z_size = math.ceil(MAPZ / 2)  # 打包后长度
                f.write(f"const uint8_t MAP[{MAPX}][{MAPY}][{c_z_size}] = {{\n")
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


init_test_map(terrain)
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
        for k in range(14, 24):
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
