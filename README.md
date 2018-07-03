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
