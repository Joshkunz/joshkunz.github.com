.PHONY: site clean

MARKDOWN = pandoc
M4 = m4

macro_base = macros.m4
generated = index.html gifts.html

site: $(generated)

index.html: index.md base.html.m4
gifts.html: gifts.md base.html.m4

%.html: %.html.m4
	$(M4) $(macro_base) $< > $@

clean:
	-rm -f $(generated)
