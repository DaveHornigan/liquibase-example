.PHONY: build
build:
	docker build . -f docker/Dockerfile -t liquibase-migrations

.PHONY: run
run:
	chmod +x ./run.sh && ./run.sh

.PHONY: compose-up
compose-up:
	docker-compose up --build

.PHONY: compose-down
compose-down:
	docker-compose down --rmi local

.DEFAULT_GOAL := build