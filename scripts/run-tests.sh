#! /bin/bash
set -euo pipefail
IFS=$'\n\t'
# 
# Copyright (c) 2015 Liviu Ionescu
# This file is part of the xPacks project (https://xpacks.github.io).
#
# Script to run all tests in this package.
#
# Must be started with an absolute path, since it computes the
# current location from this path.
#
# It is safe (and recommended) to start it from '/tmp'.
#

PACK_NAME=arm-cmsis

PARENT_PATH="$(dirname $(dirname $0))"

# This subfolder will be created in the folder where this script runs.
SUBFOLDER="xpacks/tests"

rm -rf "${SUBFOLDER}/${PACK_NAME}"
mkdir -p "${SUBFOLDER}/${PACK_NAME}"
cd "${SUBFOLDER}/${PACK_NAME}"

for f in "${PARENT_PATH}/test"/*
do
  
  if [ -d "$f" ]
  then
  TEST_NAME=$(basename "$f")
  echo
  echo "Testing \"${TEST_NAME}\"..."
  
  mkdir "${TEST_NAME}"
  cp $f/* "${TEST_NAME}"
  
  if [ -f "${TEST_NAME}/makefile" ]
  then
    # If the test folder has a 'makefile', run it.
    make --directory="${TEST_NAME}" PARENT="${PARENT_PATH}" TEST_NAME="${TEST_NAME}" all
  else
    echo "Unsupported test."
    exit 1
  fi
  
  echo
  echo "Testing \"${TEST_NAME}\" done."
  fi
  
done

if [ -f "${PARENT_PATH}/test/makefile" ]
then
  mkdir -p test
  cp ${PARENT_PATH}/test/* "test"
  make --directory="test" PARENT="${PARENT_PATH}" TEST_NAME="test" all
fi
