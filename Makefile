mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
platform := $(shell uname)
cwd := $(abspath ${mkfile_path}/../)
ifeq ($(platform), Darwin)
	sed := gsed
endif
testGradleZipFile := $(HOME)/.sdkman/archives/gradle-3.2.zip

all:
	@make help

list:
	@echo " - wrapper"
	@echo " - clean"
	@echo " - list"
	@echo " - run"

help:
	@make list

wrapper:
	@gradle wrapper
	@if [ -a $(testGradleZipFile) ]; then \
		$(sed) -ie "/distributionUrl/c distributionUrl=file:$(testGradleZipFile)" ./gradle/wrapper/gradle-wrapper.properties; \
	fi

run:
	@${cwd}/gradlew bootRun

clean:
	@gradle clean
	@for file in \
		"gradlew" \
		"gradlew.bat" \
		".gradle" \
		"gradle" \
	; do \
		rm -rf "${cwd}/$${file}"; \
	done
