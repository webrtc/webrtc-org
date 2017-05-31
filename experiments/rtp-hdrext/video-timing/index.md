---
layout: default
title: video-timing
permalink: /experiments/rtp-hdrext/video-timing/
---

The Video Timing extension is used to communicate a timing information on per-frame basis
to receiver of rtp video stream. Contact <ilnik@google.com> for more info. It may be generalized 
to audio frames as well in the future.

Name: "Video Timing" ; "RTP Header Extension for Video timing"

Formal name: <http://www.webrtc.org/experiments/rtp-hdrext/video-timing>

SDP "a= name": "video-timing" ; this is also used in client/cloud signaling.

Wire format: 1-byte extension, 10 bytes of data. Total 11 bytes extra per packet
(plus 1-3 padding byte in some cases, plus shared 4 bytes for all extensions present: 2 byte magic word 0xBEDE, 2
byte # of extensions).
5 timestamps are stored as 16-bit values in big-endian order, representing delta from the capture time of a packet in ms. 

Timestamps are, in order:

  * Encode start.
  * Encode finish.
  * Packetization complete.
  * Last packet left the pacer.
  * Reserved for network.

Pacer timestamp should be updated inside the RTP packet by pacer component when the last packet (containing the extension) 
is sent to the network. Last, reserved timstamp, is not set by sender but reserved in packet for any in-network RTP stream
processor to modify.

Notes: Extension shoud be present only in the last packet of video frames. If attached to other packets it should be ignored.
