---
layout: default
title: WebRTC Reference Apps
permalink: /reference-apps/
---


{% include toc-hide.html %}


### AppRTC

[apprtc.appspot.com](https://apprtc.appspot.com/) is a webrtc demo application
hosted on App Engine.

Developed by Google and Mozilla, it enables both browsers to "talk" to each
other using the WebRTC API.

<div class="embed-responsive embed-responsive-16by9 yt-embed">
  <iframe width="560" height="315" src="//www.youtube.com/embed/MsAWR_rJ5n8" frameborder="0" allowfullscreen></iframe>
</div>

To try this yourself you’ll need
[Firefox Nightly](https://nightly.mozilla.org/), and
[Chrome](https://www.google.com/intl/en/chrome/browser/) on desktop or
[Chrome Beta on Android](https://play-next-dogfood.corp.google.com/store/apps/details?id=com.chrome.beta).

The source code can be found here:
<https://github.com/GoogleChrome/webrtc/tree/master/samples/web/content/apprtc>.

Interop between both browsers is a snap thanks to a Javascript adapter
library. Source code can be found here:
<https://github.com/GoogleChrome/webrtc/blob/master/samples/web/js/adapter.js>

To read more about cross browser compatibility, please consult our
[browser interop page]({{ site.baseurl }}/web-apis/interop/).


### Other

Other apps and samples maintained by the Chrome team can be found here:
<https://github.com/GoogleChrome/webrtc>/