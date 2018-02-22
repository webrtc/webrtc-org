---
layout: default
title: Interop Notes
permalink: /web-apis/interop/
---


{% include toc-hide.html %}


[Firefox](https://www.mozilla.org/) and [Chrome](https://www.google.com/chrome)
are interoperable, but currently require a small degree of adaptation on the part of the calling site.


### API differences

Firefox and Chrome both prefix their interfaces and are likely to continue to
do so until the standard is more finalized. The following table shows the
relevant names:

~~~~~ bash
W3C Standard           Chrome                   Firefox
--------------------------------------------------------------
getUserMedia           webkitGetUserMedia       mozGetUserMedia
RTCPeerConnection      webkitRTCPeerConnection  RTCPeerConnection
RTCSessionDescription  RTCSessionDescription    RTCSessionDescription
RTCIceCandidate        RTCIceCandidate          RTCIceCandidate
~~~~~
Note that the getUserMedia API has been deprecated in favor of the
promise-based [mediaDevices.getUserMedia API](https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia)
which is supported natively both in Firefox and Chrome Canary.

To help insulate apps from these differences, we provide a "polyfill" library
which takes care of all these issues and lets developers write to the
unprefixed W3C standard names. This library can be found in the
[WebRTC adapter GitHub repository](https://github.com/webrtc/adapter).


### Interop with AppRTC

AppRTC ([appr.tc](https://appr.tc)) uses the adapter.js polyfill, so it
correctly handles interop between the browsers. You can test this with Chrome
and Firefox today! This is tested continuously by our
[automated Chrome-Firefox interop tests]({{ site.baseurl }}/testing/conformance/).

### Testing with KITE

KITE is an open-source testing Engine, designed to test interoperability between browsers, more information [here]({{ site.baseurl }}/testing/kite/).