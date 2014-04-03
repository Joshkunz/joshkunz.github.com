.PHONY: site clean

MARKDOWN = pandoc
M4 = m4
TREE = tree

TREEFLAGS = -s -h --du

music_base = ~/music
music_site = https://music.joshkunz.com/

macro_base = macros.m4
generated = index.html music.html gifts.html

site: $(generated)

index.html: index.md base.html.m4
gifts.html: gifts.md base.html.m4
music.html: $(music_base)
	$(TREE) $(TREEFLAGS) \
		-o "$@" -H "$(music_site)" -T "Music Library" $(music_base)

%.html: %.html.m4
	$(M4) $(macro_base) $< > $@

clean:
	-rm -f $(generated)
