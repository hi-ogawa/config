.PHONY: $(shell grep --no-filename -E '^[a-zA-Z_-]+:' $(MAKEFILE_LIST) | sed 's/:.*//')
SHELL := /bin/bash

PRETTIER ?= docker run --rm -v $(PWD):/work tmknom/prettier:2.0.5
SHELLCHECK ?= docker run --rm -v $(PWD):/mnt:ro koalaman/shellcheck:v0.7.2
SHFMT ?= docker run --rm -v $(PWD):/mnt -w /mnt --user $$(id -u):$$(id -g) mvdan/shfmt:v3.4.0-alpine

lint:
	$(SHELLCHECK) -e 1091 bash/.bashrc $(shell find . -name '*.sh')
	$(SHFMT) -i 2 -d .
	$(PRETTIER) --check .

lint/fix:
	$(SHFMT) -i 2 -w .
	$(PRETTIER) --write .
