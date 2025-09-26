from PIL import Image
from enum import IntEnum
from typing import Tuple, List
import numpy as np
import math, sys, time


# ---------------- constants ----------------
MAPX = MAPY = MAPZ = 32
DISPX = 480
DISPY = 272
MAX_STEPS = 64
SKY_COLOR = (135, 206, 235)  # sky color

# ---------------- map ----------------
# 使用 numpy uint8 三维数组（x,y,z）
MAP = np.zeros((MAPX, MAPY, MAPZ), dtype=np.uint8)

def set_block(x: int, y: int, z: int, bid: int) -> None:
    if 0 <= x < MAPX and 0 <= y < MAPY and 0 <= z < MAPZ:
        MAP[x, y, z] = bid

def get_block_fast(x: int, y: int, z: int) -> int:
    # 内联快速访问（假定调用前已做边界判断）
    return int(MAP[x, y, z])

# ---------------- types & textures ----------------
class Block(IntEnum):
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

class Texture(IntEnum):
    TEX_BEDROCK = 0
    TEX_STONE = 1
    TEX_GRASS_TOP = 2
    TEX_GRASS_SIDE = 3
    TEX_DIRT = 4
    TEX_COBBLE = 5
    TEX_OAK_PLANKS = 6
    TEX_OAK_LOG_TOP = 7
    TEX_OAK_LOG_SIDE = 8
    TEX_OAK_LEAVES = 9
    TEX_SAND = 10
    TEX_SANDSTONE_TOP = 11
    TEX_SANDSTONE_SIDE = 12
    TEX_COAL_ORE = 13
    TEX_COAL_BLOCK = 14
    TEX_IRON_ORE = 15
    TEX_IRON_BLOCK = 16
    TEX_CRAFTING_TOP = 17
    TEX_CRAFTING_FRONT = 18
    TEX_CRAFTING_SIDE = 19

# block -> six faces texture indices (top, side1, side2, side3, side4, bottom)
block_face_texture = {
    Block.AIR:                [0, 0, 0, 0, 0, 0],
    Block.BLK_BEDROCK:        [Texture.TEX_BEDROCK]*6,
    Block.BLK_STONE:          [Texture.TEX_STONE]*6,
    Block.BLK_GRASS:          [Texture.TEX_GRASS_TOP, Texture.TEX_GRASS_SIDE, Texture.TEX_GRASS_SIDE, Texture.TEX_GRASS_SIDE, Texture.TEX_GRASS_SIDE, Texture.TEX_DIRT],
    Block.BLK_DIRT:           [Texture.TEX_DIRT]*6,
    Block.BLK_COBBLE:         [Texture.TEX_COBBLE]*6,
    Block.BLK_OAK_PLANKS:     [Texture.TEX_OAK_PLANKS]*6,
    Block.BLK_OAK_LOG:        [Texture.TEX_OAK_LOG_TOP, Texture.TEX_OAK_LOG_SIDE, Texture.TEX_OAK_LOG_SIDE, Texture.TEX_OAK_LOG_SIDE, Texture.TEX_OAK_LOG_SIDE, Texture.TEX_OAK_LOG_TOP],
    Block.BLK_OAK_LEAVES:     [Texture.TEX_OAK_LEAVES]*6,
    Block.BLK_SAND:           [Texture.TEX_SAND]*6,
    Block.BLK_SANDSTONE:      [Texture.TEX_SANDSTONE_TOP, Texture.TEX_SANDSTONE_SIDE, Texture.TEX_SANDSTONE_SIDE, Texture.TEX_SANDSTONE_SIDE, Texture.TEX_SANDSTONE_SIDE, Texture.TEX_SANDSTONE_TOP],
    Block.BLK_COAL_ORE:       [Texture.TEX_COAL_ORE]*6,
    Block.BLK_COAL_BLOCK:     [Texture.TEX_COAL_BLOCK]*6,
    Block.BLK_IRON_ORE:       [Texture.TEX_IRON_ORE]*6,
    Block.BLK_IRON_BLOCK:     [Texture.TEX_IRON_BLOCK]*6,
    Block.BLK_CRAFTING_TABLE: [Texture.TEX_CRAFTING_TOP, Texture.TEX_CRAFTING_FRONT, Texture.TEX_CRAFTING_SIDE, Texture.TEX_CRAFTING_SIDE, Texture.TEX_CRAFTING_SIDE, Texture.TEX_CRAFTING_TOP],
}

# TEXTURE: list of textures, each is list/tuple length 256 of (r,g,b)
TEXTURE: List[Tuple[int,int,int]] = []

def load_texture_file(filename: str) -> None:
    """加载 textures.hex（每行 16-bit hex RGB565），每个纹理 256 像素。"""
    global TEXTURE
    TEXTURE = []
    data = []
    with open(filename, "r") as f:
        for line in f:
            s = line.strip()
            if not s:
                continue
            val = int(s, 16)
            r = (val >> 11) & 0x1F
            g = (val >> 5) & 0x3F
            b = val & 0x1F
            r = (r << 3) | (r >> 2)
            g = (g << 2) | (g >> 4)
            b = (b << 3) | (b >> 2)
            data.append((r, g, b))
    if len(data) % 256 != 0:
        raise ValueError("纹理像素数不是 256 的整数倍")
    for i in range(0, len(data), 256):
        TEXTURE.append(tuple(data[i:i+256]))

def get_texture_color(tex_idx: int, u: int, v: int) -> Tuple[int,int,int]:
    # u,v in 0..15
    u &= 15; v &= 15
    return TEXTURE[tex_idx][(v << 4) | u]

# ---------------- scene generation ----------------
GROUND = 15
def init_test_map() -> None:
    MAP.fill(Block.AIR)
    # ground layers
    for x in range(MAPX):
        for y in range(MAPY):
            MAP[x, y, :GROUND] = Block.BLK_STONE
            MAP[x, y, GROUND] = Block.BLK_GRASS
            MAP[x, y, GROUND+1:] = Block.AIR
    # tree center
    cx = MAPX // 2; cy = MAPY // 2
    trunk_height = 5
    leaves_radius = 2
    leaves_height = 2
    for z in range(GROUND+1, GROUND+1+trunk_height):
        set_block(cx, cy, z, Block.BLK_OAK_LOG)
    for z in range(GROUND+trunk_height, GROUND+trunk_height+leaves_height+1):
        layer_radius = leaves_radius + (GROUND+trunk_height) - z
        if layer_radius < 1: layer_radius = 1
        for dx in range(-layer_radius, layer_radius+1):
            for dy in range(-layer_radius, layer_radius+1):
                ax = cx + dx; ay = cy + dy
                if 0 <= ax < MAPX and 0 <= ay < MAPY:
                    if not (dx == 0 and dy == 0 and z <= GROUND+trunk_height):
                        set_block(ax, ay, z, Block.BLK_OAK_LEAVES)
    # bedrock
    MAP[:, :, 0] = Block.BLK_BEDROCK
    # demo ores
    set_block(10,10,GROUND+1,Block.BLK_COAL_ORE)
    set_block(12,9,GROUND+1,Block.BLK_IRON_ORE)
    set_block(20,20,GROUND+1,Block.BLK_COAL_BLOCK)
    set_block(21,20,GROUND+1,Block.BLK_IRON_BLOCK)

init_test_map()

# ---------------- DDA raycast ----------------
PI = math.pi

def raycast(ox: float, oy: float, oz: float, dx: float, dy: float, dz: float) -> Tuple[int,int,int]:
    """DDA raycast 返回命中的颜色 (r,g,b)；越界返回 SKY_COLOR；未命中返回黑。"""
    # 起始体素坐标（floor）
    bx = math.floor(ox); by = math.floor(oy); bz = math.floor(oz)
    # step
    stepX = 1 if dx > 0.0 else -1
    stepY = 1 if dy > 0.0 else -1
    stepZ = 1 if dz > 0.0 else -1
    # inv direction
    invDx = 1.0 / abs(dx) if dx != 0.0 else 1e30
    invDy = 1.0 / abs(dy) if dy != 0.0 else 1e30
    invDz = 1.0 / abs(dz) if dz != 0.0 else 1e30
    # t to next voxel boundary
    tMaxX = ((bx + 1.0) - ox) * invDx if stepX > 0 else (ox - bx) * invDx
    tMaxY = ((by + 1.0) - oy) * invDy if stepY > 0 else (oy - by) * invDy
    tMaxZ = ((bz + 1.0) - oz) * invDz if stepZ > 0 else (oz - bz) * invDz

    for _ in range(MAX_STEPS):
        # choose axis to step
        if tMaxX <= tMaxY and tMaxX <= tMaxZ:
            tHit = tMaxX; bx += stepX; tMaxX += invDx; steppedAxis = 1
        elif tMaxY <= tMaxX and tMaxY <= tMaxZ:
            tHit = tMaxY; by += stepY; tMaxY += invDy; steppedAxis = 2
        else:
            tHit = tMaxZ; bz += stepZ; tMaxZ += invDz; steppedAxis = 3
        # 超出地图 -> sky
        if not (0 <= bx < MAPX and 0 <= by < MAPY and 0 <= bz < MAPZ):
            return SKY_COLOR
        bid = int(MAP[bx, by, bz])
        if bid != 0:
            # 命中点
            hx = ox + dx * tHit
            hy = oy + dy * tHit
            hz = oz + dz * tHit
            # 根据步进方向做 面映射 与 uv 取样
            if steppedAxis == 1:
                # x-face; 使用 y,z 映射到 u,v
                fy = hy - math.floor(hy)
                fz = hz - math.floor(hz)
                u = int(fy * 16.0) & 15
                v = int(fz * 16.0) & 15
                # 如果 dx>0 则我们进入在该 voxel 的 -x 面?（与原逻辑保持一致）
                tex_face = block_face_texture[bid][3] if dx > 0.0 else block_face_texture[bid][2]
            elif steppedAxis == 2:
                # y-face; x,z 映射
                fx = hx - math.floor(hx)
                fz = hz - math.floor(hz)
                u = int(fx * 16.0) & 15
                v = int(fz * 16.0) & 15
                tex_face = block_face_texture[bid][4] if dy > 0.0 else block_face_texture[bid][1]
            else:
                # z-face; x,y 映射
                fx = hx - math.floor(hx)
                fy = hy - math.floor(hy)
                u = int(fx * 16.0) & 15
                v = int(fy * 16.0) & 15
                tex_face = block_face_texture[bid][5] if dz > 0.0 else block_face_texture[bid][0]
            return get_texture_color(tex_face, u, v)
    return (0,0,0)

# ---------------- camera and render ----------------
class Camera:
    def __init__(self, px: float, py: float, pz: float, yaw: float, pitch: float, fov: float):
        self.px = px; self.py = py; self.pz = pz
        self.yaw = yaw  # radians
        self.pitch = pitch  # radians
        self.fov = fov  # degrees
        # direction & basis will be set by update_basis()
        self.dx = self.dy = self.dz = 0.0
        self.ux = self.uy = self.uz = 0.0
        self.vx = self.vy = self.vz = 0.0
        self.update_basis()

    def update_basis(self) -> None:
        # from yaw (around up axis) and pitch
        cosP = math.cos(self.pitch); sinP = math.sin(self.pitch)
        cosY = math.cos(self.yaw); sinY = math.sin(self.yaw)
        self.dx = sinY * cosP
        self.dy = sinP
        self.dz = -cosY * cosP
        # right vector = world_up cross dir
        # world_up = (0,1,0)
        rx = self.dz
        ry = 0.0 - self.dx
        rz = 0.0
        # normalize right (v)
        rlen = math.sqrt(rx*rx + ry*ry + rz*rz)
        if rlen != 0.0:
            rx /= rlen; ry /= rlen; rz /= rlen
        self.vx, self.vy, self.vz = rx, ry, rz
        # up = dir cross right
        ux = self.dy * rz - self.dz * ry
        uy = self.dz * rx - self.dx * rz
        uz = self.dx * ry - self.dy * rx
        ulen = math.sqrt(ux*ux + uy*uy + uz*uz)
        if ulen != 0.0:
            ux /= ulen; uy /= ulen; uz /= ulen
        self.ux, self.uy, self.uz = ux, uy, uz

# render using incremental direction per-pixel for speed
def render_once(cam: Camera) -> Image.Image:
    aspect = DISPX / DISPY
    fovScale = math.tan(cam.fov * 0.5 * PI / 180.0)

    img = Image.new('RGB', (DISPX, DISPY))
    pix = img.load()

    # pre-locals for speed
    cam_px, cam_py, cam_pz = cam.px, cam.py, cam.pz
    dir_cx, dir_cy, dir_cz = cam.dx, cam.dy, cam.dz
    vx_x, vx_y, vx_z = cam.vx, cam.vy, cam.vz
    ux_x, ux_y, ux_z = cam.ux, cam.uy, cam.uz

    inv_DISPX = 1.0 / DISPX
    two = 2.0

    for py in range(DISPY):
        # compute v for this scanline
        v = (1.0 - two * (py + 0.5) * (1.0 / DISPY)) * fovScale
        # leftmost u (for px=0)
        u0 = (-1.0 + two * 0.5 * inv_DISPX) * aspect * fovScale  # px=0 center
        # du step per pixel
        du = (two * inv_DISPX) * aspect * fovScale
        # start direction for px=0
        dirx = dir_cx + u0 * vx_x + v * ux_x
        diry = dir_cy + u0 * vx_y + v * ux_y
        dirz = dir_cz + u0 * vx_z + v * ux_z
        # per-pixel increment for direction
        ddx = du * vx_x
        ddy = du * vx_y
        ddz = du * vx_z
        for px in range(DISPX):
            # normalize direction
            llen = math.sqrt(dirx*dirx + diry*diry + dirz*dirz)
            if llen != 0.0:
                invl = 1.0 / llen
                nx = dirx * invl; ny = diry * invl; nz = dirz * invl
            else:
                nx, ny, nz = dirx, diry, dirz
            color = raycast(cam_px, cam_py, cam_pz, nx, ny, nz)
            pix[px, py] = color
            # advance direction
            dirx += ddx; diry += ddy; dirz += ddz

    return img

# ---------------- main loop (CLI preview or pygame) ----------------
def main(game_en: bool = False):
    # start = time.time()
    init_test_map()
    load_texture_file('textures.hex')
    # end = time.time()
    # print(f"init time: {end-start:.3f}s")
    cam = Camera(16.5, 16.5, 31.0, yaw=0.0, pitch=0.0, fov=60.0)

    if not game_en:
        # start = time.time()
        img = render_once(cam)
        img.show()
        # end = time.time()
        # print(f"render time: {end-start:.3f}s")
    else:
        # minimal pygame loop with corrected movement using yaw/pitch
        import pygame
        pygame.init()
        screen = pygame.display.set_mode((DISPX, DISPY))
        clock = pygame.time.Clock()
        speed = 0.3
        mouse_sens = 0.005
        pygame.event.set_grab(True)
        pygame.mouse.set_visible(True)
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    pygame.quit(); sys.exit()
                elif event.type == pygame.MOUSEMOTION:
                    dx, dy = event.rel
                    cam.yaw += -dx * mouse_sens
                    cam.pitch += -dy * mouse_sens
                    # clamp pitch to avoid gimbal flip
                    cam.pitch = max(-math.pi/2 + 1e-3, min(math.pi/2 - 1e-3, cam.pitch))
                    cam.update_basis()
                elif event.type == pygame.KEYDOWN:
                    if event.key == pygame.pygame.K_w:
                        cam.px += cam.dx * speed
                        cam.py += cam.dy * speed
                        cam.pz += cam.dz * speed
                    if event.key == pygame.pygame.K_s:
                        cam.px -= cam.dx * speed
                        cam.py -= cam.dy * speed
                        cam.pz -= cam.dz * speed
                    if event.key == pygame.pygame.K_a:
                        cam.px -= cam.vx * speed
                        cam.py -= cam.vy * speed
                        cam.pz -= cam.vz * speed
                    if event.key == pygame.pygame.K_d:
                        cam.px += cam.vx * speed
                        cam.py += cam.vy * speed
                        cam.pz += cam.vz * speed
                    # clamp camera inside reasonable bounds
                    cam.px = max(0.1, min(MAPX - 0.1, cam.px))
                    cam.py = max(0.1, min(MAPY - 0.1, cam.py))
                    cam.pz = max(0.1, min(MAPZ - 0.1, cam.pz))

            img = render_once(cam)
            # blit to pygame
            mode = img.mode; size = img.size; data = img.tobytes()
            surf = pygame.image.fromstring(data, size, mode)
            screen.blit(surf, (0, 0))
            pygame.display.flip()
            clock.tick(30)

if __name__ == "__main__":
    # main(True)
    main(False)
