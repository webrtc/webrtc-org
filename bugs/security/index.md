---
layout: default
title: Security Bugs
permalink: /bugs/security/
crumb: Security Bugs
---

{% include toc-hide.html %}

### Filing A Security Bug
If you have found a potential security related bug [please follow the instructions here.](https://webrtc.org/bugs/#filing-a-security-bug)

### Tracking WebRTC Chromium - Security Bugs
Publicly visible security bugs in the Chromium issue tracker normally become
visible 14 weeks after they are fixed and can be found with the following query:
[WebRTC Chromium Bug-Security Tracker](https://bugs.chromium.org/p/chromium/issues/list?can=1&q=component:Blink%3EWebRTC%20Type=Bug-Security%20&sort=-modified&colspec=ID%20Pri%20M%20Stars%20ReleaseBlock%20Component%20Status%20Owner%20Summary%20OS%20Modified)

If you have an account with the bug tracker you can set up a saved query to
immediately notify you if a new security bug is posted.

### Tracking WebRTC Standalone - Security Bugs
Only a subset of the WebRTC codebase is used in Chrome. For standalone
applications such as mobile applications (that depend on WebRTC native fixes)
will be announced separately on [discuss-webrtc](https://groups.google.com/group/discuss-webrtc).

Please be sure to subscribe to the mailing list to stay up to date.

### Applying Security Patches - Standalone Clients
Note that we will generally NOT merge security fixes backwards to any branches,
so if you’re using older branches it’s your responsibility to make sure the
relevant security fixes get merged. We recommend staying up to date with master
for this reason.


### Security Research
* [Project Zero: Adventures in Video Conferencing Part 1: The Wild World of WebRTC](https://googleprojectzero.blogspot.com/2018/12/adventures-in-video-conferencing-part-1.html)
