#
# built using mmark 2.

VERSION = 03
DOCNAME = draft-ietf-dmarc-dmarcbis

all: $(DOCNAME)-$(VERSION).txt $(DOCNAME)-$(VERSION).html

$(DOCNAME)-$(VERSION).txt: $(DOCNAME)-$(VERSION).xml
	@xml2rfc --text -o $@ $<
	@cat .header.txt $@ .header.txt > README.md

$(DOCNAME)-$(VERSION).html: $(DOCNAME)-$(VERSION).xml
	@xml2rfc --html -o $@ $<

$(DOCNAME)-$(VERSION).xml: $(DOCNAME).md
	@sed 's/@DOCNAME@/$(DOCNAME)-$(VERSION)/g' $< | mmark   > $@

clean:
	@rm -f $(DOCNAME)-$(VERSION).txt $(DOCNAME)-$(VERSION).html $(DOCNAME).xml
