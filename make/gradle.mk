wrapper:
	@gradle wrapper
	@if [ -f $(testGradleZipFile) ]; then \
		$(sed) -ie "/distributionUrl/c distributionUrl=file:$(testGradleZipFile)" \
		./gradle/wrapper/gradle-wrapper.properties; \
	fi

run:
	@if [ ! -f ${cwd}/gradlew ]; then \
		make wrapper; \
	fi
	@if [ -f ${cwd}/gradlew ]; then \
	 	${cwd}/gradlew bootRun; \
	fi

run_dev:
	@env SPRING_PROFILES_ACTIVE=dev make run

run_prd:
	@env SPRING_PROFILES_ACTIVE=prd make run
