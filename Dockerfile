#first stage

FROM maven:3.6.3-jdk-8  AS BuildStage
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

#second stage

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=BuildStage/app/target/springboot-docker-demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "target/springboot-docker-demo.jar"]
