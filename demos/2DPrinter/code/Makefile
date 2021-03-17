NAME:=$(notdir $(realpath ..))
THIS_DIR:=$(strip $(notdir $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))))
MFZ:=../$(NAME).mfz
# Customize ULAM_BIN_DIR and MFM_BIN_DIR if necessary
ULAM_BIN_DIR:=/data/ackley/PART4/code/D/ULAM/bin/
MFM_BIN_DIR:=/data/ackley/PART4/code/D/MFM/bin/
ULAM:=$(ULAM_BIN_DIR)/ulam
MFZRUN:=$(MFM_BIN_DIR)/mfzrun
UFLAGS:=-g
#UFLAGS:=-g --sa
#UFLAGS:=-o
ARGS_TXT_FILES:=$(wildcard args.txt)
ULAM_FILES:=$(wildcard *.ulam)
INC_FILES:=$(wildcard *.inc)
TIMESTAMP:=$(shell date +%Y%m%d-%H%M%S)
DEV:=$(shell whoami)
ISHNAME:=$(TIMESTAMP)-$(DEV)
T2TARGET:=$(abspath ../libcue.so)

all:	$(MFZ)

t2:	$(T2TARGET)

$(T2TARGET):	$(MFZ)
	cp .gen/bin/libcue.so $@

run:	$(MFZ)
	$(MFZRUN) $(MFZ)

$(MFZ):	$(ULAM_FILES) $(ARGS_TXT_FILES) Makefile
	$(ULAM) $(UFLAGS) $(ULAM_FILES) $(INC_FILES) $(ARGS_TXT_FILES) $(MFZ)

clean:	
	rm -f *~

realclean: clean
	rm -f $(MFZ)
	rm -rf .gen

ishtar:
	@make realclean
	@make >ISH-BUILD-STDOUT.txt 2>ISH-BUILD-STDERR.txt || true
	@cd ..;tar cvzf $(ISHNAME).tgz $(THIS_DIR) --transform s/^$(THIS_DIR)/$(ISHNAME)/
	@echo Made ../$(ISHNAME).tgz

.PHONY:	all mfz clean realclean tar ishtar

