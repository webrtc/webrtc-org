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


## Writing or Modifying GN Targets

We provide the following [GN Templates](https://chromium.googlesource.com/chromium/src/+/master/tools/gn/docs/language.md#Templates)
to ensure that all our [targets](https://chromium.googlesource.com/chromium/src/+/master/tools/gn/docs/language.md#Targets)
are built with the same configuration:

  * `rtc_test` which replaces `test`
  * `rtc_source_set` which replaces `source_set`
  * `rtc_executable` which replaces `executable`
  * `rtc_static_library` which replaces `static_library`
  * `rtc_shared_library` which replaces `shared_library`

All templates include both [`common_config`](https://cs.chromium.org/chromium/src/third_party/webrtc/BUILD.gn)
and [`common_inherited_config`](https://cs.chromium.org/chromium/src/third_party/webrtc/BUILD.gn)
by default, and use the [`optimize_max`](https://cs.chromium.org/chromium/src/build/config/compiler/BUILD.gn)
compiler configuration in Windows instead of the default.

The `rtc_executable` template also includes [`//build/config/sanitizers:deps`](https://cs.chromium.org/chromium/src/build/config/sanitizers/BUILD.gn)
to allow compilation with sanitizers.


## Testing

Your commit will be subject to a number of automated tests that is run on
several platforms by our [continuous integration
system]({{ site.baseurl }}/testing/continuous/). Ask your developer contact
for what tests to run. When your patch is committed, the developer will get
back to you with the continuous build result.


## Code Style

We follow the [Chromium][8] style guides, with the exception that Java
follows the [Google Java Style Guide][12]. However, it is usually a
good idea to maintain consistency with nearby code, so when making
changes to old, non-compliant code it may be better to maintain its
non-compliant style&mdash;or to lead with a CL that makes the whole
chunk of non-compliant code comply with the style guide.

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

In your CL description you should always try to reference a bug using the `BUG=`
field. After the equals sign you should add a prefix followed by the bug number
in the issue tracker of your bug:

* `webrtc:` for the [WebRTC bug tracker][10], e.g. `BUG=webrtc:1234`
* `chromium:` for the [Chromium bug tracker][11], e.g. `BUG=chromium:123456`


#### Getting your CL Reviewed

The upload command will output a URL that you can use to directly access your
CL, add reviewers etc.

Add the reviewers that should review your change, including at least one of
the directory owners for each directory you modify. See the OWNERS files in
the source tree and [read more about OWNERS files][4] if needed.

A CL must be approved by a directory owner to be able to commit. To send out a
mail with the CL to everybody included you need to press
**Publish+Mail Comments**.

During the commenting process you need do **Publish+Mail Comments** again to
make the comments visible, so you can first comment all files and send it out
once. Reviewers are not notified when you upload a patch; you must again mail
them.


### Running Tryjobs

As a committer, you should run tryjobs before committing to ensure you don't
break the tree:

To run a try job on your CL, run:

~~~~~ bash
git cl try
~~~~~

The results will be presented in the code review web UI. You can also click the
"CQ dry run" link. Both these alternatives will trigger the default trybots that
are configured in [infra/config/cq.cfg][5].
To run tryjobs on a smaller set of bots; use the -b (--bot) flag:

~~~~~ bash
git cl try -b mac -b mac_rel -m tryserver.webrtc
~~~~~
You can see the available trybot names by clicking the "Choose trybots" link in
Rietveld (scroll down to `tryserver.webrtc`).


#### Tryjobs on Chromium trybots

It is also possible to send patches from a standalone WebRTC checkout to the
Chromium trybots. This makes it possible to catch breakages in the
[chromium.webrtc.fyi][6] waterfall before submit, i.e. detect errors that
otherwise would not be revealed until WebRTC is rolled in Chromium's
[DEPS file][7]!

To use this feature:

  1. Create a Rietveld CL as usual.

  2. Schedule the tryjobs using any of the following approaches:

     **Rietveld UI:**
     Click the "Choose trybots" link or add a line like this to your CL's
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

     To see available trybots, click the "Choose trybots" link in Rietveld.

  3. The trybot results will be posted back to the Reitveld UI for the CL.

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

After the review process is done and you get LGTM (Looks Good To Me) from all
reviewers you can go ahead and submit your change, assuming you're an approved
committer. If you're not a committer, you'll need to ask one of the reviewers
to submit the CL for you using the Commit Queue (CQ).

See the "Committing Code" section at the
[Development]({{ site.baseurl }}/native-code/development/) page for details on
how to commit the CL.

[1]: https://cla.developers.google.com/about/google-individual
[2]: https://cla.developers.google.com/about/google-corporate
[3]: https://codereview.webrtc.org/
[4]: http://www.chromium.org/developers/owners-files
[5]: https://chromium.googlesource.com/external/webrtc/+/master/infra/config/cq.cfg
[6]: https://build.chromium.org/p/chromium.webrtc.fyi/waterfall
[7]: https://code.google.com/p/chromium/codesearch#chromium/src/DEPS
[8]: http://www.chromium.org/developers/coding-style
[9]: https://chromium.googlesource.com/external/webrtc/+/master/AUTHORS
[10]: https://bugs.webrtc.org
[11]: https://crbug.com
[12]: https://google.github.io/styleguide/javaguide.html
