---
layout: default
title: iLBC Freeware
permalink: /license/ilbc-freeware/
crumb: iLBC Freeware
---


{% include toc-hide.html %}



Global IP Solutions, the creator of iLBC, was acquired by Google in January
2011. Google continues to support the iLBC effort and is offering it as part
of it's WebRTC open source effort. iLBC is now available under the same
[license]({{ site.baseurl }}/license/) as the WebRTC project. On this page,
you will find material taken from the old ilbcfreeware.org page.

Below, you will find legacy information copied from ilbcfreeware.org for
archival and reference purposes.

**[Additional iLBC documentation](ilbc-extra-documentation/)**


### What is iLBC?

iLBC (internet Low Bitrate Codec) is a FREE speech codec suitable for robust
voice communication over IP. The codec is designed for narrow band speech and
results in a payload bit rate of 13.33 kbit/s with an encoding frame length of
30 ms and 15.20 kbps with an encoding length of 20 ms. The iLBC codec enables
graceful speech quality degradation in the case of lost frames, which occurs
in connection with lost or delayed IP packets.

![]({{ site.baseurl }}/assets/images/ilbc-mos-chart-e8e2.png)


#### Features

  * Bitrate 13.33 kbps (399 bits, packetized in 50 bytes) for the frame size
    of 30 ms and 15.2 kbps (303 bits, packetized in 38 bytes) for the frame
    size of 20 ms

  * Basic quality higher then G.729A, high robustness to packet loss

  * Computational complexity in a range of G.729A

  * Google is not charging royalties for iLBC


### Contributing

Please read on how you can get the source code and contribute to the code by
reading the [build]({{ site.baseurl }}/native-code/development/) information.
