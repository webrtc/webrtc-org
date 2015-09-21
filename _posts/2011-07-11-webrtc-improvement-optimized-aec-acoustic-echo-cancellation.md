---
layout: default
title: "WebRTC Improvement: Optimized AEC (Acoustic Echo Cancellation)"
author: Serge Lachapelle
date: 2011-07-11 11:21:00
---


Acoustic Echo is what happens when sound from your speakers enters your
microphone. You may not hear it, but the people you are talking to will find
it extremely irritating. Hearing your own voice as a delayed echo is rarely
appreciated. In the past, the best way to avoid this was to force everyone to
use a headsets.

Acoustic Echo Cancellation (AEC) solves this by analyzing the sound being
played out from your speakers and removes it from the sound captured by your
microphone. This is done in software, in real time... and if you ask me, it is
magical. A state of the art AEC component is included in the WebRTC package.
We feel it is a core component for a great experience.

...And we've just improved it significantly. Through careful optimizations, our
AEC component now requires about 50% less CPU resources for SSE2 processors
and about 20% less for non-SSE2 processors. This is significant and we hope
you will spend the extra CPU cycles wisely :)

Code is checked-in and, of course, freely available for use.