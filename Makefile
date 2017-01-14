mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
platform := $(shell uname)
cwd := $(abspath ${mkfile_path}/../)

ifeq ($(platform), Darwin)
	sed := gsed
else
	sed := sed
endif

projectName := HelloSpringBoot
gradleVersion := 3.3

testGradleZipFile := $(HOME)/.sdkman/archives/gradle-$(gradleVersion).zip
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
	@echo " - run_dev"
	@echo " - run_prd"

help:
	@make list

include $(cwd)/make/gradle.mk
# include $(cwd)/make/idea.mk
# include $(cwd)/make/docker/mongo.mk

clean:
	@make gradle_clean

clean_all:
	@make clean
	@make idea_clean
