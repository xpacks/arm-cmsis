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
 * Compile test for the CMSIS Driver headers.
 */

#include "drivers.h"

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
