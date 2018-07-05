# Prequesitions
- 리눅스 혹은 맥
- docker 17.05-ce 이상 버전 설치
- JDK 8 이상 버전 설치

# How to use

## 1. Docker swarm 준비하기
- 아래의 명령어를 실행하여 docker swarm에 해당 워커노드를 추가한다.

```bash
$ docker swarm init

Initializing docker swarm and build docker images for deployments
Swarm initialized: current node (ru00t2xst3g2sekdjip393j5e) is now a manager.

To add a worker to this swarm, run the following command:

   docker swarm join --token SWMTKN-1-24l8uxxt5d9xggh1qwsruqj9s1ln945rmyc5csid3mcrpp8sjw-exda6znm0yjafkfksfc9hy9vt 192.168.65.3:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

```
- 위와 같이 정상적으로 swarm 노드가 추가됐는지 확인한다.

## 2. Deploy to docker swarm
- 아래의 명령어로 
```bash
docker stack deploy -c docker-compose.yml --resolve-image=changed mydemoapp
```
```

## Undeploy to docker swarm
```bash
docker stack rm mydemoapp
docker swarm leave --force
```

