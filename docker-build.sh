#!/bin/bash

set -e

./gradlew clean build -PprojVersion=0.0.1-RELEASE

docker build --no-cache  -f Dockerfile-webapp -t blackdog0403/webapp:0.0.1-RELEASE .
docker build --no-cache  -f Dockerfile-nginx  -t blackdog0403/nginx:0.0.1-RELEASE .

./gradlew clean