#!/bin/bash

set -e

./gradlew clean build -PprojVersion=0.0.1-RELEASE

cp build/libs/spring-boot-sample-web-ui-0.0.1-RELEASE.war docker-webapp/spring-boot-sample-web-ui-0.0.1-RELEASE.war

docker build --no-cache -t springbootsampleapp:0.0.1-RELEASE docker-webapp
docker build --no-cache -t nginxreverseproxy:0.0.1-RELEASE docker-nginx

rm docker-webapp/spring-boot-sample-web-ui-0.0.1-RELEASE.war