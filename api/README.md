# README

## Development

### Setup

```sh
docker-compose -f docker-compose-dev.yml build
./do.sh migrate
./do.sh seed
```

### Run

```sh
docker-compose -f docker-compose-dev.yml up
```

Once sucessfully up, there should be a running db, rails/graphql api connected
to the db, and client running front end elm code in with elm-reactor.
