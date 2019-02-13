#!/bin/bash

set -e

if (( $# != 1 ))
then
    echo "Usage : ./docker-build.sh [version] " 1>&2
    echo "ex : ./docker-build.sh v1 " 1>&2
    exit 1
fi

VERSION=$1
echo ${VERSION}
docker build --no-cache --build-arg APP_VERSION=${VERSION} -f Dockerfile-webapp -t blackdog0403/webapp:${VERSION} .

#docker build --no-cache --build-arg APP_VERSION=${VERSION} -f Dockerfile-nginx  -t blackdog0403/nginx:${VERSION} .

# docker build --no-cache --build-arg APP_VERSION=v1 -f Dockerfile-redis -t blackdog0403/redis:v1 .
