#ARG APP_VERSION
FROM java:openjdk-8u111-jdk-alpine
WORKDIR /App/springbootsampleapp
COPY spring-boot-sample-web-ui-0.0.1-RELEASE.war /App/springbootsampleapp/spring-boot-sample.war
EXPOSE 8080
CMD ["sh","-c","java -jar spring-boot-sample.war"]