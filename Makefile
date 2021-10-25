.PHONY: $(shell grep --no-filename -E '^[a-zA-Z_-]+:' $(MAKEFILE_LIST) | sed 's/:.*//')
SHELL := /bin/bash

PRETTIER ?= docker run --rm -v $(PWD):/work tmknom/prettier:2.0.5
SHELLCHECK ?= docker run --rm -v $(PWD):/mnt:ro koalaman/shellcheck:v0.7.2
SHFMT ?= docker run --rm -v $(PWD):/mnt -w /mnt --user $$(id -u):$$(id -g) mvdan/shfmt:v3.4.0-alpine
JQ ?= docker run --rm -i stedolan/jq:latest

lint:
	$(SHELLCHECK) -e 1091 bash/.bashrc $(shell find . -name '*.sh')
	$(SHFMT) -i 2 -d .
	$(PRETTIER) --check .

lint/fix: lint/fix/vscode
	$(SHFMT) -i 2 -w .
	$(PRETTIER) --write .

lint/fix/vscode:
	$(JQ) empty < vscode/settings.json
	$(JQ) -M --sort-keys . < vscode/settings.json | sponge vscode/settings.json
