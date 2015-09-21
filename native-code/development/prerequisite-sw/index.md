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

<http://code.google.com/p/chromium/wiki/LinuxBuildInstructions>

A script is provided for Ubuntu, which is available after your first gclient
sync:

~~~~~ bash
./build/install-build-deps.sh
~~~~~

Pulse Audio is missing from the script. On Ubuntu, this is provided by the
`libpulse-dev` package.

Although the `install-build-deps.sh` script is the recommended method, it will
install much more than you need. Here is a (hopefully complete) minimal list
of packages to install (`sudo apt-get install ...`):

~~~~~ bash
g++ (>= 4.2)
python (>= 2.4)
libnss3-dev >= 3.12
libasound2-dev
libpulse-dev
libjpeg62-dev
libxv-dev
libgtk2.0-dev
libexpat1-dev
~~~~~

For 32-bit builds on a 64-bit system:

~~~~~ bash
lib32asound2-dev
ia32-libs
~~~~~

Tips for other distributions are available on the Chromium page.


### Windows

Follow Chromium's build instructions at <http://www.chromium.org/developers/how-tos/build-instructions-windows>


### OS X

XCode 3.0 or higher


### Android

These instructions are tested on a Linux development machine. In WebRTC, we're using the same Android toolchain as Chrome (the one that is downloaded into third_party/android_tools). So you don't need to install NDK/SDK separately.

  1. Install [Chrome's Linux prerequisites](https://code.google.com/p/chromium/wiki/LinuxBuildInstructionsPrerequisites#Automated_Setup)

  2. Install [depot_tools](http://dev.chromium.org/developers/how-tos/install-depot-tools)

  3. Install Java OpenJDK as described at [Android prerequisites](https://code.google.com/p/chromium/wiki/AndroidBuildInstructions#Install_Java_JDK)

