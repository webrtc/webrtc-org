[![Build Status](https://travis-ci.org/webrtc/webrtc-org.svg?branch=gh-pages)](https://travis-ci.org/webrtc/samples/)

# The [webrtc.org](https://webrtc.org) website #

This is a repository for the [webrtc.org](http://webrtc.org) website, home of the WebRTC project.

For more information about WebRTC, we maintain a list of [WebRTC Resources](https://docs.google.com/document/d/1idl_NYQhllFEFqkGQOLv8KBK8M3EVzyvxnKkHl4SuM8/edit). If you've never worked with WebRTC, we recommend you start with the 2013 Google I/O [WebRTC presentation](http://www.youtube.com/watch?v=p2HzZkd2A40).

We welcome corrections and additions!

See [CONTRIBUTING](CONTRIBUTING.md) for instructions. All contributors must sign a contributor license agreement before code can be accepted. Please complete the agreement for an [individual](https://developers.google.com/open-source/cla/individual) or a [corporation](https://developers.google.com/open-source/cla/corporate) as appropriate.

## Add or edit content

To reiterate: the default branch for the webrtc.org repo is **gh-pages**.

We recommend building the site in order to be able to check your site locally — see the instructions below.

Alternatively, you can review your changes (after you've pushed them) on the [GitHub Pages site](https://pages.github.com/) for your fork. For example, if your username is _foobar_ and you edited the **Contributing Fixes** page, you can check the page online at _http://foobar.github.io/webrtc-org/contributing/_. A GitHub Pages site is automatically generated for any repo that has a _gh-pages_ fork.

### Find the right page to edit

The [webrtc.org](https://webrtc.org) site is built from Markdown files, using the tool [Jekyll](https://jekyllrb.com/). Each page on the site corresponds to an _index.md_ file in a directory of the repository's _gh-pages_ branch. For example, the **Development** page at [webrtc.org/native-code/development](https://webrtc.org/native-code/development/) corresponds to [github.com/webrtc/webrtc-org/tree/gh-pages/native-code/development/index.md](https://github.com/webrtc/webrtc-org/tree/gh-pages/native-code/development).

To simplify URLs, many pages are at the top level of the site rather than in a subdirectory. For example, the **Release Notes** page is at [webrtc.org/release-notes](https://webrtc.org/release-notes/) even though it belongs to the site's **About** menu. (The corresponding Markdown file is [github.com/webrtc/webrtc-org/tree/gh-pages/release-notes/index.md](https://github.com/webrtc/webrtc-org/tree/gh-pages/release-notes).)

### Make a correction or update

For minor code changes, fork the repo and make a pull request from your GitHub account.

For major or ongoing changes, create a branch and issue pull requests from that. Please delete the branch once you’ve finished working on it.

Find out more in our [Developer's Guide](https://docs.google.com/document/d/1tn1t6LW2ffzGuYTK3366w1fhTkkzsSvHsBnOHoDfRzY/edit#heading=h.fqhc83uuzrcb).

### Add a new page

1. Create a new directory in your local fork or branch of the repo, either at the top level of the site or in an existing directory.

2. Copy an existing _index.md_ file into the new directory you created.

3. At the start of the new _index.md_ file, adjust the [YAML front matter](https://jekyllrb.com/docs/frontmatter/) used by the Jekyll build tool. For example, the following front matter will cause Jekyll to create a page with the title _Android_ at [webrtc.org/native-code/android](https://webrtc.org/native-code/android/):

    ---
    layout: default
    title: Android
    permalink: /native-code/android/
    ---

4. Edit the content of _index.md_: files are in [Markdown format](http://daringfireball.net/projects/markdown/). Images are added with markup like this: !`[]({{ site.baseurl }}/assets/images/webrtc-public-diagram-for-website.png)` (from the [Architecture](https://raw.githubusercontent.com/webrtc/webrtc-org/gh-pages/architecture/index.md) page). Add code snippets like this:

    ~~~~~ bash
    export JAVA_HOME=<location of OpenJDK 7>
    ~~~~~

6. Commit and push your work.

7. Review your changes, from the GitHub Pages site for your fork (for example, https://username.github.io/webrtc-org/) then make a pull request.

## Build and run the site locally
