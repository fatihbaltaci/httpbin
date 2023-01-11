#!/bin/bash

BUILDER=buildx-multi-arch
TAG=fatihbaltaci/httpbin

docker buildx inspect $BUILDER || docker buildx create --name=$BUILDER --driver=docker-container --driver-opt=network=host
docker buildx build --push --builder=$BUILDER --platform=linux/amd64,linux/arm64 --build-arg TAG=latest --tag=$TAG .
