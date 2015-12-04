# ARM CMSIS

An xPack with a selection of ARM CMSIS files, mainly the CMSIS CORE and the CMSIS Driver headers.

## Package

[ARM CMSIS](https://github.com/xpacks/arm-cmsis) package details:

* unique name: `ilg-arm-cmsis`
* type: [xcdl](http://xcdl.github.io)
* git repository: https://github.com/xpacks/arm-cmsis.git
* latest archive: [zip](https://github.com/xpacks/arm-cmsis/archive/xpack.zip)

## Version

* 4.5.0-3

## Releases

* none

## Package maintainers

* Liviu Ionescu <ilg@livius.net> ([web](http://liviusdotnet.worldpress.com))

## Content contributors

* ARM
* Liviu Ionescu <ilg@livius.net> ([web](http://liviusdotnet.worldpress.com))

## Support

* [all issues](https://github.com/xpacks/arm-cmsis/issues)

## Dependencies

* none

## Keywords

* arm
* cmsis
* cortex-m

## License

* LicenseRef-LICENSE.pdf

## Documentation

The latest CMSIS documentation is available from
[keil.com](http://www.keil.com/cmsis).

## Original files

The original files are available from the `originals` branch.

These files were extracted from `CMSIS-SP-00300-r4p5-00rel0.zip`.

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

* the `core_cm*.h` files were edited and pragmas were added to silence warnings:

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

Compile only, `arm-none-eabi`, with most warnings enabled:

* each CORE header is compiled with both C and C++, for the proper core (M0, M0+, M3, M4, M7);
* all driver headers are compiled with both C and C++, for M0 and M4.


