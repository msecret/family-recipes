#!/bin/bash

set -e

echo "In database setup"
POSTGRES="psql --username ${POSTGRES_USER}"
DATABASES=($POSTGRES_DEV_DB $POSTGRES_TEST_DB $POSTGRES_PROD_DB)

psql -U postgres -c "CREATE USER docker;"

for i in ${DATABASES[@]}; do
  echo "Creating database: ${i}"
  psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = '${i}'" | grep -q 1 || psql -U postgres -c "CREATE DATABASE \"${i}\""
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER"
    GRANT ALL PRIVILEGES ON \"${i}\" TO docker;
done
