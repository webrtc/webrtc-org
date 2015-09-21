---
layout: default
title: First Step Toward Chrome Integration
author: Jan Linden
date: 2011-06-18 17:07:00
---


As a first significant step toward integrating the WebRTC project into Chrome
the WebRTC code is now about to land in Chromium as third party software at
`src/third_party/webrtc`. This means that the crucial media processing
capabilities necessary to implement real-time communication are available as a
part of Chromium.

We are working hard to complete the remaining steps for a full integration in
Chromium and Chrome including JavaScript APIs in WebKit and handling of the
native audio and video capture and rendering. When we are done, any web
developer shall be able to create RTC applications, like the Google Talk
client in Gmail, without using any plugins but only WebRTC components that
runs in the sandbox.
