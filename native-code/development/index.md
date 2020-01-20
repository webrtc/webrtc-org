---
layout: default
title: Development
permalink: /native-code/development/
---


{% include toc-hide.html %}


The currently supported platforms are Windows, Mac OS X, Linux, Android and
iOS. See the [Android][1] and [iOS][2] pages for build instructions and
example applications specific to these mobile platforms.


### Before You Start

First, be sure to install the [prerequisite software][3].


### Getting the Code

For desktop development:

  1. Create a working directory, enter it, and run `fetch webrtc`:

     ~~~~~ bash
     mkdir webrtc-checkout
     cd webrtc-checkout
     fetch --nohooks webrtc
     gclient sync
     ~~~~~

     NOTICE: During your first sync, you'll have to accept the license
     agreement of the Google Play Services SDK.

     The checkout size is large due the use of the Chromium build toolchain and
     many dependencies. Estimated size:

      * Linux: 6.4 GB.
      * Linux (with Android): 16 GB (of which ~8 GB is Android SDK+NDK images).
      * Mac (with iOS support): 5.6GB


  2. Optionally you can specify how new branches should be tracked:

     ~~~~~ bash
     git config branch.autosetupmerge always
     git config branch.autosetuprebase always
     ~~~~~

  3. Alternatively, you can create new local branches like this (recommended):

     ~~~~~ bash
     cd src
     git checkout master
     git new-branch your-branch-name
     ~~~~~

See [Android][1] and [iOS][2] pages for separate instructions.

**NOTICE:** if you get `Remote: Daily bandwidth rate limit exceeded for <ip>`,
make sure [you're logged in][14]. The quota is much larger for logged in users.

### Updating the Code

Update your current branch with:

~~~~~ bash
git checkout master
git pull origin master
gclient sync
git checkout my-branch
git merge master
~~~~~

### Building

[Ninja][5] is the default build system for all platforms.

See [Android][1] and [iOS][2] for build instructions specific to those
platforms.


#### Generating Ninja project files

[Ninja][5] project files are generated using [GN][12]. They're put in a
directory of your choice, like `out/Debug` or `out/Release`, but you can
use any directory for keeping multiple configurations handy.

To generate project files using the defaults (Debug build), run (standing in
the src/ directory of your checkout):

~~~~~ bash
gn gen out/Default
~~~~~

To generate ninja project files for a Release build instead:

~~~~~ bash
gn gen out/Default --args='is_debug=false'
~~~~~

To clean all build artifacts in a directory but leave the current GN
configuration untouched (stored in the args.gn file), do:

~~~~~ bash
gn clean out/Default
~~~~~

See the [GN][12] documentation for all available options. There are also more
platform specific tips on the [Android][1] and [iOS][2] pages.

#### Compiling

When you have Ninja project files generated (see previous section), compile
(standing in `src/`) using:

For [Ninja][5] project files generated in `out/Default`:

~~~~~ bash
ninja -C out/Default
~~~~~


#### Using Another Build System

Other build systems are **not supported** (and may fail), such as Visual
Studio on Windows or Xcode on OSX. GN supports a hybrid approach of using
[Ninja][5] for building, but Visual Studio/Xcode for editing and driving
compilation.

To generate IDE project files, pass the `--ide` flag to the [GN][12] command.
See the [GN reference][13] for more details on the supported IDEs.


### Working with Release Branches

To see available release branches, run:

~~~~~ bash
git branch -r
~~~~~

To create a local branch tracking a remote release branch (in this example,
the branch corresponding to Chrome M80):

~~~~~ bash
git checkout -b my_branch refs/remotes/branch-heads/3987
gclient sync
~~~~~

**NOTICE**: depot_tools are not tracked with your checkout, so it's possible gclient
sync will break on sufficiently old branches. In that case, you can try using
an older depot_tools:

~~~~~ bash
which gclient
# cd to depot_tools dir
# edit update_depot_tools; add an exit command at the top of the file
git log  # find a hash close to the date when the branch happened
git checkout <hash>
cd ~/dev/webrtc/src
gclient sync
# When done, go back to depot_tools, git reset --hard, run gclient again and
# verify the current branch becomes REMOTE:origin/master
~~~~~

The above is untested and unsupported, but it might help.

Commit log for the branch:
<https://webrtc.googlesource.com/src/+log/branch-heads/3987>

To browse it:
<https://webrtc.googlesource.com/src/+/branch-heads/3987>

For more details, read Chromium's [Working with Branches][6] and
[Working with Release Branches][7] pages. To find the branch corresponding
to a Chrome release check the [Chromium Dashboard][https://chromiumdash.appspot.com/branches].


### Contributing Patches

Please see [Contributing Fixes][8] for information on how to run
`git cl upload`, getting your patch reviewed, and getting it submitted.

This also includes information on how to run tryjobs, if you're a committer.

#### Chromium Committers

Many WebRTC committers are also Chromium committers. To make sure to use the
right account for pushing commits to WebRTC, use the `user.email` Git config
setting. The recommended way is to have the chromium.org account set globally
as described at the [depot tools setup page][9] and then set `user.email`
locally for the WebRTC repos using (change to your webrtc.org address):

~~~~~ bash
cd /path/to/webrtc/src
git config user.email yourname@webrtc.org
~~~~~


### Example Applications

WebRTC contains several example applications, which can be found under
`src/webrtc/examples` and `src/talk/examples`. Higher level applications are
listed first.


#### Peerconnection

Peerconnection consist of two applications using the [WebRTC Native APIs][10]:

  * A server application, with target name `peerconnection_server`

  * A client application, with target name `peerconnection_client` (not
    currently supported on Mac/Android)

The client application has simple voice and video capabilities. The server
enables client applications to initiate a call between clients by managing
signaling messages generated by the clients.


##### Setting up P2P calls between peerconnection_clients

Start `peerconnection_server`. You should see the following message indicating
that it is running:

~~~~~ bash
Server listening on port 8888
~~~~~

Start any number of `peerconnection_clients` and connect them to the server.
The client UI consists of a few parts:

**Connecting to a server:** When the application is started you must specify
which machine (by IP address) the server application is running on. Once that
is done you can press **Connect** or the return button.

**Select a peer:** Once successfully connected to a server, you can connect to
a peer by double-clicking or select+press return on a peer's name.

**Video chat:** When a peer has been successfully connected to, a video chat
will be displayed in full window.

**Ending chat session:** Press **Esc**. You will now be back to selecting a
peer.

**Ending connection:** Press **Esc** and you will now be able to select which
server to connect to.


##### Testing peerconnection_server

Start an instance of `peerconnection_server` application.

Open `src/webrtc/examples/peerconnection/server/server_test.html` in your
browser. Click **Connect**. Observe that the `peerconnection_server` announces
your connection. Open one more tab using the same page. Connect it too (with a
different name). It is now possible to exchange messages between the connected
peers.


#### Call App

Target name `call` (currently disabled). An application that establishes a
call using libjingle. Call uses xmpp (as opposed to SDP used by WebRTC) to
allow you to login using your gmail account and make audio/video calls with
your gmail friends. It is built on top of libjingle to provide this
functionality.

Further, you can specify input and output RTP dump for voice and video. It
provides two samples of input RTP dump: `voice.rtpdump` which contains a
stream of single channel, 16Khz voice encoded with G722, and `video.rtpdump`
which contains a 320x240 video encoded with H264 AVC at 30 frames per second.
The provided samples will interoperate with Google Talk Video. If you use
other input RTP dump, you may need to change the codecs in `call_main.cc`
(lines 215-222).


#### Relay Server

Target name `relayserver`. Relays traffic when a direct peer-to-peer
connection can't be established. Can be used with the call application above.


#### STUN Server

Target name `stunserver`. Implements the STUN protocol for Session Traversal
Utilities for NAT as documented in [RFC 5389].


#### TURN Server

Target name `turnserver`. Used for unit tests.


[1]: {{ site.baseurl }}/native-code/android/
[2]: {{ site.baseurl }}/native-code/ios/
[3]: {{ site.baseurl }}/native-code/development/prerequisite-sw/
[5]: https://ninja-build.org/
[6]: https://www.chromium.org/developers/how-tos/get-the-code/working-with-branches
[7]: https://www.chromium.org/developers/how-tos/get-the-code/working-with-release-branches
[8]: {{ site.baseurl }}/contributing/
[9]: http://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools_tutorial.html#_setting_up
[10]: {{ site.baseurl }}/native-code/native-apis/
[12]: https://gn.googlesource.com/gn/+/master/README.md
[13]: https://gn.googlesource.com/gn/+/master/docs/reference.md#IDE-options
[RFC 5389]: https://tools.ietf.org/html/rfc5389
[RFC 5766]: https://tools.ietf.org/html/rfc5766
[14]: https://webrtc.org/native-code/development/#contributing-your-first-patch
