---
layout: default
title: WebRTC Now Available in the Chrome Dev Channel
author: Serge Lachapelle
date: 2012-01-18 09:01:00
---


Today, we made available the WebRTC API and its underlying components on the
Chrome dev channel. This release implements a slightly older version of the
[W3C spec][1]. The spec is evolving rapidly, but now that we have WebRTC wired
up in Chrome, we plan to catch up to it quickly.

We thought it would be a good idea to provide some additional details for
those interested in trying it out.


#### Who should use this?

WebRTC should be interesting to developers who want to add real time
communication capabilities to their apps. However, please note that WebRTC is
still evolving. We consider it an early beta so your feedback will be critical
for future releases.


#### How do I enable WebRTC?

Please switch to the Chrome Dev Channel by following the instructions on
[this page][2]. Then start Chrome with this switch: `--enable-media-stream`


#### How can I try it out?

A simple to try it out is to access [apprtc][3]. For more details on how to
run apprtc demo, please take a look [here][4].


#### Where should I provide feedback?

Feedback for the WebRTC API should be sent to the [W3C list][5]. Underlying
protocol choices are discussed on the [IETF list][6].

Feedback on our implementation is best sent to our
[WebRTC discussion list][7]. To file issues, please use our bug tracker which
can be found [here][8].

We look forward to working with all of you!

Niklas Enbom, Software Engineer


[1]: http://www.w3.org/TR/webrtc/
[2]: http://dev.chromium.org/getting-involved/dev-channel
[3]: https://apprtc.appspot.com/
[4]: {{ site.baseurl }}/reference-apps/
[5]: http://lists.w3.org/Archives/Public/public-webrtc/
[6]: http://www.ietf.org/mail-archive/web/rtcweb/current/maillist.html
[7]: https://groups.google.com/forum/#%21forum/discuss-webrtc
[8]: http://code.google.com/p/webrtc/issues/list
