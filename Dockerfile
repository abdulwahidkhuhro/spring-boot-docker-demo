#first stage

FROM maven:3.9.6-eclipse-temurin-17  AS buildstage
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

#second stage

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=buildstage /app/target/springboot-docker-demo.jar /app/
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "target/springboot-docker-demo.jar"]