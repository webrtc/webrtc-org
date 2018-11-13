---
layout: default
title: hdr-metadata
permalink: /experiments/rtp-hdrext/hdr-metadata/
---

The HDR metadata extension is used to communicate metadata that is needed in order to properly render a
high dynamic range (HDR) video stream. Contact <kron@google.com> for more info.

Name: "HDR metadata" ; "RTP Header Extension for HDR metadata"

Formal name: <http://www.webrtc.org/experiments/rtp-hdrext/hdr-metadata>

Wire format: 2-byte header + 30 bytes of data.

The data is written in the following order,
Mastering metadata (22 bytes):
  * Luminance max, scaled by a factor of 100 and written as a 24-bit unsigned
    interger.
  * Luminance min, scaled by a factor of 10000 and written as a 24-bit unsigned
    integer.
  * X and Y coordinate of the primary red, scaled by a factor of 10000 and each written
    as 16-bit unsigned integers.
  * X and Y coordinate of the primary green, scaled by a factor of 10000 and each written
    as 16-bit unsigned integers.
  * X and Y coordinate of the primary blue, scaled by a factor of 10000 and each written
    as 16-bit unsigned integers.
  * X and Y coordinate of the white point, scaled by a factor of 10000 and each written
    as 16-bit unsigned integers.

Followed by max light levels (8 bytes)):
  * Max content light level, written as a 32-bit unsigned integer.
  * Max frame average light level, written as a 32-bit unsigned integer.

Note, the byte order for all integers is big endian.

See the standard SMPTE ST 2086 for more information about these entities.
