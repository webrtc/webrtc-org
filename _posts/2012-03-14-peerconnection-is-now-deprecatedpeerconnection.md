---
layout: default
title: PeerConnection is now Deprecated
author: Serge Lachapelle
date: 2012-03-14 08:16:00
---


(Cross-posted from the [WebRTC Google+ page][1])

In today's forecast, we expect to see sunny skies and a chance of breakage. If
you have been writing WebRTC demos with Chrome, this will affect your demo.

The Chrome WebRTC (that's us!) team is very active at both the W3C and IETF to
get the APIs in tip top shape. Our goal is to have our implementation follow
the API quickly. The result? Chrome Canary and Chrome Dev will go through
major changes, starting today, that will break your existing work.
Fortunately, fixing is easy! Please read the following carefully:

1. The current `PeerConnection` API is now renamed `DeprecatedPeerConnection`.
We are keeping the old `PeerConnection` around to give you time to move to it.
A simple rename will keep your demos working.

`DeprecatedPeerConnection` will be deleted a short while after JSEP is fully
intergrated into the WebRTC standard and `PeerConnection00` is renamed
`PeerConnection`.

2. We are working on the new `PeerConnection` API. It's not done yet. JSEP is
a new signalling API that is described in this internet draft:
<http://tools.ietf.org/html/draft-ietf-rtcweb-jsep-00>. The WebRTC W3C
workgroup is working on integrating this draft into the W3C Specification.

The new JSEP `PeerConnection` will be called `PeerConnection00`. We will keep
a version number until the W3C workgroup finalizes the standard. By using
version numbers, we can hopefully avoid "hard" breakage like the one we are
causing now.

If you adopt this new version, you will be closer to the final spec, but you
will have to expect breakage if we update from 00 to 01 and so on.

You will notice that JSEP allows lower level operations, but is more complex.
To offset this complexity, [+Harald Tveit Alvestrand][2] created a Javascript
library that abstracts JSEP and mimics the "old" way of doing things. You can
find it here:
<http://code.google.com/p/webrtc-samples/source/browse/#svn%2Ftrunk%2Froap-jsep>.
Disclaimer: It's a first version but should be useful to keep your old demos
running once we switch fully to JSEP.

Here is the timeline we expect to follow:

  * Today's `PeerConnection` is being renamed `DeprecatedPeerConnection` (NOW
    for Canary, soon for Chrome Dev.)

  * A new experimental `PeerConnection` will be introduced as
    `PeerConnection00` (gradually during the next few weeks)

  * As the JSEP draft iterates `PeerConnection00` might become
    `PeerConnection01`. The old `PeerConnection00` won't stay around.

  * When the standard is fully updated with the final JSEP API
    `PeerConnection00` (or `PeerConnection01` etc) will be updated accordingly
    and renamed `PeerConnection`.

  * A few weeks later (tops) `DeprecatedPC` will be deleted.

The demos, issues and comments you have sent us are extremely motivating. We
hope you will take the time to replace the string "PeerConnection" with
"DeprecatedPeerConnection" in your code. Iterating an early standard is a
challenge and we apologize for the inconvenience. I promise to update this
page frequently and answer questions about this quickly.

The WebKit bug entries that can be used to track the chaos are:

Overall move to JSEP <https://bugs.webkit.org/show_bug.cgi?id=80589>

Rename to `DeprecatedPeerConnection`
<https://bugs.webkit.org/show_bug.cgi?id=80692>

Thanks!


[1]: https://plus.google.com/u/0/b/113817074606039822053/113817074606039822053/posts/V2fcVUh8BAE
[2]: https://plus.google.com/u/0/b/113817074606039822053/112842896004573547999
