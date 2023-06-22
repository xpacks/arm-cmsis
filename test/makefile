#
# This file is part of the µOS++ distribution.
#   (https://github.com/micro-os-plus)
# Copyright (c) 2015-2023 Liviu Ionescu.  All rights reserved.
#
# Permission to use, copy, modify, and/or distribute this software
# for any purpose is hereby granted, under the terms of the MIT license.
#
# If a copy of the license was not distributed with this file, it can
# be obtained from https://opensource.org/licenses/mit/.
#
# -----------------------------------------------------------------------------

#
# Cross compile the CMSIS Core files with GCC.
#
# Input: (must be set by the caller)
#   PARENT=project root folder
#   TEST_NAME=test name
#

PREFIX=arm-none-eabi-
CC=$(PREFIX)gcc
CPP=$(PREFIX)g++

CFLAGS=-std=gnu11 -Og -fmessage-length=0 -fsigned-char -ffunction-sections \
-fdata-sections -fno-move-loop-invariants
CPPFLAGS=-std=gnu++11 -Og -fmessage-length=0 -fsigned-char -ffunction-sections \
-fdata-sections -fno-move-loop-invariants -fabi-version=0 -fno-exceptions \
-fno-rtti -fno-use-cxa-atexit -fno-threadsafe-statics

# Since GCC does not have an option to enable really all warnings,
# enumerate as many as possible.
WARNFLAGS=-Werror -Wall -Wextra -Wunused -Wuninitialized \
-Wmissing-declarations -Wconversion -Wpointer-arith \
-Wpadded -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal
CWARNFLAGS=-Wmissing-prototypes -Wstrict-prototypes -Wbad-function-cast
CPPWARNFLAGS=-Wabi -Wctor-dtor-privacy -Wnoexcept -Wnon-virtual-dtor \
-Wstrict-null-sentinel -Wsign-promo

INCLUDES=-I"$(PARENT)/CMSIS/Include" -I"$(PARENT)/CMSIS/Driver/Include"

all:			cm0 cm0plus cm3 cm4 cm7 driver-cm0 driver-cm4

cm0:			cm0-a.o cm0-b.o

cm0plus:		cm0plus-a.o cm0plus-b.o

cm3:			cm3-a.o cm3-b.o

cm4:			cm4-a.o cm4-b.o

cm7:			cm7-a.o cm7-b.o

driver-cm0:		driver-cm0-a.o driver-cm0-b.o

driver-cm4:		driver-cm4-a.o driver-cm4-b.o

.PHONY:			all cm0 cm0plus cm3 cm4 cm7 driver-cm0

cm0-a.o:		cm0-a.c
	$(CC) -mcpu=cortex-m0 -mthumb -mfloat-abi=soft $(CFLAGS) $(WARNFLAGS) $(CWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm0-b.o:		cm0-b.cpp
	$(CPP) -mcpu=cortex-m0 -mthumb -mfloat-abi=soft $(CPPFLAGS) $(WARNFLAGS)  $(CPPWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm0plus-a.o:	cm0plus-a.c
	$(CC) -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft $(CFLAGS) $(WARNFLAGS) $(CWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm0plus-b.o:	cm0plus-b.cpp
	$(CPP) -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft $(CPPFLAGS) $(WARNFLAGS)  $(CPPWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm3-a.o:		cm3-a.c
	$(CC) -mcpu=cortex-m3 -mthumb -mfloat-abi=soft $(CFLAGS) $(WARNFLAGS) $(CWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm3-b.o:		cm3-b.cpp
	$(CPP) -mcpu=cortex-m3 -mthumb -mfloat-abi=soft $(CPPFLAGS) $(WARNFLAGS)  $(CPPWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm4-a.o:		cm4-a.c
	$(CC) -mcpu=cortex-m4 -mthumb -mfloat-abi=soft $(CFLAGS) $(WARNFLAGS) $(CWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm4-b.o:		cm4-b.cpp
	$(CPP) -mcpu=cortex-m4 -mthumb -mfloat-abi=soft $(CPPFLAGS) $(WARNFLAGS)  $(CPPWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm7-a.o:		cm7-a.c
	$(CC) -mcpu=cortex-m7 -mthumb -mfloat-abi=soft $(CFLAGS) $(WARNFLAGS) $(CWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm7-b.o:		cm7-b.cpp
	$(CPP) -mcpu=cortex-m7 -mthumb -mfloat-abi=soft $(CPPFLAGS) $(WARNFLAGS)  $(CPPWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

driver-cm0-a.o:		driver-cm0-a.c
	$(CC) -mcpu=cortex-m0 -mthumb -mfloat-abi=soft $(CFLAGS) $(WARNFLAGS) $(CWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

driver-cm0-b.o:		driver-cm0-b.cpp
	$(CPP) -mcpu=cortex-m0 -mthumb -mfloat-abi=soft $(CPPFLAGS) $(WARNFLAGS)  $(CPPWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

driver-cm4-a.o:		driver-cm4-a.c
	$(CC) -mcpu=cortex-m0 -mthumb -mfloat-abi=soft $(CFLAGS) $(WARNFLAGS) $(CWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

driver-cm4-b.o:		driver-cm4-b.cpp
	$(CPP) -mcpu=cortex-m0 -mthumb -mfloat-abi=soft $(CPPFLAGS) $(WARNFLAGS)  $(CPPWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"
