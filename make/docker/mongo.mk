mongo:
	@docker run \
		-d \
		--restart always \
		--name spring-boot-mongo \
		-p 27017:27017 \
		mongo
