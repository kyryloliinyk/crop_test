#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE ROLE $DB_USERNAME WITH LOGIN PASSWORD '$DB_PASSWORD';
  ALTER ROLE $DB_USERNAME CREATEDB SUPERUSER;
  CREATE DATABASE cropio_test_development OWNER $DB_USERNAME;
EOSQL
