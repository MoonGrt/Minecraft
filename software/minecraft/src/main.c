#include "cyber.h"
#include "delay.h"
#include "map.h"
#include "texture.h"

void demo_DVTC(void);

void main()
{
    delay_init();
    delay_s(1);
    demo_USART();
    demo_DVTC();
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