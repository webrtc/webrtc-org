---
layout: default
title: Android
permalink: /native-code/android/
---


{% include toc-hide.html %}


### Getting the Code

Android development is only supported on Linux.

  1. Install [prerequisite software][1]

  2. Set the target OS in your environment:

     ~~~~~ bash
     export GYP_DEFINES="OS=android"
     ~~~~~

  3. Create a working directory, enter it, and run:

     ~~~~~ bash
     fetch --nohooks webrtc_android
     gclient sync
     ~~~~~

This will fetch a regular WebRTC checkout with the Android-specific parts
added. The same checkout can be used for both Linux and Android development,
depending on the OS you set in `GYP_DEFINES` (see above).

See [Development](/native-code/development/) for instructions on how to update
the code, building etc.


### Using the Bundled Android SDK/NDK

In order to use the Android SDK and NDK that is bundled in
`third_party/android_tools`, run this to get it included in your `PATH` (from
`src/`):

~~~~~ bash
. build/android/envsetup.sh
~~~~~

Then you'll have `adb` and all the other Android tools in your `PATH`.


### Running the AppRTCDemo App

AppRTCDemo is an Android application using WebRTC Native APIs via JNI (JNI
wrapper is documented [here][2]).

For instructions on how to build and run, see
[webrtc/examples/androidapp/README][3].


### Running WebRTC Native Tests on an Android Device

To build APKs with the WebRTC native tests, follow these instructions.

  1. Ensure you have an Android device set in Developer mode connected via
     USB.

  2. With the target OS set in `GYP_DEFINES` as described above, compile
     everything:

     ~~~~~ bash
     ninja -C out/Debug
     ~~~~~

  3. To see which tests are available: look in `out/Debug/bin`.

  4. Run a test on your device:

     ~~~~~ bash
     out/Debug/bin/run_modules_unittests
     ~~~~~

  5. If you want to limit to a subset of tests, use the `--gtest_filter flag`,
     e.g.

     ~~~~~
     out/Debug/bin/run_modules_unittests \
     --gtest_filter=RtpRtcpAPITest.SSRC:RtpRtcpRtcpTest.*
     ~~~~~

  6. **NOTICE:** The first time you run a test, you must accept a dialog on
     the device!

If want to run Release builds instead; build `out/Release` and use the scripts
generated in `out/Release/bin`.


### Running WebRTC Instrumentation Tests on an Android Device

The instrumentation tests (like AppRTCDemoTest and
libjingle_peerconnection_android_unittest) gets scripts generated in the same
location as the native tests described in the previous section.


[1]: {{ site.baseurl }}/native-code/development/prerequisite-sw/
[2]: https://chromium.googlesource.com/external/webrtc/+/master/webrtc/api/java/README
[3]: https://chromium.googlesource.com/external/webrtc/+/master/webrtc/examples/androidapp/README
