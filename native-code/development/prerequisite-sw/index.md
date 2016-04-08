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

No specific prerequisites, but you may want to have a look at the
[Chromium Linux Build instructions][2] if you experience problems building.


### Windows

Follow step 1 and 2 at [Chromium's build instructions for Windows][3].


### OS X

Xcode 5 or higher. Latest Xcode is recommended to be able to build all code.


### Android

You'll need a Linux development machine. WebRTC is using the same Android
toolchain as Chrome (downloaded into `third_party/android_tools`) so you won't
need to install the NDK/SDK separately.

  1. Install Java OpenJDK as described in the [Chromium Android prerequisites][5]
  2. All set! If you don't run Ubuntu, you may want to have a look at
    [Chromium's Linux prerequisites][4] for distro-specific details.



[1]: http://dev.chromium.org/developers/how-tos/install-depot-tools
[2]: https://chromium.googlesource.com/chromium/src/+/master/docs/linux_build_instructions.md
[3]: http://www.chromium.org/developers/how-tos/build-instructions-windows
[4]: https://chromium.googlesource.com/chromium/src/+/master/docs/linux_build_instructions_prerequisites.md
[5]: https://www.chromium.org/developers/how-tos/android-build-instructions
