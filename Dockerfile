FROM java:8
EXPOSE 8080
ARG JAR_FILE=target/docker-app-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} docker-app.jar
ENTRYPOINT ["java","-jar","docker-app.jar"]