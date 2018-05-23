---
layout: default
title: Report Bugs
permalink: /bugs/
crumb: Reporting Bugs
---

{% include toc-hide.html %}


There are a couple bug trackers relevant to WebRTC:

  * [crbug.com](https://crbug.com) -- for Chrome.\*

  * [bugzilla.mozilla.org](https://bugzilla.mozilla.org/) -- for Firefox.

  * [bugs.opera.com/wizard](https://bugs.opera.com/wizard/) -- for Opera.

  * [bugs.webrtc.org](http://bugs.webrtc.org) -- for WebRTC native code.

\* Anyone with a [Google account][1] can file bugs and they're continuously
triaged by Chrome and WebRTC engineers.


### How to File a Good Bug Report

Please include as many relevant details as possible.


#### Example Data Points

  * Version of the browser/app

    * For Chrome: copy/paste from **chrome://version**

    * For WebRTC native code: if applicable, include the branch (e.g. trunk)
      and WebRTC revision (e.g. r8207) your application uses

  * Operating system (Windows, Mac, Linux, Android, iOS, etc.) and version
    (e.g. Windows 7, OS X 10.9, Ubuntu 14, etc.)

  * Hardware platform/device model (e.g. PC, Mac, Samsung 4S, Nexus 7, iPhone
    5S, iPad Air 2 etc)

  * Camera and microphone model and version (if applicable)

    * <p>For Chrome audio and video device issues, please run the tests at
      <https://test.webrtc.org>. After the tests finish running, click the bug
      icon at the top, download the report, and attach the report to the issue
      tracker.</p>

  * Web site URL

  * Reproduction steps: detailed information on how to reproduce the bug. If
    applicable, please either attach or link to a minimal test page in
    HTML+JavaScript.

  * For **crashes**

    * If you experience a crash while using Chrome, please include a crash ID
      by following [these instructions][2].

    * If you experience a crash while using WebRTC native code, please include
      the full stacktrace.

  * For **functional** issues or **ICE** issues, in either Chrome or a native
    application, please gather a [native log][5].

  * For **connectivity** issues on Chrome, ensure **chrome://webrtc-internals**
    is open in another tab before starting the call and while the call is in progress,

    * expand the **Create Dump** section,

    * click the **Download the PeerConnection updates and stats data** button.
      You will be prompted to save the dump to your local machine. Please
      attach that dump to the bug report.

  * For **audio quality** issues on Chrome, while the call is in progress,

    * please open **chrome://webrtc-internals** in another tab,

    * expand the **Create Dump** section,

    * fill in the **Enable diagnostic audio recordings** checkbox. You will be
      prompted to save the recording to your local machine. After ending the
      call, attach the recording to the bug.

  * For **echo** issues, please try to capture an audio recording from the
    side that is _generating_ the echo, not the side that _hears_ the echo.
    For example, if UserA and UserB are in a call, and UserA hears herself
    speak, please obtain an audio recording from UserB.


#### Instructions

  * Identify which bug tracker to use:

    * If you're hitting a problem in Chrome, file the bug using the
      [Audio/Video Issue template][3].

    * If you're a developer working with the native code, file the bug at
      [this link][4].

  * Include as much as possible from the data points listed above.

[1]: https://accounts.google.com/
[2]: http://www.chromium.org/for-testers/bug-reporting-guidelines/reporting-crash-bug
[3]: https://code.google.com/p/chromium/issues/entry?template=Audio/Video%20Issue
[4]: https://bugs.chromium.org/p/webrtc/issues/entry
[5]: {{ site.baseurl }}/native-code/logging/
