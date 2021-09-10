# SPDX-License-Identifier: MIT
# Copyright (c) 2021 Daniiarkhodzhaev A.T.

.PHONY: help all clean-all subvector clean-subvector

help:
	@echo "Use 'make <project>' to build a project"

all: subvector

clean-all: clean-subvector

subvector:
ifeq ("$(wildcard subvector/README.md)","")
	$(info GIT cloning subvector submodule)
	$(info $(shell git submodule update --init subvector))
ifeq ("$(wildcard subvector/README.md)","")
	$(error failed)
endif
endif
	@$(MAKE) -C subvector

clean-subvector:
ifeq ("$(wildcard subvector/README.md)","")
	$(info Nothing to do!)
else
	@$(MAKE) -C subvector clean
endif
