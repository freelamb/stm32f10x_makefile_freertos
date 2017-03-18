
# STD Defines
DDEFS += -DSTM32F10X_MD -DUSE_STDPERIPH_DRIVER -DHSE_VALUE=8000000

# source director
STM32F1_STD_LIB     = $(LIB_DIR)/STM32F10x_StdPeriph_Driver
STM32F1_CORE_DIR    = $(LIB_DIR)/CMSIS/CM3/CoreSupport
STM32F1_DEVICE_DIR  = $(LIB_DIR)/CMSIS/CM3/DeviceSupport/ST/STM32F10x
STM32F1_SRC_DIR     = $(STM32F1_STD_LIB)/src
STM32F1_INC_DIR     = $(STM32F1_STD_LIB)/inc

# startup
ASM_SRC  += $(STM32F1_DEVICE_DIR)/startup/gcc_ride7/startup_stm32f10x_md.s

# CMSIS
SRC  += $(STM32F1_DEVICE_DIR)/system_stm32f10x.c
SRC  += $(STM32F1_CORE_DIR)/core_cm3.c

# use libraries, please add or remove when you use or remove it.
SRC  += $(STM32F1_SRC_DIR)/stm32f10x_rcc.c
SRC  += $(STM32F1_SRC_DIR)/stm32f10x_gpio.c
SRC  += $(STM32F1_SRC_DIR)/stm32f10x_exti.c
SRC  += $(STM32F1_SRC_DIR)/stm32f10x_usart.c
SRC  += $(STM32F1_SRC_DIR)/misc.c

# include directories
INCLUDE_DIRS += $(STM32F1_CORE_DIR)
INCLUDE_DIRS += $(STM32F1_DEVICE_DIR)
INCLUDE_DIRS += $(STM32F1_INC_DIR)
INCLUDE_DIRS += $(STM32F1_STD_LIB)

