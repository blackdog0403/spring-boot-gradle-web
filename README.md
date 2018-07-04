# Prequsition
- 리눅스 혹은 맥
- docker 17.05-ce 이상 버전 설치
- JDK 8 이상 버전 설치
- gradle 4.1.x 버전 이상 설치


# How to use

## build
```bash
./gradlew build
```

## run
```bash
./gradlew bootRun
```

## gradle build & docker build
```bash
./docker-build.sh
```

## docker run
위의 도커 빌드를 완료후에 다음의 명령어를 실행.
```bash
docker run -p 8080:8080 springbootsampleapp:0.0.1-RELEASE
```

## Deploy to docker swarm
```bash
docker swarm init
docker stack deploy -c docker-compose.yml --resolve-image=changed mydemoapp
```
### Check your swarm cluster status.
```bash
$ docker container ls
CONTAINER ID        IMAGE                               COMMAND                  CREATED             STATUS              PORTS               NAMES
0a74b44db3ff        dockersamples/visualizer:stable     "npm start"              3 minutes ago       Up 3 minutes        8080/tcp            mydemoapp_visualizer.1.4wkju80rbn69sqkinbn45inl7
b2a7edf0a14b        blackdog0403/webapp:0.0.1-RELEASE   "sh -c 'java -jar sp…"   3 minutes ago       Up 3 minutes        8080/tcp            mydemoapp_web.2.hoqh0fjvnx7b735106onbki2r
753a5ec0e726        blackdog0403/webapp:0.0.1-RELEASE   "sh -c 'java -jar sp…"   3 minutes ago       Up 3 minutes        8080/tcp            mydemoapp_web.1.ywoa1zkz9vabmegn7omnny9p8
$ docker stack ps mydemoapp
ID                  NAME                     IMAGE                               NODE                    DESIRED STATE       CURRENT STATE           ERROR               PORTS
ywoa1zkz9vab        mydemoapp_web.1          blackdog0403/webapp:0.0.1-RELEASE   linuxkit-025000000001   Running             Running 3 minutes ago                       
4wkju80rbn69        mydemoapp_visualizer.1   dockersamples/visualizer:stable     linuxkit-025000000001   Running             Running 3 minutes ago                       
hoqh0fjvnx7b        mydemoapp_web.2          blackdog0403/webapp:0.0.1-RELEASE   linuxkit-025000000001   Running             Running 3 minutes ago                       
blackdog@gimgwang-yeong-26312-DevOps-Labgaebalhyeogsin:~/dev/spring-boot-gradle-web$ 

```

## Undeploy to docker swarm
```bash
docker stack rm mydemoapp
docker swarm leave --force
```

