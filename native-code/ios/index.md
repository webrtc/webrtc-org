---
layout: default
title: iOS
permalink: /native-code/ios/
crumb: iOS
---


{% include toc-hide.html %}


### Development environment

An OS X machine is required for iOS development. While it's possible to
develop purely from the command line with text editors, it's easiest to use
XCode. Both methods will be illustrated here.


### Getting the code

  1. Install [prerequisite software][1]

  2. Set the target OS in your environment:

     ~~~~~ bash
     export GYP_DEFINES="OS=ios"
     ~~~~~

  3. Create a working directory, enter it, and run:

     ~~~~~ bash
     fetch webrtc_ios
     ~~~~~

  4. You may want to disable Spotlight indexing for the checkout to speed up
     file operations.

See [Development][2] for generic instructions on how
to update the code in your checkout.


### Compiling the code

GYP is used to generate build instructions for ninja from the relevant .gyp files. Ninja is used to compile the source using the previously generated instructions. In order to configure GYP to generate build files for iOS certain environment variables need to be set. Those variables can be edited for the various build configurations as needed.

Building for iOS device:

~~~~~ bash
export GYP_CROSSCOMPILE=1
export GYP_DEFINES="OS=ios target_arch=arm arm_version=7"
export GYP_GENERATOR_FLAGS="output_dir=out_ios"
export GYP_GENERATORS=ninja
~~~~~

Building for 64-bit iOS device:

As above, except with:

~~~~~ bash
export GYP_DEFINES="OS=ios target_arch=arm64 target_subarch=arm64"
export GYP_GENERATOR_FLAGS="output_dir=out_ios64"
~~~~~

Building for simulator:

As above, except with:

~~~~~ bash
export GYP_DEFINES="OS=ios target_arch=ia32"
export GYP_GENERATOR_FLAGS="output_dir=out_sim"
~~~~~

Building for OSX:

As above, except with:

~~~~~ bash
export GYP_DEFINES="OS=mac target_arch=x64"
export GYP_GENERATOR_FLAGS="output_dir=out_mac"
~~~~~

Note that you can set `output_dir` to whatever you'd like. It will be created
under `src/`. Now run the gyp generator script from the source root
(`<working directory>/src`):

~~~~~ bash
webrtc/build/gyp_webrtc
~~~~~

Now to compile, just run ninja on the appropriate target. E.g.

~~~~~ bash
ninja -C out_ios/Debug-iphoneos AppRTCDemo
ninja -C out_ios/Release-iphoneos AppRTCDemo
~~~~~

For interesting targets to build, see the `.gyp` files in `webrtc/webrtc.gyp`,
`webrtc/webrtc_examples.gyp`, `talk/libjingle.gyp`,
`talk/libjingle_examples.gyp`.

Some sample scripts are also available at [talk/app/webrtc/objc/README][3].


### Compiling with XCode

Compiling with XCode is not supported! What we do instead is compile using a
script that runs ninja from XCode. In order to generate the relevant xcode
project, add `xcode-ninja` to `GYP_GENERATORS` along with the targets you're
interested in. By using XCode in this manner, we get the build speed of ninja
while at the same time getting access to the usual methods of
deployment/debugging for iOS.

~~~~~ bash
export GYP_GENERATOR_FLAGS="xcode_project_version=3.2 xcode_ninja_target_pattern=All_iOS xcode_ninja_executable_target_pattern=AppRTCDemo|libjingle_peerconnection_unittest|libjingle_peerconnection_objc_test output_dir=out_ios"

export GYP_GENERATORS="ninja,xcode-ninja"
~~~~~

When running the generator script, you should see an `all.ninja.xcworkspace`
file. You should be able to select the desired target and platform in the
XCode usual fashion and build / deploy. Note that you will need to rerun the
GYP generator if you want to switch target platforms.


### Deploying to device

It's easiest to deploy to a device using XCode in `xcode-ninja` mode. Other
command line tools exist as well, e.g. ios-deploy.


[1]: {{ site.baseurl }}/native-code/development/prerequisite-sw/
[2]: {{ site.baseurl }}/native-code/development/
[3]: https://code.google.com/p/chromium/codesearch#chromium/src/third_party/libjingle/source/talk/app/webrtc/objc/README
