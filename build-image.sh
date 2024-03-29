#!/bin/bash


TAG_NAME=${1:-latest}
ENV_FILE=${2:-./.env.hie}

set -o allexport; source "$ENV_FILE"; set +o allexport

TAG_VERSION=${VERSION:-latest}
PUSH=${2:-false}

docker build -t itechuw/digi-monitoring:"$TAG_NAME" -t itechuw/digi-monitoring:"$TAG_VERSION" .

if [ "$PUSH" = true ]; then
  docker push itechuw/digi-monitoring:"$TAG_NAME"
  docker push itechuw/digi-monitoring:"$TAG_VERSION"
fi