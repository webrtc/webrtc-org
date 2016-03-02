---
layout: default
title: Prerequisite Software
permalink: /native-code/development/prerequisite-sw/
crumb: Prerequisites
---


{% include toc-hide.html %}


### Depot Tools

  1. You'll need to have the depot tools installed:

     <http://dev.chromium.org/developers/how-tos/install-depot-tools>

  2. Git: On Windows it will install a special version of Git automatically on
     the first sync. On Mac and Linux, you'll need to install Git by yourself
     (<http://git-scm.com>)


### Linux (Ubuntu/Debian)

This, and more, is described on the Chromium site:

<https://chromium.googlesource.com/chromium/src/+/master/docs/linux_build_instructions.md>


### Windows

Follow Chromium's build instructions at
<http://www.chromium.org/developers/how-tos/build-instructions-windows>.


### OS X

Xcode 3.0 or higher


### Android

These instructions are tested on a Linux development machine. In WebRTC, we're
using the same Android toolchain as Chrome (the one that is downloaded into
`third_party/android_tools`). You don't need to install NDK/SDK separately.

  1. Install [Chrome's Linux prerequisites](https://chromium.googlesource.com/chromium/src/+/master/docs/linux_build_instructions_prerequisites.md)

  2. Install [depot_tools](http://dev.chromium.org/developers/how-tos/install-depot-tools)

  3. Install Java OpenJDK as described at [Android prerequisites](https://www.chromium.org/developers/how-tos/android-build-instructions)

