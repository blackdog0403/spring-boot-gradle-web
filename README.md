# Prequesitions
- 리눅스 혹은 맥
- docker 17.05-ce 이상 버전 설치
- JDK 8 이상 버전 설치 (로컬빌드가 필요하다면)

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

## 2. 배포하기

- 아래의 명령어로 배포, 삭제, 재시작, 재배포를 할 수 있다.
```bash
$ ./devops.sh [ deploy | stop | restart | redeploy ] [version]
```
- deploy    : 컨테이너 전체 환경 실행
- stop      : 컨테이너 전체 환경 중지
- restart   : 컨테이너 전체 환경 재시작
- redeploy  : 변경된 docker-compose 상태(Desire state)로 무중단재배포(Rolling update) 

### 1) devops.sh 파일 이용하기
- 다음의 명령어로 mydemoapp을 실행한다. 
```bash
$ ./devops.sh deploy
```

### 2) 배포 상태 확인하기
- 다음의 명령어로 배포가 된 후의 상태를 확인할 수 있다
```bash
$ docker stack services mydemoapp
$ curl http://localhost
```

### 3) docker stack 명령어 이용하기
- docker-compose.yml 파일을 원하는 구성으로 수정한 다음의 명령어를 수행할 수 있다.
```bash
docker stack deploy -c docker-compose.yml --resolve-image=changed mydemoapp
```

## 3. Explicit Blue-Green Deployment  Demo

- v1 버전으로 배포한 앱을 v2로 무중단 배포하는 demo

### 1) docker-compose.yml의 webapp 이미지들의 tag를 v1으로 수정하고 2.1 의 명령어로 배포한다.
```bash
$ ./devops.sh deploy
```

### 2) docker-compose.yml의 webapp 이미지들의 tag를 v2으로 수정하고 다음의 명령어로 배포한다.
- Blue green deployment 전략으로 배포함.
```bash
$ ./blue-green-deploy.sh
```

### 3) 웹 프로우저 및 bash shell로 상태를 모니터링 해보도록 하자.
- watch로 상태를 확인한다.(mac os에 설치가 되어있지 않다면 'brew install watch' 로 설치하도록 한다.)
```bash
$ watch "docker ps"
```

###

