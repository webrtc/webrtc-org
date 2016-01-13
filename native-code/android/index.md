---
layout: default
title: Android
permalink: /native-code/android/
---


{% include toc-hide.html %}


### Getting the Code

Android development is only supported on Linux.

  1. Install [prerequisite software][1]

  2. Set the path to your Java OpenJDK 7 dir if you're not using the Ubuntu
     default:

     ~~~~~ bash
     export JAVA_HOME=<location of OpenJDK 7>
     ~~~~~

  3. Set the target OS in your environment:

     ~~~~~ bash
     export GYP_DEFINES="OS=android"
     ~~~~~

  4. Create a working directory, enter it, and run:

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


### Running WebRTCDemo

WebRTCDemo is a sample app that can send and receive media streams if manually
connected to another WebRTCDemo that is directly accessible (e.g. firewalls
might prevent you from establishing a connection). Further, it allows setting,
enabling and disabling audio and video processing functionality (e.g. echo
cancellation, NACK, audio codec and video codec). For instructions on how to
build and run it, see [webrtc/examples/android/media_demo/README][4]


### Running WebRTC Native Tests on an Android Device

To build APKs with the WebRTC native tests, follow these instructions.

  1. Ensure you have an Android device set in Developer mode connected via
     USB.

  2. With the target OS set in `GYP_DEFINES` as described above, compile
     everything:

     ~~~~~ bash
     ninja -C out/Debug
     ~~~~~

  3. Check which tests are available (see the output for the `--suite` flag):

     ~~~~~ bash
     webrtc/build/android/test_runner.py gtest --help
     ~~~~~

  4. Run a test on your device:

     ~~~~~ bash
     webrtc/build/android/test_runner.py gtest -s modules_unittests
     ~~~~~

  5. If want to run a Release build, add `--release` to the command line
     above.

     If you want to limit to a subset of tests, use the `--gtest_filter flag`,
     e.g.

     ~~~~~
     webrtc/build/android/test_runner.py gtest -s modules_unittests \
     --gtest_filter=RtpRtcpAPITest.SSRC:RtpRtcpRtcpTest.*
     ~~~~~

  6. **NOTICE:** The first time you run a test, you must accept a dialog on
     the device!

  7. **NOTICE:** If you run large test suites (like `webrtc_perf_tests` and
     `modules_unittests`) without any test filter, you may need to pass the
     `-t` flag to the script to set a higher timeout than the default 60
     seconds. 1800 seconds is needed for `webrtc_perf_tests` on slower
     devices.


### Running WebRTC Instrumentation Tests on an Android Device

To run the instrumentation tests (like AppRTCDemoTest and
libjingle_peerconnection_android_unittest), use the `instrumentation` command
for `test_runner.py` instead of `gtest`.


[1]: {{ site.baseurl }}/native-code/development/prerequisite-sw/
[2]: https://chromium.googlesource.com/external/webrtc/+/master/talk/app/webrtc/java/README
[3]: https://chromium.googlesource.com/external/webrtc/+/master/webrtc/examples/androidapp/README
[4]: https://chromium.googlesource.com/external/webrtc/+/master/webrtc/examples/android/media_demo/README
