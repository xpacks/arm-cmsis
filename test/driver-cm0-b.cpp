//
// Copyright (c) 2015 Liviu Ionescu.
// This file is part of the xPacks project (https://xpacks.github.io).
//

/*
 * Compile test for the CMSIS Driver headers.
 */

#include "Driver_CAN.h"
#include "Driver_ETH_MAC.h"
#include "Driver_ETH_PHY.h"
#include "Driver_ETH.h"
#include "Driver_Flash.h"
#include "Driver_I2C.h"
#include "Driver_MCI.h"
#include "Driver_NAND.h"
#include "Driver_SAI.h"
#include "Driver_SPI.h"
#include "Driver_USART.h"
#include "Driver_USB.h"
#include "Driver_USBD.h"
#include "Driver_USBH.h"

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
