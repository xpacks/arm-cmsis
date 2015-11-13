#! /bin/bash
set -euo pipefail
IFS=$'\n\t'

# Archives are to be downloaded from:
# https://sourceforge.net/projects/micro-os-plus/files/Vendor%20Archives/ARM/CMSIS/

RELEASE_VERSION="V3.01"
RELEASE_ID="r3p1-00rel0"

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

rm -rfv \
CMSIS/Documentation \
CMSIS/index.html \
CMSIS/DSP_Lib \
CMSIS/Lib \
Device/_Template_Vendor \
Version* \

find . -name '*.exe' -exec rm \{} \;

cat <<EOF >README.md
# ARM CMSIS

This project, available from [GitHub](https://github.com/xpacks),
includes the ARM CMSIS files.

## Version

* ${RELEASE_VERSION}

## Documentation

The latest CMSIS documentation is available from
[keil.com](http://www.keil.com/cmsis).

## Original files

The original files are available from the \`originals\` branch.

These files were extracted from \`${ARCHIVE_NAME}\`.

To save space, the following folders/files were removed:

* all nonportable *.exe files
* CMSIS/Documentation
* CMSIS/index.html
* CMSIS/DSP_Lib
* CMSIS/Lib
* Device/_Template_Vendor

EOF
