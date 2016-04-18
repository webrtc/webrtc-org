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

  2. Set the target OS in your environment:

     ~~~~~ bash
     export GYP_DEFINES="OS=ios"
     ~~~~~

  3. Create a working directory, enter it, and run:

     ~~~~~ bash
     fetch --nohooks webrtc_ios
     gclient sync
     ~~~~~

     This will fetch a regular WebRTC checkout with the iOS-specific parts
     added. The same checkout can be used for both Mac and iOS development,
     depending on the OS you set in `GYP_DEFINES` (see above).

  4. You may want to disable Spotlight indexing for the checkout to speed up
     file operations..

See [Development][2] for generic instructions on how
to update the code in your checkout.


### Compiling the Code

GYP is used to generate build instructions for ninja from the relevant .gyp files. Ninja is used to compile the source using the previously generated instructions. In order to configure GYP to generate build files for iOS certain environment variables need to be set. Those variables can be edited for the various build configurations as needed.

Building for iOS Device:

~~~~~ bash
export GYP_DEFINES="OS=ios target_arch=arm"
export GYP_GENERATOR_FLAGS="output_dir=out_ios"
~~~~~

Building for 64-bit iOS device:

~~~~~ bash
export GYP_DEFINES="OS=ios target_arch=arm64"
export GYP_GENERATOR_FLAGS="output_dir=out_ios64"
~~~~~

Building for Simulator:

~~~~~ bash
export GYP_DEFINES="OS=ios target_arch=ia32"
export GYP_GENERATOR_FLAGS="output_dir=out_sim"
~~~~~

Building for 64-bit Simulator:

~~~~~ bash
export GYP_DEFINES="OS=ios target_arch=x64"
export GYP_GENERATOR_FLAGS="output_dir=out_sim"
~~~~~

Building for OSX:

~~~~~ bash
export GYP_DEFINES="OS=mac target_arch=x64"
export GYP_GENERATOR_FLAGS="output_dir=out_mac"
~~~~~

Note that you can set `output_dir` to whatever you'd like. It will be created
under `src/`. Now run the gyp generator script from the source root
(`<working directory>/src`):

~~~~~ bash
webrtc/build/gyp_webrtc.py
~~~~~

Now to compile, just run ninja on the appropriate target. For example:

~~~~~ bash
ninja -C out_ios/Debug-iphoneos AppRTCDemo
ninja -C out_ios/Release-iphoneos AppRTCDemo
ninja -C out_sim/Debug-iphonesimulator AppRTCDemo
~~~~~

For interesting targets to build, see the `.gyp` files in `webrtc/webrtc.gyp`,
`webrtc/webrtc_examples.gyp`, `talk/libjingle.gyp`,
`talk/libjingle_examples.gyp`.

Some sample scripts are also available at [talk/app/webrtc/objc/README][3].


### Compiling with Xcode

Compiling with Xcode is not supported! What we do instead is compile using a
script that runs ninja from Xcode. In order to generate the relevant Xcode
project, add `xcode-ninja` to `GYP_GENERATORS` along with the targets you're
interested in. By using Xcode in this manner, we get the build speed of ninja
while at the same time getting access to the usual methods of
deployment/debugging for iOS.

~~~~~ bash
export GYP_GENERATOR_FLAGS="xcode_project_version=3.2 xcode_ninja_target_pattern=All_iOS xcode_ninja_executable_target_pattern=AppRTCDemo|libjingle_peerconnection_unittest|libjingle_peerconnection_objc_test output_dir=out_ios"

export GYP_GENERATORS="ninja,xcode-ninja"
~~~~~

When running the generator script, you should see an `all.ninja.xcworkspace`
file. You should be able to select the desired target and platform in the
Xcode usual fashion and build/deploy. Note that you will need to rerun the
GYP generator if you want to switch target platforms.


### Deploying to Device

It's easiest to deploy to a device using Xcode in `xcode-ninja` mode. Other
command line tools exist as well, e.g. `ios-deploy`.


[1]: {{ site.baseurl }}/native-code/development/prerequisite-sw/
[2]: {{ site.baseurl }}/native-code/development/
[3]: https://code.google.com/p/chromium/codesearch#chromium/src/third_party/libjingle/source/talk/app/webrtc/objc/README
