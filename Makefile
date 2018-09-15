#!/usr/bin/env make

.PHONE: run
ALL:	run

build:
	@docker build -t wandsas/privoxy .

run: build
	@docker run -d \
		--restart always \
		--link torproxy:torproxy \
		-p 8118:8118 \
		--name privoxy \
		wandsas/privoxy

test:
	curl -x http://localhost:8118 \
		-L https://check.torproject.org/api/ip

# vim:fenc=utf-8:ft=make:
