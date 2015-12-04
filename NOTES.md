## Documentation

To save space, this package does not contain documentation files. The current CMSIS documentation is available from [keil.com](http://www.keil.com/cmsis).

## SVD schemas

Although not required by the builds, the SVD schema files are available in the `CMSIS/Utilities` folder.

## ARM devices

Also for informative purposes, the support code (headers, startup, linker script, SVD, etc) for the ARM specific devices (ARMCM0, ARMCM0plus, ARMCM3, ARMCM4, ARMCM7, ARMCSC000, ARMCSC300) is available in the `Device/ARM` folder.

## Original files

The ARM original files are kept in the repository `originals` branch, updated with each new release, and merged into the `xpack` branch (three-way merge).

The current files were extracted from the `CMSIS-SP-00300-r4p5-00rel0.zip` archive.

To save space, the following folders/files were removed:

* all non-portable *.exe files
* CMSIS/DAP
* CMSIS/Documentation
* CMSIS/Driver/DriverTemplates
* CMSIS/index.html
* CMSIS/DSP_Lib
* CMSIS/Lib
* CMSIS/Pack
* CMSIS/RTOS/RTX/LIB
* CMSIS/RTOS/RTX/Tutorial
* Device/\_Template\_Flash
* Device/\_Template\_Vendor
* Device/ARM/Documents
* Device/ARM/Flash

## Changes

The actual files used by this package are in the `xpack` repository branch.

Most of the files are unchanged, with the following exceptions:

* the `core_cm*.h` files were edited and pragmas were added to silence the warnings:

```
#ifndef __CORE_CM4_H_GENERIC
#define __CORE_CM4_H_GENERIC

// [ILG]
#if defined ( __GNUC__ )
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#endif

...

// [ILG]
#if defined ( __GNUC__ )
#pragma GCC diagnostic pop
#endif

#endif /* __CMSIS_GENERIC */

```

## Tests

Compile only tests, using the `arm-none-eabi` toolchain, with most warnings enabled:

* each CORE header is compiled with both C and C++, for the proper core (M0, M0+, M3, M4, M7);
* all driver headers are compiled with both C and C++, for M0 and M4.

