import numpy as np
import opensimplex
import cv2


# 初始化噪声对象
noise = opensimplex.OpenSimplex(seed=233)

# 地形尺寸
x_size, y_size, z_size = 32, 32, 32

def is_coord_valid(x, y, z):
    if x < 0 or x >= x_size:
        return False
    if y < 0 or y >= y_size:
        return False
    if z < 0 or z >= z_size:
        return False
    return True

# 初始化地形数组
terrain = np.zeros((x_size, y_size, z_size), dtype=np.uint8)

# 定义地表高度和草方块的id
ground_offset = 8
grass_block = 2

# 生成地形
for x in range(x_size):
    for y in range(y_size):
        # 计算噪声值
        noise_val = noise.noise2(x / 20, y / 20)
        # 将噪声值转化为高度
        height = int((noise_val + 1) * 6) + ground_offset
        # 设置草方块
        for z in range(height, height + 2):
            terrain[x][y][z] = grass_block
        # 设置树
        if np.random.random() < 0.01:
            for z in range(height + 2, height + 7):
                if is_coord_valid(x, y, z):
                    terrain[x][y][z] = 8
            for xx in range(x - 3, x + 4):
                for yy in range(y - 3, y + 4):
                    if abs(xx - x) + abs(yy - y) < 3:
                        for zz in range(height + 7, height + 9):
                            if is_coord_valid(xx, yy, zz):
                                terrain[xx][yy][zz] = 10
        # 设置下方方块类型
        for z in range(height - 1, -1, -1):
            if z > 1:
                terrain[x][y][z] = 3
            else:
                terrain[x][y][z] = 1

# 设置基岩
for x in range(x_size):
    for y in range(y_size):
        for z in range(2):
            terrain[x][y][z] = 5

# 打印地形数组
f = open('map_test.coe', mode='w')
print('memory_initialization_radix=2;\nmemory_initialization_vector=', file=f)
for i in range(x_size):
    for j in range(y_size):
        for k in range(z_size):
            v = terrain[i, j, k]
            print('{0:05b},'.format(v), file=f)
f.close()


from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt

# 创建一个新的3D图形
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

# 遍历数组中所有非零元素，将其添加到图形中
X, Y, Z = [], [], []
for i in range(32):
    for j in range(32):
        for k in range(15, 32):
            if terrain[i, j, k] != 0:
                X.append(i)
                Y.append(j)
                Z.append(k)
ax.scatter(X, Y, Z, color='b', s=1)

# 设置坐标轴标签和范围
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
ax.set_xlim(0, 64)
ax.set_ylim(0, 64)
ax.set_zlim(0, 32)

# 显示图形
plt.show()





# Block & Texture:
#     Empty(0):           x;
#     Stone(1):           0;
#     Grass(2):           1(top);
#     Dirt(3):            3;
#     Cobblestone(4):     4;
#     Bedrock(5):         5;
#     Birch Planks(6):    6;
#     Oak Planks(7):      7;
#     Birch Log(8):       9(side);
#     Oak Log(9):         11(side);
#     Birch Leaves(10):   12;
#     Sand(11):           14;
#     Iron Block(12):     16;
#     Gold Block(13):     17;
#     Diamond Block(14):  18;14
#     Smooth Stone(15):   19;
#     Bricks(16):         20;


# Note:
#     front - X_P
#     top - Z_P
#
# Block & Texture:
#     Empty(0):           x;
#     Stone(1):           0;
#     Grass(2):           1(top), 2(side), 3(bottom);
#     Dirt(3):            3;
#     Cobblestone(4):     4;
#     Bedrock(5):         5;
#     Birch Planks(6):    6;
#     Oak Planks(7):      7;
#     Birch Log(8):       8(top, bottom), 9(side);
#     Oak Log(9):         10(top, bottom), 11(side);
#     Birch Leaves(10):   12;
#     Sand(12):           14;
#     Water(13):          15;
#     Iron Block(14):     16;
#     Gold Block(15):     17;
#     Diamond Block(16):  18;
#     Smooth Stone(17):   19;
#     Bricks(18):         20;
#     TNT(19):            21(top), 22(side), 23(bottom);
#     Bookshelf(20):      7(top, bottom), 24(side);
#     Workbench(21):      25(top), 26(front, behind), 27(side), 7(bottom);
#     Furnace(22):        28(top, bottom), 29(front), 30(side);
#     Glass(23):          31;
#
# type dir_t is (X_N, X_P, Y_N, Y_P, Z_N, Z_P, INVALID);  # 0 1 2 3 4 5, 6
