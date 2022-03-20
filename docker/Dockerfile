FROM liquibase/liquibase:latest

LABEL author="dave@hornigan.com"

ARG migrationsPath=/opt/migrations
ENV MIGRATIONS_PATH=$migrationsPath

ADD --chown=bin docker/docker-entrypoint.sh /opt

ADD migrations/* ${MIGRATIONS_PATH:-"/opt/migrations"}/

WORKDIR $MIGRATIONS_PATH