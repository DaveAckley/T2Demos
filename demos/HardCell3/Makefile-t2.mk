##STANDARD TOP-LEVEL MAKEFILE FOR PHYSICS SLOTS
SHELL:=/bin/bash
REGNUM:=0
SLOTNUM:=$(lastword $(subst /, ,$(dir $(realpath $(firstword $(MAKEFILE_LIST))))))

all:	t2

UNINSTALLED_LIBCUE_DIR:=$(abspath .)
UNINSTALLED_LIBCUE_FILE:=libcue.so
INSTALLED_LIBCUE_DIR:=/cdm/physics
INSTALLED_LIBCUE_FILE:=slot$(SLOTNUM)-installed-libcue.so
UNINSTALLED_LIBCUE_PATH:=$(UNINSTALLED_LIBCUE_DIR)/$(UNINSTALLED_LIBCUE_FILE)
INSTALLED_LIBCUE_PATH:=$(INSTALLED_LIBCUE_DIR)/$(INSTALLED_LIBCUE_FILE)

TAR_SWITCHES+=--exclude=*~ --exclude=.git --exclude-backups
TAR_SWITCHES+=--exclude=.gen
TAR_SWITCHES+=--exclude=*.mfz
TAR_SWITCHES+=--exclude=$(INSTALLED_LIBCUE_FILE)

TAR_SWITCHES+=--mtime="2008-01-02 12:34:56"
TAR_SWITCHES+=--owner=0 --group=0 --numeric-owner 

DESTDIR:=$(abspath ..)
TAG_PATH:=$(DESTDIR)/slot$(SLOTNUM)-install-tag.dat

TAR_FILE:=$(SLOTNUM)-built.tgz
TAR_FILE_DIR:=$(abspath ..)
TAR_PATH:=$(TAR_FILE_DIR)/$(TAR_FILE)

$(TAR_PATH):	FORCE
	pushd ..;tar cvzf $(TAR_PATH) $(TAR_SWITCHES) $(SLOTNUM);popd

cdmd:	t2 $(TAR_PATH)
	@pushd .. ; \
	FN=`/home/t2/MFM/bin/mfzmake cdmake $(REGNUM) $(SLOTNUM) Physics-$(SLOTNUM) $(TAR_PATH) | \
            perl -e "while(<>) {/'([^']+)'/ && print "'$$1}'`; \
	if [ "x$$FN" = "x" ] ; then echo "Build failed" ; else  \
	echo -n "Got $$FN for $(SLOTNUM), tag = "; \
	perl -e '"'$$FN'" =~ /[^-]+-[^-]+-([[:xdigit:]]+)[.]/; print $$1' > $(TAG_PATH); \
	cat $(TAG_PATH); \
	echo -n ", size = " ; stat -c %s $$FN; \
	echo "TO RELEASE:" ; \
	echo "  cp $(TAG_PATH) /cdm/tags ; cp $(DESTDIR)/$$FN /cdm/common ; cp $(UNINSTALLED_LIBCUE_PATH) $(INSTALLED_LIBCUE_PATH)"; \
	fi; \
	popd

install:	$(INSTALLED_LIBCUE_PATH)

$(INSTALLED_LIBCUE_PATH):	$(UNINSTALLED_LIBCUE_PATH)
	mkdir -p $(INSTALLED_LIBCUE_DIR)
	cp $^ $@

$(UNINSTALLED_LIBCUE_PATH):	FORCE
	touch $@

code:	FORCE
	make -C code -f Makefile-t2.mk

clean:	FORCE
	make -C code -f Makefile-t2.mk clean
	rm -f *~

realclean:	FORCE
	make -C code -f Makefile-t2.mk realclean
	rm -f *.so

SUBDIR_CMDS:=run ishtar t2

$(SUBDIR_CMDS):	FORCE
	make -C code -f Makefile-t2.mk $@

.PHONY:	FORCE $(SUBDIR_CMDS)
