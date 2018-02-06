---
layout: default
title: Contributing Fixes
permalink: /contributing/
crumb: Contributing Fixes
---


{% include toc-hide.html %}


The project is open for external contributions ... and we welcome them!

While we are only accepting bug fixes for the moment we will be opening it up
more broadly soon. We are taking it step by step.

When you start working on this project you will be a "project contributor",
which does not give you the right to commit code directly, but you will be
able to upload patches for review. The patches will be submitted for you after
approval.

After 10-20 non-trivial patches you can apply for commit rights. We will start
the external contributions at a small scale, so please ask for access only
when you have found a bug and have implemented a fix for it.

## Code of conduct

Google and the WebRTC team are committed to preserving and fostering a diverse, welcoming and open
community.
To make sure we preserve this, we have adopted a [Code of conduct](https://webrtc.googlesource.com/src/+/master/CODE_OF_CONDUCT.md).

## How to Create a Patch

These instructions assume you already have followed the [getting started guide]({{ site.baseurl }}/native-code/development/) and can build the WebRTC code. The work flow is:

  1. Make sure you accept and fill out the contributor agreement

  2. Edit the code and collect your changes in a change list (CL)

  3. If you've never submitted code before, you must add your (or your
     organization's in the case the contributor agreement is signed by your
     organization) name and contact info to the [AUTHORS][9] file

  4. Upload the CL for review and add suitable reviewers.

  5. After getting feedback, modify and upload new version of your CL (repeat
     as needed).

  6. Commit your change, or ask a reviewer to do it for you if you don't have
     access right.


Please help us:

  * Remember to keep your change lists small and focused.

  * Never fix more than one bug in each CL.

  * New features will probably require dividing your work into multiple CLs.
    (No new features just yet!)


## Testing

Your commit will be subject to a number of automated tests that is run on
several platforms by our [continuous integration
system]({{ site.baseurl }}/testing/continuous/). Ask your developer contact
for what tests to run. When your patch is committed, the developer will get
back to you with the continuous build result.


## Code Style

See the [coding style guide in the WebRTC tree][webrtc-coding-style].

[webrtc-coding-style]: https://webrtc.googlesource.com/src/+/HEAD/style-guide.md

To format the code in a CL, you can use `git cl format`.
To manually run the C++ lint checker, use `cpplint.py`.


## Contributor Agreement

To contribute code, you will need to fill in one of the following required
contributor agreements

  * [Individual Contributors License][1]
  * [Corporate Contributors License][2]

Also, please re-read our project's
[license]({{ site.baseurl}}/license/software/) and
[patent grant]({{ site.baseurl }}/license/additional-ip-grant/).


## Detailed Instructions


### Creating your CL

To create a CL after you've done some edits (in a local Git branch):

~~~~~ bash
git cl upload
~~~~~

This will open a text editor showing all local commit messages, allowing you
to modify it before it becomes the CL description. Save and close the file to
proceed with the upload to the WebRTC [code review server][3].


#### Referencing bugs

In your CL description you should always try to reference a bug using the
`Bug: ` field. After the equals sign you should add a prefix followed by the bug
number in the issue tracker of your bug:

* `webrtc:` for the [WebRTC bug tracker][10], e.g. `Bug: webrtc:1234`
* `chromium:` for the [Chromium bug tracker][11], e.g. `Bug: chromium:123456`


#### Getting your CL Reviewed

The upload command will output a URL that you can use to directly access your
CL, add reviewers etc.

Add the reviewers that should review your change, including at least one of
the directory owners for each directory you modify. See the OWNERS files in
the source tree and [read more about OWNERS files][4] if needed.

A CL must be approved by a directory owner to be able to commit. To send out a
mail with the CL to everybody included you need to press **Start review**.

During the commenting process you need to **Reply** to make the comments
visible, so you can first comment all files and send it out once. Reviewers are
not notified when you upload a patch; you must again mail them.


### Running Tryjobs

As a committer, you should run tryjobs before committing to ensure you don't
break the tree:

To run a try job on your CL, run:

~~~~~ bash
git cl try
~~~~~

The results will be presented in the code review web UI. You can also click the
"CQ Dry run" button. Both these alternatives will trigger the default trybots
that are configured in [infra/config/cq.cfg][5].
To run tryjobs on a smaller set of bots; use the -b (--bot) flag:

~~~~~ bash
git cl try -b mac -b mac_rel -m tryserver.webrtc
~~~~~
You can see the available trybot names by clicking the "Choose try jobs" link in
Gerrit (scroll down to `tryserver.webrtc`).


#### Tryjobs on Chromium trybots

It is also possible to send patches from a standalone WebRTC checkout to the
Chromium trybots. This makes it possible to catch breakages in the
[chromium.webrtc.fyi][6] waterfall before submit, i.e. detect errors that
otherwise would not be revealed until WebRTC is rolled in Chromium's
[DEPS file][7]!

To use this feature:

  1. Create a Gerrit CL as usual.

  2. Schedule the tryjobs using any of the following approaches:

     **Gerrit UI:**
     Click the "Choose try jobs" link or add a line like this to your CL's
     description:

     ~~~~~ bash
     CQ_INCLUDE_TRYBOTS=master.tryserver.chromium.linux:bot1,bot2;master.tryserver.chromium.mac:bot3
     ~~~~~

     Adjust it to your needs but make sure to follow the format convention:
     semicolon between try servers and comma-separated bot names.
     Then send it to CQ (or CQ dry run).

     **Command line:**

     ~~~~~ bash
     git cl try -m tryserver.chromium.{linux,mac,win,android} -b <bot>
     ~~~~~

     To see available trybots, click the "Choose try jobs" link in Gerrit.

  3. The trybot results will be posted back to the Gerrit UI for the CL.

Example preset selection of bots (notice this may quickly become outdated):

~~~~~ bash
git cl try -m tryserver.chromium.win -b win_chromium_rel_ng
git cl try -m tryserver.chromium.android -b android_compile_dbg -b linux_android_rel_ng
git cl try -m tryserver.chromium.linux -b linux_chromium_rel_ng
git cl try -m tryserver.chromium.mac -b mac_chromium_rel_ng -b ios-device
~~~~~

##### Note about which tests are run
Our bots in the [chromium.webrtc.fyi][6] waterfall runs special video and audio
quality tests + webcam tests that are not run on Chromium trybots. This is
useful to know since there may still be a breakage at those bots even if your CL
passes the Chromium trybots.

##### Note about the "without patch" feature of Chromium trybots
Chromium trybots have a feature where they deapply the patch upon a compile or
test failure. Doing this, it will restore the revision of
`src/third_party/webrtc` to HEAD revision (i.e. not the DEPS-pinned revision).
This makes it possible that a test still fails without the patch in case there's
currently an error for the HEAD revision of WebRTC when built inside Chromium.


## Committing your CL

After the review process is done and you get CR+1 (Code-Review +1) from all
reviewers you can go ahead and submit your change, assuming you're an approved
committer.

See the "Committing Code" section at the
[Development]({{ site.baseurl }}/native-code/development/) page for details on
how to commit the CL.

[1]: https://cla.developers.google.com/about/google-individual
[2]: https://cla.developers.google.com/about/google-corporate
[3]: https://webrtc-review.googlesource.com/
[4]: http://www.chromium.org/developers/owners-files
[5]: https://webrtc.googlesource.com/src/+/master/infra/config/cq.cfg
[6]: https://build.chromium.org/p/chromium.webrtc.fyi/waterfall
[7]: https://code.google.com/p/chromium/codesearch#chromium/src/DEPS
[9]: https://webrtc.googlesource.com/src/+/master/AUTHORS
[10]: https://bugs.webrtc.org
[11]: https://crbug.com
