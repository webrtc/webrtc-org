---
layout: default
title: "WebRTC Improvement: Better Realtime VP8 and New RTP Profile Adopted"
author: Serge Lachapelle
date: 2011-08-23 11:15:00
---


For a while now, we have been working with the WebM team to make VP8 even
better for real time scenarios.

Number one on the task list was to improve error concealment, speed and
quality. The result can now be found at webmproject.org It will automagically
get picked up by anyone building WebRTC. Relevant snippet from the [webmproject
blog post][1]:

  * Improved the datarate control in one-pass realtime compression.

  * Improved one-pass variable bitrate (VBR) visual quality by average ~7%
    across a large collection of videos.

  * Improved video conferencing user experience through error concealment, a
    feature that produces high visual quality frames even under conditions of
    substantial packet loss.

To benefit from these improvements, we have adopted a new RTP profile
(<http://tools.ietf.org/html/draft-ietf-payload-vp8-01>) for both sender and
receiver. The change is implemented in version 482 and is, of course, freely
available for use.

[1]: http://blog.webmproject.org/2011/08/vp8-codec-sdk-cayuga-released.html
