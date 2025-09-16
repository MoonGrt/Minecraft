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

// ----------------- Ray DDA 并返回 RGB565 颜色 -----------------
#define PI 3.1416
static uint16_t raycast_sample(float ox, float oy, float oz, float dx, float dy, float dz, int max_steps) {
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

    // 最大步数保护
    for (int i = 0; i < max_steps; ++i) {
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

        // 检查越界或命中
        uint8_t id = 0;
        if ((unsigned)bx < MAPSIZE && (unsigned)by < MAPSIZE && (unsigned)bz < MAPSIZE) {
            id = MAP[bx][by][bz];
        } else {
            // 越界当作空气（不命中），继续循环或直接返回背景色
            // 这里直接返回黑色背景
            printf("Ray out of bounds at (%d, %d, %d)\n", bx, by, bz);
            return 0x0000;
        }
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
                // 顶面/底面选择
                if (dy > 0.0f) {
                    // 向上行进，进入块的是 -Y 面 => new block 的 bottom? 
                    // 语义上更直观的是：如果 ray 向上，穿过的面是 block 的 bottom（朝下）还是 top（朝上）？
                    // 为简单并匹配常见实现：当 stepY>0（从下向上走，引入的是块的 -Y 面），
                    // 我们把上面的 top 纹理分配给 stepY<0 的情况（即从上向下命中 top）
                    // 实际上我们想：如果命中的是块的顶（向下的射线），使用 top；若命中块的底（向上的射线），使用 bottom。
                    // 因此：dy > 0（向上） => 命中的是 block 的 bottom（index5）；dy <0 => hit top (index0).
                    face_tex = block_face_texture[id][5]; // bottom
                } else {
                    face_tex = block_face_texture[id][0]; // top
                }
            } else {
                // Z 面（面所在为 XY）
                float fx = hx - floorf(hx);
                float fy = hy - floorf(hy);
                u = (int)(fx * 16.0f) & 15;
                v = (int)(fy * 16.0f) & 15;
                face_tex = block_face_texture[id][1]; // 侧面
            }
            // 取颜色并返回
            return sample_texture(face_tex, u, v);
        }
        // 否则继续下一步
    }
    // 未命中——背景色（黑）
    printf("Ray missed at (%d, %d, %d)\n", bx, by, bz);
    return 0x0000;
}

// ----------------- 示例：初始化一个简单地图（用于测试） -----------------
void init_test_map(void) {
    // 清空
    memset(MAP, 0, sizeof(MAP));
    // 地面：y=8 以下全为石头（示例）
    for (int x = 0; x < MAPSIZE; ++x) {
        for (int z = 0; z < MAPSIZE; ++z) {
            for (int y = 0; y < 6; ++y)
                MAP[x][y][z] = BLK_STONE;
            // 一层草地
            MAP[x][6][z] = BLK_GRASS;
            // 在中心放一棵树（简单的原木+叶子）
            if ( (x > 14 && x < 18) && (z > 14 && z < 18) ) {
                for (int h = 7; h < 11; ++h) MAP[x][h][z] = BLK_OAK_LOG;
                if ( (x > 13 && x < 19) && (z > 13 && z < 19) ) {
                    for (int h = 11; h < 13; ++h) MAP[x][h][z] = BLK_OAK_LEAVES;
                }
            }
        }
    }
    // 放几个矿石块作演示
    MAP[10][7][10] = BLK_COAL_ORE;
    MAP[12][7][9]  = BLK_IRON_ORE;
    MAP[20][7][20] = BLK_CRAFTING_TABLE;
    MAP[21][7][20] = BLK_FURNACE;
}

// ----------------- 渲染函数（按像素发射射线并写入 Framebuffer） -----------------
typedef struct {
    float px, py, pz;   // 相机位置
    float dx, dy, dz;   // 前向单位向量
    float ux, uy, uz;   // 上向单位向量（不必单位化，但为简便建议已归一）
    float fov;          // 垂直视场（度）
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
            // 归一化方向
            float len = sqrtf(dirx*dirx + diry*diry + dirz*dirz);
            if (len > 0.0f)
                dirx /= len; diry /= len; dirz /= len;
            // 最多步数（防止无限）
            const int MAX_STEPS = 64;
            // 发射射线得到颜色
            uint16_t color = raycast_sample(cam->px, cam->py, cam->pz, dirx, diry, dirz, MAX_STEPS);
            // 注意 Framebuffer 的索引顺序，这里是 [x][y]，保持和你定义一致
            Framebuffer[px][py] = color;
            printf("x=%d, y=%d, addr=%x, color=%x\n", px, py, &Framebuffer[px][py], color);
            delay_ms(1000); // 延时，降低 CPU 使用率
        }
    }
}

void main()
{
    delay_init();
    demo_USART();
    demo_DVTC();

    // Minecraft
    // 初始化相机
    Camera cam = {
        .px = 16.0f,  // 世界中心 (x)
        .py = 10.0f,  // 高度稍微抬起 (y)
        .pz = 31.0f,  // z 比较大，往地图里面看
        .dx = 0.0f,   // 前向向量 = 朝 -Z
        .dy = 0.0f,
        .dz = -1.0f,
        .ux = 0.0f,   // 上向量 = Y 轴
        .uy = 1.0f,
        .uz = 0.0f,
        .fov = 70.0f  // 视场角，类似 Minecraft 默认
    };
    // 初始化 MAP
    init_test_map();
    printf("Init map completed...\n");
    // 渲染场景
    render_scene(&cam);
}

uint8_t Serial_RxData; // 定义串口接收的数据变量
void irqCallback()
{
#ifdef CYBER_USART
    /*!< USART */
    if (USART_GetITStatus(USART1, USART_IT_RXNE) == SET) // 判断是否是USART1的接收事件触发的中断
    {
        Serial_RxData = USART_ReceiveData(USART1); // 读取数据寄存器，存放在接收的数据变量
        USART_SendData(USART1, Serial_RxData);
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