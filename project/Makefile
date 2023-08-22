NAME=inception

TARGET=srcs/docker-compose.yml

all: up

up: local
	docker-compose -p ${NAME} -f ${TARGET} up -d

down:
	docker-compose -p ${NAME} -f ${TARGET} down
	docker system prune -a

fdown:
	docker-compose -p ${NAME} -f ${TARGET} down --rmi all --volumes
	docker system prune -a

start:
	docker-compose -p ${NAME} -f ${TARGET} start

stop:
	docker-compose -p ${NAME} -f ${TARGET} stop

build:
	docker-compose -p ${NAME} -f ${TARGET} up --build -d --no-cache

logs:
	docker-compose -p ${NAME} -f ${TARGET} logs

clear_local:
	sudo rm -rf ~/data

local: ~/data/wp_data ~/data/db_data

~/data/wp_data:
	mkdir -p ~/data/wp_data

~/data/db_data:
	mkdir -p ~/data/db_data

.PHONY: all up down fdown start stop build fbuild local clear_local
