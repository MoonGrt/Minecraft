#include "cyber.h"
#include "delay.h"
#include "map.h"
#include "texture.h"
#include "lcd.h"

#define DEMO_LCD
#define FPS_STR

void demo_USART(void);
void demo_DVTC(void);

// ----------------- Math -----------------
static inline float sqrtf(float x) {
    if (x <= 0.0f) return 0.0f;
    // fast inverse sqrt (Quake III) then invert
    float xhalf = 0.5f * x;
    int i = *(int*)&x;
    i = 0x5f3759df - (i >> 1);
    float y = *(float*)&i;
    // one Newton iteration for inv sqrt
    y = y * (1.5f - xhalf * y * y);
    // invert to get sqrt
    return x * y;
}

// 简单整数噪声函数
static int16_t noise(int x, int y) {
    uint32_t n = (uint32_t)(x * 73856093) ^ (uint32_t)(y * 19349663);
    n = (n << 13) ^ n;
    uint32_t nn = (n * (n * n * 15731u + 789221u) + 1376312589u);
    return (int16_t)(nn >> 16);
}

// 伪随机数生成器（LCG）
#define RAND_MAX  0x7FFF
static uint32_t rng_state = 1;
static inline void srand(uint32_t seed) { rng_state = seed; }
static inline int rand(void) {
    rng_state = rng_state * 1103515245u + 12345u;
    return (int)((rng_state >> 16) & RAND_MAX);
}

// ----------------- Ray DDA 并返回 RGB565 颜色 -----------------
#define PI 3.1416
#define MAX_STEPS 63  // 最多步数（防止无限）
// #define RAYCAST_INCREMENTAL_UV
#ifndef RAYCAST_INCREMENTAL_UV
static uint16_t raycast(float ox, float oy, float oz, float dx, float dy, float dz) {
    // 起始方块坐标（floor）
    int bx = (int)floorf(ox);
    int by = (int)floorf(oy);
    int bz = (int)floorf(oz);
    // printf("Init -> (%d, %d, %d)\n", bx, by, bz);
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
    // printf("tMaxX=%f, tMaxY=%f, tMaxZ=%f\n", tMaxX, tMaxY, tMaxZ);
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
        // printf("Step %d -> (%d, %d, %d) - Axis: %d\n", i, bx, by, bz, steppedAxis);

        // 检查越界或命中
        uint8_t id = 0;
        if ((unsigned)bx < MAPSIZE && (unsigned)by < MAPSIZE && (unsigned)bz < MAPSIZE)
            id = get_block(bx, by, bz);
        else
            // 越界当作空气（不命中），直接返回背景色
            // printf("Ray out of bounds at (%d, %d, %d)\n", bx, by, bz);
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
            // printf("id: %d, texidx: %d, u: %d, v: %d\n", id, texidx, u, v);
            return get_texture(texidx, u, v);
        }
        // 否则继续下一步
    }
    // 未命中——背景色（黑）
    // printf("Ray missed at (%d, %d, %d)\n", bx, by, bz);
    return 0x0000;
}
#else
static uint16_t raycast(float ox, float oy, float oz, float dx, float dy, float dz) {
    // ===== 起始体素 =====
    int bx = (int)floorf(ox);
    int by = (int)floorf(oy);
    int bz = (int)floorf(oz);
    // ===== 步进方向 =====
    int stepX = (dx > 0.0f) ? 1 : -1;
    int stepY = (dy > 0.0f) ? 1 : -1;
    int stepZ = (dz > 0.0f) ? 1 : -1;
    // ===== tDelta =====
    float invDx = (dx != 0.0f) ? (1.0f / fabsf(dx)) : 1e30f;
    float invDy = (dy != 0.0f) ? (1.0f / fabsf(dy)) : 1e30f;
    float invDz = (dz != 0.0f) ? (1.0f / fabsf(dz)) : 1e30f;
    // ===== 初始 tMax =====
    float tMaxX = (stepX > 0) ? ((float)(bx + 1) - ox) * invDx : (ox - (float)bx) * invDx;
    float tMaxY = (stepY > 0) ? ((float)(by + 1) - oy) * invDy : (oy - (float)by) * invDy;
    float tMaxZ = (stepZ > 0) ? ((float)(bz + 1) - oz) * invDz : (oz - (float)bz) * invDz;
    // ===== 面内参数（只初始化一次）=====
    float fracX = ox - floorf(ox);
    float fracY = oy - floorf(oy);
    float fracZ = oz - floorf(oz);
    // ===== 每跨一个面，UV 走多少 =====
    float stepUX = dy * invDx;
    float stepVX = dz * invDx;
    float stepUY = dx * invDy;
    float stepVY = dz * invDy;
    float stepUZ = dx * invDz;
    float stepVZ = dy * invDz;
    // ===== DDA 主循环 =====
    for (int i = 0; i < MAX_STEPS; ++i) {
        int steppedAxis;
        if (tMaxX <= tMaxY && tMaxX <= tMaxZ) {
            // ---- 跨 X 面 ----
            tMaxX += invDx;
            bx += stepX;
            fracY += stepUX;
            fracZ += stepVX;
            steppedAxis = 1;
        }
        else if (tMaxY <= tMaxX && tMaxY <= tMaxZ) {
            // ---- 跨 Y 面 ----
            tMaxY += invDy;
            by += stepY;
            fracX += stepUY;
            fracZ += stepVY;
            steppedAxis = 2;
        }
        else {
            // ---- 跨 Z 面 ----
            tMaxZ += invDz;
            bz += stepZ;
            fracX += stepUZ;
            fracY += stepVZ;
            steppedAxis = 3;
        }

        // 保证在 [0,1)
        fracX -= floorf(fracX);
        fracY -= floorf(fracY);
        fracZ -= floorf(fracZ);

        // 越界检测
        if ((unsigned)bx >= MAPSIZE ||
            (unsigned)by >= MAPSIZE ||
            (unsigned)bz >= MAPSIZE)
            return 0x0000;

        uint8_t id = get_block(bx, by, bz);
        if (id == 0)
            continue;

        // ===== 命中：直接用面内参数 =====
        int u = 0, v = 0;
        uint8_t texidx = 0;
        if (steppedAxis == 1) {
            // X 面（YZ）
            u = (int)(fracY * 16.0f) & 15;
            v = (int)(fracZ * 16.0f) & 15;
            texidx = (dx > 0.0f) ? block_face_texture[id][3] : block_face_texture[id][2];
        }
        else if (steppedAxis == 2) {
            // Y 面（XZ）
            u = (int)(fracX * 16.0f) & 15;
            v = (int)(fracZ * 16.0f) & 15;
            texidx = (dy > 0.0f) ? block_face_texture[id][4] : block_face_texture[id][1];
        }
        else {
            // Z 面（XY）
            u = (int)(fracX * 16.0f) & 15;
            v = (int)(fracY * 16.0f) & 15;
            texidx = (dz > 0.0f) ? block_face_texture[id][5] : block_face_texture[id][0];
        }
        return get_texture(texidx, u, v);
    }
    // 未命中
    return 0x0000;
}
#endif

// ----------------- 渲染函数（按像素发射射线并写入 Framebuffer） -----------------
typedef struct {
    float px, py, pz; // 相机位置
    float dx, dy, dz; // 前向单位向量
    float ux, uy, uz; // 上向单位向量
    float vx, vy, vz; // 右向单位向量
    float fov;        // 垂直视场（度）
} Camera;

// 渲染入口：只负责计算结果写入 Framebuffer
void fps_str_mask(int x, int y, unsigned int color);
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
            // printf("(x, y)(%d, %d) => (u, v)(%f, %f)\n", px, py, u, v);
            // 构造世界方向
            float dirx = cam->dx + u * cam->vx + v * cam->ux;
            float diry = cam->dy + u * cam->vy + v * cam->uy;
            float dirz = cam->dz + u * cam->vz + v * cam->uz;
            // 归一化方向
            float len = sqrtf(dirx*dirx + diry*diry + dirz*dirz);
            if (len > 0.0f) { dirx /= len; diry /= len; dirz /= len; }
            // 发射射线得到颜色
            // printf("len: %f, (dx, dy, dz)(%f, %f, %f)\n", len, dirx, diry, dirz);
            uint16_t color = raycast(cam->px, cam->py, cam->pz, dirx, diry, dirz);
            // 注意 Framebuffer 的索引顺序  // mask 用于 FPS 字符显示
            fps_str_mask(px, py, color);
            // printf("x=%d, y=%d, addr=%x, color=%x\n", px, py, &Framebuffer[py][px], color);
            // if (px == 5)
            //     return;
        }
    }
}

// ----------------- 示例：初始化一个简单地图（用于测试） -----------------
#ifdef MAPGEN
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

// static inline int is_coord_valid(int x, int y, int z) {
//     return (x >= 0 && x < MAPX &&
//             y >= 0 && y < MAPY &&
//             z >= 0 && z < MAPZ);
// }

// void init_test_map(void) {
//     const int ground_offset = 5;
//     srand(1234);  // 初始化 Seed
//     memset(MAP, 0, sizeof(MAP));  // 清空地图
//     for (int x = 0; x < MAPX; x++) {
//         for (int z = 0; z < MAPZ; z++) {  // 水平平面
//             // 计算噪声值：[-32768,32767] -> [0,12]
//             int noise_val = noise(x / 4, z / 4);
//             int height = ((noise_val + 32768) * 12) / 65536 + ground_offset;
//             if (height >= MAPY - 3) height = MAPY - 4;
//             if (height < 3) height = 3;
//             // 草方块
//             for (int y = height; y < height + 2 && y < MAPY; y++)
//                 MAP[x][y][z] = BLK_GRASS;
//             // 随机生成树：1%概率
//             if ((rand() % 200) == 0) {
//                 for (int y = height + 2; y < height + 7 && y < MAPY; y++)
//                     MAP[x][y][z] = BLK_OAK_LOG;
//                 for (int xx = x - 3; xx <= x + 3; xx++)
//                     for (int zz = z - 3; zz <= z + 3; zz++)
//                         if (abs(xx - x) + abs(zz - z) < 3)
//                             for (int yy = height + 7; yy < height + 9 && yy < MAPY; yy++)
//                                 if (is_coord_valid(xx, yy, zz))
//                                     MAP[xx][yy][zz] = BLK_OAK_LEAVES;
//             }
//             // 地下方块
//             for (int y = height - 1; y >= 0; y--)
//                 if (y > 1)
//                     MAP[x][y][z] = BLK_DIRT;
//                 else
//                     MAP[x][y][z] = BLK_STONE;
//         }
//     }
//     // 底层基岩
//     for (int x = 0; x < MAPX; x++)
//         for (int z = 0; z < MAPZ; z++)
//             MAP[x][0][z] = BLK_BEDROCK;
// }
#endif


// ----------------- Main -----------------
#define STEP 0.5f // 每次移动的距离
// 初始化相机
Camera cam = {
    .px = 16.5f, .py = 16.5f, .pz = 31.0f,
    .dx =  0.0f, .dy =  0.0f, .dz = -1.0f,
    .ux = -1.0f, .uy =  0.0f, .uz =  0.0f,
    .vx =  0.0f, .vy =  1.0f, .vz =  0.0f,
    .fov = 60.0f
};

#define RAD(deg) ((deg) * (float)PI / 180.0f)
#define DEG(rad) ((rad) * 180.0f / (float)PI)
const float world_up[3] = {0.0f, 1.0f, 0.0f};  // 世界坐标系的上向量
void printf_cam(Camera* cam) {
    printf("Cam.p: px=%f py=%f pz=%f\n", cam->px, cam->py, cam->pz);
    printf("Cam.d: dx=%f dy=%f dz=%f\n", cam->dx, cam->dy, cam->dz);
    printf("Cam.u: ux=%f uy=%f uz=%f\n", cam->ux, cam->uy, cam->uz);
    printf("Cam.v: vx=%f vy=%f vz=%f\n", cam->vx, cam->vy, cam->vz);
    printf("Cam.fov: %f\n", cam->fov);
}
void set_camera_direction(Camera* cam, float radx, float rady) {
    float cosPitch = cosf(rady);
    float sinPitch = sinf(rady);
    float cosYaw   = cosf(radx);
    float sinYaw   = sinf(radx);
    // 前向向量
    cam->dx = sinYaw * cosPitch;
    cam->dy = sinPitch;
    cam->dz = -cosYaw * cosPitch;
    // 右向量
    cam->vx = world_up[1]*cam->dz - world_up[2]*cam->dy;
    cam->vy = world_up[2]*cam->dx - world_up[0]*cam->dz;
    cam->vz = world_up[0]*cam->dy - world_up[1]*cam->dx;
    float right_len = sqrtf(cam->vx*cam->vx + cam->vy*cam->vy + cam->vz*cam->vz);
    cam->vx /= right_len; cam->vy /= right_len; cam->vz /= right_len;
    // 上向量 = forward × right
    cam->ux = cam->dy*cam->vz - cam->dz*cam->vy;
    cam->uy = cam->dz*cam->vx - cam->dx*cam->vz;
    cam->uz = cam->dx*cam->vy - cam->dy*cam->vx;
    float up_len = sqrtf(cam->ux*cam->ux + cam->uy*cam->uy + cam->uz*cam->uz);
    cam->ux /= up_len; cam->uy /= up_len; cam->uz /= up_len;
}

#ifdef FPS_STR
void timer_test(void);
void fps_calculate(Camera *cam);
#endif

void main()
{
    delay_init();
    demo_USART();
    demo_DVTC();

    // Minecraft
    set_camera_direction(&cam, RAD(0), RAD(0));
    printf_cam(&cam);
#ifdef MAPGEN
    // 初始化 MAP
    init_test_map();
    printf("Init MAP Completed...\n");
#endif

#ifdef FPS_STR
    // timer_test();
    fps_calculate(&cam);
#else
    // 渲染场景
    render_scene(&cam);
    printf("Frame Rendering Once\n");
    // while (1)
    // {
    //     // 渲染场景
    //     render_scene(&cam);
    //     printf("Frame rendering once\n");
    // }
#endif
}

uint8_t Serial_RxData; // 定义串口接收的数据变量
void irqCallback()
{
#ifdef CYBER_USART
    if (USART_GetITStatus(USART1, USART_IT_RXNE) == SET)
    {
        Serial_RxData = USART_ReceiveData(USART1);
        USART_SendData(USART1, Serial_RxData); // 回显
        switch (Serial_RxData)
        {
            case 'w': cam.px += STEP; break;  // 前
            case 's': cam.px -= STEP; break;  // 后
            case 'a': cam.pz += STEP; break;  // 左
            case 'd': cam.pz -= STEP; break;  // 右
            default: return; // 非 wasd 不处理
        }
        printf(" -> Cam pos: x=%d y=%d z=%d\n", (int)cam.px, (int)cam.py, (int)cam.pz);
    }
#endif
}

#ifdef CYBER_USART
void demo_USART(void)
{
    /*GPIO初始化*/
    GPIO_InitTypeDef GPIO_InitStructure;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure); // 将PB0引脚初始化为复用推挽输出

    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure); // 将PB1引脚初始化为上拉输入

    /*USART初始化*/
    USART_InitTypeDef USART_InitStructure;                                          // 定义结构体变量
    USART_InitStructure.USART_BaudRate = 115200;                                    // 波特率
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None; // 硬件流控制，不需要  可以不配置，默认为None
    USART_InitStructure.USART_Mode = USART_Mode_Tx | USART_Mode_Rx;                 // 模式，发送模式和接收模式均选择
    USART_InitStructure.USART_Parity = USART_Parity_No;                             // 奇偶校验，不需要
    USART_InitStructure.USART_StopBits = USART_StopBits_1;                          // 停止位，选择1位
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;                     // 字长，选择8位
    USART_Init(USART1, &USART_InitStructure);                                       // 将结构体变量交给USART_Init，配置USART1
    /*中断输出配置*/
    USART_ITConfig(USART1, USART_IT_RXNE, ENABLE); // 开启串口接收数据的中断

    /*USART使能*/
    USART_Cmd(USART1, ENABLE); // 使能USART1，串口开始运行
    /*USART发送*/
    printf("Cyber USART Test\r\n");
}
#endif

#ifdef CYBER_DVTC


#ifdef DEMO_HDMI

void demo_hdmi(void)
{
}

#endif // DEMO_HDMI

#ifdef DEMO_LCD

#include "lcd.h"
#include "dvtc.h"

void demo_lcd(void)
{
    /* DVTC
       DVTC仅使用一个图层，如果要使用双图层则需使用DMA2D的前景和背景来实现
       仅存储的有1帧图像
    */
    LCD_DVTC_Init();
    /* 使能DVTC */
    DVTC_Cmd(ENABLE);

    const uint16_t colors[8] = {
        0xFFFF, 0xFFE0, 0x07FF, 0x07E0,
        0xF81F, 0xF800, 0x001F, 0x0000
    };
    uint16_t *ptr = &Framebuffer[0][0];
    for (uint32_t y = 0; y < DISPY; y++)
        for (uint32_t x = 0; x < DISPX; x++)
            *ptr++ = colors[(x * 8) / DISPX];
}
#endif // DEMO_LCD

void demo_DVTC(void)
{
#ifdef DEMO_HDMI
    demo_hdmi();
#endif
#ifdef DEMO_LCD
    demo_lcd();
#endif
}

#endif

#ifdef FPS_STR

#define FRAME_NUM 1
#define CPU_FREQ  50000000ULL  // Hz

#define CHAR_WIDTH 16
#define CHAR_HEIGHT 32
#define CHARS 15   // 字符库数量
#define SCREEN_W 640
#define SCREEN_H 480
#define STRLEN 10

uint32_t frame_cnt = 0;
uint64_t cycle_start = 0;
float fps = 0.0f;
float time = 0.0f;
char fps_str[10] = {0,0,0,0,0,0,0,0,0,0};

// 读取 CPU cycle 计数器
static inline uint64_t read_cycle(void)
{
    uint32_t hi, lo;
    asm volatile ("csrr %0, mcycleh" : "=r"(hi));
    asm volatile ("csrr %0, mcycle"  : "=r"(lo));
    return ((uint64_t)hi << 32) | lo;
}

// 映射字符到 font index
int charmap(char c) {
    if(c >= '0' && c <= '9') return c - '0';
    if(c == 'F') return 10;
    if(c == 'P') return 11;
    if(c == 'S') return 12;
    if(c == ':') return 13;
    if(c == '.') return 14;
    return -1;
}

// 绘制字符到 framebuffer
/* 字模库，宽16像素，高32像素 */
const uint16_t CHAR_32_16[CHARS][CHAR_HEIGHT] = {
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x03C0,0x0620,0x0C30,0x1818,0x1818,0x1808,0x300C,0x300C,0x300C,0x300C,0x300C,0x300C,0x300C,0x300C,0x300C,0x300C,0x1808,0x1818,0x1818,0x0C30,0x0620,0x03C0,0x0000,0x0000,0x0000,0x0000,  // '0'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0080,0x0180,0x1F80,0x0180,0x0180,0x0180,0x0180,0x0180,0x0180,0x0180,0x0180,0x0180,0x0180,0x0180,0x0180,0x0180,0x0180,0x0180,0x0180,0x0180,0x03C0,0x1FF8,0x0000,0x0000,0x0000,0x0000,  // '1'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x07E0,0x0838,0x1018,0x200C,0x200C,0x300C,0x300C,0x000C,0x0018,0x0018,0x0030,0x0060,0x00C0,0x0180,0x0300,0x0200,0x0404,0x0804,0x1004,0x200C,0x3FF8,0x3FF8,0x0000,0x0000,0x0000,0x0000,  // '2'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x07C0,0x1860,0x3030,0x3018,0x3018,0x3018,0x0018,0x0018,0x0030,0x0060,0x03C0,0x0070,0x0018,0x0008,0x000C,0x000C,0x300C,0x300C,0x3008,0x3018,0x1830,0x07C0,0x0000,0x0000,0x0000,0x0000,  // '3'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0060,0x0060,0x00E0,0x00E0,0x0160,0x0160,0x0260,0x0460,0x0460,0x0860,0x0860,0x1060,0x3060,0x2060,0x4060,0x7FFC,0x0060,0x0060,0x0060,0x0060,0x0060,0x03FC,0x0000,0x0000,0x0000,0x0000,  // '4'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0FFC,0x0FFC,0x1000,0x1000,0x1000,0x1000,0x1000,0x1000,0x13E0,0x1430,0x1818,0x1008,0x000C,0x000C,0x000C,0x000C,0x300C,0x300C,0x2018,0x2018,0x1830,0x07C0,0x0000,0x0000,0x0000,0x0000,  // '5'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x01E0,0x0618,0x0C18,0x0818,0x1800,0x1000,0x1000,0x3000,0x33E0,0x3470,0x3818,0x3808,0x300C,0x300C,0x300C,0x300C,0x300C,0x180C,0x1808,0x0C18,0x0E30,0x03E0,0x0000,0x0000,0x0000,0x0000,  // '6'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x1FFC,0x1FFC,0x1008,0x3010,0x2010,0x2020,0x0020,0x0040,0x0040,0x0040,0x0080,0x0080,0x0100,0x0100,0x0100,0x0100,0x0300,0x0300,0x0300,0x0300,0x0300,0x0300,0x0000,0x0000,0x0000,0x0000,  // '7'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x07E0,0x0C30,0x1818,0x300C,0x300C,0x300C,0x380C,0x3808,0x1E18,0x0F20,0x07C0,0x18F0,0x3078,0x3038,0x601C,0x600C,0x600C,0x600C,0x600C,0x3018,0x1830,0x07C0,0x0000,0x0000,0x0000,0x0000,  // '8'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x07C0,0x1820,0x3010,0x3018,0x6008,0x600C,0x600C,0x600C,0x600C,0x600C,0x701C,0x302C,0x186C,0x0F8C,0x000C,0x0018,0x0018,0x0010,0x3030,0x3060,0x30C0,0x0F80,0x0000,0x0000,0x0000,0x0000,  // '9'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x7FFC,0x181C,0x1804,0x1802,0x1802,0x1800,0x1800,0x1810,0x1810,0x1830,0x1FF0,0x1830,0x1810,0x1810,0x1810,0x1800,0x1800,0x1800,0x1800,0x1800,0x1800,0x7E00,0x0000,0x0000,0x0000,0x0000,  // 'F'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x7FF0,0x1818,0x180C,0x1806,0x1806,0x1806,0x1806,0x1806,0x1806,0x180C,0x1818,0x1FE0,0x1800,0x1800,0x1800,0x1800,0x1800,0x1800,0x1800,0x1800,0x1800,0x7E00,0x0000,0x0000,0x0000,0x0000,  // 'P'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0FC8,0x1878,0x3018,0x6018,0x6008,0x6008,0x6000,0x7000,0x3C00,0x1F00,0x07C0,0x01F0,0x0078,0x0018,0x001C,0x400C,0x400C,0x600C,0x200C,0x3018,0x3830,0x27E0,0x0000,0x0000,0x0000,0x0000,  // 'S'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0180,0x03C0,0x03C0,0x0180,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0180,0x03C0,0x03C0,0x0180,0x0000,0x0000,0x0000,0x0000,  // ':'
    0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x1800,0x3C00,0x3C00,0x1800,0x0000,0x0000,0x0000,0x0000,  // '.'
};
void draw_char(char c, int x, int y) {
    int idx = charmap(c);
    if(idx < 0) return;
    for (int row = 0; row < CHAR_HEIGHT; row++) {
        uint16_t row_bits = CHAR_32_16[idx][row]; // 每行16位
        for (int col = 0; col < CHAR_WIDTH; col++) {
            // 左上角是高位
            if (row_bits & (1 << (15 - col))) {
                int px = x + col;
                int py = y + row;
                if (px >= 0 && px < SCREEN_W && py >= 0 && py < SCREEN_H)
                    Framebuffer[py][px] = 0xffff;
            }
        }
    }
}

// 浮点转字符串
void float_to_str(float fps, char *buf) {
    int int_part = (int)fps;           // 整数部分
    int dec_part = (int)((fps - int_part) * 100 + 0.5f); // 小数部分四舍五入到两位

    int idx = 0;
    // 写 "FPS:"
    buf[idx++] = 'F';
    buf[idx++] = 'P';
    buf[idx++] = 'S';
    buf[idx++] = ':';

    // 写整数部分
    if(int_part >= 100) {
        buf[idx++] = '0' + (int_part / 100);       // 百位
        buf[idx++] = '0' + (int_part / 10 % 10);   // 十位
        buf[idx++] = '0' + (int_part % 10);        // 个位
    } else if(int_part >= 10) {
        buf[idx++] = '0';                    // 百位
        buf[idx++] = '0' + (int_part / 10);  // 十位
        buf[idx++] = '0' + (int_part % 10);  // 个位
    } else {
        buf[idx++] = '0';             // 百位
        buf[idx++] = '0';             // 百位
        buf[idx++] = '0' + int_part;  // 个位
    }

    // 写小数点
    buf[idx++] = '.';

    // 写小数部分，两位
    buf[idx++] = '0' + (dec_part / 10);
    buf[idx++] = '0' + (dec_part % 10);

    // 结束符
    buf[idx] = '\0';
}

// 绘制FPS
#define DRAW_FPS(x) draw_string(fps, 0, 0)
void draw_string(float fps, int x, int y) {
    // 将浮点数转成字符串，保留两位小数
    float_to_str(fps, fps_str);
    for(int i=0; i<STRLEN; i++) {
        draw_char(fps_str[i], x + i * CHAR_WIDTH, y);
    }
}
void fps_str_mask(int x, int y, unsigned int color) {
    if ((x < STRLEN * CHAR_WIDTH) && (y < CHAR_HEIGHT) && 
        (CHAR_32_16[charmap(fps_str[x / CHAR_WIDTH])][y] & (1 << (15 - (x % CHAR_WIDTH)))))
            Framebuffer[y][x] = 0xffff;
    else Framebuffer[y][x] = color;
}

void timer_test(void)
{
    uint64_t c1, c2, delta;
    double time;

    printf("===== timer_test start =====\n");

    c1 = read_cycle();
    uint32_t cnt = 100000;
    while (cnt--) {
        __asm__ volatile ("nop");
    }
    c2 = read_cycle();

    delta = c2 - c1;
    time = (double)delta * 1000.0 / (double)CPU_FREQ;
    printf("mcycle start : %lu\n", (unsigned long int)c1);
    printf("mcycle end   : %lu\n", (unsigned long int)c2);
    printf("mcycle delta : %lu\n", (unsigned long int)delta);
    printf("time approx : %f ms\n", time);
    printf("===== timer_test end =====\n");
}

void fps_calculate(Camera *cam)
{
    while (1)
    {
        if (frame_cnt == 0)
        {
            cycle_start = read_cycle();
            DRAW_FPS(fps);
            printf("render start\n");
        }

        // ====== 这里是真正的一帧处理 ======
        render_scene(cam);
        // ===============================

        frame_cnt++;

        if (frame_cnt >= FRAME_NUM)
        {
            uint64_t cycle_end = read_cycle();
            uint64_t delta = cycle_end - cycle_start;
            fps = (double)FRAME_NUM * CPU_FREQ / (double)delta;
            time = (double)delta / (double)CPU_FREQ;
            
            printf("mcycle start : %lu\n", (unsigned long int)cycle_start);
            printf("mcycle end   : %lu\n", (unsigned long int)cycle_end);
            printf("mcycle delta : %lu\n", (unsigned long int)delta);
            printf("time approx  : %f ms\n", time);
            printf("fps: %f\n", fps);
            DRAW_FPS(fps);
            frame_cnt = 0;
        }
    }
}

#endif
