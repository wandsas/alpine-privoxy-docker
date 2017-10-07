#!/usr/bin/env make

.PHONE: run
ALL: build

build:
	@docker build -t wandsas/privoxy .

run:
	@docker run -d \
    --restart always \
    --link torproxy:torproxy \
    -p 8118:8118 \
    --name privoxy \
    wandsas/privoxy

test:
	curl -x http://localhost:8118 \
		-L https://check.torproject.org/api/ip
