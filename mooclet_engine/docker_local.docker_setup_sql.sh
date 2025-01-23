#!/bin/bash
set -e

# Use environment variables passed from .docker_local.env file
psql -v ON_ERROR_STOP=1 --username "$DB_USER" --dbname "$DB_NAME" <<-EOSQL
  GRANT ALL PRIVILEGES ON DATABASE "$DB_NAME" TO "$DB_USER";
EOSQL