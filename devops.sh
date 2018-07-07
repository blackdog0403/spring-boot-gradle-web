#!/bin/bash

set -e

echo "devops.sh controls deployment for a docker swarm cluster"

if (( $# != 1 ))
then
    echo "Usage : ./devops.sh [start | stop | restart | redeploy] [version] " 1>&2
    echo "ex    : ./devops.sh deploy v1" 1>&2
    exit 1
fi

CMD=$1
#VERSION=$2

case "$CMD" in

init)
    echo "Initializing docker swarm"
    docker swarm init
#    source gradle-build.sh ${VERSION}
#    source docker-build.sh ${VERSION}
    ;;

start)
    echo "start"
    docker stack deploy -c docker-compose.yml --resolve-image=always mydemoapp
    ;;

stop)
    echo "stop"
    docker stack rm mydemoapp
    ;;

restart)
    echo "restart"
    docker stack rm mydemoapp
    sleep 30
    docker stack deploy -c docker-compose.yml mydemoapp
    ;;

redeploy)
    echo "redeploy"
#    source gradle-build.sh ${VERSION}
#    source docker-build.sh ${VERSION}
    docker stack deploy -c docker-compose.yml --resolve-image=changed mydemoapp
    ;;
*)
    echo "Error: unknown command "$1" for "devops.sh""
    ;;
esac

