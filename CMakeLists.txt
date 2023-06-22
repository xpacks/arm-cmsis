# -----------------------------------------------------------------------------
#
# This file is part of the µOS++ distribution.
#   (https://github.com/micro-os-plus/)
# Copyright (c) 2023 Liviu Ionescu. All rights reserved.
#
# Permission to use, copy, modify, and/or distribute this software
# for any purpose is hereby granted, under the terms of the MIT license.
#
# If a copy of the license was not distributed with this file, it can
# be obtained from https://opensource.org/licenses/mit/.
#
# -----------------------------------------------------------------------------

# This file is intended to be consumed by applications with:
#
# `add_subdirectory("xpacks/@xpacks/arm-cmsis")`
#
# The result is an interface library that can be added to the linker with:
#
# `target_link_libraries(your-target PUBLIC xpacks::arm-cmsis)`

# -----------------------------------------------------------------------------
## Preamble ##

# https://cmake.org/cmake/help/v3.20/
cmake_minimum_required(VERSION 3.20)

project(xpacks-arm-cmsis
  DESCRIPTION "Arm CMSIS"
)

if(COMMAND xpack_get_package_name_and_version)
  xpack_get_package_name_and_version("${CMAKE_CURRENT_SOURCE_DIR}/package.json")
  message(VERBOSE "Processing xPack ${PACKAGE_JSON_NAME}@${PACKAGE_JSON_VERSION}...")
endif()

# -----------------------------------------------------------------------------
## The project library definitions ##

add_library(xpacks-arm-cmsis-interface INTERFACE EXCLUDE_FROM_ALL)

# -----------------------------------------------------------------------------
# Target settings.

target_include_directories(xpacks-arm-cmsis-interface INTERFACE
  "CMSIS/Include"
  "CMSIS/Driver/Include"
)

target_sources(xpacks-arm-cmsis-interface INTERFACE
    # None
)

target_compile_definitions(xpacks-arm-cmsis-interface INTERFACE
  # None.
)

target_compile_options(xpacks-arm-cmsis-interface INTERFACE
  # None.
)

target_link_libraries(xpacks-arm-cmsis-interface INTERFACE
  # None.
)

if (COMMAND xpack_display_target_lists)
  xpack_display_target_lists(xpacks-arm-cmsis-interface)
endif()

# -----------------------------------------------------------------------------
# Aliases.

# https://cmake.org/cmake/help/v3.20/command/add_library.html#alias-libraries
add_library(xpacks::arm-cmsis ALIAS xpacks-arm-cmsis-interface)
message(VERBOSE "> xpacks::arm-cmsis -> xpacks-arm-cmsis-interface")

# -----------------------------------------------------------------------------
