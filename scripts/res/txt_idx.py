import numpy as np
import cv2, math

TEXTURE_COLLECTIONS = {
    "MIN": [
        "bedrock", "stone", "grass_block_top", "grass_block_side", "dirt",
        "cobblestone", "oak_planks", "oak_log_top", "oak_log", "oak_leaves",
        "sand", "coal_ore", "coal_block", "iron_ore", "iron_block",
        "crafting_table_top", "crafting_table_front", "crafting_table_side",
        "furnace_top", "furnace_front", "furnace_side",
    ],
    "MID": [
        "bedrock", "stone", "grass_block_top", "grass_block_side", "dirt",
        "cobblestone", "oak_planks", "oak_log_top", "oak_log", "oak_leaves",
        "sand", "coal_ore", "coal_block", "iron_ore", "iron_block",
        "crafting_table_top", "crafting_table_front", "crafting_table_side",
        "furnace_top", "furnace_front", "furnace_side",
        "gravel", "sandstone_top", "sandstone", "birch_planks", "birch_log_top",
        "birch_log", "birch_leaves", "gold_ore", "gold_block", "diamond_ore",
        "diamond_block", "ice", "water", "glass", "tnt_top", "tnt_side",
        "tnt_bottom", "bookshelf", "bricks", "stone_bricks",
    ]
}
BLOCK_TEXTURE_COLLECTIONS = {
    "MIN": [
        {"bedrock": ["bedrock", "bedrock", "bedrock", "bedrock", "bedrock", "bedrock"]},
        {"stone": ["stone", "stone", "stone", "stone", "stone", "stone"]},
        {"grass": ["grass_block_top", "grass_block_side", "grass_block_side", "grass_block_side", "grass_block_side", "dirt"]},
        {"dirt": ["dirt", "dirt", "dirt", "dirt", "dirt", "dirt"]},
        {"cobblestone": ["cobblestone", "cobblestone", "cobblestone", "cobblestone", "cobblestone", "cobblestone"]},
        {"oak_planks": ["oak_planks", "oak_planks", "oak_planks", "oak_planks", "oak_planks", "oak_planks"]},
        {"oak_log": ["oak_log_top", "oak_log", "oak_log", "oak_log", "oak_log", "oak_log_top"]},
        {"oak_leaves": ["oak_leaves", "oak_leaves", "oak_leaves", "oak_leaves", "oak_leaves", "oak_leaves"]},
        {"sand": ["sand", "sand", "sand", "sand", "sand", "sand"]},
        {"coal_ore": ["coal_ore", "coal_ore", "coal_ore", "coal_ore", "coal_ore", "coal_ore"]},
        {"coal_block": ["coal_block", "coal_block", "coal_block", "coal_block", "coal_block", "coal_block"]},
        {"iron_ore": ["iron_ore", "iron_ore", "iron_ore", "iron_ore", "iron_ore", "iron_ore"]},
        {"iron_block": ["iron_block", "iron_block", "iron_block", "iron_block", "iron_block", "iron_block"]},
        {"crafting_table": ["crafting_table_top", "crafting_table_front", "crafting_table_side", "crafting_table_side", "crafting_table_side", "crafting_table_top"]},
        {"furnace": ["furnace_top", "furnace_front", "furnace_side", "furnace_side", "furnace_side", "furnace_top"]},
    ],
    "MID": [
        {"bedrock": ["bedrock", "bedrock", "bedrock", "bedrock", "bedrock", "bedrock"]},
        {"stone": ["stone", "stone", "stone", "stone", "stone", "stone"]},
        {"grass": ["grass_block_top", "grass_block_side", "grass_block_side", "grass_block_side", "grass_block_side", "dirt"]},
        {"dirt": ["dirt", "dirt", "dirt", "dirt", "dirt", "dirt"]},
        {"cobblestone": ["cobblestone", "cobblestone", "cobblestone", "cobblestone", "cobblestone", "cobblestone"]},
        {"oak_planks": ["oak_planks", "oak_planks", "oak_planks", "oak_planks", "oak_planks", "oak_planks"]},
        {"oak_log": ["oak_log_top", "oak_log", "oak_log", "oak_log", "oak_log", "oak_log_top"]},
        {"oak_leaves": ["oak_leaves", "oak_leaves", "oak_leaves", "oak_leaves", "oak_leaves", "oak_leaves"]},
        {"sand": ["sand", "sand", "sand", "sand", "sand", "sand"]},
        {"coal_ore": ["coal_ore", "coal_ore", "coal_ore", "coal_ore", "coal_ore", "coal_ore"]},
        {"coal_block": ["coal_block", "coal_block", "coal_block", "coal_block", "coal_block", "coal_block"]},
        {"iron_ore": ["iron_ore", "iron_ore", "iron_ore", "iron_ore", "iron_ore", "iron_ore"]},
        {"iron_block": ["iron_block", "iron_block", "iron_block", "iron_block", "iron_block", "iron_block"]},
        {"crafting_table": ["crafting_table_top", "crafting_table_front", "crafting_table_side", "crafting_table_side", "crafting_table_side", "crafting_table_top"]},
        {"furnace": ["furnace_top", "furnace_front", "furnace_side", "furnace_side", "furnace_side", "furnace_top"]},

        {"gravel": ["gravel", "gravel", "gravel", "gravel", "gravel", "gravel"]},
        {"sandstone": ["sandstone_top", "sandstone", "sandstone", "sandstone", "sandstone", "sandstone_top"]},
        {"birch_planks": ["birch_planks", "birch_planks", "birch_planks", "birch_planks", "birch_planks", "birch_planks"]},
        {"birch_log": ["birch_log_top", "birch_log", "birch_log", "birch_log", "birch_log", "birch_log_top"]},
        {"birch_leaves": ["birch_leaves", "birch_leaves", "birch_leaves", "birch_leaves", "birch_leaves", "birch_leaves"]},
        {"gold_ore": ["gold_ore", "gold_ore", "gold_ore", "gold_ore", "gold_ore", "gold_ore"]},
        {"gold_block": ["gold_block", "gold_block", "gold_block", "gold_block", "gold_block", "gold_block"]},
        {"diamond_ore": ["diamond_ore", "diamond_ore", "diamond_ore", "diamond_ore", "diamond_ore", "diamond_ore"]},
        {"diamond_block": ["diamond_block", "diamond_block", "diamond_block", "diamond_block", "diamond_block", "diamond_block"]},
        {"ice": ["ice", "ice", "ice", "ice", "ice", "ice"]},
        {"water": ["water", "water", "water", "water", "water", "water"]},
        {"glass": ["glass", "glass", "glass", "glass", "glass", "glass"]},
        {"tnt": ["tnt_top", "tnt_side", "tnt_side", "tnt_side", "tnt_side", "tnt_bottom"]},
        {"bookshelf": ["oak_planks", "bookshelf", "bookshelf", "bookshelf", "bookshelf", "oak_planks"]},
        {"bricks": ["bricks", "bricks", "bricks", "bricks", "bricks", "bricks"]},
        {"stone_bricks": ["stone_bricks", "stone_bricks", "stone_bricks", "stone_bricks", "stone_bricks", "stone_bricks"]},
    ]
}

def format_value(value, bitwidth, datatype):
    """将数值转换成 bin 或 hex 格式字符串"""
    if datatype == 'bin':
        return format(value, f'0{bitwidth}b')
    elif datatype == 'hex':
        hexwidth = math.ceil(bitwidth / 4)
        return format(value, f'0{hexwidth}X')
    else:
        raise ValueError(f"Unsupported datatype: {datatype}")

def write_txt_idx(collection, filetype=None, datatype='bin'):
    """生成方块纹理索引文件（二维数组）"""
    # 文件名和头部
    if filetype == 'coe':  # Xilinx COE 文件
        filename = f'output/txt_idx.{filetype}'
        if datatype == 'bin':
            header = "memory_initialization_radix=2;\nmemory_initialization_vector="
        elif datatype == 'hex':
            header = "memory_initialization_radix=16;\nmemory_initialization_vector="
    elif filetype == 'mi':  # Gowin MI 文件
        filename = f'output/txt_idx.{filetype}'
        if datatype == 'bin':
            header = "#File_format=Bin\n#Address_depth=256\n#Data_width=32"
        elif datatype == 'hex':
            header = "#File_format=Hex\n#Address_depth=256\n#Data_width=32"
    elif filetype == 'c':  # C语言二维数组
        filename = f'output/txt_idx.c'
        header = None
    else:
        filename = f'output/txt_idx.{datatype}'
        header = None

    # 生成纹理索引表
    texture_list = TEXTURE_COLLECTIONS[collection]
    texture_map = {name: idx for idx, name in enumerate(texture_list)}  # {纹理名: 索引}

    # 构建二维数组
    all_blocks = []
    for block in BLOCK_TEXTURE_COLLECTIONS[collection]:
        for block_name, faces in block.items():
            block_row = []
            for face in faces:
                idx = texture_map.get(face)
                if idx is None:
                    raise ValueError(f"Texture '{face}' not found in TEXTURE_COLLECTIONS[{collection}]")
                if datatype == 'bin':
                    val_str = f"0b{format(idx, '06b')}"
                elif datatype == 'hex':
                    val_str = f"0x{format(idx, '02X')}"
                else:
                    val_str = str(idx)
                block_row.append(val_str)
            all_blocks.append(block_row)

    # 写入文件
    with open(filename, 'w') as f:
        if header:
            print(header, file=f)
        if filetype == 'c':
            num_blocks = len(all_blocks)
            num_faces = max(len(row) for row in all_blocks)
            f.write(f"const uint8_t txt_idx[{num_blocks}][{num_faces}] = {{\n")
            for i, row in enumerate(all_blocks):
                f.write("  { " + ", ".join(row) + " }" + ("," if i < num_blocks - 1 else "") + "\n")
            f.write("};\n")
        elif filetype == 'coe':
            all_lines = [val for row in all_blocks for val in row]
            for i, line in enumerate(all_lines):
                sep = ',' if i < len(all_lines) - 1 else ';'
                f.write(line + sep + '\n')
        else:
            for row in all_blocks:
                for line in row:
                    f.write(line + '\n')


if __name__ == "__main__":
    write_txt_idx('MIN', 'coe', 'hex')
    write_txt_idx('MIN', 'mi', 'bin')
    write_txt_idx('MIN', None, 'hex')
    write_txt_idx('MIN', 'c', 'bin')
    print("Texture index file generation completed!")


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
#   Coal Ore(10):       11;
#   Coal Block(11):     12;
#   Iron Ore(12):       13;
#   Iron Block(13):     14;
#   Crafting Table(14): 15(top, bottom), 16(front), 17(side);
#   Furnace(15):        18(top, bottom), 19(front), 20(side);
# Block & Texture: MID
#   gravel(16):         21;
#   Sandstone(17):      22(top), 23(side);
#   Birch Planks(18):   24;
#   Birch Log(19):      25(top, bottom), 26(side);
#   Birch Leaves(20):   27;
#   Gold Ore(21):       28;
#   Gold Block(22):     29;
#   Diamond Ore(23):    30;
#   Diamond Block(24):  31;
#   Ice(25):            32;
#   Water(26):          33;
#   Glass(27):          34;
#   TNT(28):            35(top), 36(side), 37(bottom);
#   Bookshelf(29):      38;
#   Bricks(30):         39;
#   Stone Bricks(31):   40;
