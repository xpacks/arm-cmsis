![GitHub package.json version](https://img.shields.io/github/package-json/v/xpacks/arm-cmsis)](https://github.com/xpacks/arm-cmsis/blob/xpack/package.json)
[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/xpacks/arm-cmsis)](https://github.com/xpacks/arm-cmsis/tags/)
[[![license](https://img.shields.io/github/license/xpacks/arm-cmsis)](https://github.com/xpacks/arm-cmsis/blob/xpack/LICENSE)

# A source code library with a selection of Arm CMSIS files

This project provides support for running µOS++ on Cortex-M devices.

The project is hosted on GitHub as
[xpacks/arm-cmsis](https://github.com/xpacks/arm-cmsis).

## Maintainer info

This page is addressed to developers who plan to include this source
library into their own projects.

For maintainer info, please see the
[README-MAINTAINER](README-MAINTAINER.md) file.

## Install

As a source library xPack, the easiest way to add it to a project is via
**xpm**, but it can also be used as any Git project, for example as a submodule.

### Prerequisites

A recent [xpm](https://xpack.github.io/xpm/),
which is a portable [Node.js](https://nodejs.org/) command line application.

It is recommended to update to the latest version with:

```sh
npm install --global xpm@latest
```

For details please follow the instructions in the
[xPack install](https://xpack.github.io/install/) page.

### xpm

This package is available as
`@xpacks/arm-cmsis` from GitHub.

```sh
cd my-project
xpm init # Unless a package.json is already present

xpm install github:xpacks/arm-cmsis

ls -l xpacks/@xpacks/arm-cmsis
```

### Git submodule

If, for any reason, **xpm** is not available, the next recommended
solution is to link it as a Git submodule below an `xpacks` folder.

```sh
cd my-project
git init # Unless already a Git project
mkdir -p xpacks

git submodule add https://github.com/xpacks/arm-cmsis.git \
  xpacks/@xpacks/arm-cmsis
```

## Branches

Apart from the unused `master` branch, there are two active branches:

- `xpack`, with the latest stable version (default)
- `xpack-develop`, with the current development version

All development is done in the `xpack-develop` branch, and contributions via
Pull Requests should be directed to this branch.

When new releases are published, the `xpack-develop` branch is merged
into `xpack`.

## Developer info

The current files were extracted from the `CMSIS-SP-00300-r4p5-00rel0.zip` archive.

Most of the files are unchanged, with the following exceptions:

- the `core_cm*.h` files were edited and pragmas were added to silence the warnings:

### Status

The **arm-cmsis** source library is fully functional,
but starting with mid 2023 it was marked as end-of-life and
is not recommended for new designs.

### Build & integration info

To ease the integration of this package into user projects, there
are already made CMake configuration files (see below).

For other build systems, consider the following details:

#### Include folders

The following folders should be passed to the compiler during the build:

- `CMSIS/Include`

#### Source files

- none

#### Preprocessor definitions

- none

#### Compiler options

- none

#### Dependencies

- none

#### CMake

To integrate the **arm-cmsis** source library
into a CMake application,
add this folder to the build:

```cmake
add_subdirectory("xpacks/@xpacks/arm-cmsis")`
```

The result is an interface library that can be added as an application
dependency with:

```cmake
target_link_libraries(your-target PRIVATE

  xpacks::arm-cmsis
)
```

### Examples

- none

### Known problems

- none

#### Limitations

- none

### Tests

- none (the `test` folder is currently not used)

## License

The original content is released under the
[MIT License](https://opensource.org/licenses/mit/),
with all rights reserved to
[Liviu Ionescu](https://github.com/ilg-ul).
