---
layout: default
title: Chrome
permalink: /web-apis/chrome/
---


{% include toc-hide.html %}


Both getUserMedia and RTCPeerConnection are implemented and shipping in Chrome
for Windows, Linux, Mac and Android.


### FAQ about the current implementation

### What's the status of Unified Plan SDP?

Chrome is in the process of transitioning from the old, non-standard SDP
called "plan b" to the standardized format called "Unified Plan".

Details of this transition are found in the [Unified Plan document](unified-plan).

#### What's the status of data channels?

The standards-compliant SCTP-based DataChannel implementation has been
released in Chrome 32. You do not need to specify any constraint in order to
use the SCTP-based DataChannels in Chrome.

A few specific notes on data channels:

  * In the standalone WebRTC build, DTLS must be enabled by either the
    "DtlsSrtpKeyAgreement:true" constraint or providing your own
    implementation of DTLSIdentityServiceInterface to
    PeerConnectionFactoryInterface::CreatePeerConnection.

  * You should not try to send more than 64KB at a time via the
    DataChannel.send() API. This limitation is temporary and will be removed once Chrome has incorporated the [SCTP User Message Interleaving][6] extension. Until then, you can
    work around this by breaking your data into < 64KB chunks and sending each
    chunk individually.

#### What API can I use for screensharing?

[chrome.desktopCapture.chooseDesktopMedia][1] is the API that you want to use,
and is available starting with Chrome 34. This API is currently only available
to Chrome apps/extensions, but a web page can use postMessage to communicate
with such an extension. For more information on this API, see
[this discuss-webrtc thread][2].


#### Native WebRTC Logging in Chrome

Turning on logging in Chrome in order to debug WebRTC related issues can be
very useful. It is furthermore possible to filter the log output to libjingle
and webrtc in order to reduce the noise.

When launching Chrome from the command line, here's an example for how to turn
on logging and filter it to WebRTC and libjingle:

~~~~~
chrome.exe --enable-logging --vmodule=*/webrtc/*=2,*/libjingle/*=2,*=-2 --no-sandbox
~~~~~

This example is from Windows, so please replace `chrome.exe` with the path to
the main Chrome binary on the platform you will be testing on (e.g. on Mac
this would typically be `Google\ Chrome.app/Contents/MacOS/Google\ Chrome`).
Note also that the `--no-sandbox` parameter is currently only needed on
Windows and since it turns off Chrome's security sandbox, please use only for
testing trusted code.

The logging level you can assign is the verbosity level with higher values
being more verbose. More details [here][3].

In order to actually see the logs, it's fairly simple on Mac and Linux, just
watch the output in the terminal, but on Windows, I recommend [Sawbuck][4].
Sawbuck has the nice option of being able to get stack traces for each trace,
if you have the symbols (and performance is still pretty good). Configure the
Chrome provider to "All" and uncheck "Text Only" in the "Enable Mask" column,
and hit Ctrl+E to start capturing. {% comment %}More on that [here][5].{% endcomment %}

[1]: https://developer.chrome.com/extensions/desktopCapture#method-chooseDesktopMedia
[2]: https://groups.google.com/forum/#!msg/discuss-webrtc/j6jmyBFt9QI/6cjiksWiYaEJ
[3]: https://www.chromium.org/for-testers/enable-logging
[4]: https://code.google.com/p/sawbuck/
[5]: https://wiki.corp.google.com/twiki/bin/view/Main/SawbuckProject
[6]: https://tools.ietf.org/html/rfc8260


