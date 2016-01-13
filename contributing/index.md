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


### How to Create a Patch

These instructions assume you already have followed the getting started guide and can build the WebRTC code. The work flow is:

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

[9]: https://chromium.googlesource.com/external/webrtc/+/master/AUTHORS

Please help us:

  * Remember to keep your change lists small and focused.

  * Never fix more than one bug in each CL.

  * New features will probably require dividing your work into multiple CLs.
    (No new features just yet!)


### Testing

Your commit will be subject to a number of automated tests that is run on
several platforms by our [continuous integration
system]({{ site.baseurl }}/testing/continuous/). Ask your developer contact
for what tests to run. When your patch is committed, the developer will get
back to you with the continuous build result.


### Code Style

We generally follow the [Google][7] and [Chromium][8] C++ style guides. For
sake of consistency a reviewer might ask you to break the style guide, or
extend your changes to make old non-compliant code up to date with the style
guide.

[7]: http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml
[8]: http://www.chromium.org/developers/coding-style


### Contributor Agreement

To contribute code, you will need to fill in one of the following required
contributor agreements

  * [Individual Contributors License][1]
  * [Corporate Contributors License][2]

[1]: https://cla.developers.google.com/about/google-individual
[2]: https://cla.developers.google.com/about/google-corporate

Also, please re-read our project's
[license]({{ site.baseurl}}/license/software/) and
[patent grant]({{ site.baseurl }}/license/additional-ip-grant/).


### Detailed Instructions


#### Creating your CL

To create a CL after you've done some edits (in a local Git branch):

~~~~~ bash
git cl upload
~~~~~

This will open a text editor showing all local commit messages, allowing you
to modify it before it becomes the CL description. Save and close the file to
proceed with the upload to the WebRTC [code review server][3].

[3]: https://codereview.webrtc.org/


#### Getting your CL Reviewed

The upload command will output a URL that you can use to directly access your
CL, add reviewers etc.

Add the reviewers that should review your change, including at least one of
the directory owners for each directory you modify. See the OWNERS files in
the source tree and [read more about OWNERS files][4] if needed.

[4]: http://www.chromium.org/developers/owners-files

A CL must be approved by a directory owner to be able to commit. To send out a
mail with the CL to everybody included you need to press
**Publish+Mail Comments**.

During the commenting process you need do **Publish+Mail Comments** again to
make the comments visible, so you can first comment all files and send it out
once. Reviewers are not notified when you upload a patch; you must again mail
them.


#### Running Tryjobs

As a committer, you should run tryjobs before committing to ensure you don't
break the tree:

To run a try job on your CL, run:

~~~~~ bash
git cl try
~~~~~

The results will be presented in the code review web UI.


#### Committing your CL

After the review process is done and you get LGTM (Looks Good To Me) from all
reviewers you can go ahead and submit your change, assuming you're an approved
committer. If you're not a committer, you'll need to ask one of the reviewers
to submit the CL for you.

See the "Committing Code" section at the
[Development]({{ site.baseurl }}/native-code/development/) page for details on
how to commit the CL.
