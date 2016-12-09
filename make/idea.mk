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

idea_clean:
	@for file in \
		".idea" \
		"${projectName}.iml" \
		"${projectName}.ipr" \
		"${projectName}.iws" \
	; do \
		rm -rf "${cwd}/$${file}"; \
	done
