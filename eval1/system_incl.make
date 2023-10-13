#################################################################
# Makefile generated by Xilinx Platform Studio 
# Project:\\vboxsvr\desktop\eval1\system.xmp
#
# WARNING : This file will be re-generated every time a command
# to run a make target is invoked. So, any changes made to this  
# file manually, will be lost when make is invoked next. 
#################################################################

XILINX_EDK_DIR = /cygdrive/c/Xilinx/12.4/ISE_DS/EDK
NON_CYG_XILINX_EDK_DIR = C:/Xilinx/12.4/ISE_DS/EDK

SYSTEM = system

MHSFILE = system.mhs

MSSFILE = system.mss

FPGA_ARCH = spartan3e

DEVICE = xc3s1600efg320-4

LANGUAGE = vhdl
GLOBAL_SEARCHPATHOPT = 
PROJECT_SEARCHPATHOPT = 

SEARCHPATHOPT = $(PROJECT_SEARCHPATHOPT) $(GLOBAL_SEARCHPATHOPT)

SUBMODULE_OPT = 

PLATGEN_OPTIONS = -p $(DEVICE) -lang $(LANGUAGE) $(SEARCHPATHOPT) $(SUBMODULE_OPT) -msg __xps/ise/xmsgprops.lst

LIBGEN_OPTIONS = -mhs $(MHSFILE) -p $(DEVICE) $(SEARCHPATHOPT) -msg __xps/ise/xmsgprops.lst \
                   $(MICROBLAZE_0_LIBG_OPT)

OBSERVE_PAR_OPTIONS = -error yes

CODE_OUTPUT_DIR = Code
CODE_OUTPUT = $(CODE_OUTPUT_DIR)/executable.elf
CYG_CODE_OUTPUT_DIR = Code
CYG_CODE_OUTPUT = $(CYG_CODE_OUTPUT_DIR)/executable.elf

MICROBLAZE_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/microblaze/mb_bootloop.elf
MICROBLAZE_BOOTLOOP_LE = $(XILINX_EDK_DIR)/sw/lib/microblaze/mb_bootloop_le.elf
PPC405_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc405/ppc_bootloop.elf
PPC440_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc440/ppc440_bootloop.elf
BOOTLOOP_DIR = bootloops

MICROBLAZE_0_BOOTLOOP = $(BOOTLOOP_DIR)/microblaze_0.elf
MICROBLAZE_0_XMDSTUB = microblaze_0/code/xmdstub.elf

BRAMINIT_ELF_FILES =  $(CYG_CODE_OUTPUT) 
BRAMINIT_ELF_FILE_ARGS =   -pe microblaze_0 $(CODE_OUTPUT) 

ALL_USER_ELF_FILES = $(CYG_CODE_OUTPUT) 

SIM_CMD = vsim

BEHAVIORAL_SIM_SCRIPT = simulation/behavioral/$(SYSTEM)_setup.do

STRUCTURAL_SIM_SCRIPT = simulation/structural/$(SYSTEM)_setup.do

TIMING_SIM_SCRIPT = simulation/timing/$(SYSTEM)_setup.do

DEFAULT_SIM_SCRIPT = $(BEHAVIORAL_SIM_SCRIPT)

MIX_LANG_SIM_OPT = -mixed yes

SIMGEN_OPTIONS = -p $(DEVICE) -lang $(LANGUAGE) $(SEARCHPATHOPT) $(BRAMINIT_ELF_FILE_ARGS) $(MIX_LANG_SIM_OPT) -msg __xps/ise/xmsgprops.lst -s mti -X Z:/eval1/


LIBRARIES =  \
       microblaze_0/lib/libxil.a 

LIBSCLEAN_TARGETS = microblaze_0_libsclean 

PROGRAMCLEAN_TARGETS = Code_programclean 

CORE_STATE_DEVELOPMENT_FILES = 

WRAPPER_NGC_FILES = implementation/microblaze_0_wrapper.ngc \
implementation/mb_plb_wrapper.ngc \
implementation/ilmb_wrapper.ngc \
implementation/dlmb_wrapper.ngc \
implementation/dlmb_cntlr_wrapper.ngc \
implementation/ilmb_cntlr_wrapper.ngc \
implementation/lmb_bram_wrapper.ngc \
implementation/rs232_dce_wrapper.ngc \
implementation/leds_8bit_wrapper.ngc \
implementation/dip_switches_4bit_wrapper.ngc \
implementation/ddr_sdram_wrapper.ngc \
implementation/clock_generator_0_wrapper.ngc \
implementation/mdm_0_wrapper.ngc \
implementation/proc_sys_reset_0_wrapper.ngc

POSTSYN_NETLIST = implementation/$(SYSTEM).ngc

SYSTEM_BIT = implementation/$(SYSTEM).bit

DOWNLOAD_BIT = implementation/download.bit

SYSTEM_ACE = implementation/$(SYSTEM).ace

UCF_FILE = data/system.ucf

BMM_FILE = implementation/$(SYSTEM).bmm

BITGEN_UT_FILE = etc/bitgen.ut

XFLOW_OPT_FILE = etc/fast_runtime.opt
XFLOW_DEPENDENCY = __xps/xpsxflow.opt $(XFLOW_OPT_FILE)

XPLORER_DEPENDENCY = __xps/xplorer.opt
XPLORER_OPTIONS = -p $(DEVICE) -uc $(SYSTEM).ucf -bm $(SYSTEM).bmm -max_runs 7

FPGA_IMP_DEPENDENCY = $(BMM_FILE) $(POSTSYN_NETLIST) $(UCF_FILE) $(XFLOW_DEPENDENCY)

# cygwin path for windows
SDK_EXPORT_DIR = SDK/SDK_Export/hw
CYG_SDK_EXPORT_DIR = SDK/SDK_Export/hw
SYSTEM_HW_HANDOFF = $(SDK_EXPORT_DIR)/$(SYSTEM).xml
CYG_SYSTEM_HW_HANDOFF = $(CYG_SDK_EXPORT_DIR)/$(SYSTEM).xml
SYSTEM_HW_HANDOFF_BIT = $(SDK_EXPORT_DIR)/$(SYSTEM).bit
CYG_SYSTEM_HW_HANDOFF_BIT = $(CYG_SDK_EXPORT_DIR)/$(SYSTEM).bit
SYSTEM_HW_HANDOFF_BMM = $(SDK_EXPORT_DIR)/$(SYSTEM)_bd.bmm
CYG_SYSTEM_HW_HANDOFF_BMM = $(CYG_SDK_EXPORT_DIR)/$(SYSTEM)_bd.bmm
SYSTEM_HW_HANDOFF_DEP = $(CYG_SYSTEM_HW_HANDOFF) $(CYG_SYSTEM_HW_HANDOFF_BIT) $(CYG_SYSTEM_HW_HANDOFF_BMM)

#################################################################
# SOFTWARE APPLICATION CODE
#################################################################

CODE_SOURCES = microblaze_0/code/Code.c 

CODE_HEADERS = 

CODE_CC = mb-gcc
CODE_CC_SIZE = mb-size
CODE_CC_OPT = -O2
CODE_CFLAGS = 
CODE_CC_SEARCH = # -B
CODE_LIBPATH = -L./microblaze_0/lib/ # -L
CODE_INCLUDES = -I./microblaze_0/include/ # -I
CODE_LFLAGS = # -l
CODE_LINKER_SCRIPT = Code/Code_linker_script.ld
CODE_LINKER_SCRIPT_FLAG = -T $(CODE_LINKER_SCRIPT) 
CODE_CC_DEBUG_FLAG =  -g 
CODE_CC_PROFILE_FLAG = # -pg
CODE_CC_GLOBPTR_FLAG= # -mxl-gp-opt
CODE_MODE = executable
CODE_LIBG_OPT = -$(CODE_MODE) microblaze_0
CODE_CC_INFERRED_FLAGS= -mxl-soft-mul -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.00.b 
CODE_CC_START_ADDR_FLAG=  #  # -Wl,-defsym -Wl,_TEXT_START_ADDR=
CODE_CC_STACK_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_STACK_SIZE=
CODE_CC_HEAP_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_HEAP_SIZE=
CODE_OTHER_CC_FLAGS= $(CODE_CC_GLOBPTR_FLAG)  \
                  $(CODE_CC_START_ADDR_FLAG) $(CODE_CC_STACK_SIZE_FLAG) $(CODE_CC_HEAP_SIZE_FLAG)  \
                  $(CODE_CC_INFERRED_FLAGS)  \
                  $(CODE_LINKER_SCRIPT_FLAG) $(CODE_CC_DEBUG_FLAG) $(CODE_CC_PROFILE_FLAG) 
