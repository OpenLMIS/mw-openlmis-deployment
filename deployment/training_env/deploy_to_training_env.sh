#!/usr/bin/env bash

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="52.15.171.186:2376"
export DOCKER_CERT_PATH="${PWD}/../../credentials"

../shared/init_env.sh

../shared/pull_images.sh $1

../shared/restart.sh $1
