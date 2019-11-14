#
# nb-qemu-capstone
#
# Copyright (c) 2019 Michael Goffioul
#
# This file is distributed under the University of Illinois Open Source
# License. See LICENSE.TXT for details.
#

LOCAL_PATH := $(call my-dir)

LIBSRC_CORE := \
	cs.c \
	utils.c \
	SStream.c \
	MCInst.c \
	MCInstrDesc.c \
	MCRegisterInfo.c
LIBSRC_ARM := \
	arch/ARM/ARMDisassembler.c \
	arch/ARM/ARMInstPrinter.c \
	arch/ARM/ARMMapping.c \
	arch/ARM/ARMModule.c
LIBSRC_ARM64 := \
	arch/AArch64/AArch64BaseInfo.c \
	arch/AArch64/AArch64Disassembler.c \
	arch/AArch64/AArch64InstPrinter.c \
	arch/AArch64/AArch64Mapping.c \
	arch/AArch64/AArch64Module.c
LIBSRC_PPC := \
	arch/PowerPC/PPCDisassembler.c \
	arch/PowerPC/PPCInstPrinter.c \
	arch/PowerPC/PPCMapping.c \
	arch/PowerPC/PPCModule.c
LIBSRC_X86 := \
	arch/X86/X86DisassemblerDecoder.c \
	arch/X86/X86Disassembler.c \
	arch/X86/X86IntelInstPrinter.c \
	arch/X86/X86ATTInstPrinter.c \
	arch/X86/X86Mapping.c \
	arch/X86/X86Module.c

include $(CLEAR_VARS)
LOCAL_MODULE := libqemu-capstone
LOCAL_CFLAGS := \
	-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE \
	-DCAPSTONE_USE_SYS_DYN_MEM -DCAPSTONE_HAS_ARM -DCAPSTONE_HAS_ARM64 -DCAPSTONE_HAS_POWERPC -DCAPSTONE_HAS_X86 \
	-fno-strict-aliasing -fno-common -fwrapv -std=gnu11 -fstack-protector-strong \
	-Wno-unused-parameter
LOCAL_SRC_FILES := \
	$(LIBSRC_CORE) \
	$(LIBSRC_ARM) \
	$(LIBSRC_ARM64) \
	$(LIBSRC_PPC) \
	$(LIBSRC_X86)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include/capstone
include $(BUILD_STATIC_LIBRARY)
