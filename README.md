# STM32 Makefile FreeRTOS

[![Build Status](https://travis-ci.org/runmec/stm32f10x_makefile_freertos.svg?branch=master)](https://travis-ci.org/runmec/stm32f10x_makefile_freertos)

## Requirement

Working GNU ARM GCC (https://launchpad.net/gcc-arm-embedded)

Texane stlink to flash the STM32F10x (https://github.com/texane/stlink)

FreeRTOS Source (http://www.freertos.org)

## Usage

### build project

```
$ make
```

### clean project

```
$ make clean
```

### download to mcu by stlink 
```
$ make flash
```

### erase flash
```
$ make erase
```

### download main.bin to mcu
```
$ ./build.sh
```

## Debug base on st-link

start debug
```
$ st-util
```

open shell in project root dir
```
$ arm-none-eabi-gdb *.elf

GNU gdb (GNU Tools for ARM Embedded Processors) 7.10.1.20160923-cvs
Copyright (C) 2015 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "--host=x86_64-apple-darwin10 --target=arm-none-eabi".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from z2_cmcc_b_app.elf...done.
...
(gdb) target extended-remote :4242
...
```

Clion configure debug reference

http://www.jianshu.com/p/4635a2380698

## Example

mcu: STM32F103C8T6

GPIOB11--Led

