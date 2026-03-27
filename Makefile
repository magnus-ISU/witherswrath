NAME    := witherswrath
VERSION := R1.21.11+
OUTDIR  := ..
ZIPNAME := $(NAME)-$(VERSION).zip

.PHONY: all dist clean

all: dist

dist:
	cd "$(VERSION)" && zip -rq "../$(ZIPNAME)" . -x "*.DS_Store" -x "*.py"
	mv "$(ZIPNAME)" "$(OUTDIR)/$(ZIPNAME)"
	@echo "Packaged: $(OUTDIR)/$(ZIPNAME)"

clean:
	rm -f "$(OUTDIR)/$(ZIPNAME)"
