---
layout: default
title: abs-capture-time
permalink: /experiments/rtp-hdrext/abs-capture-time/
---

The Absolute Capture Time extension is used to stamp RTP packets with a NTP
timestamp showing when the first audio or video frame in a packet was originally
captured. The intent of this extension is to provide a way to accomplish
audio-to-video synchronization when RTCP-terminating intermediate systems (e.g.
mixers) are involved.

**Name:**
"Absolute Capture Time"; "RTP Header Extension for Absolute Capture Time"

**Formal name:**
<http://www.webrtc.org/experiments/rtp-hdrext/abs-capture-time>

**Status:**
This extension is defined here to allow for experimentation. Once experience has
shown that it is useful, we intend to make a proposal based on it for
standardization in the IETF.

Contact <chxg@google.com> for more info.

## RTP header extension format

### Data layout overview
Data layout of the shortened version of `abs-capture-time` with a 1-byte header
\+ 8 bytes of data:

      0                   1                   2                   3
      0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |  ID   | len=7 |     absolute capture timestamp (bit 0-23)     |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |             absolute capture timestamp (bit 24-55)            |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |  ... (56-63)  |
     +-+-+-+-+-+-+-+-+

Data layout of the extended version of `abs-capture-time` with a 1-byte header +
16 bytes of data:

      0                   1                   2                   3
      0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |  ID   | len=15|     absolute capture timestamp (bit 0-23)     |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |             absolute capture timestamp (bit 24-55)            |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |  ... (56-63)  |   sender's capture clock offset (bit 0-23)    |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |           sender's capture clock offset (bit 24-55)           |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |  ... (56-63)  |
     +-+-+-+-+-+-+-+-+

### Data layout details
#### Absolute capture timestamp

`Absolute capture timestamp` is the NTP timestamp of when the first frame in a
packet was originally captured. This timestamp MUST be based on the same clock
as the clock used to generate NTP timestamps for RTCP sender reports on the
capture system.

It's not always possible to do an NTP clock readout at the exact moment of when
a media frame is captured. A capture system MAY postpone the readout until a
more convenient time. A capture system SHOULD have known delays (e.g. from
hardware buffers) subtracted from the readout to make the final timestamp as
close to the actual capture time as possible.

This field is encoded as a 64-bit unsigned fixed-point number with the high 32
bits for the timestamp in seconds and low 32 bits for the fractional part. This
is also known as the UQ32.32 format and is what the RTP specification defines as
the canonical format to represent NTP timestamps.

#### Sender's capture clock offset

`Sender's capture clock offset` is the sender's estimate of the offset between
its own NTP clock and the capture system's NTP clock. The sender is here defined
as the system that owns the NTP clock used to generate the NTP timestamps for
the RTCP sender reports on this stream. The sender system is typically either
the capture system or a mixer. In the case that the sender system is also the
capture system, the `sender's capture clock offset` is zero.

This field is encoded as a 64-bit two’s complement **signed** fixed-point number
with the high 32 bits for the seconds and low 32 bits for the fractional part.
It’s intended to make it easy for a receiver, which knows how to estimate the
offset between its own NTP clock and that of the sender, to also estimate the
offset between its own NTP clock and that of the capturer:

     Receiver's Capture Clock Offset = Receiver's Sender Clock Offset + Sender's
Capture Clock Offset.

For an intermediate system, this facilitates to update the "sender's capture clock
offset" field in the header extension before forwarding it.

For any receiver, this facilites to estimate the one-way delay of this packet.
Simply, the receiver can use the receiver's capture clock offset to translate the
`absolute capture timestamp` into its own clock and calculate the elapsed time tills
the packet being consumed.

### Further details

#### Capture system

A receiver MUST treat the first CSRC in the CSRC list of a received packet as if
it belongs to the capture system. If the CSRC list is empty, then the receiver
MUST treat the SSRC as if it belongs to the capture system. Mixers SHOULD put
the most prominent CSRC as the first CSRC in a packet’s CSRC list.

#### Intermediate systems

An intermediate system (e.g. mixer) MAY adjust these timestamps as needed. It
MAY also choose to rewrite the timestamps completely, using its own NTP clock as
reference clock, if it wants to present itself as a capture system for A/V-sync
purposes.

#### Timestamp interpolation

A sender SHOULD save bandwidth by not sending `abs-capture-time` with every
RTP packet. It SHOULD still send them at regular intervals (e.g. every second)
to help mitigate the impact of clock drift and packet loss. Mixers SHOULD always
send `abs-capture-time` with the first RTP packet after changing capture system.

A receiver SHOULD memorize the capture system (i.e. CSRC/SSRC), capture
timestamp, and RTP timestamp of the most recently received `abs-capture-time`
packet on each received stream. It can then use that information, in combination
with RTP timestamps of packets without `abs-capture-time`, to extrapolate
missing capture timestamps.

Timestamp interpolation works fine as long as there’s reasonably low NTP/RTP
clock drift. This is not always true. Senders that detect "jumps" between its
NTP and RTP clock mappings SHOULD send `abs-capture-time` with the first RTP
packet after such a thing happening.

#### Receiver's sender clock offset
One way for a receiver to estimate the offset between its own NTP clock and that
of the sender follows. First, a receiver can estimate its round trip time (RTT)
to the sender according to [RFC3611]. Then upon receiving of a sender report (SR)
as defined in [RFC3550], which contains the NTP timestamp that the SR was sent
according to the sender's clock, the receiver can use its NTP time that it
received the SR, to estimate its clock offset againt the sender's NTP clock by:

     Receiver's Sender Clock Offset = Receiver's NTP timestamp of receiving SR -
(Sender's NTP timestamp in SR + RTT / 2).

## References
 * [RFC3611] Friedman, T., Ed., Caceres, R., Ed., and A. Clark, Ed., "RTP Control
 Protocol Extended Reports (RTCP XR)", RFC 3611, November 2003.
 * [RFC3550] Schulzrinne, H., Casner, S., Frederick, R. and V. Jacobson, "RTP: A
 Transport Protocol for Real-Time Applications", RFC 3550, July 2003.

