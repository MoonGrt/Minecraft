import pygame
import math
import sys

# 屏幕大小
WIDTH, HEIGHT = 320, 240

# 地图大小
MAPX, MAPY, MAPZ = 32, 32, 32

# 方块ID
AIR = 0
STONE = 1
GRASS = 2

# 简单的颜色贴图（直接颜色代替纹理）
BLOCK_COLORS = {
    AIR: (0, 0, 0),
    STONE: (100, 100, 100),
    GRASS: (0, 200, 0),
}

# 初始化地图：平地 + 草地
def init_map():
    world = [[[AIR for _ in range(MAPZ)] for _ in range(MAPY)] for _ in range(MAPX)]
    ground = 8
    for x in range(MAPX):
        for y in range(MAPY):
            for z in range(ground):
                world[x][y][z] = STONE
            world[x][y][ground] = GRASS
    return world

# 射线投射 DDA
MAX_STEPS = 64
PI = math.pi

def raycast(world, ox, oy, oz, dx, dy, dz):
    bx, by, bz = int(ox), int(oy), int(oz)
    stepX = 1 if dx > 0 else -1
    stepY = 1 if dy > 0 else -1
    stepZ = 1 if dz > 0 else -1

    invDx = 1.0 / abs(dx) if dx != 0 else 1e30
    invDy = 1.0 / abs(dy) if dy != 0 else 1e30
    invDz = 1.0 / abs(dz) if dz != 0 else 1e30

    tMaxX = ((bx + 1) - ox) * invDx if dx > 0 else (ox - bx) * invDx
    tMaxY = ((by + 1) - oy) * invDy if dy > 0 else (oy - by) * invDy
    tMaxZ = ((bz + 1) - oz) * invDz if dz > 0 else (oz - bz) * invDz

    for _ in range(MAX_STEPS):
        if 0 <= bx < MAPX and 0 <= by < MAPY and 0 <= bz < MAPZ:
            bid = world[bx][by][bz]
            if bid != AIR:
                return BLOCK_COLORS[bid]
        if tMaxX < tMaxY and tMaxX < tMaxZ:
            bx += stepX
            tMaxX += invDx
        elif tMaxY < tMaxZ:
            by += stepY
            tMaxY += invDy
        else:
            bz += stepZ
            tMaxZ += invDz
    return (135, 206, 235)  # 天空色

# 相机类
class Camera:
    def __init__(self):
        self.px, self.py, self.pz = 16.5, 16.5, 20.0
        self.yaw, self.pitch = 0.0, 0.0
        self.fov = 60.0

    def get_direction(self):
        cosPitch = math.cos(self.pitch)
        sinPitch = math.sin(self.pitch)
        cosYaw = math.cos(self.yaw)
        sinYaw = math.sin(self.yaw)
        dx = sinYaw * cosPitch
        dy = sinPitch
        dz = -cosYaw * cosPitch
        return dx, dy, dz

# 渲染场景
def render_scene(screen, world, cam):
    aspect = WIDTH / HEIGHT
    fovScale = math.tan(cam.fov * 0.5 * PI / 180.0)
    for py in range(HEIGHT):
        for px in range(WIDTH):
            u = (2 * (px + 0.5) / WIDTH - 1) * aspect * fovScale
            v = (1 - 2 * (py + 0.5) / HEIGHT) * fovScale

            dx, dy, dz = cam.get_direction()
            dirx = dx + u
            diry = dy + v
            dirz = dz + 1.0
            length = math.sqrt(dirx*dirx + diry*diry + dirz*dirz)
            dirx /= length; diry /= length; dirz /= length

            color = raycast(world, cam.px, cam.py, cam.pz, dirx, diry, dirz)
            screen.set_at((px, py), color)

# 主循环
def main():
    pygame.init()
    screen = pygame.display.set_mode((WIDTH, HEIGHT))
    clock = pygame.time.Clock()

    world = init_map()
    cam = Camera()
    speed = 0.3

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()

        keys = pygame.key.get_pressed()
        if keys[pygame.K_w]:
            cam.px += math.sin(cam.yaw) * speed
            cam.pz -= math.cos(cam.yaw) * speed
        if keys[pygame.K_s]:
            cam.px -= math.sin(cam.yaw) * speed
            cam.pz += math.cos(cam.yaw) * speed
        if keys[pygame.K_a]:
            cam.px -= math.cos(cam.yaw) * speed
            cam.pz -= math.sin(cam.yaw) * speed
        if keys[pygame.K_d]:
            cam.px += math.cos(cam.yaw) * speed
            cam.pz += math.sin(cam.yaw) * speed

        render_scene(screen, world, cam)
        pygame.display.flip()
        clock.tick(30)

if __name__ == "__main__":
    main()
