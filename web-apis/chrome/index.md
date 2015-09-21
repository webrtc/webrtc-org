---
layout: default
title: Chrome
permalink: /web-apis/chrome/
---


{% include toc-hide.html %}


Both getUserMedia and RTCPeerConnection are implemented and shipping in Chrome
for Windows, Linux, Mac and Android.


### FAQ about the current implementation


#### What's the status of data channels?

The standards-compliant SCTP-based DataChannel implementation has been
released in Chrome 32. You do not need to specify any constraint in order to
use the SCTP-based DataChannels in Chrome.

A few specific notes on data channels:

  * In the standalone WebRTC build, DTLS must be enabled by either the
    "DtlsSrtpKeyAgreement:true" constraint or providing your own
    implementation of DTLSIdentityServiceInterface to
    PeerConnectionFactoryInterface::CreatePeerConnection.

  * You should not try to send more than 16KB at a time via the
    DataChannel.send() API. This limitation is temporary and will be removed
    in a future update to the SCTP protocol (EOR + ndata). Until then, you can
    work around this by breaking your data into < 16KB chunks and sending each
    chunk individually.

  * Chrome also supports unreliable RTP-based data channels, and they can be
    activated by a { RtpDataChannels: true } constraint to the PeerConnection
    constructor. However, they should be considered deprecated and NOT used in
    new code. Chrome will remove support for RTP-based data channels at some
    point in the future.


#### What API can I use for screensharing?

[chrome.desktopCapture.chooseDesktopMedia][1] is the API that you want to use,
and is available starting with Chrome 34. This API is currently only available
to Chrome apps/extensions, but a web page can use postMessage to communicate
with such an extension. For more information on this API, see
[this discuss-webrtc thread][2].

[1]: https://developer.chrome.com/extensions/desktopCapture#method-chooseDesktopMedia
[2]: https://groups.google.com/forum/#!msg/discuss-webrtc/j6jmyBFt9QI/6cjiksWiYaEJ


#### How about recording?

We have announced our intention to implement the MediaStreamRecorder API, and
are currently working on the guts of the implementation. We are hoping to have
this available to developers in 2H 2014. **FIXME**
