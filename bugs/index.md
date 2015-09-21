---
layout: default
title: Report Bugs
permalink: /bugs/
crumb: Reporting Bugs
---

{% include toc-hide.html %}


There are two bug trackers relevant to WebRTC:

  * <//crbug.com> - for Chrome.

  * <//code.google.com/p/webrtc/issues/list> - for WebRTC native code.

Anyone with a Google account can file bugs and they're continuously triaged by
Chrome and WebRTC engineers.


### How to File a Good Bug Report

It's important a bug report contains the relevant information in order to get
it fixed.


#### Example Data Points

  * Version of the browser/app (check [chrome://version] for Chrome)
  * Operating system (Windows, Mac, Linux, Android, iOS etc) and version
    (Windows 7, OS X 10.9, Ubuntu 14 etc.)
  * Hardware platform/device model (PC, Mac, Samsung 4S, Nexus 7, iPhone 5S,
    iPad Air 2 etc)
  * Webcam model and version (if applicable)
  * Web site URL
  * Reproduction steps: detailed information on how to reproduce the bug. If
    applicable and possible: a minimal test page in HTML+JavaScript.

[chrome://version]: chrome://version


#### Instructions

  1. Identify which bug tracker to use:

     * If you're hitting a problem in Chrome, file the bug using the
       Audio/Video Issue template.

     * If you're a developer working with the native code, file the bug at
       this link.

  2. Include as much as possible from the data points listed above. You can
     use <//test.webrtc.org> and attach the log for some of this data.

  3. If possible; include a dump from chrome://webrtc-internals (must be done
     during the WebRTC session).

     * If your bug is related to audio quality; check the Enable diagnostic
       audio recordings checkbox to create a recording.

