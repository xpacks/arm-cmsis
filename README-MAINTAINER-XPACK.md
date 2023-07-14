[![GitHub issues](https://img.shields.io/github/issues/xpacks/arm-cmsis.svg)](https://github.com/xpacks/arm-cmsis/issues/)
[![GitHub pulls](https://img.shields.io/github/issues-pr/xpacks/arm-cmsis.svg)](https://github.com/xpacks/arm-cmsis/pulls)

# Maintainer info

## Project repository

The project is hosted on GitHub:

- <https://github.com/xpacks/arm-cmsis.git>

To clone the stable branch (`xpack`), run the following commands in a
terminal (on Windows use the _Git Bash_ console):

```sh
rm -rf ~/Work/xpack-3rd-party/arm-cmsis.git && \
mkdir -p ~/Work/xpack-3rd-party && \
git clone \
  https://github.com/xpacks/arm-cmsis.git \
  ~/Work/xpack-3rd-party/arm-cmsis.git
```

For development purposes, clone the `xpack-develop` branch:

```sh
rm -rf ~/Work/xpack-3rd-party/arm-cmsis.git && \
mkdir -p ~/Work/xpack-3rd-party && \
git clone \
  --branch xpack-develop \
  https://github.com/xpacks/arm-cmsis.git \
  ~/Work/xpack-3rd-party/arm-cmsis.git
```

## Prerequisites

A recent [xpm](https://xpack.github.io/xpm/), which is a portable
[Node.js](https://nodejs.org/) command line application.

## How to make new releases

### Release schedule

There are no fixed releases, the project aims to follow the upstream releases.

### Check Git

In the `xpacks/arm-cmsis` Git repo:

- switch to the `xpack-develop` branch
- if needed, merge the `xpack` branch

No need to add a tag here, it'll be added when the release is created.

### Increase the version

Determine the upstream version (like `4.5.0`)

- <https://arm-software.github.io/CMSIS_5/General/html/index.html>

Update the`package.json` file; add an extra digit in the
pre-release field, and initially also add `.pre`,
for example `4.5.0-7.pre.1`.

### Fix possible open issues

Check GitHub issues and pull requests:

- <https://github.com/xpacks/arm-cmsis/issues/>

and fix them; assign them to a milestone (like `4.5.0-7`).

### Update the `README*.md`` files

Update the following files to reflect the changes
related to the new version:

- `README-MAINTAINER.md`
- `README.md`

### Update `CHANGELOG-XPACK.md`

- open the `CHANGELOG-XPACK.md` file
- check if all previous fixed issues are in
- add a new entry like _* v4.5.0-7_
- commit with a message like _prepare v4.5.0-7_

### Push changes

- commit and push

### Commit the new version

- select the `xpack-develop` branch
- commit all changes
- `npm pack` and check the content of the archive, which should list
  only `package.json`, `README.md`, `LICENSE`, `CHANGELOG-XPACK.md`,
  the `doxygen-awesome-*.js` and `doxygen-custom/*` files;
  possibly adjust `.npmignore`
- `npm version 4.5.0-7`
- push the `xpack-develop` branch to GitHub
- the `postversion` npm script should also update tags via `git push origin --tags`

### Update the repo

When the package is considered stable:

- with a Git client (VS Code is fine)
- merge `xpack-develop` into `xpack`
- push to GitHub
- select `xpack-develop`
