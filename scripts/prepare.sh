#! /bin/bash
set -euo pipefail
IFS=$'\n\t'

# Archives are to be downloaded from:
# https://sourceforge.net/projects/micro-os-plus/files/Vendor%20Archives/ARM/CMSIS/

# RELEASE_VERSION="V3.01"
# RELEASE_ID="r3p1-00rel0"
# RELEASE_VERSION="V3.20"
# RELEASE_ID="r3p2-00rel1"
# RELEASE_VERSION="V4.00"
# RELEASE_ID="r4p0-00rel0"
# RELEASE_VERSION="V4.1"
# RELEASE_ID="r4p1-00rel0"
# RELEASE_VERSION="V4.2"
# RELEASE_ID="r4p2-00rel0"
# RELEASE_VERSION="V4.3"
# RELEASE_ID="r4p3-00rel0"
# RELEASE_VERSION="V4.4"
# RELEASE_ID="r4p4-00rel0"
RELEASE_VERSION="V4.5"
RELEASE_ID="r4p5-00rel0"

NAME_PREFIX="CMSIS-SP-00300-"
RELEASE_NAME="${NAME_PREFIX}${RELEASE_ID}"
ARCHIVE_NAME="${RELEASE_NAME}.zip"
ARCHIVE_URL="https://sourceforge.net/projects/micro-os-plus/files/Vendor%20Archives/ARM/CMSIS/${ARCHIVE_NAME}"

LOCAL_ARCHIVE_FILE="/tmp/xpacks/${ARCHIVE_NAME}"

for f in *
do
  if [ "${f}" == "scripts" ]
  then
    :
  else
    rm -rf "${f}"
  fi
done

if [ ! -f "${LOCAL_ARCHIVE_FILE}" ]
then
  mkdir -p $(dirname ${LOCAL_ARCHIVE_FILE})
  curl -o "${LOCAL_ARCHIVE_FILE}" -L "${ARCHIVE_URL}"
fi

unzip -q "${LOCAL_ARCHIVE_FILE}"

rm -rf CMSIS/Documentation

rm -rfv \
CMSIS/*.rtf \
CMSIS/DAP \
CMSIS/Driver/DriverTemplates \
CMSIS/index.html \
CMSIS/DSP_Lib \
CMSIS/Lib \
CMSIS/Pack \
CMSIS/RTOS/RTX/LIB \
CMSIS/RTOS/RTX/index.html \
CMSIS/RTOS/RTX/Tutorial \
Device/_Template_Flash \
Device/_Template_Vendor \
Device/ARM/Documents \
Device/ARM/Flash \
Version* \

find . -name '*.exe' -exec rm \{} \;

# Move license to the top folder, since it is needed in metadata files.
mv CMSIS/CMSIS*.pdf .

cat <<EOF >NOTES.md
## Documentation

To save space, this package does not contain documentation files. The current CMSIS documentation is available from [keil.com](http://www.keil.com/cmsis).

## SVD schemas

Although not required by the builds, the SVD schema files are available in the `CMSIS/Utilities` folder.

## ARM devices

Also for informative purposes, the support code (headers, startup, linker script, SVD, etc) for the ARM specific devices (ARMCM0, ARMCM0plus, ARMCM3, ARMCM4, ARMCM7, ARMCSC000, ARMCSC300) is available in the `Device/ARM` folder.

## Original files

The ARM original files are kept in the repository `originals` branch, updated with each new release, and merged into the `xpack` branch (three-way merge).

The current files were extracted from the `${ARCHIVE_NAME}` archive.

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

EOF
