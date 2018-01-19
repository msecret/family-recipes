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
  docker exec -it $1 /bin/sh
}

connect_db() {
  log "Connecting to db through postgres"
  docker exec -it $DB_IMAGE \
    psql -U postgres

  [ $? != 0 ] && error "Could not connect" && exit 101
}

test() {
  log "Running client tests"
  docker exec -it $CLIENT_IMAGE \
    elm-test

  [ $? != 0 ] && error "Tests failed" && exit 101
}

$*
