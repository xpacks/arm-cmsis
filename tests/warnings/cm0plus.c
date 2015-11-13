/*
 * Copyright (c) 2015 Liviu Ionescu
 * This file is part of the xPacks project (https://xpacks.github.io).
 */

/*
 * Compile test for the CMSIS Cortex-M0+ core header.
 */

#define __MPU_PRESENT             0
#define __NVIC_PRIO_BITS          2

typedef enum
{
/******  Cortex-M0+ Processor Exceptions Numbers ****************************************************************/
  NonMaskableInt_IRQn         = -14,
  HardFault_IRQn              = -13,
  SVC_IRQn                    = -5,
  PendSV_IRQn                 = -2,
  SysTick_IRQn                = -1,
} IRQn_Type;

#include "core_cm0plus.h"

#if (__CORTEX_M != 0x00)
#error #__CORTEX_M __CORTEX_M
#endif
