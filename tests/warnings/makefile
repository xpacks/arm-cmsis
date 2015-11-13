#
# Copyright (c) 2015 Liviu Ionescu
# This file is part of the xPacks project (https://xpacks.github.io).
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

INCLUDES=-I"$(PARENT)/CMSIS/Include"

all:			cm0 cm0plus cm3 cm4

cm0:			cm0c.o cm0pp.o

cm0plus:		cm0plusc.o cm0pluspp.o

cm3:			cm3c.o cm3pp.o

cm4:			cm4c.o cm4pp.o

.PHONY:			all cm0 cm0plus cm3 cm4

cm0c.o:			cm0.c
	$(CC) -mcpu=cortex-m0 -mthumb -mfloat-abi=soft $(CFLAGS) $(WARNFLAGS) $(CWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm0pp.o:		cm0.c
	$(CPP) -mcpu=cortex-m0 -mthumb -mfloat-abi=soft $(CPPFLAGS) $(WARNFLAGS)  $(CPPWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm0plusc.o:		cm0plus.c
	$(CC) -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft $(CFLAGS) $(WARNFLAGS) $(CWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm0pluspp.o:	cm0plus.c
	$(CPP) -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft $(CPPFLAGS) $(WARNFLAGS)  $(CPPWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm3c.o:			cm3.c
	$(CC) -mcpu=cortex-m3 -mthumb -mfloat-abi=soft $(CFLAGS) $(WARNFLAGS) $(CWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm3pp.o:		cm3.c
	$(CPP) -mcpu=cortex-m3 -mthumb -mfloat-abi=soft $(CPPFLAGS) $(WARNFLAGS)  $(CPPWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm4c.o:			cm4.c
	$(CC) -mcpu=cortex-m4 -mthumb -mfloat-abi=soft $(CFLAGS) $(WARNFLAGS) $(CWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"

cm4pp.o:		cm4.c
	$(CPP) -mcpu=cortex-m4 -mthumb -mfloat-abi=soft $(CPPFLAGS) $(WARNFLAGS)  $(CPPWARNFLAGS) $(INCLUDES) -c -o "$@" "$<"
