---
layout: default
title: Changes to Our WebRTC API Implementation
author: Serge Lachapelle
date: 2012-05-02 06:19:00
---


The good: As we move closer to a stable release, we want to be comply with the
proposed W3C API as much as possible.  The less good: This means that several
of your incredible demos will need a minor tiny update.

#### 1st change: `getUserMedia`

The spec (<http://w3c.github.io/mediacapture-main/getusermedia.html>) advocates
the use of an object based argument syntax. Example:

Before:

~~~~~
navigator.webkitGetUserMedia("audio,video", gotStream, gotStreamFailed);
~~~~~

After:

~~~~~
navigator.webkitGetUserMedia({audio:true, video:true}, gotStream, gotStreamFailed);
~~~~~

This change has been submitted and will be a part of Chrome Canary soon.

#### 2nd change: `PeerConnection00`

The second change affects the new PeerConnection API called JSEP
(<http://tools.ietf.org/html/draft-uberti-rtcweb-jsep-02>). The older, soon to
be deprecated, webkitDeprecatedPeerConnection API is not affected by this.

Similarly to `webkitGetUserMedia`, `webkitPeerConnection00` also advocates the
use of an object based argument syntax.

This change has not been submitted yet, but we expect it to land soon.

`createOffer & createAnswer requires a MediaHints dictionary with the
`following properties:

~~~~~
has_audio: boolean
has_video: boolean
~~~~~

`startIce` now takes an `IceOptions` dictionary with the following property:

~~~~~
use_candidates: "all", "no_relay", "only_relay"
~~~~~

`addStream` now takes a `MediaStreamHints` dictionary for future usage.

All these four APIs previously required string arguments. We expect further
changes in the valid keys for these objects. We will be able to support
backwards compatibility for those changes.

#### 3rd change, a new Chrome flag

`webkitGetUserMedia() has proven very popular with developers. It enables
`local camera and microphone access and can be used for taking pictures, for
`games, etc...

To allow us to deliver this popular functionality independently of the
complete WebRTC package, we have decided to split the `webkitGetUserMedia` and
`PeerConnection` implementation (both `webkitPeerConnection00` and
`webkitDeprecatedPeerConnection`) into two flags:

`--enable-media-stream` is the master flag. It will enable `getUserMedia`
`--functionality giving you access to camera and microphone.

In order to establish an audio and video connection between two browsers, you
will now need to also enable `--enable-peer-connection`.

The last two changes are not yet in, but we wanted to give you a heads up. I
will send an update once they start showing up on Canary.

Thank you for all your great demos and feedback.

/Serge
