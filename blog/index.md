---
layout: default
title: Archived Blog Posts
permalink: /blog/
class: blog
---

See more recent posts in the [Chromium Blog](http://blog.chromium.org/) and
on the [WebRTC Google+](https://plus.google.com/+WebRTCorg/) and
[Twitter](https://twitter.com/webrtc) pages.

<ul>
  {% for post in site.posts %}
    <li>
      <p style="margin-top: 2em;"><strong><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></strong><br>
      <small><i>{{ post.date | date: "%B %e, %Y at %l:%M %p" }} by {{ post.author }}</i></small></p>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>
