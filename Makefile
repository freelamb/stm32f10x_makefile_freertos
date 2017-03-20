
# toolchain
TOOLCHAIN    = arm-none-eabi-
CC           = $(TOOLCHAIN)gcc
CP           = $(TOOLCHAIN)objcopy
AS           = $(TOOLCHAIN)gcc -x assembler-with-cpp
HEX          = $(CP) -O ihex
BIN          = $(CP) -O binary -S

# define mcu, specify the target processor
MCU          = cortex-m3

# define root dir
ROOT_DIR     = .

# define include dir
INCLUDE_DIRS =

# define bin dir
BIN_DIR      = $(ROOT_DIR)/bin

# define lib dir
LIB_DIR      = $(ROOT_DIR)/Libraries

# define freertos dir
FREERTOS_DIR = $(ROOT_DIR)/FreeRTOS

# define user dir
USER_DIR     = $(ROOT_DIR)/user

# link file
LINK_SCRIPT  = $(ROOT_DIR)/stm32_flash.ld

# user specific
SRC       =
ASM_SRC   =
SRC      += $(USER_DIR)/main.c
#SRC      += $(USER_DIR)/uart_log.c

# user include
INCLUDE_DIRS  = $(USER_DIR)

# include sub makefiles
include makefile_std_lib.mk   # STM32 Standard Peripheral Library
include makefile_freertos.mk  # freertos source

INCDIR  = $(patsubst %, -I%, $(INCLUDE_DIRS))

# run from Flash
DEFS	 = $(DDEFS) -DRUN_FROM_FLASH=1

OBJECTS  = $(ASM_SRC:.s=.o) $(SRC:.c=.o)

# Define optimisation level here
OPT = -Os

MC_FLAGS = -mcpu=$(MCU)

AS_FLAGS = $(MC_FLAGS) -g -gdwarf-2 -mthumb  -Wa,-amhls=$(<:.s=.lst)
CP_FLAGS = $(MC_FLAGS) $(OPT) -g -gdwarf-2 -mthumb -fomit-frame-pointer -Wall -fverbose-asm -Wa,-ahlms=$(<:.c=.lst) $(DEFS)
LD_FLAGS = $(MC_FLAGS) -g -gdwarf-2 -mthumb -nostartfiles -Xlinker --gc-sections -T$(LINK_SCRIPT) -Wl,-Map=$(PROJECT_NAME).map,--cref,--no-warn-mismatch $(LIBDIR) $(LIB)

# all the files will be generated with this name (main.elf, main.bin, main.hex, etc)
PROJECT_NAME=$(BIN_DIR)/main

#
# makefile rules
#
all: $(OBJECTS) $(PROJECT_NAME).elf  $(PROJECT_NAME).hex $(PROJECT_NAME).bin
	$(TOOLCHAIN)size $(PROJECT_NAME).elf

%o: %c
	$(CC) -c $(CP_FLAGS) -I . $(INCDIR) $< -o $@

%o: %s
	$(AS) -c $(AS_FLAGS) $< -o $@

%elf: $(OBJECTS)
	$(CC) $(OBJECTS) $(LD_FLAGS) $(LIBS) -o $@

%hex: %elf
	$(HEX) $< $@

%bin: %elf
	$(BIN)  $< $@

flash: $(PROJECT).bin
	st-flash write $(PROJECT).bin 0x8000000

erase:
	st-flash erase

clean:
	-rm -rf $(OBJECTS)
	-rm -rf $(PROJECT_NAME).elf
	-rm -rf $(PROJECT_NAME).map
	-rm -rf $(PROJECT_NAME).hex
	-rm -rf $(PROJECT_NAME).bin
	-rm -rf $(SRC:.c=.lst)
	-rm -rf $(ASM_SRC:.s=.lst)

