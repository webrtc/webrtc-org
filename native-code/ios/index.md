---
layout: default
title: iOS
permalink: /native-code/ios/
crumb: iOS
---


{% include toc-hide.html %}


### Development Environment

A macOS machine is required for iOS development. While it's possible to
develop purely from the command line with text editors, it's easiest to use
Xcode. Both methods will be illustrated here.

You will need to install [Chromium depot_tools][1].

### Getting the Code

Create a working directory, enter it, and run:

~~~~~ bash
fetch --nohooks webrtc_ios
gclient sync
~~~~~

This will fetch a regular WebRTC checkout with the iOS-specific parts
added. The same checkout can be used for both Mac and iOS development,
since you can generate your [Ninja][4] project files in multiple
directories (see below).

Note that the git repository root is in `src`.

You may want to disable Spotlight indexing for the checkout to speed up
file operations.

From here you can check out a new local branch with:

~~~~~ bash
git new-branch <branch name>
~~~~~

See [Development][2] for generic instructions on how
to update the code in your checkout.


### Generating project files

[GN][5] is used to generate [Ninja][4] project files. In order to configure
[GN][5] to generate build files for iOS certain variables need to be set.
Those variables can be edited for the various build configurations as needed.

The variables you should care about are the following:

* `target_os`:
  - To build for iOS this should be set as `target_os="ios"` in your `gn args`.
  The default is whatever OS you are building on.
* `target_cpu`:
  - For builds targeting iOS devices, this should be set to either `"arm"` or
  `"arm64"`, depending on the architecture of the device. For builds to run in
  the simulator, this should be set to `"x64"`.
* `is_component_build`:
  - Component builds don't take as long to link, but have runtime performance
  implications. They are not supported on iOS, so this should always be set
  to `false`.
* `is_debug`:
  - Debug builds are the default. When building for release, specify `false`.

The component build is the default for Debug builds, which are also enabled by
default unless `is_debug=false` is specified.

The [GN][5] command for generating build files is `gn gen <output folder>`.

#### Examples
~~~~~ bash
# debug build for 64-bit iOS
gn gen out/ios_64 --args='target_os="ios" target_cpu="arm64" is_component_build=false'

# debug build for simulator
gn gen out/ios_sim --args='target_os="ios" target_cpu="x64" is_component_build=false'
~~~~~

### Compiling with ninja

To compile, just run ninja on the appropriate target. For example:

~~~~~ bash
ninja -C out/ios_64 AppRTCMobile
~~~~~

Replace `AppRTCMobile` in the command above with the target you
are interested in.

To see a list of available targets, run `gn ls out/<output folder>`.

### Using Xcode

GN can generate an Xcode project from the build files. The build targets
in the generated project will invoke a script that builds with ninja instead
of building the project directly.

Compiling with Xcode is not supported! What we do instead is compile using a
script that runs ninja from Xcode. In order to generate the relevant Xcode
project, add `--ide=xcode` to the GN command. By using Xcode in this manner, we
get the build speed of ninja while at the same time getting access to the usual
methods of deployment/debugging for iOS.

After running GN, you'll find a `all.xcworkspace` file in the output directory.
Using this, you can select the desired target and platform in the Xcode usual
fashion and build/deploy. Note that you will need to rerun GN if you want to
switch target platforms.

### Running the tests

There are several test targets in WebRTC. To run them, simply invoke them from
the command line, for example:

~~~~~ bash
./out/mac/peerconnection_unittests
~~~~~

To run a specific test or collection of tests, pass the `--gtest_filter` argument
to the test binary, for example:

~~~~~ bash
./out/mac/peerconnection_unittests --gest_filter="WebRtcSessionTest.*"
~~~~~

This will run all tests under `WebRtcSessionTest`.

To run tests on device, or in the simulator, the `.app` bundle must be deployed
to the device and run from there. See the next section.

### Deploying to Device

It's easiest to deploy to a device using Xcode. Other command line tools exist
as well, e.g. `ios-deploy`.

### Using WebRTC in your app

To build WebRTC for use in a native iOS app, it's easiest to build
`WebRTC.framework`. This can be done with ninja as follows, replacing `ios`
with the actual location of your generated build files.

~~~~~ bash
ninja -C out/ios rtc_sdk_framework_objc
~~~~~

This should result in a `.framework` bundle being generated in `out/ios`.
This bundle can now be directly included in another app.

If you need a FAT `.framework`, that is, a binary that contains code for
multiple architectures, and will work both on device and in the simulator,
a script is available [here][3]


[1]: {{ site.baseurl }}/native-code/development/prerequisite-sw/
[2]: {{ site.baseurl }}/native-code/development/
[3]: https://chromium.googlesource.com/external/webrtc/+/master/webrtc/build/ios/build_ios_libs.sh
[4]: https://chromium.googlesource.com/chromium/src/+/master/docs/ninja_build.md
[5]: https://chromium.googlesource.com/chromium/src/+/master/tools/gn/README.md
