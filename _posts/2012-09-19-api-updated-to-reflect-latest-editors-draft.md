---
layout: default
title: API Updated to Reflect Latest Editor's Draft
author: Serge Lachapelle
date: 2012-09-19 03:00:00
---

If you have been following the W3C WebRTC spec and looking at the Chrome
implementation, you will have noticed that our implementation was not spec
compliant.

With this week's patches to Chromium and Webkit, Chrome is now an
[editor's-draft-compliant][1] WebRTC implementation.

`RTCPeerConnection is replacing PeerConnection00. RTCPeerConnection is the API
`you will find in the upcoming stable version of Chrome, and the last major
`API change before we go to a public stable release.

These changes signify breaking current applications. We do not take this
lightly. It is the unfortunate consequence of being at the forefront and of
using the Chrome Canary and Dev channels to help the community iterate on the
WebRTC API.

As Chrome 23 hits the beta channel, we will move the older, deprecated
PeerConnection00 behind a flag, `--enable-deprecated-peerconnection`, and
remove it completely thereafter.

Once WebRTC goes into the stable channel of Chrome, API changes will be done
with a longer, smoother transition period.

[1]: http://dev.w3.org/2011/webrtc/editor/webrtc.html
