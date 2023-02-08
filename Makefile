#!/bin/bash

# destroy containers, if any, then triggers docker-compose
all: prune load

# put down every container
down:
	@ docker compose -f srcs/docker-compose.yml down --remove-orphans --volumes

# remove all unused containers, including volumes
prune:	down
	@ docker system prune -af --volumes

# all will triggers docker compose up (create images and launch containers).
load:
	@ docker compose -f srcs/docker-compose.yml up -d --build

clean:
	@docker stop $(docker ps -qa); docker rm $(docker ps -qa); \
	docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); \
	docker network rm $(docker network ls -q) 2>/dev/null

PHONY: all load down prune clean
