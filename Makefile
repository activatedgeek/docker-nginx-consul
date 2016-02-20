##
# Makefile for development environments
##

latest: Dockerfile
	@docker build -t activatedgeek/nginx-consul:latest .

run:
	@docker run -d -p 8080:80 \
		-e CONSUL_HOST="192.168.80.2:8500" \
		-v "$(shell pwd)/consul-template:/templates" \
		--name test-nginx-consul \
		--dns=8.8.8.8 \
		activatedgeek/nginx-consul:latest

restart:
	@make kill
	@make latest
	@make run

login:
	@docker exec -it test-nginx-consul bash

logs:
	@docker logs test-nginx-consul

kill:
	@docker rm -f test-nginx-consul
