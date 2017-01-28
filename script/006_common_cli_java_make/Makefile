mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
cwd := $(abspath ${mkfile_path}/../)
platform := $(shell uname)

clean:
	@rm -rf ${cwd}/java_modules
	@rm -rf ${cwd}/build

install:
	@mkdir -p ${cwd}/java_modules
	@curl -C - -o ${cwd}/java_modules/commons-cli/commons-cli-1.4.jar \
		https://repository.apache.org/content/groups/snapshots/commons-cli/commons-cli/1.4-SNAPSHOT/commons-cli-1.4-20161117.005127-21.jar

build:
	@mkdir -p ${cwd}/build
	@javac -cp "${cwd}/java_modules/commons-cli/commons-cli-1.4.jar" Main.java -d ${cwd}/build

run:
	@java -cp "${cwd}/java_modules/commons-cli/commons-cli-1.4.jar:${cwd}/build" Main ${ARGS}
