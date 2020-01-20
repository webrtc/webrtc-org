---
layout: default
title: Getting Started
permalink: /start/
---

{% include toc-hide.html %}

New to WebRTC?

Here are some suggestions to help you get started:

1. Get an overview of WebRTC: [video](https://youtube.com/watch?v=p2HzZkd2A40), [slides](http://io13webrtc.appspot.com/).
2. Find out more about WebRTC architecture and JavaScript APIs: [Getting Started With WebRTC](http://html5rocks.com/en/tutorials/webrtc/basics/).
3. Try out our [code samples](https://github.com/webrtc/samples) and [live demos](https://webrtc.github.io/samples).
4. Try our [codelab](https://codelabs.developers.google.com/codelabs/webrtc-web/#0).
5. Read through the code for the canonical video chat app [appr.tc](https://appr.tc). The repo is at [github.com/webrtc/apprtc](http://github.com/webrtc/apprtc).
6. For iOS, Android or the C++ WebRTC APIs, take a look at the Native APIs resources below.
7. Ask general questions on [Stack Overflow](https://stackoverflow.com/tags/webrtc), deeper technical WebRTC questions on [discuss-webrtc](http://groups.google.com/forum/?fromgroups#!forum/discuss-webrtc).

More resources below.

**Contributions and updates welcome.**

<br>

### Overview presentations
* 2013 Google I/O presentation: [video](https://youtube.com/watch?v=p2HzZkd2A40), [slides](http://io13webrtc.appspot.com/)
* [Video chat for Web, Android and iOS](https://docs.google.com/presentation/d/1CjuTaY2J9P5xrFDtRCh6VmS7Iw2UBbm-JEwzCHQCYkE)
* [What’s next for WebRTC?](https://www.youtube.com/watch?v=HCE3S1E5UwY)

### Demos and samples
* WebRTC JavaScript code samples: [github.com/webrtc/samples](http://github.com/webrtc/samples)
* Live demos of the samples: [webrtc.github.io/samples](http://webrtc.github.io/samples)
* [List of WebRTC demos and apps](https://docs.google.com/document/d/1hNK15_cNx3CpYsro2TKwEbdFxLv5WFe8djGHdFeZBks) (incomplete and slightly out of date)
* WebRTC video chat: [appr.tc](https://www.appr.tc) (source code at [github.com/webrtc/apprtc](http://github.com/webrtc/apprtc))
* Simple getUserMedia demo: [simpl.info/gum](https://simpl.info/gum)
* RTCPeerConnection 'on one page', i.e. without signalling: [simpl.info/pc](https://www.simpl.info/rtcpeerconnection)
* Simple RTCDataChannel example: [simpl.info/rtcdatachannel](https://simpl.info/rtcdatachannel)
* Data channel file transfer: [webrtc.github.io/samples/src/content/datachannel/filetransfer](http://webrtc.github.io/samples/src/content/datachannel/filetransfer)
* RTCPeerConnection signaling example: [w3.org/TR/webrtc/#simple-example](http://w3.org/TR/webrtc/#simple-example)
* Constraints: [simpl.info/getusermedia/constraints](https://simpl.info/getusermedia/constraints/)
* [Screen capture](https://html5-demos.appspot.com/static/getusermedia/screenshare.html)
* Muaz Khan maintains a mighty assortment of experiments at [webrtc-experiment.com](https://www.webrtc-experiment.com).

### Tutorials
* Getting Started With WebRTC: [html5rocks.com/en/tutorials/webrtc/basics](http://html5rocks.com/en/tutorials/webrtc/basics/)
* [WebRTC in the real world: STUN, TURN and signaling](http://html5rocks.com/en/tutorials/webrtc/infrastructure/)
* [A practical guide to WebRTC](https://slideshare.net/vline/a-practical): presentation slides from vLine
* Capturing audio and video in HTML5: [html5rocks.com/en/tutorials/getusermedia/intro](http://html5rocks.com/en/tutorials/getusermedia/intro)
* Excellent series of articles by Louis Stowasser and Robert Nyman: [hacks.mozilla.org/category/webrtc](https://hacks.mozilla.org/category/webrtc/)
* Justin Uberti at Google I/O 2012: [youtu.be/E8C8ouiXHHk](https://youtube.com/watch?v=E8C8ouiXHHk)
* [WebRTC Fundamentals](https://www.pluralsight.com/courses/webrtc-fundamentals): online course
* [Build a simple 1-to-1 video chat with WebRTC and Firebase](https://websitebeaver.com/insanely-simple-webrtc-video-chat-using-firebase-with-codepen-demo) (perfect for beginners)

### Codelabs
* Walkthrough and code for setting up a server and client for video chat: [bitbucket.org/webrtc/codelab](https://bitbucket.org/webrtc/codelab)
* [Google I/O 2014 file sharing codelab](http://io2014codelabs.appspot.com/static/codelabs/webrtc-file-sharing/#1)

### Books
* [webrtcbook.com](http://webrtcbook.com)
* [Getting Started with WebRTC](https://packtpub.com/getting-started-with-webrtc/book)
* [Real-Time Communication with WebRTC](http://bloggeek.me/book-webrtc-salvatore-simon/)

### Developer tools and resources
* [adapter.js](https://github.com/webrtc/adapter): shim maintained by Google to cope with API changes and platform differences
* [WebRTC Troubleshooter](https://test.webrtc.org/), code and documentation at [github.com/webrtc/testrtc](https://github.com/webrtc/testrtc)
* Stats and information for current RTCPeerConnection session: chrome://webrtc-internals
* [getUserMedia.js](https://github.com/addyosmani/getUserMedia.js): polyfill from Addy Osmani
* Chrome–Firefox: [interop notes](https://webrtc.org/web-apis/interop/)
* File bugs at [new.crbug.com](https://crbug.com/new)
* KITE, a test engine designed to test WebRTC interoperability across browsers [https://github.com/webrtc/KITE](https://github.com/webrtc/KITE)

### Standards and protocols
* [Web Real-Time Communications Working Group](https://w3.org/2011/04/webrtc/)
* [W3C Working Draft: WebRTC 1.0: Real-time Communication Between Browsers](https://w3.org/TR/webrtc/)
* [Media Capture and Streams W3C Working Draft](https://w3.org/TR/mediacapture-streams/)
* [IETF RTCWEB](http://datatracker.ietf.org/wg/rtcweb/): protocol specifications

### Native APIs
* [Build scripts from pristineio](https://github.com/pristineio/webrtc-build-scripts): repo with links to how-to guides for Android and iOS
* [Native API documentation](https://webrtc.org/native-code/)
* [WebRTC shim for WKWebView](https://github.com/common-tater/wkwebview-webrtc-shim)

### Discussion, blogs and articles
* [discuss-webrtc ](http://groups.google.com/forum/?fromgroups#!forum/discuss-webrtc)
* [@webrtc](http://twitter.com/webrtc)
* [WebRTC on Stack Overflow](http://stackoverflow.com/tags/webrtc)
* [Tsahi Levent-Levi](https://bloggeek.me/)
* [WebRTC Weekly](https://webrtcweekly.com/)
* [webrtcHacks](https://webrtchacks.com/)

### Browser support
* [iswebrtcreadyyet.com](http://iswebrtcreadyyet.com/)

### JavaScript apps and frameworks
* Comprehensive list in the [webrtcHacks article about JavaScript libraries](https://webrtchacks.com/whats-in-a-webrtc-javascript-library/).

#### Video chat
* [Whereby (formerly appear.in)](https://whereby.com/)
* [SimpleWebRTC](https://github.com/henrikjoreteg/SimpleWebRTC)
* [easyRTC](https://github.com/priologic/easyrtc)
* [LyteSpark](http://lytespark.com)

#### Peer-to-peer data
* [PeerJS](http://peerjs.com/): data channel abstraction
* [Sharefest](https://github.com/peer5/sharefest): share files via data channels
* [Peer5 Downloader](https://www.peer5.com): P2P file download
* [ShareDrop](https://github.com/cowbell/sharedrop): file sharing between devices on the same network

#### VoIP/PSTN
* Open source JavaScript phone API: [Phono](http://phono.com/)
* Open source JavaScript SIP client: [sipML5](https://code.google.com/p/sipml5/)
* Open source JavaScript SIP library: [JsSIP](http://jssip.net/)
* Open source SIP proxy with WebSocket and SRTP support: [Kamailio](https://kamailio.org/w/)
* [FreeSWITCH](https://freeswitch.org/)

#### Face/head tracking
* [clmtrackr](https://github.com/auduno/clmtrackr)
* [headtrackr](https://github.com/auduno/headtrackr/) ([demo](http://simpl.info/headtrackr/))

#### Node
* [rtc.io](http://rtc.io)

### Services
* [OpenTok](https://tokbox.com/) (acquired by Telefonica Digital)
* [vLine](https://vline.com/)
* [WebRTC Developer Tool Vendor Directory](https://webrtchacks.com/vendor-directory/)


### Applications

#### getUserMedia
* ASCII: [idevelop.github.com/ascii-camera](http://idevelop.github.com/ascii-camera)
* Movement tracking slide page controller: [lli.web.fh-koeln.de/mocowe](http://lli.web.fh-koeln.de/mocowe)
* Xylophone: [soundstep.com/blog/experiments/jsdetection](http://soundstep.com/blog/experiments/jsdetection)
* Photobooth with filters: [webcamtoy.com](http://webcamtoy.com)
* SVG filters: [rawgithub.com/SenorBlanco/moggy/master/filterbooth.html](https://rawgithub.com/SenorBlanco/moggy/master/filterbooth.html)
* Face masking with WebGL:[www.auduno.com/clmtrackr/examples/face_mask.html](https://www.auduno.com/clmtrackr/examples/face_mask.html)
* Face deformation with WebGL: [auduno.github.io/clmtrackr/examples/facedeform.html](http://auduno.github.io/clmtrackr/examples/facedeform.html)
* Augmented Reality Photobooth: [picshare.jooink.com](https://picshare.jooink.com/)

#### Screen capture
* [Screen recording app](https://github.com/niklasenbom/RecordingApp)

#### Web Audio integration
* Music production: [soundtrap.com](http://soundtrap.com)
* Chris Wilson’s input demos at [webaudiodemos.appspot.com](http://webaudiodemos.appspot.com)
* RTCPeerConnection integration: [simpl.info/webrtcwebaudio](http://simpl.info/webrtcwebaudio)
* [cabbibo.github.io/holly](http://cabbibo.github.io/holly/)

#### Recording
* Record audio and video with the MediaRecorder API: [simpl.info/mr](https://simpl.info/mr)
* [Voice Memos app](https://github.com/GoogleChrome/voice-memos)
* Record and download without MediaRecorder: [webaudiodemos.appspot.com/AudioRecorder](http://webaudiodemos.appspot.com/AudioRecorder/index.html)
* [RecordRTC](https://github.com/muaz-khan/WebRTC-Experiment/tree/master/RecordRTC)

#### Chat
* [talky.io](http://talky.io)
* [appear.in](http://appear.in)
* [tawk.com](http://tawk.com)
* [Twelephone](http://twelephone.com/): chat with Twitter contacts
* [browsermeeting.com](http://browsermeeting.com/)
* [codassium.com](http://codassium.com/): job interview tool with live coding
* [vmux.co](http://vmux.co)
* [voxeet.com](https://voxeet.com/): high quality audio

#### Games
* [Who Am I?](https://www.designweek.co.uk/issues/may-2012/magneticnorth-creates-who-am-i-game-for-google/) (second ever WebRTC game, no longer online)
* WebRTC + Web Audio + WebGL: [Cube Slam](http://cubeslam.com)
* Face tracking: [shinydemos.com/facekat](https://shinydemos.com/facekat/)
* RTCDataChannel + WebGL: [BananaBread](https://hacks.mozilla.org/2013/03/webrtc-data-channels-for-great-multiplayer/)

#### Telehealth
* [Regional Cystic Fibrosis Program](https://pulseitmagazine.com.au/index.php?option=com_content&view=article&id=1382:cystic-fibrosis-project-to-trial-webrtc-home-monitoring-and-shared-ehr&catid=16:australian-ehealth&Itemid=327)
* [consultdirect.com.au](http://consultdirect.com.au/)

#### File sharing and P2P
* [Sharefest](http://sharefest.me): share file by uploading and sharing link
* [peerCDN](https://peercdn.com/): P2P CDN
* [WebTorrent:](http://webtorrent.io) BitTorrent over WebRTC
* [peer5.com](https://peer5.com): add P2P file download to your web page

#### Other
* [Internet-less WebRTC](https://plus.google.com/115686393595662427054/posts/WEmRsCfuCEb)
* [Video call between Qt app and web app](http://research.edm.uhasselt.be/~jori/page/index.php?n=Misc.QtWebRTC)

#### Alternatives: for IE and Safari
* [Temasys plugin](https://temasys.atlassian.net/wiki/display/TWPP/WebRTC+Plugins)
