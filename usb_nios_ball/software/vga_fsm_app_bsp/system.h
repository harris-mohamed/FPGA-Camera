/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2_gen2_0' in SOPC Builder design 'on_chip_fsm'
 * SOPC Builder design path: ../../on_chip_fsm.sopcinfo
 *
 * Generated: Mon Apr 29 22:23:05 CDT 2019
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00020820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x12
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00000020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x12
#define ALT_CPU_NAME "nios2_gen2_0"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00000000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00020820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x12
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00000020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x12
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00000000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_NIOS2_GEN2


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV E"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x21100
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x21100
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x21100
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "on_chip_fsm"


/*
 * blue configuration
 *
 */

#define ALT_MODULE_CLASS_blue altera_avalon_pio
#define BLUE_BASE 0x21010
#define BLUE_BIT_CLEARING_EDGE_REGISTER 0
#define BLUE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define BLUE_CAPTURE 0
#define BLUE_DATA_WIDTH 32
#define BLUE_DO_TEST_BENCH_WIRING 0
#define BLUE_DRIVEN_SIM_VALUE 0
#define BLUE_EDGE_TYPE "NONE"
#define BLUE_FREQ 50000000
#define BLUE_HAS_IN 0
#define BLUE_HAS_OUT 1
#define BLUE_HAS_TRI 0
#define BLUE_IRQ -1
#define BLUE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define BLUE_IRQ_TYPE "NONE"
#define BLUE_NAME "/dev/blue"
#define BLUE_RESET_VALUE 0
#define BLUE_SPAN 16
#define BLUE_TYPE "altera_avalon_pio"


/*
 * calibrate_start configuration
 *
 */

#define ALT_MODULE_CLASS_calibrate_start altera_avalon_pio
#define CALIBRATE_START_BASE 0x21000
#define CALIBRATE_START_BIT_CLEARING_EDGE_REGISTER 0
#define CALIBRATE_START_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CALIBRATE_START_CAPTURE 0
#define CALIBRATE_START_DATA_WIDTH 1
#define CALIBRATE_START_DO_TEST_BENCH_WIRING 0
#define CALIBRATE_START_DRIVEN_SIM_VALUE 0
#define CALIBRATE_START_EDGE_TYPE "NONE"
#define CALIBRATE_START_FREQ 50000000
#define CALIBRATE_START_HAS_IN 0
#define CALIBRATE_START_HAS_OUT 1
#define CALIBRATE_START_HAS_TRI 0
#define CALIBRATE_START_IRQ -1
#define CALIBRATE_START_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CALIBRATE_START_IRQ_TYPE "NONE"
#define CALIBRATE_START_NAME "/dev/calibrate_start"
#define CALIBRATE_START_RESET_VALUE 0
#define CALIBRATE_START_SPAN 16
#define CALIBRATE_START_TYPE "altera_avalon_pio"


/*
 * exposure configuration
 *
 */

#define ALT_MODULE_CLASS_exposure altera_avalon_pio
#define EXPOSURE_BASE 0x21050
#define EXPOSURE_BIT_CLEARING_EDGE_REGISTER 0
#define EXPOSURE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define EXPOSURE_CAPTURE 0
#define EXPOSURE_DATA_WIDTH 32
#define EXPOSURE_DO_TEST_BENCH_WIRING 0
#define EXPOSURE_DRIVEN_SIM_VALUE 0
#define EXPOSURE_EDGE_TYPE "NONE"
#define EXPOSURE_FREQ 50000000
#define EXPOSURE_HAS_IN 0
#define EXPOSURE_HAS_OUT 1
#define EXPOSURE_HAS_TRI 0
#define EXPOSURE_IRQ -1
#define EXPOSURE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define EXPOSURE_IRQ_TYPE "NONE"
#define EXPOSURE_NAME "/dev/exposure"
#define EXPOSURE_RESET_VALUE 0
#define EXPOSURE_SPAN 16
#define EXPOSURE_TYPE "altera_avalon_pio"


/*
 * green1 configuration
 *
 */

#define ALT_MODULE_CLASS_green1 altera_avalon_pio
#define GREEN1_BASE 0x21040
#define GREEN1_BIT_CLEARING_EDGE_REGISTER 0
#define GREEN1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define GREEN1_CAPTURE 0
#define GREEN1_DATA_WIDTH 32
#define GREEN1_DO_TEST_BENCH_WIRING 0
#define GREEN1_DRIVEN_SIM_VALUE 0
#define GREEN1_EDGE_TYPE "NONE"
#define GREEN1_FREQ 50000000
#define GREEN1_HAS_IN 0
#define GREEN1_HAS_OUT 1
#define GREEN1_HAS_TRI 0
#define GREEN1_IRQ -1
#define GREEN1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define GREEN1_IRQ_TYPE "NONE"
#define GREEN1_NAME "/dev/green1"
#define GREEN1_RESET_VALUE 0
#define GREEN1_SPAN 16
#define GREEN1_TYPE "altera_avalon_pio"


/*
 * green2 configuration
 *
 */

#define ALT_MODULE_CLASS_green2 altera_avalon_pio
#define GREEN2_BASE 0x21030
#define GREEN2_BIT_CLEARING_EDGE_REGISTER 0
#define GREEN2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define GREEN2_CAPTURE 0
#define GREEN2_DATA_WIDTH 32
#define GREEN2_DO_TEST_BENCH_WIRING 0
#define GREEN2_DRIVEN_SIM_VALUE 0
#define GREEN2_EDGE_TYPE "NONE"
#define GREEN2_FREQ 50000000
#define GREEN2_HAS_IN 0
#define GREEN2_HAS_OUT 1
#define GREEN2_HAS_TRI 0
#define GREEN2_IRQ -1
#define GREEN2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define GREEN2_IRQ_TYPE "NONE"
#define GREEN2_NAME "/dev/green2"
#define GREEN2_RESET_VALUE 0
#define GREEN2_SPAN 16
#define GREEN2_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x21100
#define JTAG_UART_0_IRQ 5
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * mouse_click configuration
 *
 */

#define ALT_MODULE_CLASS_mouse_click altera_avalon_pio
#define MOUSE_CLICK_BASE 0x21060
#define MOUSE_CLICK_BIT_CLEARING_EDGE_REGISTER 0
#define MOUSE_CLICK_BIT_MODIFYING_OUTPUT_REGISTER 0
#define MOUSE_CLICK_CAPTURE 0
#define MOUSE_CLICK_DATA_WIDTH 1
#define MOUSE_CLICK_DO_TEST_BENCH_WIRING 0
#define MOUSE_CLICK_DRIVEN_SIM_VALUE 0
#define MOUSE_CLICK_EDGE_TYPE "NONE"
#define MOUSE_CLICK_FREQ 50000000
#define MOUSE_CLICK_HAS_IN 0
#define MOUSE_CLICK_HAS_OUT 1
#define MOUSE_CLICK_HAS_TRI 0
#define MOUSE_CLICK_IRQ -1
#define MOUSE_CLICK_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MOUSE_CLICK_IRQ_TYPE "NONE"
#define MOUSE_CLICK_NAME "/dev/mouse_click"
#define MOUSE_CLICK_RESET_VALUE 0
#define MOUSE_CLICK_SPAN 16
#define MOUSE_CLICK_TYPE "altera_avalon_pio"


/*
 * mouse_x configuration
 *
 */

#define ALT_MODULE_CLASS_mouse_x altera_avalon_pio
#define MOUSE_X_BASE 0x21080
#define MOUSE_X_BIT_CLEARING_EDGE_REGISTER 0
#define MOUSE_X_BIT_MODIFYING_OUTPUT_REGISTER 0
#define MOUSE_X_CAPTURE 0
#define MOUSE_X_DATA_WIDTH 12
#define MOUSE_X_DO_TEST_BENCH_WIRING 0
#define MOUSE_X_DRIVEN_SIM_VALUE 0
#define MOUSE_X_EDGE_TYPE "NONE"
#define MOUSE_X_FREQ 50000000
#define MOUSE_X_HAS_IN 0
#define MOUSE_X_HAS_OUT 1
#define MOUSE_X_HAS_TRI 0
#define MOUSE_X_IRQ -1
#define MOUSE_X_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MOUSE_X_IRQ_TYPE "NONE"
#define MOUSE_X_NAME "/dev/mouse_x"
#define MOUSE_X_RESET_VALUE 0
#define MOUSE_X_SPAN 16
#define MOUSE_X_TYPE "altera_avalon_pio"


/*
 * mouse_y configuration
 *
 */

#define ALT_MODULE_CLASS_mouse_y altera_avalon_pio
#define MOUSE_Y_BASE 0x21070
#define MOUSE_Y_BIT_CLEARING_EDGE_REGISTER 0
#define MOUSE_Y_BIT_MODIFYING_OUTPUT_REGISTER 0
#define MOUSE_Y_CAPTURE 0
#define MOUSE_Y_DATA_WIDTH 12
#define MOUSE_Y_DO_TEST_BENCH_WIRING 0
#define MOUSE_Y_DRIVEN_SIM_VALUE 0
#define MOUSE_Y_EDGE_TYPE "NONE"
#define MOUSE_Y_FREQ 50000000
#define MOUSE_Y_HAS_IN 0
#define MOUSE_Y_HAS_OUT 1
#define MOUSE_Y_HAS_TRI 0
#define MOUSE_Y_IRQ -1
#define MOUSE_Y_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MOUSE_Y_IRQ_TYPE "NONE"
#define MOUSE_Y_NAME "/dev/mouse_y"
#define MOUSE_Y_RESET_VALUE 0
#define MOUSE_Y_SPAN 16
#define MOUSE_Y_TYPE "altera_avalon_pio"


/*
 * onchip_memory2_0 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2_0 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_0_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_0_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_0_BASE 0x0
#define ONCHIP_MEMORY2_0_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_0_DUAL_PORT 0
#define ONCHIP_MEMORY2_0_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_INIT_CONTENTS_FILE "on_chip_fsm_onchip_memory2_0"
#define ONCHIP_MEMORY2_0_INIT_MEM_CONTENT 0
#define ONCHIP_MEMORY2_0_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_0_IRQ -1
#define ONCHIP_MEMORY2_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_0_NAME "/dev/onchip_memory2_0"
#define ONCHIP_MEMORY2_0_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_0_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_0_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_0_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_0_SIZE_VALUE 102400
#define ONCHIP_MEMORY2_0_SPAN 102400
#define ONCHIP_MEMORY2_0_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_0_WRITABLE 1


/*
 * otg_hpi_address configuration
 *
 */

#define ALT_MODULE_CLASS_otg_hpi_address altera_avalon_pio
#define OTG_HPI_ADDRESS_BASE 0x210e0
#define OTG_HPI_ADDRESS_BIT_CLEARING_EDGE_REGISTER 0
#define OTG_HPI_ADDRESS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OTG_HPI_ADDRESS_CAPTURE 0
#define OTG_HPI_ADDRESS_DATA_WIDTH 2
#define OTG_HPI_ADDRESS_DO_TEST_BENCH_WIRING 0
#define OTG_HPI_ADDRESS_DRIVEN_SIM_VALUE 0
#define OTG_HPI_ADDRESS_EDGE_TYPE "NONE"
#define OTG_HPI_ADDRESS_FREQ 50000000
#define OTG_HPI_ADDRESS_HAS_IN 0
#define OTG_HPI_ADDRESS_HAS_OUT 1
#define OTG_HPI_ADDRESS_HAS_TRI 0
#define OTG_HPI_ADDRESS_IRQ -1
#define OTG_HPI_ADDRESS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OTG_HPI_ADDRESS_IRQ_TYPE "NONE"
#define OTG_HPI_ADDRESS_NAME "/dev/otg_hpi_address"
#define OTG_HPI_ADDRESS_RESET_VALUE 0
#define OTG_HPI_ADDRESS_SPAN 16
#define OTG_HPI_ADDRESS_TYPE "altera_avalon_pio"


/*
 * otg_hpi_cs configuration
 *
 */

#define ALT_MODULE_CLASS_otg_hpi_cs altera_avalon_pio
#define OTG_HPI_CS_BASE 0x210a0
#define OTG_HPI_CS_BIT_CLEARING_EDGE_REGISTER 0
#define OTG_HPI_CS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OTG_HPI_CS_CAPTURE 0
#define OTG_HPI_CS_DATA_WIDTH 1
#define OTG_HPI_CS_DO_TEST_BENCH_WIRING 0
#define OTG_HPI_CS_DRIVEN_SIM_VALUE 0
#define OTG_HPI_CS_EDGE_TYPE "NONE"
#define OTG_HPI_CS_FREQ 50000000
#define OTG_HPI_CS_HAS_IN 0
#define OTG_HPI_CS_HAS_OUT 1
#define OTG_HPI_CS_HAS_TRI 0
#define OTG_HPI_CS_IRQ -1
#define OTG_HPI_CS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OTG_HPI_CS_IRQ_TYPE "NONE"
#define OTG_HPI_CS_NAME "/dev/otg_hpi_cs"
#define OTG_HPI_CS_RESET_VALUE 0
#define OTG_HPI_CS_SPAN 16
#define OTG_HPI_CS_TYPE "altera_avalon_pio"


/*
 * otg_hpi_data configuration
 *
 */

#define ALT_MODULE_CLASS_otg_hpi_data altera_avalon_pio
#define OTG_HPI_DATA_BASE 0x210d0
#define OTG_HPI_DATA_BIT_CLEARING_EDGE_REGISTER 0
#define OTG_HPI_DATA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OTG_HPI_DATA_CAPTURE 0
#define OTG_HPI_DATA_DATA_WIDTH 16
#define OTG_HPI_DATA_DO_TEST_BENCH_WIRING 0
#define OTG_HPI_DATA_DRIVEN_SIM_VALUE 0
#define OTG_HPI_DATA_EDGE_TYPE "NONE"
#define OTG_HPI_DATA_FREQ 50000000
#define OTG_HPI_DATA_HAS_IN 1
#define OTG_HPI_DATA_HAS_OUT 1
#define OTG_HPI_DATA_HAS_TRI 0
#define OTG_HPI_DATA_IRQ -1
#define OTG_HPI_DATA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OTG_HPI_DATA_IRQ_TYPE "NONE"
#define OTG_HPI_DATA_NAME "/dev/otg_hpi_data"
#define OTG_HPI_DATA_RESET_VALUE 0
#define OTG_HPI_DATA_SPAN 16
#define OTG_HPI_DATA_TYPE "altera_avalon_pio"


/*
 * otg_hpi_r configuration
 *
 */

#define ALT_MODULE_CLASS_otg_hpi_r altera_avalon_pio
#define OTG_HPI_R_BASE 0x210c0
#define OTG_HPI_R_BIT_CLEARING_EDGE_REGISTER 0
#define OTG_HPI_R_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OTG_HPI_R_CAPTURE 0
#define OTG_HPI_R_DATA_WIDTH 1
#define OTG_HPI_R_DO_TEST_BENCH_WIRING 0
#define OTG_HPI_R_DRIVEN_SIM_VALUE 0
#define OTG_HPI_R_EDGE_TYPE "NONE"
#define OTG_HPI_R_FREQ 50000000
#define OTG_HPI_R_HAS_IN 0
#define OTG_HPI_R_HAS_OUT 1
#define OTG_HPI_R_HAS_TRI 0
#define OTG_HPI_R_IRQ -1
#define OTG_HPI_R_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OTG_HPI_R_IRQ_TYPE "NONE"
#define OTG_HPI_R_NAME "/dev/otg_hpi_r"
#define OTG_HPI_R_RESET_VALUE 0
#define OTG_HPI_R_SPAN 16
#define OTG_HPI_R_TYPE "altera_avalon_pio"


/*
 * otg_hpi_reset configuration
 *
 */

#define ALT_MODULE_CLASS_otg_hpi_reset altera_avalon_pio
#define OTG_HPI_RESET_BASE 0x21090
#define OTG_HPI_RESET_BIT_CLEARING_EDGE_REGISTER 0
#define OTG_HPI_RESET_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OTG_HPI_RESET_CAPTURE 0
#define OTG_HPI_RESET_DATA_WIDTH 1
#define OTG_HPI_RESET_DO_TEST_BENCH_WIRING 0
#define OTG_HPI_RESET_DRIVEN_SIM_VALUE 0
#define OTG_HPI_RESET_EDGE_TYPE "NONE"
#define OTG_HPI_RESET_FREQ 50000000
#define OTG_HPI_RESET_HAS_IN 0
#define OTG_HPI_RESET_HAS_OUT 1
#define OTG_HPI_RESET_HAS_TRI 0
#define OTG_HPI_RESET_IRQ -1
#define OTG_HPI_RESET_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OTG_HPI_RESET_IRQ_TYPE "NONE"
#define OTG_HPI_RESET_NAME "/dev/otg_hpi_reset"
#define OTG_HPI_RESET_RESET_VALUE 0
#define OTG_HPI_RESET_SPAN 16
#define OTG_HPI_RESET_TYPE "altera_avalon_pio"


/*
 * otg_hpi_w configuration
 *
 */

#define ALT_MODULE_CLASS_otg_hpi_w altera_avalon_pio
#define OTG_HPI_W_BASE 0x210b0
#define OTG_HPI_W_BIT_CLEARING_EDGE_REGISTER 0
#define OTG_HPI_W_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OTG_HPI_W_CAPTURE 0
#define OTG_HPI_W_DATA_WIDTH 1
#define OTG_HPI_W_DO_TEST_BENCH_WIRING 0
#define OTG_HPI_W_DRIVEN_SIM_VALUE 0
#define OTG_HPI_W_EDGE_TYPE "NONE"
#define OTG_HPI_W_FREQ 50000000
#define OTG_HPI_W_HAS_IN 0
#define OTG_HPI_W_HAS_OUT 1
#define OTG_HPI_W_HAS_TRI 0
#define OTG_HPI_W_IRQ -1
#define OTG_HPI_W_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OTG_HPI_W_IRQ_TYPE "NONE"
#define OTG_HPI_W_NAME "/dev/otg_hpi_w"
#define OTG_HPI_W_RESET_VALUE 0
#define OTG_HPI_W_SPAN 16
#define OTG_HPI_W_TYPE "altera_avalon_pio"


/*
 * red configuration
 *
 */

#define ALT_MODULE_CLASS_red altera_avalon_pio
#define RED_BASE 0x21020
#define RED_BIT_CLEARING_EDGE_REGISTER 0
#define RED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define RED_CAPTURE 0
#define RED_DATA_WIDTH 32
#define RED_DO_TEST_BENCH_WIRING 0
#define RED_DRIVEN_SIM_VALUE 0
#define RED_EDGE_TYPE "NONE"
#define RED_FREQ 50000000
#define RED_HAS_IN 0
#define RED_HAS_OUT 1
#define RED_HAS_TRI 0
#define RED_IRQ -1
#define RED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RED_IRQ_TYPE "NONE"
#define RED_NAME "/dev/red"
#define RED_RESET_VALUE 0
#define RED_SPAN 16
#define RED_TYPE "altera_avalon_pio"


/*
 * sysid_qsys_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sysid_qsys_0 altera_avalon_sysid_qsys
#define SYSID_QSYS_0_BASE 0x210f8
#define SYSID_QSYS_0_ID 0
#define SYSID_QSYS_0_IRQ -1
#define SYSID_QSYS_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_QSYS_0_NAME "/dev/sysid_qsys_0"
#define SYSID_QSYS_0_SPAN 8
#define SYSID_QSYS_0_TIMESTAMP 1556590621
#define SYSID_QSYS_0_TYPE "altera_avalon_sysid_qsys"

#endif /* __SYSTEM_H_ */
