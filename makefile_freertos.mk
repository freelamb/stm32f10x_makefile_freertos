
# source director
FREERTOS_SRC_DIR     = $(FREERTOS_DIR)
FREERTOS_INC_DIR     = $(FREERTOS_DIR)/include
FREERTOS_ARM_CM3_DIR = $(FREERTOS_DIR)/portable/GCC/ARM_CM3
FREERTOS_MemMang_DIR = $(FREERTOS_DIR)/portable/MemMang

# add freertos source
SRC  += $(FREERTOS_SRC_DIR)/list.c
SRC  += $(FREERTOS_SRC_DIR)/queue.c
SRC  += $(FREERTOS_SRC_DIR)/croutine.c
SRC  += $(FREERTOS_SRC_DIR)/tasks.c

SRC  += $(FREERTOS_ARM_CM3_DIR)/port.c

SRC  += $(FREERTOS_MemMang_DIR)/heap_4.c

# include directories
INCLUDE_DIRS += $(FREERTOS_INC_DIR)
INCLUDE_DIRS += $(FREERTOS_ARM_CM3_DIR)


