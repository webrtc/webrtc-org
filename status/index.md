---
layout: default
title: Status of Implementation
permalink: /status/
---

Here, we address questions about changes to the PeerConnection API and other
topics that developers have been asking about recently.

### GetUserMedia

  * Can the microphone input from `GetUserMedia` be used to pipe it to the
    `<audio>` for local playback?
    * No, the `<audio>` tag does not support `MediaStreams` yet but it is
      currently being worked on.


### PeerConnection API Status

  * Can you summarize the evolution of the PeerConnection API changes?

    There have been many changes. Here is a little history and background and
    the latest (Oct 1st 2012, Chrome M23).

    1. The first implementation of PeerConnection API was changed to
       `webkitDeprecatedPeerConnection` and the latest implementation
       `webkitPeerConnection00` was introduced. This reason for this is
       detailed in a blog post but, in short, we switched from a ROAP based
       signalling mechanism to JSEP.

    2. `webkitDeprecatedPeerConnection` was removed and replaced by
       `webkitPeerConnection00`.

    3. The W3C made further significant changes, including a naming convention
       change. Chrome M23 introduces `RTCPeerConnection`. Since this is what
       will be shipping in Chrome, we have moved `webkitPeerConnection00`
       behind a flag. Here is what we have implemented in Chrome:

       We have implemented <http://www.w3.org/TR/2012/WD-webrtc-20120821/>
       with these two APIs:

           void createAnswer (RTCSessionDescriptionCallback successCallback, optional RTCPeerConnectionErrorCallback? failureCallback = null, optional MediaConstraints constraints = null);

           void updateIce (optional RTCConfiguration? configuration = null, optional MediaConstraints? constraints = null);

       instead of :

           void createAnswer (RTCSessionDescription offer, RTCSessionDescriptionCallback successCallback, optional RTCPeerConnectionErrorCallback? failure Callback = null, optional MediaConstraints constraints = null, optional boolean createProvisionalAnswer = false);

           void updateIce (optional RTCConfiguration? configuration = null, optional MediaConstraints? constraints = null, optional boolean restart = false);


### Data Channels

  * What is the status of the Data Channel API?

    The Data Channel API is not implemented and its implementation is being
    discussed in the standards committee. We will begin to focus on it as
    soon as we stabilize PeerConnection. Please refer to our latest
    [presentation from Google I/O](http://www.youtube.com/watch?v=E8C8ouiXHHk#t=24m35s)
    that will give one a good idea of what the Data Channel API will look like.


### TURN?

  * TURN support is being introduced in Chrome 24. Please run Chrome Canary or
    Dev Channel to try it out.

### OPUS?

  * OPUS audio codec support is being introduced in Chrome 24. Please run
    Chrome Canary or Dev Channel to try it out.

### ICE

  * When will ICE be fully RFC 5245 compliant and be enabled in PeerConnection?

    Chrome M23 ships with a first version of the newly compliant API. Join our
    discuss list to help iron out issues.

### Muting

  * How do I mute an outgoing track?

    Set track.enabled to false, see the
    [bug](https://bugs.chromium.org/p/webrtc/issues/detail?id=582) for
    implementing it.

  * How do I stop sending RTP packets?

    Set `a=inactive` in your SDP, and update your local description.

### Recording

  * What is the status of the recording functionality?

    Recording does not have a stable specification yet and our current focus
    is on PeerConnection.

### DTMF support

  * What is the the current status of DTMF support?

    We are nearly complete with the native implementation of DTMF as
    [specified](http://dev.w3.org/2011/webrtc/editor/webrtc.html#idl-def-AudioMediaStreamTrack) except for:

      * The character "," indicates a delay of 2 seconds before processing
        the next character in the tones parameter

      * If insertDTMF is called on the same object while an existing task for
        this object is generate DTMF is still running, the previous task is
        canceled

    After this is complete, we hope to wire this up in WebKit.
