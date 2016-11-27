mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
platform := $(shell uname)
cwd := $(abspath ${mkfile_path}/../)
ifeq ($(platform), Darwin)
	sed := gsed
endif
gradleVersion := 3.2
testGradleZipFile := $(HOME)/.sdkman/archives/gradle-$(gradleVersion).zip
projectName := HelloSpringBoot
ideaProjectFile := $(projectName).ipr

all:
	@make help

list:
	@echo " - wrapper"
	@echo " - pre_idea"
	@echo " - idea"
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

pre_idea:
	@if [ ! -a ${cwd}/gradlew ]; then \
		make wrapper; \
	fi
	@if [ -a ${cwd}/gradlew ]; then \
		${cwd}/gradlew idea; \
	fi

idea:
	@if [ ! -a $(ideaProjectFile) ]; then \
		make pre_idea; \
	fi
	@if [ -a $(ideaProjectFile) ]; then \
		idea ${cwd}/${projectName}.ipr; \
	fi

run:
	@if [ ! -a ${cwd}/gradlew ]; then \
		make wrapper; \
	fi
	@if [ -a ${cwd}/gradlew ]; then \
		@${cwd}/gradlew bootRun; \
	fi

clean:
	@gradle clean
	@for file in \
		"gradlew" \
		"gradlew.bat" \
		".gradle" \
		"gradle" \
		".idea" \
		"${projectName}.iml" \
		"${projectName}.ipr" \
		"${projectName}.iws" \
	; do \
		rm -rf "${cwd}/$${file}"; \
	done
