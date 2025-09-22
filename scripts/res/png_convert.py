import numpy as np
import cv2, math

RES = 16  # Texture resolution

BLOCK_COLLECTIONS = {
    "MIN": [
        "", "bedrock", "stone", "grass", "dirt", "cobblestone", "oak_planks",
        "oak_log", "oak_leaves", "sand", "sandstone", "coal_ore", "coal_block",
        "iron_ore", "iron_block", "crafting_table",
    ],
    "MID": [
        "", "bedrock", "stone", "grass", "dirt", "cobblestone", "oak_planks",
        "oak_log", "oak_leaves", "sand", "sandstone", "coal_ore", "coal_block",
        "iron_ore", "iron_block", "crafting_table",
        "gravel", "birch_planks", "birch_log", "birch_leaves", "melon",
        "gold_ore", "gold_block", "diamond_ore", "diamond_block",  "ice",
        "water", "glass", "furnace", "bookshelf", "bricks", "stone_bricks",
    ]
}
TEXTURE_COLLECTIONS = {
    "MIN": [
        "bedrock", "stone", "grass_block_top", "grass_block_side", "dirt",
        "cobblestone", "oak_planks", "oak_log_top", "oak_log", "oak_leaves",
        "sand", "sandstone_top", "sandstone", "coal_ore", "coal_block", "iron_ore",
        "iron_block", "crafting_table_top", "crafting_table_front", "crafting_table_side",
    ],
    "MID": [
        "bedrock", "stone", "grass_block_top", "grass_block_side", "dirt",
        "cobblestone", "oak_planks", "oak_log_top", "oak_log", "oak_leaves",
        "sand", "sandstone_top", "sandstone", "coal_ore", "coal_block", "iron_ore",
        "iron_block", "crafting_table_top", "crafting_table_front", "crafting_table_side",
        "gravel", "birch_planks", "birch_log_top", "birch_log", "birch_leaves",
        "melon_top", "melon_side", "gold_ore", "gold_block", "diamond_ore", "diamond_block", "ice", "water",
        "glass", "furnace_top", "furnace_front", "furnace_side", "bookshelf", "bricks", "stone_bricks",
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
        hexwidth = math.ceil(bitwidth / 4)
        return format(value, f'0{hexwidth}X')
    else:
        raise ValueError(f"Unsupported datatype: {datatype}")

def write_textures(collection, filetype=None, datatype='bin', colortype='rgb888'):
    """通用输出函数"""
    if filetype == 'coe':  # Xilinx COE 文件
        filename = f'output/textures.{filetype}'
    elif filetype == 'mi':  # Gowin MI 文件
        filename = f'output/textures.{filetype}'
    elif filetype == 'c':  # C语言二维数组
        filename = "output/textures.c"
    else:
        filename = f'output/textures.{datatype}'
    # 读取图片并转换颜色
    bitwidth = None
    with open(filename, 'w') as f:
        all_lines = []
        all_textures = []
        bitwidth_detected = None
        for texture in TEXTURE_COLLECTIONS[collection]:
            if texture == '':  # 空纹理
                continue
            img = cv2.imread(f'texture/{texture}.png', cv2.IMREAD_UNCHANGED)
            texture_values = []
            for j in range(RES):
                row_values = []
                for k in range(RES):
                    b, g, r = img[j, k, 0:3]
                    a = img[j, k, 3] if img.shape[2] == 4 else 255
                    value, bitwidth = convert_color(b, g, r, a, colortype)
                    if bitwidth_detected is None:
                        bitwidth_detected = bitwidth
                        if filetype == 'c':
                            c_type = f"uint{max(8, ((bitwidth+7)//8)*8)}_t"
                            f.write(f"const {c_type} TEXTURE[{len(TEXTURE_COLLECTIONS[collection])}][{RES*RES}] = {{\n")
                    if datatype == 'bin':
                        data = format(value, f'0{bitwidth}b')
                        val_str = f"0b{data}"
                        all_lines.append(data)
                    elif datatype == 'hex':
                        hexwidth = (bitwidth + 3) // 4
                        data = format(value, f'0{hexwidth}X')
                        val_str = f"0x{data}"
                        all_lines.append(data)
                    else:
                        raise ValueError(f"Unsupported datatype: {datatype}")
                    row_values.append(val_str)
                texture_values.extend(row_values)
            all_textures.append(texture_values)

        # 写入文件
        if filetype == 'coe':  # Xilinx COE 文件
            if datatype == 'bin':
                header = "memory_initialization_radix=2;\nmemory_initialization_vector="
            elif datatype == 'hex':
                header = "memory_initialization_radix=16;\nmemory_initialization_vector="
        elif filetype == 'mi':  # Gowin MI 文件
            if datatype == 'bin':
                header = f"#File_format=Bin\n#Address_depth={len(TEXTURE_COLLECTIONS[collection])*RES*RES}\n#Data_width={bitwidth}"
            elif datatype == 'hex':
                header = f"#File_format=Hex\n#Address_depth={len(TEXTURE_COLLECTIONS[collection])*RES*RES}\n#Data_width={bitwidth}"
        elif filetype == 'c':  # C语言二维数组
            header = None
        else:
            header = None
        if header:
            print(header, file=f)
        if filetype == 'coe':
            for i, line in enumerate(all_lines):
                sep = ',' if i < len(all_lines) - 1 else ';'
                f.write(line + sep + '\n')
        elif filetype == 'c':
            for t_idx, tex in enumerate(all_textures):
                f.write("  {\n    ")
                for r in range(RES):
                    row_start = r * RES
                    row_end = row_start + RES
                    f.write(", ".join(tex[row_start:row_end]))
                    if r < RES - 1:
                        f.write(",\n    ")  # 每行换行并缩进
                f.write("\n  }")
                if t_idx < len(all_textures) - 1:
                    f.write(",\n")
                else:
                    f.write("\n")
            f.write("};\n")
        else:
            for line in all_lines:
                f.write(line + '\n')


if __name__ == "__main__":
    write_textures('MIN', 'coe', 'hex', 'ARGB8888')
    write_textures('MIN', 'mi', 'bin', 'RGB565')
    write_textures('MIN', None, 'hex', 'RGB565')
    write_textures('MIN', 'c', 'hex', 'RGB565')
    print("PNG convert to MI/COE/BIN/HEX files completed!")


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
