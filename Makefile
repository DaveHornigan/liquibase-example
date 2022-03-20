.PHONY: build
build:
	docker build . -f docker/Dockerfile -t liquibase-migrations

.PHONY: run
run:
	docker run --rm --name liquibase-migrations liquibase-migrations:latest --classpath=/liquibase/changelog \                                                       ✔
      --url="jdbc:postgresql://${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_NAME}" \
      --username="${DATABASE_USER}" \
      --password="${DATABASE_PASS}" \
      --changeLogFile=./master.yaml \
      update

.PHONY: compose-up
compose-up:
	docker-compose up --build

.PHONY: compose-down
compose-down:
	docker-compose down --rmi local

.DEFAULT_GOAL := build