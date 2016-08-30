---
layout: default
title: iOS
permalink: /native-code/ios/
crumb: iOS
---


{% include toc-hide.html %}


### Development Environment

An OS X machine is required for iOS development. While it's possible to
develop purely from the command line with text editors, it's easiest to use
Xcode. Both methods will be illustrated here.


### Getting the Code

  1. Install [prerequisite software][1]

  2. Create a working directory, enter it, and run:

     ~~~~~ bash
     fetch --nohooks webrtc_ios
     gclient sync
     ~~~~~

     This will fetch a regular WebRTC checkout with the iOS-specific parts
     added. The same checkout can be used for both Mac and iOS development,
     since you can generate your [Ninja][4] project files in multiple
     directories (see below).

  3. You may want to disable Spotlight indexing for the checkout to speed up
     file operations..

See [Development][2] for generic instructions on how
to update the code in your checkout.


### Compiling the Code

[GN][5] is used to generate [Ninja][4] project files. In order to configure
[GN][5] to generate build files for iOS certain variables need to be set.
Those variables can be edited for the various build configurations as needed.

Building for iOS Device (the different output directories can be replaced with any
directory of your own choice):

~~~~~ bash
gn gen out/Debug-device-arm32 --args='target_os="ios" target_cpu="arm" is_component_build=false'
~~~~~

Building for 64-bit iOS device:

~~~~~ bash
gn gen out/Debug-device-arm64 --args='target_os="ios" target_cpu="arm64" is_component_build=false'
~~~~~

Building for Simulator:

~~~~~ bash
gn gen out/Debug-sim32 --args='target_os="ios" target_cpu="x86" is_component_build=false'
~~~~~

Building for 64-bit Simulator:

~~~~~ bash
gn gen out/Debug-sim64 --args='target_os="ios" target_cpu="x64" is_component_build=false'
~~~~~

Building for OSX:

~~~~~ bash
gn gen out/Debug-mac --args='target_os="mac" target_cpu="x64" is_component_build=false'
~~~~~

The component build is the default for Debug builds, which are also enabled by
default unless `is_debug=false` is specified. iOS needs static builds, which is
why `is_component_build=false` is specified for all the examples above.


Now, to compile just run ninja on the appropriate target. For example:

~~~~~ bash
ninja -C out/Debug-device-arm32 AppRTCDemo
~~~~~

Some sample scripts are also available in [webrtc/build/ios][3].


### Compiling with Xcode

Compiling with Xcode is not supported! What we do instead is compile using a
script that runs ninja from Xcode. In order to generate the relevant Xcode
project, `--ide=xcode` to the GN command. By using Xcode in this manner, we get
the build speed of ninja while at the same time getting access to the usual
methods of deployment/debugging for iOS.

After running GN, you'll find a `all.xcworkspace` file in the output directory.
Using this, you can select the desired target and platform in the Xcode usual
fashion and build/deploy. Note that you will need to rerun GN if you want to
switch target platforms.


### Deploying to Device

It's easiest to deploy to a device using Xcode. Other command line tools exist
as well, e.g. `ios-deploy`.


[1]: {{ site.baseurl }}/native-code/development/prerequisite-sw/
[2]: {{ site.baseurl }}/native-code/development/
[3]: https://chromium.googlesource.com/external/webrtc/+/master/webrtc/build/ios
[4]: https://chromium.googlesource.com/chromium/src/+/master/docs/ninja_build.md
[5]: https://chromium.googlesource.com/chromium/src/+/master/tools/gn/README.md
