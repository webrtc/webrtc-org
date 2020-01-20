---
layout: default
title: Contributing Fixes
permalink: /contributing/
crumb: Contributing Fixes
---


{% include toc-hide.html %}

The project is open for external contributions ... and we welcome them!

## Code of conduct

Google and the WebRTC team are committed to preserving and fostering a diverse, welcoming and open
community.
To make sure we preserve this, we have adopted a [code of conduct](https://webrtc.googlesource.com/src/+/master/CODE_OF_CONDUCT.md).

## Contributing your First Patch

You must do some preparation in order to upload your first CL:

  1. [Check out and build the code][12]

  2. Fill in the [contributor agreement](#contributor-agreement).

  3. If you've never submitted code before, you must add your (or your
     organization's in the case the contributor agreement is signed by your
     organization) name and contact info to the [AUTHORS][9] file.

  4. Go to <https://webrtc.googlesource.com/new-password> and login with
     your email account. *This should be the same account as is returned by*
     `git config user.email`.

  5. Follow the instructions on how to store the credentials in the
     `.gitcookies` file in your home directory.

  6. Go to <https://webrtc-review.googlesource.com> and login with your
     email account.

  7. Then, run:
     ~~~~~ bash
     git cl creds-check
     ~~~~~
     If you get any errors, ask for help on [discuss-webrtc][15].

You will not have to repeat the above. After all that, you're ready to upload:

## Uploading your First Patch

Now that you have your account set up, you can do the actual upload:

  1. Do this:
     ~~~~~ bash
     # Assuming you're on the master branch:
     git checkout -b my-work-branch
     # Make changes, build locally, run tests locally
     git commit -am "Changed x, and it is working"
     git cl upload
     ~~~~~
     This will open a text editor showing all local commit messages, allowing you
     to modify it before it becomes the CL description.

     Fill out the bug entry properly. Please specify the issue tracker prefix and
     the issue number, separated by a colon, e.g. webrtc:123 or chromium:12345.
     If you do not have an issue tracker prefix and an issue number just add
     `None`.

     Save and close the file to proceed with the upload to the WebRTC [code review server][3].

     The command will print a link like <https://webrtc-review.googlesource.com/c/src/+/53121>
     if everything goes well.

  2. Click the CL link.

  3. If you're not signed in, click the Sign In button in the top right and sign
  in with your email.

  4. Click Start Review and add a reviewer. See
  [Getting your CL Reviewed](#getting-your-cl-reviewed) for how to choose
  reviewers.

  5. Address any reviewer feedback:
     ~~~~~ bash
     # Make changes, build locally, run tests locally
     git commit -am "Fixed X and Y"
     git cl upload
     ~~~~~

  6. Once the reviewer LGTMs (approves) the patch, ask them to put it into the
  commit queue.

**NOTICE:** On Windows, you'll need to run the above in a Git bash shell in order
for gclient to find the `.gitcookies` file.

## Becoming a Committer

After 10-20 non-trivial patches you can apply for commit rights. If you are
writing a lot of patches you can also apply for try job access before then.
To apply, send an email to [discuss-webrtc][15].

The source of truth is the Git repository at
<https://webrtc.googlesource.com/src>. To be able to push
commits to it, you need to perform the steps below (assuming you're a
committer).

If you already have a `.netrc`/`.gitcookies` file (most Chromium committers
already do), you can skip steps 1 and 2.

  1. Ask to be added to the committers group to get push access.

  2. Make sure you have set the `user.name` and `user.email` Git config
     settings as specified at the [depot tools setup page][9]. If you're also
     a Chromium committer, read the next section.

Sometimes it's necessary to bypass the presubmit checks (like when fixing an
error that has closed the tree). Then use the `--bypass-hooks` flag.

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

Also, please read our project's
[license]({{ site.baseurl}}/license/software/) and
[patent grant]({{ site.baseurl }}/license/additional-ip-grant/).


## Detailed Instructions

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

Please help us:

  * Remember to keep your change lists small and focused.

  * Never fix more than one bug in each CL.

  * New features will probably require dividing your work into multiple CLs.

### Running Tryjobs

As a committer, you should run tryjobs before committing to ensure you don't
break the tree:

To run a try job on your CL, run:

~~~~~ bash
git cl try
~~~~~

The results will be presented in the code review web UI. You can also click the
"CQ Dry run" button. Both these alternatives will trigger the default trybots
that are configured in [infra/config/commit-queue.cfg][5].
To run tryjobs on a smaller set of bots; use the -b (--bot) flag:

~~~~~ bash
git cl try -b mac -b mac_rel -B luci.webrtc.try
~~~~~
You can see the available trybot names by clicking the "Choose try jobs" link in
Gerrit (scroll down to `tryserver.webrtc`).

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


[1]: https://cla.developers.google.com/about/google-individual
[2]: https://cla.developers.google.com/about/google-corporate
[3]: https://webrtc-review.googlesource.com/
[4]: http://www.chromium.org/developers/owners-files
[5]: https://webrtc.googlesource.com/src/+/infra/config/commit-queue.cfg
[6]: https://ci.chromium.org/p/chromium/g/chromium.webrtc/console
[7]: https://code.google.com/p/chromium/codesearch#chromium/src/DEPS
[9]: https://webrtc.googlesource.com/src/+/master/AUTHORS
[10]: https://bugs.webrtc.org
[11]: https://crbug.com
[12]: {{ site.baseurl }}/native-code/development/
[15]: https://groups.google.com/forum/#!forum/discuss-webrtc
