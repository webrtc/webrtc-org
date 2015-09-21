---
layout: default
title: Testing
permalink: /testing/
---


{% include toc-hide.html %}


Like the rest of Chrome, there's a focus on automated tests.

For manual development and testing, here are some command line flags that are useful for WebRTC-related testing:

  * `--allow-file-access-from-files` allows `getUserMedia()` to be called
    from `file://` URLs.

  * `--disable-gesture-requirement-for-media-playback` removes the need to tap
    a `<video>` element to start it playing on Android.

  * `--use-fake-ui-for-media-stream` avoids the need to grant
    camera/microphone permissions.

  * `--use-fake-device-for-media-stream` feeds a test pattern to
    `getUserMedia()` instead of live camera input.

  * `--use-file-for-fake-video-capture=path/to/file.y4m` feeds a [Y4M] test
    file to `getUserMedia()` instead of live camera input.


##### Subpage Listing

  * [Analyze packets using Wireshark](wireshark/)
  * [Conformance](conformance/)
  * [Continuous](continuous/)

[Y4M]: http://wiki.multimedia.cx/index.php?title=Y4M
