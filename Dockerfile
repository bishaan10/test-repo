#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY /docker-app/src /home/app/src
COPY /docker-app/pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/docker-app.jar /usr/local/lib/docker-app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/docker-app.jar"]