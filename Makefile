.PHONY: build
build:
	docker build . -f docker/Dockerfile -t liquibase-migrations

.PHONY: run
run:
	docker run --rm --env-file .env --name liquibase-migrations liquibase-migrations:latest --classpath=/liquibase/changelog \                                                       ✔
      --url="jdbc:postgresql://${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_NAME}" \
      --username="${DATABASE_USER}" \
      --password="${DATABASE_PASS}" \
      --changeLogFile=./master.yaml \
      update

.DEFAULT_GOAL := build