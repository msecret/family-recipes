FROM postgres:10
COPY ./setup-db.sh /docker-entrypoint-initdb.d/setup-db.sh
COPY ./setup-db.sql /docker-entrypoint-initdb.d/setup-db.sql
