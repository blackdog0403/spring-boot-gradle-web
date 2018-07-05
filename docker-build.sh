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
# docker rmi blackdog0403/webapp:0.0.1-RELEASE # 도커 허브에서 내려받지 못하면 새 이미지인지 인식을 못함...image id가 달라졌는데 왜 이럴까..
docker build --no-cache --build-arg APP_VERSION=${VERSION} -f Dockerfile-webapp -t blackdog0403/webapp:${VERSION} .

# docker rmi blackdog0403/nginx:0.0.1-RELEASE # 이렇게 안 하니 새 이미지인지 인식을 못함...image id가 달라졌는데 왜 이럴까..
docker build --no-cache --build-arg APP_VERSION=${VERSION} -f Dockerfile-nginx  -t blackdog0403/nginx:${VERSION} .