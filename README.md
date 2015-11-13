# ARM CMSIS

This project, available from [GitHub](https://github.com/xpacks),
includes the ARM CMSIS files.

## Version

* V3.20

## Documentation

The latest CMSIS documentation is available from
[keil.com](http://www.keil.com/cmsis).

## Original files

The original files are available from the `originals` branch.

These files were extracted from `CMSIS-SP-00300-r3p2-00rel1.zip`.

To save space, the following folders/files were removed:

* all non-portable *.exe files
* CMSIS/Documentation
* CMSIS/index.html
* CMSIS/DSP_Lib
* CMSIS/Lib
* Device/_Template_Vendor

## Changes

Add /tests/warnings & run-tests.sh

Add pragmas to silence warnings.

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
