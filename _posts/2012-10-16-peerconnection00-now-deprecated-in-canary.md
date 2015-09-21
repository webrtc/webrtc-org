---
layout: default
title: PeerConnection00 Now Deprecated in Canary
author: Serge Lachapelle
date: 2012-10-16 11:50:00
---

We are getting closer to having WebRTC reach stable. As I mentioned a while
back, we are trying to make the last big changes before  this happens.

As such, we are now hiding the PeerConnection00 class behind a flag
(`--enable-deprecated-peer-connection`) both for Canary and M23 beta.

This won't be visible in the chrome://flags page and therefore can't be made
to stick; you have to launch chrome/chromium with the flag every time if you
require the old API.

This is a hassle and having you switch APIs is no fun. Rest assured that
changes going forward will be smaller and smaller... and thanks for all the
amazing feedback so far!

/Serge
