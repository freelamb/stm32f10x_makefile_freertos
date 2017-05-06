//
// Created by YangYongbao on 2017/3/16.
//

#include "stm32f10x.h"
#include "stm32f10x_conf.h"
#include "FreeRTOS.h"
#include "task.h"
#include "uart_log.h"

void Delay(__IO uint32_t nCount)
{
    for(; nCount != 0; nCount--);
}

void RCC_Configuration(void)
{
    /* GPIOA, GPIOB clock enable */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOB, ENABLE);
}

void GPIO_Configuration(void)
{
    GPIO_InitTypeDef GPIO_InitStructure;

    GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_11;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);
}

void vTaskFunction(void * pvParameters)
{
    debug("start task");
    while (1) {
        GPIO_ResetBits(GPIOB, GPIO_Pin_11);
        vTaskDelay(1000);
        GPIO_SetBits(GPIOB, GPIO_Pin_11);
        vTaskDelay(1000);
    }
}

int main()
{
    // init uart log
    uart_log_init();

    RCC_Configuration();
    GPIO_Configuration();

    debug("start main");
    const char* pcTextForTask1 = "Task1 is running\r\n";


    xTaskCreate(vTaskFunction, "Task 1", 16, (void*)pcTextForTask1, 1, NULL);

    vTaskStartScheduler();

    while (1);

    return 0;
}