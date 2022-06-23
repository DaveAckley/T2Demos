NAME:=$(notdir $(realpath ..))
THIS_DIR:=$(strip $(notdir $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))))
MFZ:=../$(NAME).mfz
# Customize ULAM_BIN_DIR and MFM_BIN_DIR if necessary
ULAM_BIN_DIR?=$(DEFAULT_ULAM_BIN)
MFM_BIN_DIR?=$(DEFAULT_MFM_BIN)
ULAM:=$(ULAM_BIN_DIR)/ulam
MFZRUN:=$(MFM_BIN_DIR)/mfzrun
#UFLAGS:=-g
#UFLAGS:=--sa
UFLAGS:=-o
ARGS_TXT_FILES:=$(wildcard args.txt)
ULAM_FILES:=$(wildcard *.ulam)
TCC_FILES:=$(sort $(wildcard *.tcc))
INC_FILES:=$(wildcard *.inc)
TIMESTAMP:=$(shell date +%Y%m%d-%H%M%S)
DEV:=$(shell whoami)
ISHNAME:=$(TIMESTAMP)-$(DEV)
T2TARGET:=$(abspath ../libcue.so)

all:	code

code:	$(MFZ)

t2:	$(T2TARGET)

$(T2TARGET):	$(MFZ)
	cp .gen/bin/libcue.so $@

run:	$(MFZ)
	$(MFZRUN) $(MFZ)

$(MFZ):	$(ULAM_FILES) $(INC_FILES) $(TCC_FILES) $(ARGS_TXT_FILES) *.mk
	$(ULAM) $(UFLAGS) $(SOURCE_DIR_ARGS) $(ULAM_FILES) $(INC_FILES) $(TCC_FILES) $(ARGS_TXT_FILES) $(MFZ)

clean:
	rm -f *~
	rm -rf .gen

realclean: clean
	rm -f $(MFZ)

ishtar:
	@make clean
	@make >ISH-BUILD-STDOUT.txt 2>ISH-BUILD-STDERR.txt || true
	@cd ..;tar cvzf $(ISHNAME).tgz $(THIS_DIR) --transform s/^$(THIS_DIR)/$(ISHNAME)/
	@echo Made ../$(ISHNAME).tgz

.PHONY:	FORCE all code mfz clean realclean tar ishtar

