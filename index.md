<div class="prefix_2 grid_5">
# Hello, I'm Josh
</div>
<div class="clear"></div>
<div class="prefix_2 grid_8">

## Elsewhere 

[Github][github], 
[Blog][blog] (new),
[Pinboard][pinboard],
[last.fm][lastfm],
[libre.fm][librefm],
[SoundCloud][soundcloud],
[MusicBrainz][musicbrainz],
[Bandcamp][bandcamp],
<josh@kunz.xyz>.

### With Flux Research Group

I also write some open source software with the [Flux Research Group][flux],
you can see those projects at the [Flux Group Gitlab][flux-gitlab-me].

## Useful Things I've Written

* __[tumblr2rss][rss]__ A utility to convert your tumblr dashboard into an
  RSS feed.
* __[ashuffle][]__ An awesome sliding-window-based shuffle client for
  [mpd][], my music player of choice. 
* __[uecron][]__ A cron-like program for executing scripts when device events
  change. It's a good lightweight alternative when udev is too much trouble
  or won't work. I originally wrote it to monitor virtual devices in a network
  namespace.
* __[nfsn.py][]__ An authentication helper for the [requests][] library
  that implements the authentication protocol for the [NearlyFreeSpeech.Net][nfsn]
  API.
* __[pdf2kindle][]__ A command-line tool for uploading academic papers to a
  kindle. Automatically processes and emails the papers.
* __[fpick][]__ A curses-based utility for manually selecting a set of
  files from a directory. The selection is output as an [rsync][] exclude
  file, so it is useful for copying sub-sets of files. The readme in the
  repository has more information.
* __[soundrip][]__ A command-line utility for ripping tracks off of 
  [soundcloud][].

## Other Stuff

* My __[mpd][] File-Access patch__ ([v.20.x][mpd_patch_v20], [v0.19][mpd_patch_v19], 
  [v0.17-v0.18][mpd_patch_v17])
  that makes it so you can queue `file://*` urls as long as you have read permission
  on the file. Normally MPD tries to intuit what user you are which I believe may
  only work when you actually log-in.
* A __[bittorrent tracker][lua-bt]__ that could theoretically run on 
  [webscript.io](https://webscript.io) but seems to have trouble doing so.
  To build it, I implemented [bencoding](https://en.wikipedia.org/wiki/Bencode)
  in lua. Find it [here](https://gist.github.com/Joshkunz/4e114cd473c64498af5d).

</div>

  [blog]: http://jkz.wtf
  [github]: https://github.com/joshkunz
  [pinboard]: https://pinboard.in/u:joshkunz
  [lastfm]: http://www.last.fm/user/obstack
  [librefm]: http://www.libre.fm/user/obstack
  [soundcloud]: https://soundcloud.com/joshkunz
  [musicbrainz]: https://musicbrainz.org/user/Joshkunz

  [mpd]: http://www.musicpd.org/
  [requests]: http://docs.python-requests.org/en/latest/index.html
  [nfsn]: http://nearlyfreespeech.net/
  [rsync]: https://rsync.samba.org/

  [rss]: https://tumblr2rss.obstack.net/
  [ashuffle]: https://github.com/Joshkunz/ashuffle
  [uecron]: https://github.com/joshkunz/uecron
  [nfsn.py]: https://github.com/Joshkunz/nfsn.py
  [pdf2kindle]: https://github.com/Joshkunz/pdf2kindle
  [fpick]: https://github.com/Joshkunz/fpick
  [soundrip]: https://github.com/Joshkunz/soundrip

  [mpd_patch_v20]: https://gist.github.com/joshkunz/5a87e8ba51d7d6088e91c9ec24b8ff60
  [mpd_patch_v19]: https://gist.github.com/Joshkunz/6e922cedb86c76fd1bfe
  [mpd_patch_v17]: https://gist.github.com/Joshkunz/6946483

  [lua-bt]: https://gist.github.com/Joshkunz/b482992056d08f17be93

  [ad-blocker]: https://github.com/gorhill/uBlock

  [flux]: https://www.flux.utah.edu/index
  [flux-gitlab-me]: https://gitlab.flux.utah.edu/u/joshkunz

  [bandcamp]: https://bandcamp.com/obstack
