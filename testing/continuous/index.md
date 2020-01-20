---
layout: default
title: Continuous Testing
permalink: /testing/continuous/
---


{% include toc-hide.html %}


The WebRTC-in-Chrome implementation is built on the code you find in
code.webrtc.org. In order to ensure the quality of those libraries, we have a ton of unit tests
and integration tests for those libraries. These tests can be built and run by
developers, and they also run in the Chrome continuous integration system at
build.chromium.org. You can see those here:

<https://ci.chromium.org/p/webrtc/g/ci/console>

Furthermore, there's a lot of code in Chromium which uses the webrtc library to 
implement the WebRTC web standard. There's a bunch of tests for that too, which run here:

<https://ci.chromium.org/p/chromium/g/chromium.webrtc/console>

When you submit a patch to webrtc, it will first run in the
WebRTC waterfall to ensure you change is sound on the library level.
When we roll the WebRTC version in Chrome (which normally happens daily) 
you change will be tested against all the WebRTC-in-Chrome tests to ensure the
change is OK. If your change breaks something on some level, it will be reverted 
and you'll get a chance to fix and re-submit.


### Want to Add a Test?

It is a very good idea to add tests if you use webrtc.org code and want your
particular way of using it to be protected from unintentional breakage. If you
don't have a test, other developers will break your application without even
knowing it! Feel free to [write an issue][1] if you want to come into contact
with the main WebRTC devs and discuss collaborating about tests.


### WebRTC Tests

Like we said earlier, these tests run [here][2]. The waterfall is a bit tricky
to understand, but essentially each build bot will compile as soon as a patch
is submitted to code.webrtc.org and run all the tests we have on it. For
instance, [video_engine_tests][3] will run tests on the WebRTC video engine.


### WebRTC-in-Chrome Tests

There are essentially two kinds of tests: [browser_tests][4] and
[content_browsertests][5]. The former are big end-to-end tests which set up a
very realistic WebRTC call (and that exercise the getUserMedia info bar),
whereas the latter test more detailed spec behavior in [javascript][6].

If you have made a change and want to run all the relevant WebRTC browser
tests, you need to build the browser_tests and content_browsertests targets in
your Chromium checkout. First, ensure you have a working webcam plugged in.
Then run

~~~~~ bash
out/Debug/content_browsertests --gtest_filter="WebRtc*" --run-manual
~~~~~

and

~~~~~ bash
out/Debug/browser_tests --gtest_filter="WebRtcBrowserTest*" --run-manual
~~~~~

If all those pass, you're probably good.


### Continuous Conformance Tests

See the [Conformance testing]({{ site.baseurl }}/testing/conformance/) page.


[1]: http://bugs.webrtc.org
[2]: https://ci.chromium.org/p/webrtc/g/ci/console
[3]: https://webrtc.googlesource.com/src/+/master/BUILD.gn#568
[4]: https://cs.chromium.org/chromium/src/chrome/browser/media/webrtc/webrtc_browsertest.cc
[5]: https://cs.chromium.org/chromium/src/content/browser/webrtc/webrtc_browsertest.cc
[6]: https://code.google.com/p/chromium/codesearch#chromium/src/content/test/data/media/peerconnection-call.html&q=peerconn&sq=package:chromium&l=1
