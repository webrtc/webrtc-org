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
     fetch webrtc_android
     ~~~~~

See Development for instructions on how to update the code, building etc.


### Using the Bundled Android SDK/NDK

In order to use the Android SDK and NDK that is bundled in
third_party/android_tools, run this to get it included in your PATH (from
src/):

~~~~~ bash
. build/android/envsetup.sh
~~~~~

Then you'll have adb and all the other Android tools in your PATH.


### Running the AppRTCDemo App

AppRTCDemo is an Android application using WebRTC Native APIs via JNI (JNI
wrapper is documented [here][2]).

For instructions on how to build and run, see
[talk/examples/android/README][3].


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

  5. **NOTICE:** The first time you run a test, you must accept a dialog on
     the device!

[1]: {{ site.baseurl }}/native-code/development/prerequisite-sw/
[2]: https://chromium.googlesource.com/external/webrtc/+/master/talk/app/webrtc/java/README
[3]: https://chromium.googlesource.com/external/webrtc/+/master/talk/examples/android/README
[4]: https://chromium.googlesource.com/external/webrtc/+/master/webrtc/examples/android/media_demo/README
