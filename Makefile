#!/usr/bin/make
# Makefile
CXX       := gcc
#CXXFLAGS  := -std=c++0x -Werror -Wall -Wextra -Wfloat-equal -Wmissing-include-dirs
CXXFLAGS  := -std=c++0x -Werror -Wall -Wextra -Wmissing-include-dirs

SAFLAGS   := -DSTATIC_ANALYSIS
LDFLAGS   :=
LIBS      := -lm
INCLUDES  := -I./inc
RCXXFLAGS := $(CXXFLAGS) $(SAFLAGS)
RLDFLAGS  := $(LDFLAGS)
RLIBS     := $(LIBS)
RINCLUDES := $(INCLUDES)

RTARGETS  := test04

RTARGETDIR:= ./bin
ROBJECTDIR:= ./obj

SOURCEDIR := ./src

DIRREPORT := ./report
DIRWORKSPACE := ./workspace

##########################################################################
SRCDIRLIST := $(shell find $(SOURCEDIR) -type d)
SRCLIST    := $(foreach srcdir, $(SRCDIRLIST), $(wildcard $(srcdir)/*.cpp))
CUTSRCLIST := $(subst $(SOURCEDIR),.,$(SRCLIST))
ROBJLIST   := $(addprefix $(ROBJECTDIR)/, $(CUTSRCLIST:.cpp=.o))
ROBJDIRLIST := $(addprefix $(ROBJECTDIR)/, $(SRCDIRLIST))

##########################################################################
.PHONY: all build clean
all: build

build: $(RTARGETS)

clean:
	rm -f $(ROBJLIST) $(RTARGETDIR)/$(RTARGETS)
	rm -rf $(ROBJECTDIR)
	rm -rf $(RTARGETDIR)
	rm -rf $(DIRREPORT)
	rm -rf $(DIRWORKSPACE)

$(RTARGETS): $(ROBJLIST)
	@echo "$^"
	@if [ ! -e $(RTARGETDIR) ]; then mkdir -p $(RTARGETDIR); fi
	$(CXX) -o $(RTARGETDIR)/$@ $^ $(RLDFLAGS) $(RLIBS)

$(ROBJECTDIR)/%.o: $(SOURCEDIR)/%.cpp
	@if [ ! -e `dirname $@` ]; then mkdir -p `dirname $@`; fi
	$(CXX) $(RCXXFLAGS) $(RINCLUDES) -o $@ -c $<

