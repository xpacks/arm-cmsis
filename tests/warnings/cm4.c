/*
 * Copyright (c) 2015 Liviu Ionescu
 * This file is part of the xPacks project (https://xpacks.github.io).
 */

/*
 * Compile test for the CMSIS Cortex-M4 core header.
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

typedef enum
{
/******  Cortex-M4 Processor Exceptions Numbers ****************************************************************/
  NonMaskableInt_IRQn         = -14,
  MemoryManagement_IRQn       = -12,
  BusFault_IRQn               = -11,
  UsageFault_IRQn             = -10,
  SVCall_IRQn                 = -5,
  DebugMonitor_IRQn           = -4,
  PendSV_IRQn                 = -2,
  SysTick_IRQn                = -1,
} IRQn_Type;

#include "core_cm4.h"

#if (__CORTEX_M != 0x04)
#error #__CORTEX_M __CORTEX_M
#endif
