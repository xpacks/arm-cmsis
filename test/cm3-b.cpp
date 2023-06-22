/*
 * This file is part of the µOS++ distribution.
 *   (https://github.com/micro-os-plus)
 * Copyright (c) 2015-2023 Liviu Ionescu. All rights reserved.
 *
 * Permission to use, copy, modify, and/or distribute this software
 * for any purpose is hereby granted, under the terms of the MIT license.
 *
 * If a copy of the license was not distributed with this file, it can
 * be obtained from https://opensource.org/licenses/mit/.
 */

/*
 * Compile test for the CMSIS Cortex-M3 core header.
 */

#define __MPU_PRESENT             1
#define __NVIC_PRIO_BITS          4

#include "armv7m-irqs.h"

#include "core_cm3.h"

#if (__CORTEX_M != 0x03)
#error #__CORTEX_M __CORTEX_M
#endif

int
main (int argc __attribute__((unused)), char* argv[] __attribute__((unused)))
{
  return 0;
}

extern "C" void
_exit (int code);

void
_exit (int code __attribute__((unused)))
{
  for (;;)
    {
    }
}
