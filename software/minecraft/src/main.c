#include "cyber.h"
#include "delay.h"
#include "map.h"
#include "texture.h"
#include "lcd.h"

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
static uint16_t raycast(float ox, float oy, float oz, float dx, float dy, float dz) {
    // 起始方块坐标（floor）
    int bx = (int)floorf(ox);
    int by = (int)floorf(oy);
    int bz = (int)floorf(oz);
    // 步进方向
    int stepX = (dx > 0.0f) ? 1 : -1;
    int stepY = (dy > 0.0f) ? 1 : -1;
    int stepZ = (dz > 0.0f) ? 1 : -1;
    // 计算 tDelta（穿过每个单位格在参数 t 上的增量）
    float invDx = (dx != 0.0f) ? (1.0f / fabsf(dx)) : 1e30f;
    float invDy = (dy != 0.0f) ? (1.0f / fabsf(dy)) : 1e30f;
    float invDz = (dz != 0.0f) ? (1.0f / fabsf(dz)) : 1e30f;
    float tDeltaX = invDx;
    float tDeltaY = invDy;
    float tDeltaZ = invDz;
    // 计算初始 tMax：从起点到第一条网格面的距离（以 t 参数计）
    float tMaxX = (stepX > 0)
        ? ((float)(bx + 1) - ox) * invDx
        : (ox - (float)bx) * invDx;
    float tMaxY = (stepY > 0)
        ? ((float)(by + 1) - oy) * invDy
        : (oy - (float)by) * invDy;
    float tMaxZ = (stepZ > 0)
        ? ((float)(bz + 1) - oz) * invDz
        : (oz - (float)bz) * invDz;
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
            tMaxX += tDeltaX;
            steppedAxis = 1;
        } else if (tMaxY <= tMaxX && tMaxY <= tMaxZ) {
            // 走 Y
            tHit = tMaxY;
            by += stepY;
            tMaxY += tDeltaY;
            steppedAxis = 2;
        } else {
            // 走 Z
            tHit = tMaxZ;
            bz += stepZ;
            tMaxZ += tDeltaZ;
            steppedAxis = 3;
        }
        // printf("Step %d: tHit=%f, bx=%d, by=%d, bz=%d, steppedAxis=%d\n", i, tHit, bx, by, bz, steppedAxis);
        // printf("bx=%d, by=%d, bz=%d\n", bx, by, bz);

        // 检查越界或命中
        uint8_t id = 0;
        if ((unsigned)bx < MAPSIZE && (unsigned)by < MAPSIZE && (unsigned)bz < MAPSIZE)
            id = MAP[bx][by][bz];
        else
            // 越界当作空气（不命中），继续循环或直接返回背景色
            // 这里直接返回黑色背景
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
            uint8_t face_tex = 0;
            // 哪一面被命中：注意 stepX>0 时说明我们向 +X 走，进入的是新方块的 -X 面（即 negative X face）
            if (steppedAxis == 1) {
                // X 面（面所在为 YZ）
                float fy = hy - floorf(hy);
                float fz = hz - floorf(hz);
                // 将 f -> [0,15]
                u = (int)(fy * 16.0f) & 15;
                v = (int)(fz * 16.0f) & 15;
                // 选择侧面纹理（我们把所有侧面都映射到 index 1）
                // 如果未来需要区分四个方向，可以根据 stepX/stepZ/stepY 额外判断
                face_tex = block_face_texture[id][1];
            } else if (steppedAxis == 2) {
                // Y 面（面所在为 XZ）；如果 stepY>0（向上）则是新方块的 -Y 面 => 映射为 top/bottom
                float fx = hx - floorf(hx);
                float fz = hz - floorf(hz);
                u = (int)(fx * 16.0f) & 15;
                v = (int)(fz * 16.0f) & 15;
                face_tex = block_face_texture[id][1]; // 侧面
            } else {
                // Z 面（面所在为 XY）
                float fx = hx - floorf(hx);
                float fy = hy - floorf(hy);
                u = (int)(fx * 16.0f) & 15;
                v = (int)(fy * 16.0f) & 15;
                // 顶面/底面选择
                if (dz > 0.0f)
                    // 为简单并匹配常见实现：当 stepY>0（从下向上走，引入的是块的 -Y 面），
                    // 我们把上面的 top 纹理分配给 stepY<0 的情况（即从上向下命中 top）
                    // 实际上我们想：如果命中的是块的顶（向下的射线），使用 top；若命中块的底（向上的射线），使用 bottom。
                    // 因此：dy > 0（向上） => 命中的是 block 的 bottom（index5）；dy <0 => hit top (index0).
                    face_tex = block_face_texture[id][5]; // bottom
                else
                    face_tex = block_face_texture[id][0]; // top
            }
            // 取颜色并返回
            // printf("id: %d, face: %d, u: %d, v: %d\n", id, face_tex, u, v);
            return get_texture(face_tex, u, v);
        }
        // 否则继续下一步
    }
    // 未命中——背景色（黑）
    // printf("Ray missed at (%d, %d, %d)\n", bx, by, bz);
    return 0x0000;
}

// ----------------- 渲染函数（按像素发射射线并写入 Framebuffer） -----------------
typedef struct {
    float px, py, pz; // 相机位置
    float dx, dy, dz; // 前向单位向量
    float ux, uy, uz; // 上向单位向量
    float fov;        // 垂直视场（度）
} Camera;

// 渲染入口：只负责计算结果写入 Framebuffer
void render_scene(Camera *cam)
{
    // 计算右向量 = forward × up
    float rx = cam->dy * cam->uz - cam->dz * cam->uy;
    float ry = cam->dz * cam->ux - cam->dx * cam->uz;
    float rz = cam->dx * cam->uy - cam->dy * cam->ux;
    // 归一化右向量（可选）
    float rlen = sqrtf(rx*rx + ry*ry + rz*rz);
    if (rlen > 1e-6f) { rx /= rlen; ry /= rlen; rz /= rlen; }
    float aspect = (float)DISPX / (float)DISPY;
    float fovScale = tanf(cam->fov * 0.5f * (float)PI / 180.0f);
    // printf("rx=%f, ry=%f, rz=%f, fovScale=%f\n", rx, ry, rz, fovScale);
    // 每像素产生射线并采样
    for (int py = 0; py < DISPY; ++py) {
        for (int px = 0; px < DISPX; ++px) {
            // 屏幕归一化坐标
            float u = (2.0f * (px + 0.5f) / (float)DISPX - 1.0f) * aspect * fovScale;
            float v = (1.0f - 2.0f * (py + 0.5f) / (float)DISPY) * fovScale;
            // 构造世界方向（未严格正交投影，但足够）
            float dirx = cam->dx + u * rx + v * cam->ux;
            float diry = cam->dy + u * ry + v * cam->uy;
            float dirz = cam->dz + u * rz + v * cam->uz;
            // printf("(%d, %d) => (%f, %f) (%f, %f, %f)\n", px, py, u, v, dirx, diry, dirz);
            // 归一化方向
            float len = sqrtf(dirx*dirx + diry*diry + dirz*dirz);
            if (len > 0.0f) { dirx /= len; diry /= len; dirz /= len; }
            // 发射射线得到颜色
            uint16_t color = raycast(cam->px, cam->py, cam->pz, dirx, diry, dirz);
            // 注意 Framebuffer 的索引顺序
            Framebuffer[py][px] = color;
            // printf("x=%d, y=%d, addr=%x, color=%x\n", px, py, &Framebuffer[py][px], color);
            // delay_ms(50); // 延时，降低 CPU 使用率
        }
    }
}

// ----------------- 示例：初始化一个简单地图（用于测试） -----------------
void init_test_map(void) {
    memset(MAP, 0, sizeof(MAP));  // 清空地图
    const int ground_height = 8;  // 草地高度
    // 1. 填充地面
    for (int x = 0; x < MAPX; ++x) {
        for (int y = 0; y < MAPY; ++y) {
            for (int z = 0; z < ground_height - 1; ++z)
                MAP[x][y][z] = BLK_STONE;
            MAP[x][y][ground_height] = BLK_GRASS;
            for (int z = ground_height + 1; z < MAPZ; ++z)
                MAP[x][y][z] = AIR;
        }
    }
    // 2. 在地图中心生成一棵 Minecraft 风格树
    const int center_x = MAPX / 2;
    const int center_y = MAPY / 2;
    const int trunk_height = 5; // 树干高度
    const int leaves_radius = 2; // 树叶半径
    const int leaves_height = 2; // 树叶层数
    // 树干
    for (int z = ground_height + 1; z <= ground_height + trunk_height; ++z)
        MAP[center_x][center_y][z] = BLK_OAK_LOG;
    // 树叶（球状/方块层叠）
    for (int z = ground_height + trunk_height; z <= ground_height + trunk_height + leaves_height; ++z) {
        int layer_radius = leaves_radius + (ground_height + trunk_height) - z;
        if (layer_radius < 1) layer_radius = 1;
        for (int dx = -layer_radius; dx <= layer_radius; ++dx) {
            for (int dy = -layer_radius; dy <= layer_radius; ++dy) {
                int ax = center_x + dx;
                int ay = center_y + dy;
                if (ax < 0 || ax >= MAPX || ay < 0 || ay >= MAPY) continue;
                // 不覆盖树干位置
                if (!(dx == 0 && dy == 0 && z <= ground_height + trunk_height))
                    MAP[ax][ay][z] = BLK_OAK_LEAVES;
            }
        }
    }
    // 3. 底层基岩
    for (int x = 0; x < MAPX; x++)
        for (int y = 0; y < MAPZ; y++)
            MAP[x][y][0] = BLK_BEDROCK;
    // 4. 放几个矿石块作演示
    MAP[10][10][9] = BLK_COAL_ORE;
    MAP[12][ 9][9] = BLK_IRON_ORE;
    MAP[20][20][9] = BLK_COAL_BLOCK;
    MAP[21][20][9] = BLK_IRON_BLOCK;
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


// ----------------- Main -----------------
#define STEP 0.5f // 每次移动的距离
// 初始化相机
/*
Camera up 向量(u)说明：
- 1. 默认 up = (0,0,1) 用于大多数情况。
- 2. 当 forward 与 up 平行或反向时（如 forward = (0,0,±1)），
  计算 right = forward × up 会得到零向量，导致渲染错误。
  - 解决方法：选择与 forward 不平行的 up，例如 (0,1,0)。
*/
Camera cam = {
    .px = 16.0f,
    .py = 16.0f,
    .pz = 24.0f,
    .dx =  0.0f, .ux = 0.0f,
    .dy =  0.0f, .uy = 1.0f,
    .dz = -1.0f, .uz = 0.0f,
    .fov = 60.0f
};

void main()
{
    delay_init();
    demo_USART();
    demo_DVTC();

    // Minecraft
    // 初始化 MAP
    init_test_map();
    printf("Init map completed...\n");
    while (1)
    {
        // 渲染场景
        render_scene(&cam);
        printf("Frame rendering once\n");
    }
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
            case 'w': // 前
                cam.px += STEP;
                break;
            case 's': // 后
                cam.px -= STEP;
                break;
            case 'a': // 左
                cam.pz += STEP;
                break;
            case 'd': // 右
                cam.pz -= STEP;
                break;
            default:
                return; // 非 wasd 不处理
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

#define DEMO_LCD
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