---
layout: default
title: Interop Notes
permalink: /web-apis/interop/
---


{% include toc-hide.html %}


[Firefox Beta][1] (as of 5/16/13) and [Chrome][2] 25 and later are
interoperable, but currently require a small degree of adaptation on the part
of the calling site.


### API differences

Firefox and Chrome both prefix their interfaces and are likely to continue to
do so until the standard is more finalized. The following table shows the
relevant names:

~~~~~ bash
W3C Standard           Chrome                   Firefox
--------------------------------------------------------------
getUserMedia           webkitGetUserMedia       mozGetUserMedia
RTCPeerConnection      webkitRTCPeerConnection  mozRTCPeerConnection
RTCSessionDescription  RTCSessionDescription    mozRTCSessionDescription
RTCIceCandidate        RTCIceCandidate          mozRTCIceCandidate
~~~~~

To help insulate apps from these differences, we provide a "polyfill" library
which takes care of all these issues and lets developers write to the
unprefixed W3C standard names. This library can be found in the WebRTC code
repository:

<//github.com/webrtc/adapter/blob/master/adapter.js>


### Interop with AppRTC

AppRTC (<//apprtc.webrtc.org>) uses the adapter.js polyfill, so it
correctly handles interop between the browsers. You can test this with Chrome
and Firefox today! This is tested continuously by our
[automated Chrome-Firefox interop tests][3].


[1]: //www.mozilla.org/beta
[2]: //www.google.com/intl/en/chrome/browser/beta.html
[3]: {{ site.baseurl }}/testing/conformance/
