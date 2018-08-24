# Synapse Janitor for Docker deployments

This container runs synapse-janitor every week and restarts the synapse docker container afterwards.
Information about the deployment have to be passed into the container using environment variables.


Example docker-compose file:

```
services:
  matrix:
    image: avhost/docker-matrix:${TAG}
    ...
    depends_on:
      - db

  db:
    image: postgres:10-alpine
    environment:
      - POSTGRES_USER=synapse
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
    ...

  janitor:
    image: weissi/synapse-janitor-docker:latest
    environment:
      - DB_PASS=${POSTGRES_PASSWORD}
      - DB_USER=synapse
      - DB_PORT=5432
      - DB_NAME=synapse
      - DB_HOST=db
      - SYNAPSE_CONTAINER_NAME=synapse_matrix_1
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock
    ...


```