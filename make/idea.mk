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
