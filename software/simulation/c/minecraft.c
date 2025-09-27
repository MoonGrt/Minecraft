// minecraft_raycast_pc.c
// 移植自嵌入式示例：在 PC 上渲染一次并输出 frame.ppm (RGB24)
// Compile: gcc -std=c11 -O2 -lm -o minecraft_raycast_pc minecraft_raycast_pc.c

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"
#include "texture.h"

// ----------------- Config -----------------
#define DISPX 480
#define DISPY 272
#define MAPX 32
#define MAPY 32
#define MAPZ 32
#define MAPSIZE MAPX

// ----------------- Types & Globals -----------------
typedef uint16_t rgb565_t;
static rgb565_t Framebuffer[DISPY][DISPX];
static uint8_t MAP[MAPX][MAPY][MAPZ]; // 0 = air

// ----------------- Map functions -----------------
static inline uint8_t get_block(int x, int y, int z) {
    if (x < 0 || x >= MAPX || y < 0 || y >= MAPY || z < 0 || z >= MAPZ) return 0;
    return MAP[x][y][z];
}
static inline void set_block(int x, int y, int z, uint8_t id) {
    if (x < 0 || x >= MAPX || y < 0 || y >= MAPY || z < 0 || z >= MAPZ) return;
    MAP[x][y][z] = id;
}

// ----------------- Ray DDA -----------------
#define PI 3.14156f
#define MAX_STEPS 63  // 最多步数（防止无限）
static uint16_t raycast(float ox, float oy, float oz, float dx, float dy, float dz) {
    // 起始方块坐标（floor）
    int bx = (int)floorf(ox);
    int by = (int)floorf(oy);
    int bz = (int)floorf(oz);
    printf("Init -> (%d, %d, %d)\n", bx, by, bz);
    // 步进方向
    int stepX = (dx > 0.0f) ? 1 : -1;
    int stepY = (dy > 0.0f) ? 1 : -1;
    int stepZ = (dz > 0.0f) ? 1 : -1;
    // 计算 tDelta（穿过每个单位格在参数 t 上的增量）
    float invDx = (dx != 0.0f) ? (1.0f / fabsf(dx)) : 1e30f;
    float invDy = (dy != 0.0f) ? (1.0f / fabsf(dy)) : 1e30f;
    float invDz = (dz != 0.0f) ? (1.0f / fabsf(dz)) : 1e30f;
    // 计算初始 tMax：从起点到第一条网格面的距离（以 t 参数计）
    float tMaxX = (stepX > 0) ? ((float)(bx + 1) - ox) * invDx : (ox - (float)bx) * invDx;
    float tMaxY = (stepY > 0) ? ((float)(by + 1) - oy) * invDy : (oy - (float)by) * invDy;
    float tMaxZ = (stepZ > 0) ? ((float)(bz + 1) - oz) * invDz : (oz - (float)bz) * invDz;
    printf("tMaxX=%f, tMaxY=%f, tMaxZ=%f\n", tMaxX, tMaxY, tMaxZ);
    // DDA 主循环
    for (int i = 0; i < MAX_STEPS; ++i) { // 最大步数保护
        // 在 DDA 中更常用的做法是：先跨格（根据最小 tMax），然后检查进入的方块（bx,by,bz 更新后）
        // 因此这里先选轴并跨格，然后检查新方块是否为非空气
        int steppedAxis = 0; // 1=X, 2=Y, 3=Z
        float tHit;
        if (tMaxX <= tMaxY && tMaxX <= tMaxZ) {
            // 走 X
            tHit = tMaxX;
            bx += stepX;
            tMaxX += invDx;
            steppedAxis = 1;
        } else if (tMaxY <= tMaxX && tMaxY <= tMaxZ) {
            // 走 Y
            tHit = tMaxY;
            by += stepY;
            tMaxY += invDy;
            steppedAxis = 2;
        } else {
            // 走 Z
            tHit = tMaxZ;
            bz += stepZ;
            tMaxZ += invDz;
            steppedAxis = 3;
        }
        printf("Step %d -> (%d, %d, %d) - Axis: %d\n", i, bx, by, bz, steppedAxis);

        // 检查越界或命中
        uint8_t id = 0;
        if ((unsigned)bx < MAPSIZE && (unsigned)by < MAPSIZE && (unsigned)bz < MAPSIZE)
            id = get_block(bx, by, bz);
        else
            // 越界当作空气（不命中），直接返回背景色
            return 0x0000;
        if (id != 0) {
            // 发生命中：计算交点坐标
            float hx = ox + dx * tHit;
            float hy = oy + dy * tHit;
            float hz = oz + dz * tHit;
            // 面内 UV（取小数部分）；当碰到 X 面时，面在 YZ 平面 => 用 y,z
            // u,v 取 0...15
            int u = 0, v = 0;
            uint8_t texidx = 0;
            // 哪一面被命中：注意 stepX>0 时说明我们向 +X 走，进入的是新方块的 -X 面（即 negative X face）
            if (steppedAxis == 1) {
                // X 面（面所在为 YZ）
                float fy = hy - floorf(hy);
                float fz = hz - floorf(hz);
                // 将 f -> [0,15]
                u = (int)(fy * 16.0f) & 15;
                v = (int)(fz * 16.0f) & 15;
                // 侧面选择
                if (dx > 0.0f)
                    texidx = block_face_texture[id][3];
                else
                    texidx = block_face_texture[id][2];
            } else if (steppedAxis == 2) {
                // Y 面（面所在为 XZ）；如果 stepY>0（向上）则是新方块的 -Y 面 => 映射为 top/bottom
                float fx = hx - floorf(hx);
                float fz = hz - floorf(hz);
                u = (int)(fx * 16.0f) & 15;
                v = (int)(fz * 16.0f) & 15;
                texidx = block_face_texture[id][1]; // 侧面
                // 侧面选择
                if (dy > 0.0f)
                    texidx = block_face_texture[id][4];
                else
                    texidx = block_face_texture[id][1];
            } else {
                // Z 面（面所在为 XY）
                float fx = hx - floorf(hx);
                float fy = hy - floorf(hy);
                u = (int)(fx * 16.0f) & 15;
                v = (int)(fy * 16.0f) & 15;
                // 顶面/底面选择
                if (dz > 0.0f)
                    // 当 stepY>0（从下向上走，引入的是块的 -Y 面），
                    // 把上面的 top 纹理分配给 stepY<0 的情况（即从上向下命中 top）
                    // 如果命中的是块的顶（向下的射线），使用 top；若命中块的底（向上的射线），使用 bottom。
                    // 因此：dy > 0（向上） => 命中的是 block 的 bottom（index5）；dy <0 => hit top (index0).
                    texidx = block_face_texture[id][5]; // bottom
                else
                    texidx = block_face_texture[id][0]; // top
            }
            // 取颜色并返回
            printf("id: %d, texidx: %d, u: %d, v: %d\n", id, texidx, u, v);
            return get_texture(texidx, u, v);
        }
        // 否则继续下一步
    }
    // 未命中——背景色（黑）
    // printf("Ray missed at (%d, %d, %d)\n", bx, by, bz);
    return 0x0000;
}

// ----------------- Camera & rendering -----------------
typedef struct {
    float px, py, pz;
    float dx, dy, dz; // forward
    float ux, uy, uz; // up
    float vx, vy, vz; // right
    float fov;
} Camera;

const float world_up[3] = {0.0f, 1.0f, 0.0f};

void set_camera_direction(Camera* cam, float radx, float rady) {
    float cosPitch = cosf(rady);
    float sinPitch = sinf(rady);
    float cosYaw   = cosf(radx);
    float sinYaw   = sinf(radx);
    cam->dx = sinYaw * cosPitch;
    cam->dy = sinPitch;
    cam->dz = -cosYaw * cosPitch;
    // right = world_up × forward
    cam->vx = world_up[1]*cam->dz - world_up[2]*cam->dy;
    cam->vy = world_up[2]*cam->dx - world_up[0]*cam->dz;
    cam->vz = world_up[0]*cam->dy - world_up[1]*cam->dx;
    // 归一化方向 - 可选
    // float right_len = sqrtf(cam->vx*cam->vx + cam->vy*cam->vy + cam->vz*cam->vz);
    // if (right_len > 0.0f) { cam->vx /= right_len; cam->vy /= right_len; cam->vz /= right_len; }
    cam->ux = cam->dy*cam->vz - cam->dz*cam->vy;
    cam->uy = cam->dz*cam->vx - cam->dx*cam->vz;
    cam->uz = cam->dx*cam->vy - cam->dy*cam->vx;
    // 归一化方向 - 可选
    // float up_len = sqrtf(cam->ux*cam->ux + cam->uy*cam->uy + cam->uz*cam->uz);
    // if (up_len > 0.0f) { cam->ux /= up_len; cam->uy /= up_len; cam->uz /= up_len; }
}

void render_scene(Camera *cam)
{
    // 计算视场角度
    float aspect = (float)DISPX / (float)DISPY;
    float fovScale = tanf(cam->fov * 0.5f * (float)PI / 180.0f);
    // printf("aspect=%f, fovScale=%f\n", aspect, fovScale);
    // 每像素产生射线并采样
    for (int py = 0; py < DISPY; ++py) {
        for (int px = 0; px < DISPX; ++px) {
            // 屏幕归一化坐标
            float u = (2.0f * (px + 0.5f) / (float)DISPX - 1.0f) * aspect * fovScale;
            float v = (1.0f - 2.0f * (py + 0.5f) / (float)DISPY) * fovScale;
            // printf("\n");
            printf("(x, y)(%d, %d) => (u, v)(%f, %f)\n", px, py, u, v);
            // 构造世界方向
            float dirx = cam->dx + u * cam->vx + v * cam->ux;
            float diry = cam->dy + u * cam->vy + v * cam->uy;
            float dirz = cam->dz + u * cam->vz + v * cam->uz;
            // 归一化方向
            // float len = sqrtf(dirx*dirx + diry*diry + dirz*dirz);
            // if (len > 0.0f) { dirx /= len; diry /= len; dirz /= len; }
            // 发射射线得到颜色
            printf("(dx, dy, dz)(%f, %f, %f)\n", dirx, diry, dirz);
            uint16_t color = raycast(cam->px, cam->py, cam->pz, dirx, diry, dirz);
            // 注意 Framebuffer 的索引顺序
            Framebuffer[py][px] = color;
            printf("x=%d, y=%d, addr=%x, color=%x\n", px, py, &Framebuffer[py][px], color);
            if (px == 5)
                return;
        }
    }
}

// ----------------- Map generator (MAPGEN 模式，类似你原来的) -----------------
#define GROUND 15  // 草地高度
// 地图生成函数
void init_test_map(void) {
    memset(MAP, 0, sizeof(MAP));  // 清空地图
    // 1. 填充地面
    for (int x = 0; x < MAPX; ++x) {
        for (int y = 0; y < MAPY; ++y) {
            for (int z = 0; z < GROUND - 1; ++z)
                set_block(x, y, z, BLK_STONE);
            set_block(x, y, GROUND, BLK_GRASS);
            for (int z = GROUND + 1; z < MAPZ; ++z)
                set_block(x, y, z, AIR);
        }
    }
    // 2. 在地图中心生成一棵 Minecraft 风格树
    const int center_x = MAPX / 2;
    const int center_y = MAPY / 2;
    const int trunk_height = 5; // 树干高度
    const int leaves_radius = 2; // 树叶半径
    const int leaves_height = 2; // 树叶层数
    // 树干
    for (int z = GROUND + 1; z <= GROUND + trunk_height; ++z)
        set_block(center_x, center_y, z, BLK_OAK_LOG);
    // 树叶
    for (int z = GROUND + trunk_height; z <= GROUND + trunk_height + leaves_height; ++z) {
        int layer_radius = leaves_radius + (GROUND + trunk_height) - z;
        if (layer_radius < 1) layer_radius = 1;
        for (int dx = -layer_radius; dx <= layer_radius; ++dx) {
            for (int dy = -layer_radius; dy <= layer_radius; ++dy) {
                int ax = center_x + dx;
                int ay = center_y + dy;
                if (ax < 0 || ax >= MAPX || ay < 0 || ay >= MAPY) continue;
                if (!(dx == 0 && dy == 0 && z <= GROUND + trunk_height))
                    set_block(ax, ay, z, BLK_OAK_LEAVES);
            }
        }
    }
    // 3. 底层基岩
    for (int x = 0; x < MAPX; x++)
        for (int y = 0; y < MAPY; y++)
            set_block(x, y, 0, BLK_BEDROCK);
    // 4. 演示矿石
    set_block(10, 10, GROUND+1, BLK_COAL_ORE);
    set_block(12,  9, GROUND+1, BLK_IRON_ORE);
    set_block(20, 20, GROUND+1, BLK_COAL_BLOCK);
    set_block(21, 20, GROUND+1, BLK_IRON_BLOCK);
}

// ----------------- Output Framebuffer -> PPM -----------------
static inline void rgb565_to_rgb888(uint16_t p, uint8_t *r, uint8_t *g, uint8_t *b) {
    uint8_t r5 = (p >> 11) & 0x1F;
    uint8_t g6 = (p >> 5)  & 0x3F;
    uint8_t b5 =  p        & 0x1F;
    *r = (r5 << 3) | (r5 >> 2);
    *g = (g6 << 2) | (g6 >> 4);
    *b = (b5 << 3) | (b5 >> 2);
}

void topng(void) {
    // ----- 把 framebuffer 转换成 24-bit RGB 内存 -----
    size_t out_stride = DISPX * 3; // 行字节数
    uint8_t *outbuf = malloc(DISPY * out_stride);
    if (!outbuf) {
        perror("malloc");
        return;
    }
    for (int y = 0; y < DISPY; ++y) {
        uint8_t *row = outbuf + y * out_stride;
        for (int x = 0; x < DISPX; ++x) {
            uint8_t r, g, b;
            rgb565_to_rgb888(Framebuffer[y][x], &r, &g, &b);
            row[x*3 + 0] = r;
            row[x*3 + 1] = g;
            row[x*3 + 2] = b;
        }
    }
    // ----- 写 PNG （若要 BMP/JPG 可用 stbi_write_bmp/stbi_write_jpg） -----
    if (!stbi_write_png("minecraft.png", DISPX, DISPY, 3, outbuf, out_stride)) {
        fprintf(stderr, "stbi_write_png failed\n");
        free(outbuf);
        return;
    }
    printf("Saved minecraft.png\n");
    free(outbuf);
}

// ----------------- Main -----------------
int main(void) {
    // init
    init_test_map();
    memset(Framebuffer, 0, sizeof(Framebuffer));

    // camera
    Camera cam = {
        .px = 16.5f, .py = 16.5f, .pz = 31.0f,
        .dx = 0.0f, .dy = 0.0f, .dz = -1.0f,
        .ux = -1.0f, .uy = 0.0f, .uz = 0.0f,
        .vx = 0.0f, .vy = 1.0f, .vz = 0.0f,
        .fov = 60.0f
    };
    set_camera_direction(&cam, 0.0f, 0.0f);

    // printf("Rendering %dx%d, map %dx%dx%d\n", DISPX, DISPY, MAPX, MAPY, MAPZ);
    // render_scene(&cam);
    // topng(); // 保存 framebuffer 到 PNG 文件

    printf("\nRaycasting...\n");
    printf("color=%x\n", raycast(cam.px, cam.py, cam.pz, -0.0224, 0.0153, -0.3600));

    return 0;
}
