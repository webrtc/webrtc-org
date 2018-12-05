---
layout: default
title: color-space
permalink: /experiments/rtp-hdrext/color-space/
---

The color space extension is used to communicate color space information and
optionally also metadata that is needed in order to properly render a high
dynamic range (HDR) video stream. Contact <kron@google.com> for more info.

**Name:** "Color space" ; "RTP Header Extension for color space"

**Formal name:** <http://www.webrtc.org/experiments/rtp-hdrext/color-space>

**Status:** This extension is defined here to allow for experimentation. Once experience
has shown that it is useful, we intend to make a proposal based on it for standardization
in the IETF.

## RTP header extension format

Wire format: 1-byte header + 4 bytes of data or 2-byte header + 30 bytes of data.

The data is written in the following order,
Color space information (4 bytes):
  * Color primaries value according to ITU-T H.273 Table 2.
  * Transfer characteristic value according to ITU-T H.273 Table 3.
  * Matrix coefficients value according to ITU-T H.273 Table 4.
  * Range value as specified at
    https://www.webmproject.org/docs/container/#colour.

The extension may optionally include HDR metadata written in the following
order,
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

Followed by max light levels (4 bytes):
  * Max content light level, written as a 16-bit unsigned integer.
  * Max frame average light level, written as a 16-bit unsigned integer.

Note, the byte order for all integers is big endian.

See the standard SMPTE ST 2086 for more information about these entities.

Notes: Extension shoud be present only in the last packet of video frames. If attached
to other packets it should be ignored.

