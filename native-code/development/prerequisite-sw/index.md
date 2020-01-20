---
layout: default
title: Prerequisite Software
permalink: /native-code/development/prerequisite-sw/
crumb: Prerequisites
---


{% include toc-hide.html %}


### Depot Tools

  1. [Install the Chromium depot tools][1].

  2. On Windows, depot tools will download a special version of Git during your
     first `gclient sync`.
     On Mac and Linux, you'll need to install Git by yourself
     (<http://git-scm.com>).


### Linux (Ubuntu/Debian)

A script is provided for Ubuntu, which is unfortunately only available after
your first gclient sync:

~~~~~ bash
./build/install-build-deps.sh
~~~~~

Most of the libraries installed with this script are not needed since we now
build using Debian sysroot images in build/linux, but there are still some tools
needed for the build that are installed with [install-build-deps.sh][2]

[1]: https://code.google.com/p/chromium/codesearch#chromium/src/build/install-build-deps.sh

You may also want to have a look at the [Chromium Linux Build instructions][3]
if you experience any other problems building.


### Windows

Follow the [Chromium's build instructions for Windows][4].

WebRTC requires Visual Studio 2017 to be used. If you only have version 2015
available, you might be able to keep using it for some time by setting
`GYP_MSVS_VERSION=2015` in your environment. Keep in mind that this is not a
suppported configuration however.

### macOS

Xcode 9 or higher is required. Latest Xcode is recommended to be able to build
all code.


### Android

You'll need a Linux development machine. WebRTC is using the same Android
toolchain as Chrome (downloaded into `third_party/android_tools`) so you won't
need to install the NDK/SDK separately.

  1. Install Java OpenJDK as described in the [Chromium Android prerequisites][6]
  2. All set! If you don't run Ubuntu, you may want to have a look at
    [Chromium's Linux prerequisites][5] for distro-specific details.



[1]: http://dev.chromium.org/developers/how-tos/install-depot-tools
[2]: https://cs.chromium.org/chromium/src/build/install-build-deps.sh
[3]: https://chromium.googlesource.com/chromium/src/+/master/docs/linux/build_instructions.md
[4]: https://chromium.googlesource.com/chromium/src/+/master/docs/windows_build_instructions.md
[5]: https://chromium.googlesource.com/chromium/src/+/master/docs/linux/build_instructions.md#Install
[6]: https://chromium.googlesource.com/chromium/src/+/master/docs/android_build_instructions.md
