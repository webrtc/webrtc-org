---
layout: default
title: Testing with Wireshark
permalink: /testing/wireshark/
---


{% include toc-hide.html %}


### Before You Start

Download and install **[Wireshark][1]**.

**Note:** On Mac OS you might have to install [XQuartz][2] as well (X11 window
system).


### Starting Wireshark

Make sure to start it with appropriate permissions (admin/root accounts
usually have access to the network interfaces). **Note:** On Mac OS/Unix OS's
you might have to grant read access to the network interfaces (e.g.
`sudo chmod +r /dev/bpf*` works but has to be done after every OS restart) as
well, more info can be found [here][3].


### Capturing RTP streams

  1. Select the network interface currently used for RTP traffic and start a
     capture.

  2. Right click on any package in the capture view and select **Decode as**.

  3. Make sure **Both (src/dst port \<\> src/dst port)** is selected in the
     drop-down menu.

  4. On the right scroll down to and select **RTP** then click **OK**.

  5. RTP packets should now be visible with SSRC details in the info column.

     * If **Unknown RTP version 0** appears its most likely not a RTP packet.

     * If **Unknown RTP version 1** appears it's most likely RTP encapsulated
       in a TURN packet, see the [Capturing TURN RTP streams][4] section on how to
       capture them properly.

  6. Go to the **Telephony** menu and select **RTP** then **Show All
     Streams**.

  7. A popup window should appear with lots of RTP streams.

  8. The RTP payload types indicate which codec is in use. For payload types
     between 96 and 128, they are assigned in the SDP negotiation setting up
     the RTP streams, but browsers typically have preferred values.

     The ones we are interested in typically have a payload type
     **96** (VP8 in Chrome), **111** (Opus in Chrome) and **127** (VP8 with
     RED in Chrome). Firefox and Opera may have different payload types for
     VP8 etc.

     * Sorting by number of packets is usually a good approach to filter out
       the relevant streams.

  9. If an [rtcdump][5] file is desired select a stream and click **Save As**.


### Capturing TURN RTP streams

  1. First we need to enable the **Try to decode RTP outside of
     conversations** option.

     1. In Wireshark press **Shift+Ctrl+p** to bring up the preferences window.

     2. In the menu to the left, expand **protocols**.

     3. Scroll down to RTP.

     4. Check the **Try to decode RTP outside of conversations** checkbox.

     5. Click **OK**.

  2. Now perform the steps in [Capturing RTP streams][6] section but skip the
     **Decode As** steps (2-4).


[1]: http://www.wireshark.org/
[2]: http://xquartz.macosforge.org/landing/
[3]: http://www.wireshark.org/faq.html#q9.1
[4]: #capturing-turn-rtp-streams
[5]: #capturing-rtp-streams
[6]: {{ site.baseurl }}/testing/wireshark/#capturing-rtp-streams
