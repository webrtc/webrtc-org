---
layout: default
title: Goodbye DeprecatedPeerConnection
author: Serge Lachapelle
date: 2012-07-23 04:31:00
---

Hello everyone,

We now have a new W3C editor's draft to work with. This draft, which can be
found at <http://dev.w3.org/2011/webrtc/editor/webrtc.html>, makes it possible
for us to move forward with our implementation of PeerConnection.

To keep the code base manageable, we will be removing
`DeprecatedPeerConnection` from the API. This change will affect Canary and
Dev versions soon. The newer JSEP API provides greater flexibility and allows
for easier encapsulation of other protocols. A lot has been written about it.

For those that want a quick transition to the new API, we recommend using the
ROAP to JSEP JS library created by one of our colleagues. It abstracts
`DeprecatedPeerConnection` while using the newer JSEP API. [link obsolete]
