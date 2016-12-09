wrapper:
	@gradle wrapper
	@if [ -a $(testGradleZipFile) ]; then \
		$(sed) -ie "/distributionUrl/c distributionUrl=file:$(testGradleZipFile)" ./gradle/wrapper/gradle-wrapper.properties; \
	fi

run:
	@if [ ! -a ${cwd}/gradlew ]; then \
		make wrapper; \
	fi
	@if [ -a ${cwd}/gradlew ]; then \
	 	${cwd}/gradlew bootRun; \
	fi

run_dev:
	@env SPRING_PROFILES_ACTIVE=dev make run

run_prd:
	@env SPRING_PROFILES_ACTIVE=prd make run

gradle_clean:
	@gradle clean
	@for file in \
		"gradlew" \
		"gradlew.bat" \
		".gradle" \
		"gradle" \
	; do \
		rm -rf "${cwd}/$${file}"; \
	done
