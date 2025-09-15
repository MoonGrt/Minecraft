import numpy as np
import cv2

RES = 16  # Texture resolution

# Minecraft 方块集合
# Block & Texture:
#   Empty(0):           x;
#   Stone(1):           0;
#   Grass(2):           1(top), 2(side), 3(bottom);
#   Dirt(3):            3;
#   Cobblestone(4):     4;
#   Bedrock(5):         5;
#   Birch Planks(6):    6;
#   Oak Planks(7):      7;
#   Birch Log(8):       8(top, bottom), 9(side);
#   Oak Log(9):         10(top, bottom), 11(side);
#   Birch Leaves(10):   12;
#   Oak Leaves(11):     13;
#   Sand(12):           14;
#   Water(13):          15;
#   Iron Block(14):     16;
#   Gold Block(15):     17;
#   Diamond Block(16):  18;
#   Smooth Stone(17):   19;
#   Bricks(18):         20;
#   TNT(19):            21(top), 22(side), 23(bottom);
#   Bookshelf(20):      7(top, bottom), 24(side);
#   Workbench(21):      25(top), 26(front, behind), 27(side), 7(bottom);
#   Furnace(22):        28(top, bottom), 29(front), 30(side);
#   Glass(23):          31;
COLLECTIONS = {
    "MIN": [
        "stone", "grass_block_top", "grass_block_side", "dirt", "cobblestone",
        "oak_planks", "oak_log", "oak_log_top", "oak_leaves", "sand",
        "iron_ore", "iron_block", "coal_ore", "coal_block", "bedrock",
    ],
    "MID": [
        "stone", "grass_block_top", "grass_block_side", "dirt", "cobblestone",
        "oak_planks", "oak_log", "oak_log_top", "oak_leaves", "sand",
        "iron_ore", "iron_block", "coal_ore", "coal_block", "bedrock",
        "red_sand", "birch_planks", "birch_log", "birch_log_top", "birch_leaves",
        "mossy_cobblestone", "stone_bricks", "mossy_stone_bricks", "gold_ore", "gold_block",
        "diamond_ore", "diamond_block", "emerald_ore", "lapis_ore", "snow_block", "ice"
    ]
}

def convert_color(b, g, r, a, colortype):
    """根据 colortype 转换像素值"""
    b, g, r, a = map(int, (b, g, r, a))
    if colortype.upper() == 'ARGB8888':
        value = (a << 24) | (r << 16) | (g << 8) | b
        return value, 32
    elif colortype.upper() == 'RGB888':
        value = (r << 16) | (g << 8) | b
        return value, 24
    elif colortype.upper() == 'RGB565':
        r5 = (r >> 3) & 0x1F
        g6 = (g >> 2) & 0x3F
        b5 = (b >> 3) & 0x1F
        value = (r5 << 11) | (g6 << 5) | b5
        return value, 16
    elif colortype.upper() == 'ARGB1555':
        a1 = 1 if a >= 128 else 0
        r5 = (r >> 3) & 0x1F
        g5 = (g >> 3) & 0x1F
        b5 = (b >> 3) & 0x1F
        value = (a1 << 15) | (r5 << 10) | (g5 << 5) | b5
        return value, 16
    elif colortype.upper() == 'ARGB4444':
        a4 = a >> 4
        r4 = r >> 4
        g4 = g >> 4
        b4 = b >> 4
        value = (a4 << 12) | (r4 << 8) | (g4 << 4) | b4
        return value, 16
    elif colortype.upper() == 'L8':
        l = int(0.299*r + 0.587*g + 0.114*b)
        return l, 8
    elif colortype.upper() == 'AL44':
        a4 = a >> 4
        l4 = int((0.299*r + 0.587*g + 0.114*b) / 16)
        value = (a4 << 4) | l4
        return value, 8
    elif colortype.upper() == 'AL88':
        l8 = int(0.299*r + 0.587*g + 0.114*b)
        value = (a << 8) | l8
        return value, 16
    else:
        raise ValueError(f"Unsupported colortype: {colortype}")

def format_value(value, bitwidth, datatype):
    """将数值转换成 bin 或 hex 格式字符串"""
    if datatype == 'bin':
        return format(value, f'0{bitwidth}b')
    elif datatype == 'hex':
        hexwidth = bitwidth // 4
        return format(value, f'0{hexwidth}X')
    else:
        raise ValueError(f"Unsupported datatype: {datatype}")

def write_textures(collection_name, filetype=None, datatype='bin', colortype='rgb888'):
    """通用输出函数"""
    if filetype == 'coe':  # xilinx coe file
        filename = f'output/textures.{filetype}'
        header = "memory_initialization_radix=16;\nmemory_initialization_vector="
    elif filetype == 'mi':  # gowin mi file
        filename = f'output/textures.{filetype}'
        header = "#File_format=Hex\n#Address_depth=256\n#Data_width=24"
    else:
        header = None
        filename = f'output/textures.{datatype}'
    with open(filename, 'w') as f:
        if header:
            print(header, file=f)
        for texture in COLLECTIONS[collection_name]:
            img = cv2.imread(f'texture/{texture}.png', cv2.IMREAD_UNCHANGED)
            for j in range(RES):
                for k in range(RES):
                    b, g, r = img[j, k, 0:3]
                    a = img[j, k, 3] if img.shape[2] == 4 else 255
                    value, bitwidth = convert_color(b, g, r, a, colortype)
                    val_str = format_value(value, bitwidth, datatype)
                    end = ',\n' if filetype == 'coe' else '\n'
                    f.write(val_str + end)


if __name__ == "__main__":
    write_textures('MIN', 'coe', 'hex', 'ARGB8888')
    write_textures('MIN', 'mi', 'bin', 'RGB888')
    write_textures('MIN', None, 'hex', 'RGB565')
    print("PNG convert to MI/COE/BIN/HEX files completed!")
