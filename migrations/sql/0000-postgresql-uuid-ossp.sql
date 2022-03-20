--liquibase formatted storage_sql
--changeset Dave Hornigan:0 dbms:postgresql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";