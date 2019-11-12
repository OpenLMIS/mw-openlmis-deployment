#!/usr/bin/env bash

export DOCKER_TLS_VERIFY="1"
export COMPOSE_TLS_VERSION=TLSv1_2
export DOCKER_HOST="reporting-lmis-dev.health.gov.mw:2376"
export DOCKER_CERT_PATH="${PWD}/../../../credentials"
export DOCKER_COMPOSE_BIN=/usr/local/bin/docker-compose

export REPORTING_DIR_NAME=reporting

reportingRepo=$1

# To avoid running the whole ETL process, we need to create a volume for
# Postgres data and mark it as external, so that Nifi can update already
# persisted data.
docker volume create pgdata

cd "$reportingRepo/$REPORTING_DIR_NAME"
$DOCKER_COMPOSE_BIN kill
$DOCKER_COMPOSE_BIN down -v --remove-orphans
$DOCKER_COMPOSE_BIN up --build --force-recreate -d
