---
layout: default
title: Firefox
permalink: /web-apis/firefox/
---


{% include toc-hide.html %}


### How to Reach the Firefox Team

For any questions or comments about Firefox's implementation of WebRTC, please
go to [dev-media][1]. For a discussion of WebRTC, please join us on the
[discussion list][2].

For specific issues with the FIrefox WebRTC code, please use our
[bug tracker][3].

Press inquiries should be sent to <press@mozilla.com>


### How Do I Contribute Code?

Community contributors are very welcome at Mozilla. Please go [here][4] to
learn basic information about contributing to the Firefox project and
[here][5] for detailed instructions on how to contribute code.  Then go to
irc.mozilla.org #media or #developers and ask questions about the WebRTC
Firefox code or any of our open bugs. Since Firefox is a Global project,
someone is usually online to answer questions and chat about the project.


### Firefox Implementation Details

`getUserMedia`, `PeerConnection` and `DataChannels` are implemented in the
desktop version of Firefox for Windows, Linux and Mac. `getUserMedia` does not
require any flags to use in Firefox 20 or later. `PeerConnection` and
`DataChannels` do not require a flag for Firefox Nightly versions after
February 19, 2013.

Here are some frequently asked questions about the current implementation:


#### DataChannels

Supported in Firefox today, you can use `DataChannels` to send peer-to-peer
information during an audio/video call.


#### TURN

We don’t have TURN support yet, but we plan to support it soon.


#### Opus

We support the [Opus audio codec][6] as our preferred audio codec. We also
support G.711 for compatibility with devices that have not yet implemented
Opus.


#### Recording API

We have not implemented the [Recording API][7] yet, but we plan to support it
in future versions of Firefox.


[1]: https://groups.google.com/forum/#!forum/mozilla.dev.media
[2]: https://groups.google.com/group/discuss-webrtc
[3]: https://bugzilla.mozilla.org/enter_bug.cgi?product=Core&component=WebRTC
[4]: http://www.mozilla.org/en-US/contribute/
[5]: https://developer.mozilla.org/en-US/docs/Introduction
[6]: http://tools.ietf.org/html/rfc6716
[7]: http://lists.w3.org/Archives/Public/public-media-capture/2012Dec/att-0159/RecordingProposal.html
