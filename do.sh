# !/bin/bash

# Output colors
NORMAL="\\033[0;39m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"

CLIENT_IMAGE="family-recipes-client"
DB_IMAGE="family-recipes-db"
API_IMAGE="family-recipes-api"

log() {
  echo "$BLUE > $1 $NORMAL"
}

error() {
  echo ""
  echo "$RED >>> ERROR - $1$NORMAL"
}

connect() {
  log "Bash for container '$1'"
  docker exec -it family-recipes-$1 /bin/sh
}

connect_db() {
  log "Connecting to db through postgres"
  docker exec -it $DB_IMAGE \
    psql -U postgres

  [ $? != 0 ] && error "Could not connect" && exit 101
}

rails() {
  docker exec -it family-recipes-api rails $*
}

rake() {
  docker exec -it family-recipes-api rake $*
}

migrate() {
  docker exec -it family-recipes-api rails db:migrate
}

query() {
  log "Running graphql query: $*"
  curl \
    -X POST \
    -H "Content-Type: application/json" \
    --data "{ \"query\": \"$*\" }" \
    http://localhost:4000/graphql
}

test() {
  log "Running client tests"
  docker exec -it $CLIENT_IMAGE \
    elm-test

  [ $? != 0 ] && error "Tests failed" && exit 101

  log "Running api tests"
  docker exec -it $API_IMAGE \
    bundle exec rspec

  [ $? != 0 ] && error "Tests failed" && exit 101
}

$*
