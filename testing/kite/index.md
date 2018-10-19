---
layout: default
title: Testing with Kite
permalink: /testing/kite/
---


{% include toc-hide.html %}

### Development:

KITE is an open source test tool to test interoperability of WebRTC across browsers. KITE makes it easy to test interoperability of WebRTC applications and detect regressions early.

KITE is designed to be a generic, reusable and easy to maintain automated testing environment. The tests (implementing KiteTest interface) can be developed independently from the KITE Engine.

So far, our developments on KITE allow interoperability testing on stable versions of all major web browsers, namely Chrome, Firefox, Safari and Edge, running on desktop OS, that is either Ubuntu, MacOS or Windows 10.

Mobile testing (Chrome,Firefox on Android, Safari on iOS) is well in development.


You can check out the source for KITE and run your own tests [here](https://github.com/webrtc/KITE).

### Included sample IceConnectionTest

The Ice Connection test is a basic test showing that two browsers can establish a connection. IceConnectionTest's algorithm is as follows:

    1) Open the 2 browsers with https://appr.tc/r/xxx.

    2) Click 'confirm-join-button' for both of the browsers in sequence.

    3) Do the following every 1 second for 1 minute for both the browsers:

        a) Retreive iceConnectionState.

        b) Checks whether both the browsers'iceConnectionState is either 'completed' or 'connected'.

    4) The test is considered as successful if all the browsers either returns 'completed' or 'connected' within 1 minute.


### Simple result Dashboard for KITE tests:


<iframe width="100%" height="1200" src="https://kiteboard.herokuapp.com/public" frameborder="0" scrolling="no"></iframe>

