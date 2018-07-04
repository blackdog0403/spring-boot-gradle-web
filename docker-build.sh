#!/bin/bash

set -e

./gradlew clean build -PprojVersion=0.0.1-RELEASE

docker build --no-cache  -f Dockerfile-webapp -t springbootsampleapp:0.0.1-RELEASE .
docker build --no-cache  -f Dockerfile-nginx  -t nginxreverseproxy:0.0.1-RELEASE .

./gradlew clean