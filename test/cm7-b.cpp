//
// Copyright (c) 2015 Liviu Ionescu.
// This file is part of the xPacks project (https://xpacks.github.io).
//

/*
 * Compile test for the CMSIS Cortex-M7 core header.
 *
 * There are three FP configurations:
 *  - soft
 *  - softfp
 *  - hard
 * Currently only softfp is tested.
 */

#define __MPU_PRESENT             1
#define __FPU_PRESENT             1
#define __NVIC_PRIO_BITS          4

#include "armv7m-irqs.h"

#include "core_cm7.h"

#if (__CORTEX_M != 0x07)
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

