FROM alpine/git AS vcs
RUN cd / && git clone https://github.com/tejaswini1811/spring-petclinic.git

FROM maven:3-amazoncorretto-17 AS build
COPY --from=vcs /spring-petclinic /spring-petclinic
RUN cd /spring-petclinic && mvn package

FROM amazoncorretto:17-alpine-jdk
ARG HOME=/spc
LABEL Author=Tejaswini, Purpose=multistage
COPY --from=build  /spring-petclinic/target/*.jar ${HOME}/spring-petclinic.jar
WORKDIR ${HOME}
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic.jar"]
