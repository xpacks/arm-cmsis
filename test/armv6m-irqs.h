#ifndef _ARMV6M_IRQS_H
#define _ARMV6M_IRQS_H

/*  ARMv6-M Processor Exceptions Numbers */
typedef enum
{
  NonMaskableInt_IRQn = -14,
  HardFault_IRQn = -13,
  SVC_IRQn = -5,
  PendSV_IRQn = -2,
  SysTick_IRQn = -1,
} IRQn_Type;

#endif /* _ARMV6M_IRQS_H */
