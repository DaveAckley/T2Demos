# All targets go through Make-dispatch.sh to decide whether we're
# trying to build mfmt2 (t2 tiles only) or mfms (everything else).

# For mfms builds, customize ULAM_BIN_DIR and MFM_BIN_DIR as needed
# for your installation in ./code/Makefile-mfms.mk. "Nothing else
# should need to be changed"

all:	code

TARGETS:=code run ishtar clean cdmd

help:	FORCE
	@echo "Make targets are: $(TARGETS)"

$(TARGETS):	FORCE
	@./Make-dispatch.sh $@

.PHONY:	FORCE
