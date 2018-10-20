---
layout: default
title: Unified Plan SDP format - transition plan
permalink: /web-apis/chrome/unified-plan/
---
Google is planning to transition Chrome’s WebRTC implementation from the current SDP format (called “Plan B”) to a standards conformant format (“Unified Plan”, draft-ietf-rtcweb-jsep) over the next couple of quarters.

The plan involves 4 phases, and one transient API feature.

## Who will be affected
People who use multiple audio tracks or multiple video tracks on a single PeerConnection will have to test their product under Unified Plan, and adapt accordingly. In the case where a call is initiated from a non-Chrome endpoint and replied to by Chrome, the form of the offer may have to change.
People who do detailed SDP parsing and care about msid attributes will have to check that their parsing code picks up the new format (a=msid).
The details on whether changes will be needed and how the apps need to change will be application dependent. We think that almost all applications that use only a single audio and a single video track per RTCPeerConnection will be unaffected by the change.
## The API feature
We are adding one new feature to the RTCPeerConnection’s RTCConfiguration:
```
enum SdpSemantics {
  "plan-b",
  "unified-plan"
};


partial dictionary RTCConfiguration {
   SdpSemantics sdpSemantics;
}
```
The RTCConfiguration can be passed to the constructor of an RTCPeerConnection, and all offers and answers constructed will be in the Unified Plan format. Calls to setLocalDescription and setRemoteDescription will also expect the SDP to be in the Unified Plan format; if it is in the legacy Chrome format, then all but the first audio track and the first video track will be ignored.

There’s also a command line flag (--enable-features=RTCUnifiedPlanByDefault in M71 and above, --enable-blink-features=RTCUnifiedPlanByDefault in earlier versions) that allows the default value of this flag to be set to “unified-plan”.
## The Phases

### Phase 1: Implement Unified Plan
Unified Plan is currently developed, and the flag for experimentation has been available from M65. Until phase 2, it is wisest to test with Canary.
If you run Chrome with “--enable-blink-features=RTCUnifiedPlan”, you will have access to the “sdpSemantics” feature described above, and can start testing with Unified Plan.

### Phase 2: Make the API feature generally available
Released in M69 (beta August 2018, stable September 2018)

In this phase, the default value of the sdpSemantics flag is “plan-b”.
In Phase 2, we expect people who have implementations that depend on the SDP format to run tests to see if their applications work when Unified Plan is in use.
For applications that support Firefox, we expect this to be a very simple exercise: just do as you would do for Firefox.

The default value of the sdpSemantics flag can be changed in "chrome://flags"; look for the feature "WebRTC: Use Unified Plan SDP Semantics by default".

### Phase 3: Switch the default

The date for the switch will be set in consultation with the users, after extensive testing. Our current plan is M72 (beta December 2018, stable January 2019). 

In this phase, we’ll change the default value of the sdpSemantics flag to “unified-plan”.
Applications that discover that they need more time to convert can set the sdpSemantics flag explicitly to “plan-b” in order to recover previous behaviour.

As part of testing, we expect to try changing the default value of the flag in Canary multiple times over the development cycle of M71 and M72.

We will be monitoring the usage of the flag, and the amount of SDP being received with “Plan B” semantics, in order to set the date for phase 4.
### Phase 4: Remove “plan B”

In this phase, the sdpSemantics flag and all code for supporting Plan B will be removed from Chrome. Setting the sdpSemantics flag will not be an error, but will have no effect.

## Preparing Your Application For Unified Plan

For detailed information about Plan B and Unified Plan differences and how your application may need to be updated in preparation for Unified plan, see the [“Unified Plan” Transition Guide (JavaScript)](https://docs.google.com/document/d/1-ZfikoUtoJa9k-GZG1daN0BU3IjIanQ_JSscHxQesvU/edit?usp=sharing).

For native (C++) applications, see the document ["Migrating your native/mobile application to Unified Plan"](https://docs.google.com/document/d/1PPHWV6108znP1tk_rkCnyagH9FK205hHeE9k5mhUzOg/edit#heading=h.cp7krlgejmby).

