//#include "stm32f4xx.h"
#include "stm32f4xx_hal.h"
#include "stm32f429i_discovery_lcd.h"

//GPIO_InitTypeDef GPIO_InitStructure;

int main(void) {
	/*RCC->AHB1ENR |= RCC_AHB1ENR_GPIOGEN;
	GPIOG->MODER &= ~GPIO_MODER_MODER13;
	GPIOG->MODER |= GPIO_MODER_MODER13_0;
	
	while (1) {
		GPIOG->BSRR = GPIO_BSRR_BS_13;
		GPIOG->BSRR = GPIO_BSRR_BR_13;
	}*/
	
	HAL_Init();
	
	BSP_LCD_Init();
	
	/*__HAL_RCC_GPIOG_CLK_ENABLE();
	
	GPIO_InitStructure.Pin = GPIO_PIN_13;
	GPIO_InitStructure.Speed = GPIO_SPEED_MEDIUM;
	GPIO_InitStructure.Mode = GPIO_MODE_OUTPUT_PP;
	HAL_GPIO_Init(GPIOG, &GPIO_InitStructure);
	
	while (1) {
		HAL_GPIO_WritePin(GPIOG, GPIO_PIN_13, GPIO_PIN_SET);
		HAL_GPIO_WritePin(GPIOG, GPIO_PIN_13, GPIO_PIN_RESET);
	}*/
}
