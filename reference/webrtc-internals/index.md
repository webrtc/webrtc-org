---
layout: default
title: WebRTC Internals
permalink: /reference/webrtc-internals/
crumb: WebRTC Internals
---



{% include toc-hide.html %}


### libjingle

The WebRTC project reuses certain components from libjingle, namely network and transport components. Documentation for libjingle can be found [here][1].

[1]: http://code.google.com/apis/talk/libjingle/developer_guide.html


### Media Processing Classes, Structures and Enumerators

Note that, all methods, structures and enumerators in this document are declared within the webrtc namespace.

| Classes, Structures, Enumerators | Header | Description
| -------------------------------- | ------ | -----------
| Structures                       | `common_types.h` | Lists the structures common to the VoiceEngine & VideoEngine
| Enumerators                      | `common_types.h` | List the enumerators common to the  VoiceEngine & VideoEngine
| Classes                          | `common_types.h` | List the classes common to VoiceEngine & VideoEngine
| class VoiceEngine                | `voe_base.h`     | How to allocate and release resources for the VoiceEngine using factory methods in the VoiceEngine class. It also lists the APIs which are required to enable file tracing and/or traces as callback messages
| class VideoEngine                | `vie_base.h`     | How to allocate and release resources for the VideoEngine using factory methods in the VideoEngine class. It also lists the APIs which are required to enable file tracing and/or traces as callback messages


### VoiceEngine Sub APIs

The table below summarizes the sub APIs that are currently available in VoiceEngine.

| sub-API            | Header | Description
| ------------------ | ------ | -----------
| VoEAudioProcessing | `voe_audio_processing.h` | Adds support for Noise Suppression (NS), Automatic Gain Control (AGC) and Echo Control (EC). Receiving side VAD is also included.
| VoEBase            | `voe_base.h`             | Enables full duplex VoIP using G.711. **NOTE:** This API must always be created.
| VoECallReport      | `voe_call_report.h`      | Adds support for call reports which contains number of dead-or-alive detections, RTT measurements, and Echo metrics.
| VoECodec           | `voe_codec.h`            | Adds non-default codecs (e.g. iLBC, iSAC, G.722 etc.), Voice Activity Detection (VAD) support.
| VoEDTMF            | `voe_dtmf.h`             | Adds telephone event transmission, DTMF tone generation and telephone event detection. (Telephone events include DTMF.)
| VoEEncryption      | `voe_encryption.h`       | Adds external encryption/decryption support.
| VoEErrors          | `voe_errors.h`           | Error Codes for the VoiceEngine
| VoEExternalMedia   | `voe_external_media.h`   | Adds support for external media processing and enables utilization of an external audio resource.
| VoEFile            | `voe_file.h`             | Adds file playback, file recording and file conversion functions.
| VoEHardware        | `voe_hardware.h`         | Adds sound device handling, CPU load monitoring and device information functions.
| VoENetEqStats      | `voe_neteq_stats.h`      | Adds buffer statistics functions.
| VoENetwork         | `voe_network.h`          | Adds external transport, port and address filtering, Windows QoS support and packet timeout notifications.
| VoERTP_RTCP        | `voe_rtp_rtcp.h`         | Adds support for RTCP sender reports, SSRC handling, RTP/RTCP statistics, Forward Error Correction (FEC), RTCP APP, RTP capturing and RTP keepalive.
| VoEVideoSync       | `voe_video_sync.h`       | Adds RTP header modification support, playout-delay tuning and monitoring.
| VoEVolumeControl   | `voe_volume_control.h`   | Adds speaker volume controls, microphone volume controls, mute support, and additional stereo scaling methods.


### VideoEngine Sub APIs

The table below summarizes the sub APIs that are currently available in VideoEngine.

| sub-API       | Header             | Description
| ------------- | ------------------ | --------------------
| ViEBase       | vie_base.h         | Basic functionality for creating a VideoEngine instance, channels and VoiceEngine interaction. (NOTE: This API must always be created.)
| ViECapture    | `vie_capture.h`    | Adds support for capture device allocation as well as capture device capabilities.
| ViECodec      | `vie_codec.h`      | Adds non-default codecs, codec settings and packet loss functionality.
| ViEEncryption | `vie_encryption.h` | Adds external encryption/decryption support.
| ViEErrors     | `vie_errors.h`     | Error codes for the VideoEngine
| ViEExternalCodec | `vie_external_codec.h` | Adds support for using external codecs.
| ViEFile          | `vie_file.h`           | Adds support for file recording, file playout, background images and snapshot.
| ViEImageProcess  | `vie_image_process.h`  | Adds effect filters, deflickering, denoising and color enhancement.
| ViENetwork    | `vie_network.h`    | Adds send and receive functionality, external transport, port and address filtering, Windows QoS support, packet timeout notification and changes to network settings.
| ViERender     | `vie_render.h`     | Adds rendering functionality.
| ViERTP_RTCP   | `vie_rtp_rtcp.h`   | Adds support for RTCP reports, SSRS handling RTP/RTCP statistics, NACK/FEC, keep-alive functionality and key frame request methods.

* * *

(Included HTML from GSites)

{% include webrtc-internals-home.html %}
