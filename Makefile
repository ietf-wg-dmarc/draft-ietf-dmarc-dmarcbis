#
# built using mmark 2.

VERSION = 16
DOCNAME = draft-ietf-dmarc-dmarcbis
#XMLFLAGS=-v

all: $(DOCNAME)-$(VERSION).txt $(DOCNAME)-$(VERSION).html

$(DOCNAME)-$(VERSION).txt: $(DOCNAME)-$(VERSION).xml
	xml2rfc ${XMLFLAGS} --text -o $@ $<
#	cat .header.txt $@ .header.txt > foo.txt
#	mv foo.txt $@

$(DOCNAME)-$(VERSION).html: $(DOCNAME)-$(VERSION).xml
	xml2rfc ${XMLFLAGS} --html -o $@ $<

$(DOCNAME)-$(VERSION).xml: $(DOCNAME).md
	sed 's/@DOCNAME@/$(DOCNAME)-$(VERSION)/g' $< | mmark > $@

clean:
	rm -f $(DOCNAME)-$(VERSION).txt $(DOCNAME)-$(VERSION)*.html $(DOCNAME)-$(VERSION).xml

diff:	$(DOCNAME)-$(VERSION).txt
	rfcdiff $(DOCNAME)-$(shell echo ${VERSION} - 1 | bc).txt $(DOCNAME)-$(VERSION).txt
