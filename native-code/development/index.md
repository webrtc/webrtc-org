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

  1. If you're on Linux and have OpenJDK 7 installed in another location than
     Ubuntu's default:

     ~~~~~ bash
     export JAVA_HOME=<location of OpenJDK 7>
     ~~~~~

  2. On Windows: launch a command prompt as Administrator.

  3. Create a working directory, enter it, and run `fetch webrtc`:

     ~~~~~ bash
     mkdir webrtc-checkout
     cd webrtc-checkout
     fetch webrtc
     ~~~~~

     This will **take a long time** because it downloads the whole Chromium
     repository and dependencies, which are several gigabytes. **Do not**
     interrupt this step or you may need to start all over agan (a new
     `gclient sync` may be enough, but you might also need to start over
     cleanly).

  4. Optionally you can specify how new branches should be tracked:

     ~~~~~ bash
     git config branch.autosetupmerge always
     git config branch.autosetuprebase always
     ~~~~~

  5. Alternatively, you can create new local branches like this (recommended):

     ~~~~~ bash
     cd src
     git checkout master
     git new-branch your-branch-name
     ~~~~~

See [Android][1] and [iOS][2] pages for separate instructions.



### Updating the Code

Update your current branch with:

~~~~~ bash
git pull
~~~~~

**Notice:** if you're not on a branch, `git pull` won't work, and you'll need
to use `git fetch` instead.

Peridically, the build toolchain and dependencies of WebRTC are updated. To
get such updates you must run:

~~~~~ bash
gclient sync
~~~~~

In addition to downloading dependencies this also generates native build files
for your environment using [GYP][4] during the execution of the hooks in the
[DEPS][5] file (which can also be run separately using `gclient runhooks`).

[Ninja][6] is the default build system for all platforms. It is possible to
just generate new build files by calling:

~~~~~ bash
python webrtc/build/gyp_webrtc
~~~~~

This also runs as a part of the `gclient runhooks` step.


### Building

Binaries are by default (i.e. when building with ninja) generated in
`out/Debug` and `out/Release` for debug and release builds respectively. See
[Android][1] and [iOS][2] for build instructions specific to those platforms.


#### With Ninja

Ninja project files are normally generated during the
`gclient sync</runhooks>` step. If you need to re-generate only the ninja
files (like if you've wiped your out folder), run:

~~~~~ bash
python webrtc/build/gyp_webrtc
~~~~~

Then compile with (standing in `src/`):

Debug:

~~~~~ bash
ninja -C out/Debug
~~~~~

Release:

~~~~~ bash
ninja -C out/Release
~~~~~


#### Using Another Build System

Other build systems are **not fully supported** (and may fail), such as Visual
Studio on Win or Xcode on OSX. GYP supports a hybrid approach of using ninja
for building, but VS/Xcode for editing and driving compilation. Set the
`GYP_GENERATORS` environment variable to the string:

  * `ninja,msvs-ninja` for Visual Studio project building with ninja

  * `ninja,xcode-ninja` for Xcode

Note, when the build environment is set to generate Visual Studio project
files, GYP will by default generate a project for the latest version of
Visual Studio installed on your computer. It is possible to specify the
desired Visual Studio version as described below:

Set environment variable `GYP_MSVS_VERSION=<version>` before `runhooks`, or
manually run the following gyp command from the `src/` directory (this
replaces `gclient runhooks`):

~~~~~ bash
python webrtc/build/gyp_webrtc -G msvs_version=<version>
~~~~~

Where `<version>` is on the form YYYY. And Chromium requests VS2013 for now.

Then use Visual Studio to open and build the `src/all.sln` solution file.

Please refer to <http://www.chromium.org> for more details.


### Working with Release Branches

To see available release branches, run:

~~~~~ bash
git branch -r
~~~~~

**Notice:** If you only see your local branches, you have a checkout created
before our switch to Git (March 24, 2015). In that case, first run:

~~~~~ bash
cd /path/to/webrtc/src
gclient sync --with_branch_heads
git fetch origin
~~~~~

You should now have an entry like this under [remote "origin"] in
`.git/config`:

~~~~~ bash
fetch = +refs/branch-heads/*:refs/remotes/branch-heads/*
~~~~~

To create a local branch tracking a remote release branch (in this example,
the 43 branch):

~~~~~ bash
git checkout -b my_branch branch-heads/43
~~~~~

Commit log for the branch:
<https://chromium.googlesource.com/external/webrtc/+log/branch-heads/43>

To browse it:
<https://chromium.googlesource.com/external/webrtc/+/branch-heads/43>

For more details, read Chromium's [Working with Branches][7] and
[Working with Release Branches][8] pages.


### Contributing Patches

Please see [Contributing Fixes][9] for information on how to get your changes
included in the WebRTC codebase. You'll also need to setup authentication for
committing, below.


### Committing Code

To commit code you have to be a committer.

From March 24, 2015, the source of truth is the Git repository at
<https://chromium.googlesource.com/external/webrtc>. To be able to push
commits to it, you need to perform the steps below.

If you already have a `.netrc` / `.gitcookies` file (most Chromium committers
already do), you can skip steps 1 and 2.

  1. Go to <https://chromium.googlesource.com/new-password> and login with
     your webrtc.org account.

  2. Follow the instructions on how to store the credentials in the
     `.gitcookies` file in your home directory.

  3. Go to <https://chromium-review.googlesource.com> and login with your
     webrtc.org account. This will create the user in the Gerrit permission
     system so it can be added to the right committers group.

  4. Make sure you have set the `user.name` and `user.email` Git config
     settings as specified at the [depot tools setup page][10]. If you're also
     a Chromium committer, read the next section.

Commit a change list to the Git repo using:

~~~~~ bash
git cl land
~~~~~

**Notice:** On Windows, you'll need to run this in a Git bash shell in order
for gclient to find the `.gitcookies` file.

Sometimes it's necessary to bypass the presubmit checks (like when fixing an
error that has closed the tree). Then use the `--bypass-hooks` flag.


#### Chromium Committers

Many WebRTC committers are also Chromium committers. To make sure to use the
right account for pushing commits to WebRTC, use the `user.email` Git config
setting. The recommended way is to have the chromium.org account set globally
as described at the [depot tools setup page][10] and then set `user.email`
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

Peerconnection consist of two applications using the [WebRTC Native APIs][11]:

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

Open `src/talk/examples/peerconnection/server/server_test.html` in your
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
Utilities for NAT as documented in RFC5389.


#### TURN Server

Target name `turnserver`. In active development to reach compatibility with
RFC5766.


[1]: {{ site.baseurl }}/native-code/android/
[2]: {{ site.baseurl }}/native-code/ios/
[3]: {{ site.baseurl }}/native-code/development/prerequisite-sw/
[4]: https://gyp.gsrc.io/
[5]: https://chromium.googlesource.com/external/webrtc/+/master/DEPS
[6]: https://chromium.googlesource.com/chromium/src/+/master/docs/ninja_build.md
[7]: https://www.chromium.org/developers/how-tos/get-the-code/working-with-branches
[8]: https://www.chromium.org/developers/how-tos/get-the-code/working-with-release-branches
[9]: {{ site.baseurl }}/contributing/
[10]: http://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools_tutorial.html#_setting_up
[11]: {{ site.baseurl }}/native-code/native-apis/
