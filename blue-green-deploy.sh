#!/bin/bash

set -e

echo "Blue-Green Deployment started..."

echo "Route to secondary"
cat conf/nginx/nginx.conf_sec > conf/nginx/nginx.conf
docker exec -it $(docker ps | awk '{print $NF}' | grep nginx) nginx -s reload
sleep 5

echo "Deploy new application to primary"
docker stack deploy -c docker-compose.blue.yml --resolve-image=changed mydemoapp
sleep 60

echo "Route to pri"
cat conf/nginx/nginx.conf_pri > conf/nginx/nginx.conf
docker exec -it $(docker ps | awk '{print $NF}' | grep nginx) nginx -s reload
sleep 5

echo "Deploy new application to secondary"
docker stack deploy -c docker-compose.green.yml --resolve-image=changed mydemoapp
sleep 60

echo "Route round robin"
cat conf/nginx/nginx.conf_rr > conf/nginx/nginx.conf
docker exec -it $(docker ps | awk '{print $NF}' | grep nginx) nginx -s reload

echo "New application deployment finished"