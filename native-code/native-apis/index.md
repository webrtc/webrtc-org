---
layout: default
title: WebRTC Native APIs
permalink: /native-code/native-apis/
crumb: Native APIs
class: api
---



{% include toc-hide.html %}


The WebRTC Native APIs implementation is based on W3C's
[**WebRTC 1.0: Real-time Communication Between Browsers**][1].

The code that implements WebRTC Native APIs (including the `Stream` and
`PeerConnection` APIs) are available [here][2]. A
[sample client application][3] is also provided.

The target audience of this document are those who want to use WebRTC Native
APIs to implement WebRTC JavaScript APIs or to develop native RTC
applications.

[1]: http://w3c.github.io/webrtc-pc/
[2]: https://webrtc.googlesource.com/src/+/master/api/
[3]: https://webrtc.googlesource.com/src/+/master/examples/peerconnection



### Block Diagram

![]({{ site.baseurl }}/assets/images/WebRTCNativeAPIsDocument.png){: .img-responsive .center-block :}


### Calling Sequences


#### Set up a call

![]({{ site.baseurl }}/assets/images/WebRTCNativeAPIsDocument%20%281%29.png){: .img-responsive .center-block :}


#### Receive a Call

![]({{ site.baseurl }}/assets/images/WebRTCNativeAPIsDocument%20%282%29.png){: .img-responsive .center-block :}


#### Close Down a Call

![]({{ site.baseurl }}/assets/images/WebRTCNativeAPIsDocument%20%283%29.png){: .img-responsive .center-block :}


### Threading Model

WebRTC Native APIs use two globally available threads: the signaling thread
and the worker thread. Depending on how the PeerConnection factory is created,
the application can either provide those two threads or just let them be
created internally.

Calls to the Stream APIs and the PeerConnection APIs will be proxied to
the signaling thread, which means that an application can call those APIs from
whatever thread.

All callbacks will be made on the signaling thread. The application should
return the callback as quickly as possible to avoid blocking the signaling
thread. Resource-intensive processes should be posted to a different thread.

The worker thread is used to handle more resource-intensive processes, such as
data streaming.

  * Stream APIs ([media_stream_interface.h](https://webrtc.googlesource.com/src/+/master/api/media_stream_interface.h))

  * PeerConnection APIs ([peer_connection_interface.h](https://webrtc.googlesource.com/src/+/master/api/peer_connection_interface.h))




### Reference

The current HTML5 specification for WebRTC: <http://w3c.github.io/webrtc-pc/>

The source code of the WebRTC Native API: <https://webrtc.googlesource.com/src/+/master/api>

Complete list of directories that contain API files: <https://webrtc.googlesource.com/src/+/master/native-api.md>

Client and server sample apps: <https://webrtc.googlesource.com/src/+/master/examples>
