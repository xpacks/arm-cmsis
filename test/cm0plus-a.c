//
// Copyright (c) 2015 Liviu Ionescu.
// This file is part of the xPacks project (https://xpacks.github.io).
//

/*
 * Compile test for the CMSIS Cortex-M0+ core header.
 */

#define __MPU_PRESENT             0
#define __NVIC_PRIO_BITS          2

#include "armv6m-irqs.h"

#include "core_cm0plus.h"

#if (__CORTEX_M != 0x00)
#error #__CORTEX_M __CORTEX_M
#endif

int
main (int argc __attribute__((unused)), char* argv[] __attribute__((unused)))
{
  return 0;
}

void
_exit (int code);

void
_exit (int code __attribute__((unused)))
{
  for (;;)
    {
    }
}
