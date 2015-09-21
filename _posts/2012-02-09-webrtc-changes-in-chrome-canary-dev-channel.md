---
layout: default
title: WebRTC changes in Chrome Canary / Dev Channel
author: Serge Lachapelle
date: 2012-02-09 06:06:00
---


The Chrome WebRTC package has changed this week for user of Chrome Canary and
Dev channels. We thought it would be a good idea to drop a note on the blog as
we have not yet caught up with updating our own documentation. The Chrome
implementation of the WebRTC API is now a closer match to current W3C WebRTC
API draft. It includes the ability for separate audio / video sessions. (ref:
[Stream API][1])

  * SRTP (encryption) now on by default, meaning all audio and video data will
    be encrypted. This will maybe break a few early phone interop demos.

  * Signaling is now built using [ROAP][2]. Another proposal, which has gained
    some consensus, is [JSEP][3]. We are tracking this closely.

Hints on how to migrate your early prototypes can be found in
[this changelist][4].

[1]: http://dev.w3.org/2011/webrtc/editor/webrtc.html#stream-api
[2]: http://tools.ietf.org/html/draft-jennings-rtcweb-signaling-01
[3]: https://tools.ietf.org/html/draft-uberti-rtcweb-jsep
[4]: http://codereview.chromium.org/9284020
