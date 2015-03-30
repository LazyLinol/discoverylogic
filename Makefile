######################################################################################
# GNU GCC ARM Embeded Toolchain base directories and binaries
######################################################################################
GCC_BASE = /home/lazy/Projects/stm32/toolchain/gcc-arm-none-eabi-4_9-2015q1/
GCC_BIN  = $(GCC_BASE)bin/
GCC_LIB  = $(GCC_BASE)arm-none-eabi/lib/
GCC_INC  = $(GCC_BASE)arm-none-eabi/include/
AS       = $(GCC_BIN)arm-none-eabi-as
CC       = $(GCC_BIN)arm-none-eabi-gcc
CPP      = $(GCC_BIN)arm-none-eabi-g++
LD       = $(GCC_BIN)arm-none-eabi-gcc
OBJCOPY  = $(GCC_BIN)arm-none-eabi-objcopy


######################################################################################
# Custom options for cortex-m and cortex-r processors
######################################################################################
CORTEX_M0PLUS_CC_FLAGS  = -mthumb -mcpu=cortex-m0plus
CORTEX_M0PLUS_LIB_PATH  = $(GCC_LIB)armv6-m
CORTEX_M0_CC_FLAGS      = -mthumb -mcpu=cortex-m0
CORTEX_M0_LIB_PATH      = $(GCC_LIB)armv6-m
CORTEX_M1_CC_FLAGS      = -mthumb -mcpu=cortex-m1
CORTEX_M1_LIB_PATH      = $(GCC_LIB)armv6-m
CORTEX_M3_CC_FLAGS      = -mthumb -mcpu=cortex-m3
CORTEX_M3_LIB_PATH      = $(GCC_LIB)armv7-m
CORTEX_M4_NOFP_CC_FLAGS = -mthumb -mcpu=cortex-m4
CORTEX_M4_NOFP_LIB_PATH = $(GCC_LIB)armv7e-m
CORTEX_M4_SWFP_CC_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=softfp -mfpu=fpv4-sp-d16
CORTEX_M4_SWFP_LIB_PATH = $(GCC_LIB)armv7e-m/softfp
CORTEX_M4_HWFP_CC_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
CORTEX_M4_HWFP_LIB_PATH = $(GCC_LIB)armv7e-m/fpu
CORTEX_R4_NOFP_CC_FLAGS = -mthumb -march=armv7-r
CORTEX_R4_NOFP_LIB_PATH = $(GCC_LIB)armv7-r/thumb
CORTEX_R4_SWFP_CC_FLAGS = -mthumb -march=armv7-r -mfloat-abi=softfp -mfloat-abi=softfp -mfpu=vfpv3-d16
CORTEX_R4_SWFP_LIB_PATH = $(GCC_LIB)armv7-r/thumb/softfp
CORTEX_R4_HWFP_CC_FLAGS = -mthumb -march=armv7-r -mfloat-abi=softfp -mfloat-abi=hard -mfpu=vfpv3-d16
CORTEX_R4_HWFP_LIB_PATH = $(GCC_LIB)armv7-r/thumb/fpu
CORTEX_R5_NOFP_CC_FLAGS = -mthumb -march=armv7-r
CORTEX_R5_NOFP_LIB_PATH = $(GCC_LIB)armv7-r/thumb
CORTEX_R5_SWFP_CC_FLAGS = -mthumb -march=armv7-r -mfloat-abi=softfp -mfloat-abi=softfp -mfpu=vfpv3-d16
CORTEX_R5_SWFP_LIB_PATH = $(GCC_LIB)armv7-r/thumb/softfp
CORTEX_R5_HWFP_CC_FLAGS = -mthumb -march=armv7-r -mfloat-abi=softfp -mfloat-abi=hard -mfpu=vfpv3-d16
CORTEX_R5_HWFP_LIB_PATH = $(GCC_LIB)armv7-r/thumb/fpu


######################################################################################
# STM32 Libraries
######################################################################################
STMLIBS_BASE   = /home/lazy/Projects/stm32/fw/STM32Cube_FW_F4_V1.5.0/Drivers
HAL            = $(STMLIBS_BASE)/STM32F4xx_HAL_Driver
CMSIS          = $(STMLIBS_BASE)/CMSIS
CMSIS_DEVICE   = $(STMLIBS_BASE)/CMSIS/Device/ST/STM32F4xx
BSP            = $(STMLIBS_BASE)/BSP/STM32F429I-Discovery
BSP_COMPONENTS = $(STMLIBS_BASE)/BSP/Components

######################################################################################
# Project custom includes
######################################################################################
PROJECT_CMSIS  = ./cmsis
PROJECT_HAL    = ./hal
INC_DIRS       = $(HAL)/Inc $(CMSIS)/Include $(CMSIS_DEVICE)/Include $(BSP) $(BSP_COMPONENTS)/ili9341 $(PROJECT_CMSIS) $(PROJECT_HAL)

######################################################################################
# Main makefile project configuration
#    PROJECT      = <name of the target to be built>
#    MCU_CC_FLAGS = <one of the CC_FLAGS above>
#    MCU_LIB_PATH = <one of the LIB_PATH above>
#    OPTIMIZE_FOR = < SIZE or nothing >
#    DEBUG_LEVEL  = < -g compiler option or nothing >
#    OPTIM_LEVEL  = < -O compiler option or nothing >
######################################################################################
PROJECT           = discoverylogic
MCU_CC_FLAGS      = $(CORTEX_M4_HWFP_CC_FLAGS)
MCU_LIB_PATH      = $(CORTEX_M4_HWFP_LIB_PATH)
OPTIMIZE_FOR      =
DEBUG_LEVEL       =
OPTIM_LEVEL       =
LINKER_SCRIPT     = ./STM32F429ZI_FLASH.ld
PROJECT_AS_SOURCES = $(PROJECT_CMSIS)/gcc/startup_stm32f429xx.s
PROJECT_C_SOURCES = main.c
PROJECT_C_SOURCES += system_stm32f4xx.c
PROJECT_C_SOURCES += stm32f4xx_hal.c stm32f4xx_hal_dma.c stm32f4xx_hal_dma2d.c stm32f4xx_hal_dma_ex.c stm32f4xx_hal_flash.c stm32f4xx_hal_flash_ex.c stm32f4xx_hal_flash_ramfunc.c
PROJECT_C_SOURCES += stm32f4xx_hal_sdram.c stm32f4xx_hal_gpio.c stm32f4xx_hal_i2c.c stm32f4xx_hal_i2c_ex.c stm32f4xx_hal_ltdc.c stm32f4xx_hal_rcc.c stm32f4xx_hal_rcc_ex.c
PROJECT_C_SOURCES += stm32f4xx_hal_spi.c stm32f4xx_hal_cortex.c
PROJECT_C_SOURCES += stm32f429i_discovery.c stm32f429i_discovery_lcd.c stm32f429i_discovery_sdram.c
PROJECT_C_SOURCES += stm32f4xx_ll_fmc.c
PROJECT_C_SOURCES += ili9341.c
PROJECT_OBJECTS   = $(PROJECT_C_SOURCES:.c=.o)
PROJECT_OBJECTS  += $(PROJECT_AS_SOURCES:.s=.o)
#PROJECT_INC_PATHS = -I.
PROJECT_INC_PATHS = $(patsubst %,-I%,$(INC_DIRS))
PROJECT_LIB_PATHS = -L.
PROJECT_LIBRARIES =
PROJECT_SYMBOLS   = -DTOOLCHAIN_GCC_ARM -DNO_RELOC='0' -DSTM32F429xx

vpath %.c $(HAL)/Src $(BSP) $(PROJECT_CMSIS) $(BSP_COMPONENTS)/ili9341

######################################################################################
# Main makefile system configuration
######################################################################################
SYS_OBJECTS =
SYS_INC_PATHS = -I. -I$(GCC_INC)
SYS_LIB_PATHS = -L$(MCU_LIB_PATH)
ifeq (OPTIMIZE_FOR, SIZE)
SYS_LIBRARIES = -lstdc++_s -lsupc++_s -lm -lc_s -lg_s -lnosys
SYS_LD_FLAGS  = --specs=nano.specs -u _printf_float -u _scanf_float
else
SYS_LIBRARIES = -lstdc++ -lsupc++ -lm -lc -lg -lnosys
SYS_LD_FLAGS  =
endif


###############################################################################
# Command line building
###############################################################################
ifdef DEBUG_LEVEL
CC_DEBUG_FLAGS = -g$(DEBUG_LEVEL)
CC_SYMBOLS = -DDEBUG $(PROJECT_SYMBOLS)
else
CC_DEBUG_FLAGS =
CC_SYMBOLS = -DNODEBUG $(PROJECT_SYMBOLS)
endif

ifdef OPTIM_LEVEL
CC_OPTIM_FLAGS = -O$(OPTIM_LEVEL)
else
CC_OPTIM_FLAGS =
endif

INCLUDE_PATHS = $(PROJECT_INC_PATHS) $(SYS_INC_PATHS)
LIBRARY_PATHS = $(PROJECT_LIB_PATHS) $(SYS_LIB_PATHS)
CC_FLAGS = $(MCU_CC_FLAGS) -c $(CC_OPTIM_FLAGS) $(CC_DEBUG_FLAGS) -fno-common -fmessage-length=0 -Wall -fno-exceptions -ffunction-sections -fdata-sections
LD_FLAGS = $(MCU_CC_FLAGS) -Wl,--gc-sections $(SYS_LD_FLAGS) -Wl,-Map=$(PROJECT).map
LD_SYS_LIBS = $(SYS_LIBRARIES)

BULD_TARGET = $(PROJECT)


###############################################################################
# Makefile execution
###############################################################################

all: $(BULD_TARGET).bin $(BULD_TARGET).hex

clean:
	rm -f $(BULD_TARGET).bin $(BULD_TARGET).elf $(BULD_TARGET).hex $(BULD_TARGET).map $(PROJECT_OBJECTS) $(PROJECT_OBJECTS:.o=.lst)

.s.o:
	$(AS) $(MCU_CC_FLAGS) -o $@ $<

.c.o:
	$(CC)  $(CC_FLAGS) $(CC_SYMBOLS) -std=gnu99   $(INCLUDE_PATHS) -o $@ $<

.cpp.o:
	$(CPP) $(CC_FLAGS) $(CC_SYMBOLS) -std=gnu++98 $(INCLUDE_PATHS) -o $@ $<


$(BULD_TARGET).elf: $(PROJECT_OBJECTS) $(SYS_OBJECTS)
	$(LD) $(LD_FLAGS) -T$(LINKER_SCRIPT) $(LIBRARY_PATHS) -o $@ $^ $(PROJECT_LIBRARIES) $(SYS_LIBRARIES) $(PROJECT_LIBRARIES) $(SYS_LIBRARIES)

$(BULD_TARGET).bin: $(BULD_TARGET).elf
	$(OBJCOPY) -O binary $< $@

$(BULD_TARGET).hex: $(BULD_TARGET).elf
	$(OBJCOPY) -O ihex $< $@

