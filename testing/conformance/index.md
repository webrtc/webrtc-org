---
layout: default
title: Conformance Testing
permalink: /testing/conformance/
---


{% include toc-hide.html %}


### W3C Conformance Tests

It's important that WebRTC works across browsers - Chrome must be able to talk
to Firefox, for instance. The W3C conformance tests are strongly grounded in
the spec and makes sure the browsers conform.

The WebRTC-related tests can be found at

  * <https://github.com/w3c/web-platform-tests/tree/master/mediacapture-streams>

  * <https://github.com/w3c/web-platform-tests/tree/master/webrtc>

The tests are continually updated as the spec changes. If you're interested in contributing, speak to <dom@w3.org> or <phoglund@webrtc.org>.


#### Conformance Tests in Chrome

The conformance tests are [pulled into Chrome][1] continuous integration every now and then.


### Interop Tests

We actually have an automated test which tests Firefox nightly with Chrome continuously. The test brings up both browser and a local AppRTC server and makes sure they can get a call up and get video flowing.

Read more here on the Google testing blog: [Part 1][3], [Part 2][4]


[1]: https://chromium.googlesource.com/chromium/src/+/master/docs/testing/web_platform_tests.md
[3]: http://googletesting.blogspot.se/2014/08/chrome-firefox-webrtc-interop-test-pt-1.html
[4]: http://googletesting.blogspot.se/2014/09/chrome-firefox-webrtc-interop-test-pt-2.html
